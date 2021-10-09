class Router extends System {
    constructor() {
        super();
        this.Routes = [];
        this.Welcome = null;
        this.StartPoint = "[start]";
    }

    route = async (ROUTE, DEST = null, CURRENT = true, REPLACE = true) => {
        if (ROUTE == "INROOT") return;
        if (DEST == null) DEST = this.StartPoint;
        var PATH = "./App/" + ROUTE + "/" + ROUTE;
        var HTML = await this.getFromFile(PATH + ".html");
        if (REPLACE) document.querySelector(DEST).innerHTML = HTML;
        else document.querySelector(DEST).appendChild(document.createElement(HTML));
        await this.doLoops();
        await this.removeCurrentRoutes();
        await this.getStyle(PATH, CURRENT); 
        await this.getScript(PATH, CURRENT);

        if (document.querySelector(DEST).contains(document.querySelector("[open]"))) 
            await this.openRoute(document.querySelector(DEST)); 
    }

    openRoute = async (parent) => {
        parent.querySelectorAll("[open]").forEach( async (open) => {
            var route = open.getAttribute("open");
            var replace = open.hasAttribute("non-replace") ? false : true;
            var dest = "[open='" + route + "']";
            await this.route(route, dest, false , replace);
            await this.closeRoute();
        });
    }

    closeRoute = async () => {
        var closedNodes = document.querySelectorAll("[route-me]");
        console.log(closedNodes);
        closedNodes.forEach(el => {
            el.onclick = async(each) => {
                var routery = each.target.getAttribute("route-me");
                console.log(routery);
                if (routery != "")
                    await call.route(routery, "[open='INROOT']");
            };
        });
    }

    doLoops = async () => {
        document.querySelectorAll("[Vfor]").forEach( async(loop) => {
            var route = loop.getAttribute("Vfor").split('@')[0];
            var act = loop.getAttribute("Vfor").split('@')[1];
            var result = await this.getResponse({ route: route, act: act });
            this.ForeachIT(loop, result);
        });
    }

}

var system = new System().pluginRegister({
    "charts": "ApexCharts",
    "dropdowns": "DropDown",
    "JqueryPlugin": "JqueryPlugin",
    "slideshow/carousel": "Slider",
});

var call = new Router();
call.route("Main", null, false);

// import Helper from "./helper.js";
// import Router from "./router.js";
// //import System from "./system.js";
//
// var routeIT = new Router();
// await routeIT.getRoutes();
// await routeIT.routeIn();
// await routeIT.openRoutes();
// await routeIT.closedRoutes();
// 

class Router {
    constructor() {
        this.Routes = [];
        this.Welcome = null;
        this.StartPoint = "[start]";
    }

    route = async (ROUTE, DEST = null, REPLACE = true) => {
        if (ROUTE == "INROOT") return;
        if (DEST == null) DEST = this.StartPoint;
        var PATH = "./App/" + ROUTE + "/" + ROUTE;
        var HTML = await this.getFromFile(PATH + ".html");
        if (REPLACE) document.querySelector(DEST).innerHTML = HTML;
        else document.querySelector(DEST).appendChild(document.createElement(HTML));
        this.getStyle(PATH); 
        this.getScript(PATH);
        // work loops
        // document.querySelectorAll("[Vfor]").forEach((loop) => {
        //     var route = loop.getAttribute("Vfor").split('@')[0];
        //     var act = loop.getAttribute("Vfor").split('@')[1];
        //     var result = this.getResponse({ route: route, act: act });
        //     this.ForeachIT(loop, result);
        // });
        if (document.querySelector(DEST).contains(document.querySelector("[open]"))) 
            await this.openRoute(document.querySelector(DEST)); 
    }

    openRoute = async (parent) => {
        parent.querySelectorAll("[open]").forEach( async (open) => {
            var route = open.getAttribute("open");
            var replace = open.hasAttribute("non-replace") ? false : true;
            var dest = "[open='" + route + "']";
            await this.route(route, dest, replace);
            await this.closeRoute();
        });
    }

    getJsonFile = async (url) => {
        const data = new Promise((resolve, reject) => {
            fetch(url)
                .then(respond => {
                    resolve(respond.json())
                }).catch(err => {
                    reject(err)
                })
        });
        
        return await data;
    }

    getFromFile = async (url) => {
        const  response = await fetch(url)
        const  text = await response.text();
        return text;
    }

    getScript = async (url,type = "") => {
        var script = document.createElement("script"); 
        script.src = url + "Class.js";
        if (type != "")
            script.type = type;
        document.head.appendChild(script); 
    }

    getStyle = async (url, type = "") => {
        if (type == "")
            type = "css";
        var style = document.createElement("link"); 
        style.rel = 'stylesheet'; 
        style.type = 'text/' + type;
        style.href = url + "." + type; 
        style.setAttribute('current', 'true');
        document.head.appendChild(style);  
    }

    closeRoute = async () => {
        var closedNodes = document.querySelectorAll("[route-me]");
        console.log(closedNodes);
        closedNodes.forEach(el => {
            el.onclick = (each) => {
                var routery = each.target.getAttribute("route-me");
                console.log(routery);
                if (routery != "")
                    call.route(routery, "[open='INROOT']");
            };
        });
    }

    ForIT = async (el, nuber) => {
        var tmpEl = el;
        var parent = el.parentNode;
        parent.innerHTML = "";
        for (let i = 0; i < nuber; i++)
            parent.appendChild(tmpEl);
        
    }

    ForeachIT = async (el, arr) => {
        var tmpEl = el;
        var parent = el.parentNode;
        parent.innerHTML = "";
        for (let i = 0; i < arr.length; i++) {
            var text = tmpEl.textContent;
            var key = text.substring(
                text.indexOf("{") + 1, 
                text.lastIndexOf("}")
            );
            tmpEl.innerHTML = "";
            tmpEl.appendChild(arr[i][key]);
            parent.appendChild(tmpEl);

        }
        
    }

    getResponse = async (data) => {
        var request = $.ajax({
            type: "POST",
            url: "response.php",
            data: data,
            success:  (response)=> request = response,
            error: function (response) {
                console.log(response);
            }
        });
        return await request;
    }
}

var call = new Router();
call.route("Main");

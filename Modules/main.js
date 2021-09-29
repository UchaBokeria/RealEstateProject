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

    route = async (ROUTE, DEST = null, CURRENT = true, REPLACE = true) => {
        if (ROUTE == "INROOT") return;
        if (DEST == null) DEST = this.StartPoint;
        var PATH = "./App/" + ROUTE + "/" + ROUTE;
        var HTML = await this.getFromFile(PATH + ".html");
        if (REPLACE) document.querySelector(DEST).innerHTML = HTML;
        else document.querySelector(DEST).appendChild(document.createElement(HTML));
        await this.removeCurrentRoutes();
        this.getStyle(PATH, CURRENT); 
        this.getScript(PATH, CURRENT);
        await this.doLoops();

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

    removeCurrentRoutes = async () => {
        var currentRoutes = document.querySelectorAll("[current='true']");
        currentRoutes.forEach((route) => {
            document.head.removeChild(route);
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

    getScript = async (url, CURRENT = true, type = "") => {
        var script = document.createElement("script"); 
        script.src = url + "Class.js";
        script.setAttribute("current",CURRENT); 
        if (type != "")
            script.type = type;
        document.head.appendChild(script); 
    }

    getStyle = async (url, CURRENT = true, type = "") => {
        if (type == "")
            type = "css";
        var style = document.createElement("link");
        style.setAttribute("current",CURRENT); 
        style.rel = 'stylesheet'; 
        style.type = 'text/' + type;
        style.href = url + "." + type; 
        document.head.appendChild(style);  
    }

    doLoops = async () => {
        document.querySelectorAll("[Vfor]").forEach( async(loop) => {
            var route = loop.getAttribute("Vfor").split('@')[0];
            var act = loop.getAttribute("Vfor").split('@')[1];
            var result = await this.getResponse({ route: route, act: act });
            this.ForeachIT(loop, result);
        });
    }

    ForeachIT = async (el, data) => {
        var tmpEl = el;
        var parent = el.parentNode;

        var keys = [];
            
        var text = tmpEl.innerHTML;
        var tmpbind = "";
        var record = false;
        for (let i = 0; i < text.length; i++) {
            if (record) {
                tmpbind += text[i];
            }
            if (text[i] == '{') record = true;
            else if ( i != text.length - 1 && (text[i+1] == '}') ) {
                record = false;
                keys.push(tmpbind);
                tmpbind = "";
            }
        }

        for (let i = 0; i < data.length; i++) {
            var NewHtml = text;
            keys.forEach((each) => {
                NewHtml = NewHtml.replace("{" + each + "}", data[i][each]);
            });
            var tmpElement = (i == 0) ? el : el.cloneNode(true);
            tmpElement.innerHTML = NewHtml;
            parent.appendChild(tmpElement);
            //parent.insertAdjacentHTML('beforeend',tmpEl);
        }
        
    }

    ForIT = async (el, nuber) => {
        var tmpEl = el;
        var parent = el.parentNode;
        parent.innerHTML = "";
        for (let i = 0; i < nuber; i++)
            parent.appendChild(tmpEl);
        
    }

    getResponse = async (data) => {
        var request = $.ajax({
            type: "POST",
            url: "response.php",
            data: data,
            dataType: "json",
            success:  (response)=> request = response,
            error: function (response) {
                console.log(response);
            }
        });
        return await request;
    }
}

var call = new Router();
call.route("Main", null, false);

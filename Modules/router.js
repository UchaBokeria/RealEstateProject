import System from "./system.js";
import Helper from "./helper.js";

export default class router {

    constructor() {
        this.links = [];
        this.error = false;
        this.welcome = null;
        this.styleExt = "css";
        this.errorColor = "red";
        this.errorBgColor = "#333";
        this.successColor = "green";
        this.successBgColor = "#333";
        this.System = new System();
        this.Helper = new Helper();
        this.routeMeLinks = [];
    }

    getRoutes = async () => {
        const bluePrint = await this.Helper.getJsonFile('./App/router.json');
        const setting = await this.Helper.getJsonFile('./settings.json');
        this.styleExt = (setting.styles.extension == "") ? "css" : setting.styles.extension;
        
        // check if files exist
        bluePrint.routes.forEach( el => {
            var exists = { success: true, ext: "" };
            exists = { success: this.Helper.UrlExists(el.path + "." + this.styleExt), ext: this.styleExt };
            exists = { success: this.Helper.UrlExists(el.path + ".html"), ext: ".html" };
            exists = { success: this.Helper.UrlExists(el.path + "Class.php"), ext: ".php" };
            exists = { success: this.Helper.UrlExists(el.path + "Class.js"), ext: ".js" };

            if (exists.success == false) {
                this.error = exists.success;
                this.System.log("FILE: " + el.path + exists.ext + " DOES NOT EXISTS", false);
                return false;
            }
        });

        this.System.log("Routes Successfully Loaded", true);
        
        this.welcome = bluePrint.welcome;
        this.links = bluePrint.routes;
        return true;
    }

    closedRoutes = async () => {
        console.log(1);
        var closedNodes = document.querySelectorAll("[route-me]");
        console.log(closedNodes);
        // clicking
        closedNodes.forEach(el => {
            console.log(3);
            el.onclick = (each) => {
                var router = each.target.getAttribute("route-me");
                if (router != "")
                    this.routeIn(router);
                else
                    this.System.log(" route-me attribute is empty ", false);
            };
        });
    }

    openRoutes = async () => {
        var openNodes = document.querySelectorAll("[open]");
        // defaultOpen
        openNodes.forEach( el => {
            var routing = el.getAttribute("open");
            console.log(routing);
            if (routing != "") {
                this.routeIn(routing, el);
                console.log(el);
            }
            else
                this.System.log(" open attribute is empty ", false);
        });
        console.log(2);
    }

    routeIn = async (route = this.welcome, bodySection = null) => {
        // imports html of this route in global section
        // imports and calls js class of this route
        // imports style of this route in head tag
        if(bodySection == null)
            bodySection = document.querySelector("section[start]");

        var path = "App/" + route + "/" + route;
        var HTML = await this.Helper.getFromFile("./" + path + ".html");

        if(HTML == null)
            HTML = "<p>I'm EMPTY</p>";
        
        
        bodySection.setAttribute("start", route);
        bodySection.innerHTML = "";
        bodySection.innerHTML = HTML;

        if(bodySection == null)
            this.System.changeRouting();
        this.System.callStyle(path);
        this.System.callRouter(path, route);
    }


}
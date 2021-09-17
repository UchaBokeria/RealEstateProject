import Helper from"./helper.js";

export default class router {

    constructor() {
        this.links = [];
        this.styleExt = "css";
        this.error = false;
        this.welcome = null;
        this.errorColor = "red";
        this.errorBgColor = "#333";
        this.successColor = "green";
        this.successBgColor = "#333";
        this.Helper = new Helper();
        this.getConsoleColors();
    }

    getRoutes = async () => {
        const bluePrint = await this.Helper.getJsonFile('./App/router.json');
        
        // check if files exist
        bluePrint.routes.forEach( el => {
            var exists = { success: true, ext: "" };
            exists = { success: this.Helper.UrlExists(el.path + "." + this.styleExt), ext: this.styleExt };
            exists = { success: this.Helper.UrlExists(el.path + ".html"), ext: ".html" };
            exists = { success: this.Helper.UrlExists(el.path + "Class.php"), ext: ".php" };
            exists = { success: this.Helper.UrlExists(el.path + "Class.js"), ext: ".js" };

            var errorStyle = "background:" + this.errorBgColor + ", color:" + this.errorColor;
            var error = "%c FILE: " + el.path + exists.ext + " DOES NOT EXISTS";

            if (exists.success == false) {
                console.log(error, errorStyle);
                this.error = exists.success;
                return false;
            }
        });

        var successStyle = "background:" + this.successBgColor + ", color:" + this.successColor;
        var success = "%c Successfully loaded";
        console.log(success, successStyle);
        
        this.welcome = bluePrint.welcome;
        this.links = bluePrint.routes;
        return true;
    }


    routeIn = async (route = this.welcome) => {
        // imports html of this route in global section
        // imports and calls js class of this route
        // imports style of this route in head tag

        var bodySection = document.querySelector("section[start]");
        var HEAD = document.getElementsByTagName('HEAD')[0];
        var body = document.body;

        var path = "App/" + route + "/" + route;
        var HTML = await this.Helper.getFromFile("./" + path + ".html");

        if(HTML == null)
            HTML = "<p>I'm EMPTY</p>";
        

        bodySection.setAttribute("start", route);
        bodySection.innerHTML = "";
        bodySection.innerHTML = HTML;

        var link = document.createElement('link');
        link.type = 'text/' + this.styleExt;
        link.href = path + "." + this.styleExt; 
        link.rel = 'stylesheet'; 
        HEAD.appendChild(link);

        var routerClass = document.createElement('script');
        routerClass.type = "module";
        routerClass.src = "./" + path + "Class.js";
        routerClass.innerHTML = "var open = new " + route + "();";
        body.append(routerClass);
        
    }

    
    getConsoleColors = async () => {
        // gets console colors for error handling
        const colors = await this.Helper.getJsonFile('./settings.json');
        
        if(colors.CustomConsole.errorColor != "")
            this.errorColor = colors.CustomConsole.errorColor;
        if(colors.CustomConsole.errorBgColor != "")
            this.errorBgColor = colors.CustomConsole.errorBgColor;
        if(colors.CustomConsole.successColor != "")
            this.successColor = colors.CustomConsole.successColor;
        if(colors.CustomConsole.successBgColor != "")
            this.successBgColor = colors.CustomConsole.successBgColor;
    }

}
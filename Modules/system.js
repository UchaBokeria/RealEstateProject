import Helper from"./helper.js";

export default class System {
    constructor() {
        this.styleExt;
        this.Helper = new Helper();

        this.Console = {
            ErrBg: "red",
            ErrCr : "#333",
            SuccBg : "green",
            SuccCr : "#333"
        }
        this.setSettings();
        this.currentLinks = [];
        this.currentScripts = [];
    }
    
    log = (what, mode = true) => {
        var modeStyle = "";
        what = "%c " + what;

        if (mode) {
            modeStyle += "background:" + this.Console.SuccBg + ";";
            modeStyle += "color:" + this.Console.SuccCr + ";";
        }else {
            modeStyle += "background:" + this.Console.ErrBg + ";";
            modeStyle += "color:" + this.Console.ErrCr + ";";
        }
        console.log(what,modeStyle);
    }

    setSettings = async () => {
        const setting = await this.Helper.getJsonFile('./settings.json');
        
        if(setting.CustomConsole.errorColor != "")
            this.Console.ErrCr = setting.CustomConsole.errorColor;
        if(setting.CustomConsole.errorBgColor != "")
            this.Console.ErrBg = setting.CustomConsole.errorBgColor;
        if(setting.CustomConsole.successColor != "")
            this.Console.SuccCr = setting.CustomConsole.successColor;
        if(setting.CustomConsole.successBgColor != "")
            this.Console.SuccBg = setting.CustomConsole.successBgColor;
        
        // set type of style for project like css , scss , sass
        this.styleExt = (setting.styles.extension == "") ? "css" : setting.styles.extension;

    }

    callStyle = (href) => {
        var HEAD = document.getElementsByTagName('HEAD')[0];
        var link = document.createElement('link');
        link.type = 'text/' + this.styleExt;
        link.href = href + "." + this.styleExt; 
        link.setAttribute('current', '');
        link.rel = 'stylesheet'; 
        HEAD.appendChild(link);
        this.currentLinks.push(link);
    }

    callRouter = (path, name , type = "") => {
        var body = document.body;
        var routerClass = document.createElement('script');
        routerClass.type = type;
        routerClass.setAttribute('current',name);
        routerClass.src = "./" + path + "Class.js";
        routerClass.innerHTML = "console.log(123123);  var open"+name+" = new " + name + "();";
        body.append(routerClass);
        this.currentScripts.push(routerClass);
    }

    changeRouting = () => {
        this.currentLinks.forEach(el => {
            el.remove();
        });
        this.currentScripts.forEach(el => {
            el.remove();
        });
    }


 }
class Dropdown extends System {
    constructor(options = null) {
        this.optionTemplate = null;
        this.container = null;
        this.selected = null;
        this.selectedID = null;
        this.selectedItem = null;
        this.selections = null;
        this.parent = null;
        this.data = null;


        this.options = {

        };


        this.init(options);
    }

    init = async (parameters)=> {
        if(parameters != null) this.options = this.setUpOptions(parameters);
        await this.buildContainer();
        await this.buildSelector();
        await this.build();
    }

    build = async ()=> {
        this.parent = docuent.querySelector(this.options.area);
        this.parent.appendChild(this.selected);
        this.parent.appendChild(this.selections);
    }

    buildContainer = async ()=> {
        this.selections = document.createElement("div");
        this.selections.setAttribute("id", this.options.area.substring(1) + "Options");
        this.selections.style.display = "none";
    }

    buildOptions = async ()=> {
        this.optionTemplate = docuent.createElement("div");
        this.options.options.attributes.forEach( (attr) => {
            this.optionTemplate.setAttribute(attr, "{" + attr + "}");
        });
        this.options.options.class.forEach( (eachClass) => {
            this.optionTemplate.classList.add(eachClass);
        });

        this.optionTemplate.innerHtml = "{option}";
        this.selections.appendChild(this.optionTemplate);

        this.data = await this.getResponse( this.options.data, this.options.data.url );
        await this.ForeachIT( this.optionTemplate, this.data);
    }


    buildSelected = async ()=> {
        this.selected = document.createElement("p");
        this.selected.setAttribute("id", this.options.area.substring(1) + "Selected");
        this.selected.setAttribute("dropdown-id", this.selectedID );
        this.selected.classList.add("dropdown-selected");
        this.selectedItem = this.data.find( obj => {  return obj.id === this.selectedID  })
        this.selected.innerHtml = this.selectedItem[this.options.output];
    }

    buildContainer = async ()=> {
        
    }

    
    setUpOptions = async (parameters) => {
        var optionsToArray = Object.entries(this.options);

        optionsToArray.forEach((e) => {
            if (!parameters.hasOwnProperty(e[0]))
                parameters[e[0]] = e[1];
            else if (typeof parameters[e[0]] == "object") {
                var tmpArr = Object.entries(e[1]);
                tmpArr.forEach((x) => {
                    if (!parameters[e[0]].hasOwnProperty(x[0]))
                        parameters[e[0]][x[0]] = x[1];
                })
            }
        });

        return parameters;
    }
}

var newDropdown = new Dropdown({
    data: {
        route: "Header",
        act: "read",
        url: "../../response.php"
    },
    area: "#mydropdown",
    output: "name",
    options: {
        attributes: ["id", "name"],
        class: ["optionies", "red"],
    },

});
var system = new System();

system.pluginRegister({
    "charts": "ApexCharts",
    "dropdowns": "DropDown",
    "JqueryPlugin": "JqueryPlugin",
    "slideshow/carousel": "Slider",
});

var call   = new Router();
call.route("Main", null, false);

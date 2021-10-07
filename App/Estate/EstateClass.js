console.log("this is Estate");
var newslider = new Slider({
    data: { route: "Home", act: "read" },
    area: "#mySlider",
    type: "slideshow",
    buttons: {
        left: true,
        right: true,
    },
    scrollHide: true,
    cell: {
        class: ["sa"],
        gap: "4vw"
    }
});

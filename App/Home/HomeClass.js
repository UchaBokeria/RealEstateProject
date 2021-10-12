console.log("this is home");

var newslider = new Slider({
    data: { route: "Home", act: "readVips", vip:1,},
    area: "#mySlider",
    type: "carousel",
    scrollHide: false,
    class: ["asas","sadasdas"],
    buttons: {
        left: true,
        right: true,
    },
    scrollHide: true,
    template: "<p><img src='Assets/Uploads/{dir}'></p>",
    cell: {
        class: ["slider-cell"],
        attributes: ["cell-id","dir","title","description","bedrooms","rooms","price","space","floor"],
        gap: "4vw",
        width: "30%"
    }
});
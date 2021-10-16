// import Router from "../../modules/router.js";
//console.log(document.querySelectorAll("[route-me]"))
console.log("this is header");

var estateDropdown = new DropDown({
  data: {
    route: "Header",
    act: "readCategories",
  },
  area: "#estateDropdown",
  output: "title",
  trigger: "#estateDropdown",
  class: ["container"],
  options: {
    chosen: { title: "category  2" },
    attributes: ["title"],
    class: ["optionies", "red"],
  },
});

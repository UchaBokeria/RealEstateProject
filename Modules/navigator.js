console.log("navigator");
var closedNodes = document.querySelectorAll("[route-me]");
// clicking
console.log(closedNodes);
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
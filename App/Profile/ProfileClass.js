// Profile Chart
var profileOptions = {
  series: [
    {
      name: "Net Profit",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [35, 41, 36, 26, 45, 48, 52, 53, 41],
    },
  ],
  chart: {
    type: "bar",
    height: 750,
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: "55%",
      endingShape: "rounded",
    },
  },
  dataLabels: {
    enabled: false,
  },
  stroke: {
    show: true,
    width: 2,
    colors: ["transparent"],
  },
  xaxis: {
    categories: ["Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct"],
  },
  yaxis: {
    title: {
      text: "$ (thousands)",
    },
  },
  fill: {
    opacity: 1,
  },
  tooltip: {
    y: {
      formatter: function (val) {
        return "$ " + val + " thousands";
      },
    },
  },
};

var profileChart = new ApexCharts(
  document.querySelector("#profileChart"),
  profileOptions
);
profileChart.render();

// Analytics Charts

// Sparklines
var spark1 = {
  chart: {
    id: "sparkline1",
    group: "sparklines",
    type: "area",
    height: 160,
    sparkline: {
      enabled: true,
    },
  },
  stroke: {
    curve: "straight",
  },
  fill: {
    opacity: 1,
  },
  series: [
    {
      name: "Net Profit",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [35, 41, 36, 26, 45, 48, 52, 53, 41],
    },
    {
      name: "Net Profit",
      data: [
        44, 55, 57, 56, 61, 58, 63, 60, 66, 35, 41, 36, 26, 45, 48, 52, 53, 41,
        76, 85, 101, 98, 87, 105, 91, 114, 94,
      ],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [
        35, 41, 36, 26, 45, 48, 52, 53, 41, 76, 85, 101, 98, 87, 105, 91, 114,
        94,
      ],
    },
  ],
  labels: [...Array(24).keys()].map((n) => `2018-09-0${n + 1}`),
  yaxis: {
    min: 0,
  },
  xaxis: {
    type: "datetime",
  },
  colors: ["#DCE6EC"],
  title: {
    text: "$424,652",
    offsetX: 30,
    style: {
      fontSize: "24px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
  subtitle: {
    text: "Sales",
    offsetX: 30,
    style: {
      fontSize: "14px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
};

var spark2 = {
  chart: {
    id: "sparkline2",
    group: "sparklines",
    type: "area",
    height: 160,
    sparkline: {
      enabled: true,
    },
  },
  stroke: {
    curve: "straight",
  },
  fill: {
    opacity: 1,
  },
  series: [
    {
      name: "Net Profit",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [35, 41, 36, 26, 45, 48, 52, 53, 41],
    },
  ],
  labels: [...Array(24).keys()].map((n) => `2018-09-0${n + 1}`),
  yaxis: {
    min: 0,
  },
  xaxis: {
    type: "datetime",
  },
  colors: ["#DCE6EC"],
  title: {
    text: "$235,312",
    offsetX: 30,
    style: {
      fontSize: "24px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
  subtitle: {
    text: "Expenses",
    offsetX: 30,
    style: {
      fontSize: "14px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
};

var spark3 = {
  chart: {
    id: "sparkline3",
    group: "sparklines",
    type: "area",
    height: 160,
    sparkline: {
      enabled: true,
    },
  },
  stroke: {
    curve: "straight",
  },
  fill: {
    opacity: 1,
  },
  series: [
    {
      name: "Net Profit",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [35, 41, 36, 26, 45, 48, 52, 53, 41],
    },
  ],
  labels: [...Array(24).keys()].map((n) => `2018-09-0${n + 1}`),
  xaxis: {
    type: "datetime",
  },
  yaxis: {
    min: 0,
  },
  colors: ["#008FFB"],
  //colors: ['#5564BE'],
  title: {
    text: "$135,965",
    offsetX: 30,
    style: {
      fontSize: "24px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
  subtitle: {
    text: "Profits",
    offsetX: 30,
    style: {
      fontSize: "14px",
      cssClass: "apexcharts-yaxis-title",
    },
  },
};

// Bars
var optionsBar = {
  chart: {
    type: "bar",
    height: 380,
    width: "100%",
    stacked: true,
  },
  plotOptions: {
    bar: {
      columnWidth: "45%",
    },
  },
  colors: ["#00D8B6", "#008FFB", "#FEB019", "#FF4560", "#775DD0"],
  series: [
    {
      name: "Clothing",
      data: [42, 52, 16, 55, 59, 51, 45, 32, 26, 33, 44, 51, 42, 56],
    },
    {
      name: "Food Products",
      data: [6, 12, 4, 7, 5, 3, 6, 4, 3, 3, 5, 6, 7, 4],
    },
  ],
  labels: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23],
  xaxis: {
    labels: {
      show: false,
    },
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
  },
  yaxis: {
    axisBorder: {
      show: false,
    },
    axisTicks: {
      show: false,
    },
    labels: {
      style: {
        colors: "#78909c",
      },
    },
  },
  title: {
    text: "Monthly Sales",
    align: "left",
    style: {
      fontSize: "18px",
    },
  },
};

// Donut
var optionDonut = {
  chart: {
    type: "donut",
    // width: '100%',
    height: 400,
  },
  dataLabels: {
    enabled: false,
  },
  plotOptions: {
    pie: {
      customScale: 0.8,
      donut: {
        size: "75%",
      },
      offsetY: 20,
    },
    stroke: {
      colors: undefined,
    },
  },
  colors: ["#00D8B6", "#008FFB", "#FEB019", "#FF4560", "#775DD0"],
  title: {
    text: "Department Sales",
    style: {
      fontSize: "18px",
    },
  },
  series: [21, 23, 19, 14, 6],
  labels: [
    "Clothing",
    "Food Products",
    "Electronics",
    "Kitchen Utility",
    "Gardening",
  ],
  legend: {
    position: "left",
    offsetY: 80,
  },
};

new ApexCharts(document.querySelector("#bar"), optionsBar).render();
new ApexCharts(document.querySelector("#donut"), optionDonut).render();
new ApexCharts(document.querySelector("#spark1"), spark1).render();
new ApexCharts(document.querySelector("#spark2"), spark2).render();
new ApexCharts(document.querySelector("#spark3"), spark3).render();

// Dropdown
var dashboardDropdown = new DropDown({
  data: {
    route: "Profile",
    act: "sortRead",
  },
  area: "#dashboardDropdown",
  output: "title",
  trigger: "#dashboardDropdown",
  class: ["container"],
  options: {
    chosen: { title: "Apartments" },
    attributes: ["title"],
    class: ["optionies", "dashboard-categories"],
  },
});

// Datepicker
$("#datepicker").datepicker({
  inline: true,
});
$("#bookmarkDatepicker").datepicker({
  inline: true,
});

// Dashboard Panel & Elements


document.querySelectorAll(".dashboard-button").forEach((e) => {
  e.addEventListener("click", () => {
    var sectionAttr = e.getAttribute("dashboard-tab");
    document.querySelectorAll(".dashboard-button").forEach((button) => {
      button.classList.remove('active')
    })
    document.querySelectorAll(".db-element").forEach((a) => {
      a.classList.add('hidden')
    });
    document.querySelector("#" + sectionAttr).classList.remove('hidden');
    document.querySelector("#" + sectionAttr + "-btn").classList.add("active");
  });
});

// document.querySelectorAll(".dashboard-button").forEach((e) => {
//   e.addEventListener("click", () => {
//     document.querySelectorAll(".dashboard-button").forEach((el) => {
//       el.classList.remove("active");
//     });

//     document.querySelectorAll(".db-element").forEach((dashboardElement) => {
//       dashboardElement.classList.add("hidden");

//       let dashboardButtonAttr = e.getAttribute("dashboard-tab");
//       let dashboardElementAttr =
//         dashboardElement.getAttribute("dashboard-element");
//       if (
//         (dashboardButtonAttr == "dashboard") &
//         (dashboardElementAttr == "dashboard")
//       ) {
//         e.classList.add("active");
//         dashboardElement.classList.remove("hidden");
//       } else if (
//         (dashboardButtonAttr == "bookmarks") &
//         (dashboardElementAttr == "bookmarks")
//       ) {
//         e.classList.add("active");
//         dashboardElement.classList.remove("hidden");
//       } else if (
//         (dashboardButtonAttr == "analytics") &
//         (dashboardElementAttr == "analytics")
//       ) {
//         e.classList.add("active");
//         dashboardElement.classList.remove("hidden");
//       } else if (
//         (dashboardButtonAttr == "profile") &
//         (dashboardElementAttr == "profile")
//       ) {
//         e.classList.add("active");
//         dashboardElement.classList.remove("hidden");
//       } else {
//         return false;
//       }
//     });
//   });
// });

document.querySelector(".analytics-btn").addEventListener("click", () => {
  document.querySelector(".analytics-post").classList.remove("hidden");
  document.querySelectorAll(".analytics-card").forEach((analyticsCard) => {
    analyticsCard.classList.add("hidden");
  });
  document.querySelector(".paging").classList.add("hidden");
  console.log(document.querySelector(".paging"));
});

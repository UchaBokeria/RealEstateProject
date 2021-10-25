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

var chart = new ApexCharts(
  document.querySelector("#profileChart"),
  profileOptions
);
chart.render();


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




document.querySelectorAll(".dashboard-button").forEach(e => {
  e.addEventListener('click', () => {
    let dashboardButtonAttr = e.getAttribute('dashboard-tab')
    console.log(dashboardButtonAttr)
    console.log(e)
    if (dashboardButtonAttr == "dashboard") {
      e.classList.add('active')
      if (e.classList.contains('active')) {
        e.classList.remove('active')
      }
      console.log(e)
    } else if (dashboardButtonAttr == "bookmarks") {
      e.classList.add('active')
    }
    else if (dashboardButtonAttr == "analytics") {
      e.classList.add('active')
    }
    else if (dashboardButtonAttr == "profile") {
      e.classList.add('active')
    } else if (e.classList.contains('active')) {
      e.classList.remove('active')
    }
  })
})

// dashboardButton.addEventListener('click', () => {
//   let dashboardButtonAttr = dashboardButton.getAttribute('dashboard-tab')
//   console.log(dashboardButtonAttr)
//   console.log('clicked')
// })

// console.log(dashboardButton)
import { Controller } from "stimulus";
import ApexCharts from "apexcharts";

// Connects to data-controller="work-order-widget"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    console.log("Work Order controller connected");
    this.renderChart();
  }

  renderChart() {

      let today = new Date();
      let beginning_of_year = new Date(today.getFullYear(), 0, 1);
      let end_of_year = new Date(hoy.getFullYear(), 11, 31);

      fetch(`/reports/work_orders.json?from=${beginning_of_year}&to=${end_of_year}`)
          .then(response => response.json())
          .then(data => {
              let options = {
                  yaxis: {
                      title: {
                          text: "Cantidad de órdenes de trabajos realizadas",
                          style: {
                              fontSize: '12px',
                              fontFamily: 'Inter, sans-serif',
                          },
                      },
                      labels: {
                          offsetX: -5,  // Añade espacio entre las etiquetas y el gráfico
                          style: {
                              fontFamily: "Inter, sans-serif",
                              cssClass: 'text-muted small'  // Utilizando clases de Bootstrap aquí
                          },
                      },
                  },
                  chart: {
                      height: "100%",
                      maxWidth: "100%",
                      type: "area",
                      fontFamily: "Inter, sans-serif",
                      dropShadow: {
                          enabled: false,
                      },
                      toolbar: {
                          show: false,
                      },
                  },
                  tooltip: {
                      enabled: true,
                      x: {
                          show: true,
                      },
                  },
                  fill: {
                      type: "gradient",
                      gradient: {
                          opacityFrom: 0.55,
                          opacityTo: 0,
                          shade: "#1C64F2",
                          gradientToColors: ["#1C64F2"],
                      },
                  },
                  dataLabels: {
                      enabled: false,
                  },
                  stroke: {
                      width: 6,
                  },
                  markers: {
                      size: 5,
                      strokeWidth: 0,
                      strokeColors: 'transparent',
                  },
                  grid: {
                      show: false,
                      strokeDashArray: 4,
                      padding: {
                          left: 2,
                          right: 2,
                          top: 0
                      },
                  },
                  series: [
                      {
                          name: 'Ordenes de Trabajo',
                          data: data.series,
                      },
                  ],
                  // series: [
                  //     {
                  //         name: "Developer Edition",
                  //         data: [1500, 1418, 1456, 1526, 1356, 1256],
                  //         color: "#1A56DB",
                  //     },
                  //     {
                  //         name: "Designer Edition",
                  //         data: [643, 413, 765, 412, 1423, 1731],
                  //         color: "#7E3BF2",
                  //     },
                  // ],
                  xaxis: {
                      categories: data.categories, // Asumiendo que tu respuesta JSON tiene una clave 'new_categories_data' con las nuevas categorías
                      // categories: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4', 'Semana 5', 'Semana 6', 'Semana 7'],
                      title: {
                          text: 'Semanas',
                          style: {
                              fontSize: '12px',
                              fontFamily: 'Inter, sans-serif',
                          },
                      },
                      labels: {
                          show: true,
                      },
                      axisBorder: {
                          show: false,
                      },
                      axisTicks: {
                          show: false,
                      },
                  },
              }
              const chart = new ApexCharts(this.chartTarget, options);
              chart.render();
          });
  }

  update(event) {
    const value = event.target.value;

    fetch(`/work_orders?from=${value}&to=${value}`)
        .then(response => response.json())
        .then(data => {
          const options = {
            series: [
              {
                data: data.new_series_data // Asumiendo que tu respuesta JSON tiene una clave 'new_series_data' con los nuevos datos
              }
            ],
            xaxis: {
              categories: data.new_categories_data // Asumiendo que tu respuesta JSON tiene una clave 'new_categories_data' con las nuevas categorías
            }
          };

          const chart = new ApexCharts(this.chartTarget, options);
          chart.updateOptions(options);
        });
  }
}
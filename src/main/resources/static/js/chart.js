



new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
        labels: ["긍정", "중립", "부정"],
        datasets: [
            {
                label: "Percentage(%)",
                backgroundColor: ["#FF4500", "#696969","#4169E1"],
                data: [js_posi,js_midd,js_nega]
            }
        ]
    },
    options: {
        responsive : false,
        title: {
            display: true,
            text: '기준일로부터 7일간 수집된 기사를 반영한 결과입니다.'
        }
    }
});

new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
        labels: ["상승률","하락률","정확도"],
        datasets: [
            {
                label: "Percentage(%)",
                backgroundColor: ["#FF4500", "#4169E1","#3cba9f"],
                data: [js_rise,js_decline,js_acc]
            }
        ]
    },
    options: {
        responsive: false,
        scales: {
            yAxes: [{
                ticks: {
                    min: 0,
                    max: 100,
                    fontSize : 14,
                }
            }]
        },
        legend: { display: false },
        title: {
            display: true,
            text: 'LSTM+NLP 분석 결과'
        }

    }
});

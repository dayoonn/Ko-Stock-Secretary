function handleOnChange(e) {

    const value = e.value;
    const url = 'prediction_' + value;

    if(e.value==value){
        document.frm.action=url;
    }

    document.frm.submit();

}

// 선택된 데이터의 텍스트값 가져오기
//const text = e.options[e.selectedIndex].text;

// console.log(e.options);

// 선택한 텍스트 출력
//document.getElementById('result').innerText
//= text;

// const value = e.value;

// 데이터 출력
//  document.getElementById('').innerText
// = value;
function handleOnChange(e) {

    const value = e.value;
    const url = 'recommend_sector' + value;

    if(e.value==value){
        document.frm.action=url;
    }

    document.frm.submit();

}

function costsearch(e) {

    const value = e.value;
    const url = 'recommend_sector' + value;

    if(e.value==value){
        document.frm.action=url;
    }

    document.frm.submit();

}
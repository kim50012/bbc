jQuery(function($) {
    $("#categorySelect").each(function() {
        var maxLength = $(this).attr("maxlength");
        if(maxLength == undefined || maxLength == ""){
            maxLength = 0;
        }
        categorySelectLoad("00", maxLength, $(this).attr("id"));
    });
});

function categorySelectLoad(prntCtgrId, maxLength, divId, inputName) {
    if(prntCtgrId == undefined || prntCtgrId == "") {
        prntCtgrId = "00";
    }
    
    if (maxLength == undefined || maxLength == "") {
        maxLength = 0;
    }
    
    if (divId == undefined || divId == '') {
        divId = "categorySelect";
    }
    
    if (inputName == undefined || inputName == '') {
        inputName = 'selectCategory';
    }
    
    var params = "prntCtgrId=" + prntCtgrId;
    params += "&maxLength=" + maxLength;
    params += "&divId=" + divId;
    params += "&inputName=" + inputName;
    
    $("#" + divId).html("");

    $.ajax({
        type: "GET"
        ,url: "/product/categorySelectBox"
        ,data: params
        ,dataType: "html"
        ,success: function(html) {
            $("#" + divId).html(html);
        }
    });
}
$(function() {
    $('#subBtn').click(function() {
        if($("#proposalText").val()) {
            var date = new Date();
            var division = '품질 보증';
            var val = $("#proposalText").val();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            // 这里可以添加提交数据的而方法
            var today = year + '-' + month + '-' + strDate;
            var html = '<div class="modelOnly oneModel"><div class="title news borderBt">'
            html += '<div><div class="f-row"><span class="font20 fontBlue">'+division+'</span>'
            html += '<div class="delBtn" onclick=del(this)>삭제</div></div>';
            html += '<div class="f-row"><span class="bold font20 fontColor5">'+today+'</span></div></div></div>'
            html += '<div class="fontColor5 font20 mt20 lineH24">'+val+'</div></div>'
            $("#childOne").append(html)
            $("#proposalText").val('')
            $("#proposalText").focus()
            $(".scroll-wrap").animate({scrollTop: 20 + $(".container ")[0].offsetHeight - $(".scroll-wrap ")[0].offsetHeight + 'px'}, 100)
        }
    })
    scroll()
})
function del(el) {
  messageBox({
    title: '의견 삭제',
    message: '정말 삭제 하시겠습니까?',
    type: 'confirm',
    callback: function() {
      $(el).parents('.modelOnly').remove()
    }
  })
}
function solveRisk() {
  messageBox({
    title: '提示',
    message: '确认解决风险？',
    type: 'alert',
    callback: function() {
      alert(1)
    }
  })
}
                          
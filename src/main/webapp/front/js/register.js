//打开弹出层
function ShowRegisterPopup(show_div,bg_div){
	var bh = document.body.scrollHeight;
	var bw =document.body.scrollWidth;
	document.getElementById(show_div).style.display = 'block';
	document.getElementById(bg_div).style.display = 'block';
	$("#" + bg_div).height(bh);
	$("#" + bg_div).width(bw);
}
//关闭弹出层
function CloseRegisterPopup(show_div, bg_div) {
	document.getElementById(show_div).style.display = 'none';
	document.getElementById(bg_div).style.display = 'none';
};
//检查上传文件是否为图片
function checkImage(file){
	var picPath =file.value;
        var type = picPath.substring(picPath.lastIndexOf(".") + 1, picPath.length).toLowerCase();
        if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
            alert("请上传正确的图片格式");
            return false;
        }
        var fileSize = file.files[0].size;
        if(fileSize > (5*1024*1024)){
      		alert("图片太大");
      		return;
      	}
	return true;
}
//店铺logo的上传预览
function logoUpload(file){
	if(checkImage(file)){
		 var prevDiv = document.getElementById('preview');
		 if (file.files && file.files[0]) {
			var reader = new FileReader();
			reader.onload = function(evt){
		 	prevDiv.innerHTML = '<img id="imgInput" alt="logo" src="' + evt.target.result + '"/>';
			}; 
		 reader.readAsDataURL(file.files[0]);
		}
		else{
			prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		}
	}
}
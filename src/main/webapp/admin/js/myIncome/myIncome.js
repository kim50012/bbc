$(function(){
	$(".datepicker").datepicker(); 
	
	$('.btn-icon').hover(function() {
		$(this).find('.btn-tip').show();
	}, function() {
		$(this).find('.btn-tip').hide();
	});
	
});

function incomeDetail() {
	
	location.href = "/admin/incomeDetail/incomeDetail.htm";
}

function option(opType,shopId,payTypeId) {
	
	if (opType == "" || shopId == "" || payTypeId == "") {
		alert('${label.请重新打开页面}');
		return;
	}

	var params = {
		opType : opType,
		shopId : shopId,
		payTypeId : payTypeId
	};

	$.ajax({
		data : params,
		dataType : "json",
		type : "POST",
		cache : false,
		url : "/admin/myIncome/modify.htm",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
			
			if (data.result == 'SUCCESS'){
				
				alert("${label.修改成功}"+".");
				location.reload();
			} else {
				alert("${label.请重新点击}"+".");
			}
		},
		error : function(a, msg, c){
			
			alert("error: " + msg);
		}
	});
}



function doDelete(shopId,payTypeId){
	
	var params = {
			shopId : shopId,
			payTypeId : payTypeId
		};

		$.ajax({
			data : params,
			dataType : "json",
			type : "POST",
			cache : false,
			url : "/admin/myIncome/deletePayment.htm",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				
				if (data.result == 'SUCCESS'){
					
					alert("${label.删除成功}"+".");
					location.reload();
				} else {
					alert("${label.请重新点击}"+".");
				}
			},
			error : function(a, msg, c){
				
				alert("error: " + msg);
			}
		});
	
}

function bPoupDivDisplay(){
	
	$('.poupMessageDisplay').bPopup({
		modalClose: false,//弹出框深色区域，关闭的响应
		modalColor: "#aeaeae",
		opacity: 0.3,
		fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
		closeClass:'exitPoup'
	});
	
}

var rowCount=1;
function trAdd(){
	rowCount+=1;
	if(rowCount>2){
		return;
	}
	var html='<tr>'+
				'<td class="tdTitle"></td>'+
				'<td class="tdContent">'+
					'<input type="text" style="width: 225px;" id="payPreInfo2" maxlength="90">'+
					'<img class="icon-tip2" onclick="javascript:trRomove(this);" src="/admin/images/icon/icon-minus2.png">'+
				'</td>'+
			 '</tr>';
	$("#trPrdDesc").after(html);
	$(".poupMessage").css("height",$(".poupMessage").height()+45);

}

function trRomove(obj){
	
	$(obj).parent().parent().remove();
	
}

//商品照片上传预览
function logoUpload(file){
	
	var prevDiv = document.getElementById('preview');
	 
	if(checkImage(file)){
		
		 if (file.files && file.files[0]){
			 
			var reader = new FileReader();
			
			reader.onload = function(evt){
		 		prevDiv.innerHTML = '<img src="' + evt.target.result + '" />';
			}; 
			$("#preview").attr("style","background-image:url('')");
			$("#preview").find("span").remove();
		 	reader.readAsDataURL(file.files[0]);
		} else {
			
			prevDiv.innerHTML = '<div style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
			$("#preview").attr("style","background-image:url('')");
			$("#preview").find("span").remove();
		}
	} else {			

 		//prevDiv.innerHTML = '<img src="/admin/images/shopCreate/upload.png" />';
 		prevDiv.innerHTML='';
 		$("#preview").attr("style","background-image:url('/admin/images/shopCreate/main_Upload.png')");
		$("#preview").append("<span>${label.上传本地图片}</span>");
	}
	
}

//检查上传文件是否为图片
function checkImage(file){
	
	var picPath = file.value;
	var type = picPath.substring(picPath.lastIndexOf(".") + 1, picPath.length).toLowerCase();
	
	if (picPath == "") {
		
	    return false;
	} else {
		
		if (type != "jpg" && type != "bmp" && type != "gif" && type != "png") {
			
		    alert("${label.请上传正确的图片格式}");
		    return false;
		} else {

			return true;
		}
	}
}

function closePopup(){
	
	$('.poupMessageDisplay').bPopup().close();
	
}



function search(){
	
	window.location.href='/admin/myIncome/myIncome.htm?payTypeId='+$("#payTypeId").val()+"&isUse="+$("#isUse").val();

}

//分页操作
function gets_page_value(){
	//存储分页的每页条数
	var pageUnit=$("#wholePage").find("option:selected").val();
	//存储分页的页数
	var pageCurr=1;
	window.location.href='/admin/myIncome/myIncome.htm?payTypeId='+$("#payTypeId").val()+"&isUse="+$("#isUse").val()+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
}

//页面的上一页，下一页，第一页，最后一页的操作。
function pageNext(pageCurr){
	//存储分页的页数
	var pageUnit=$("#wholePage").find("option:selected").val();
	window.location.href='/admin/myIncome/myIncome.htm?payTypeId='+$("#payTypeId").val()+"&isUse="+$("#isUse").val()+"&pageUnit="+pageUnit+"&pageCurr="+pageCurr;
}

function save(){
	var payName = $("#payName").val();
	var payPreDate = $("#payPreDate").val();
	var payPreInfo =$("#payPreInfo").val();
	var payPreInfo2 =$("#payPreInfo2").val();
	var payRreDesc=$("#payRreDesc").val();
	var imgLogoPicture = $('#logo_input').val();
	
	if(payName == ""){
		alert('请输入支付类型'+'.');
		return;
	}
	
	if(payPreDate == ""){
		alert('请选择使用时间'+'.');
		return;
	}
	
	if(imgLogoPicture == ""){
		
		alert('${label.请上传商品照片}');
		return;
	}
	
	if(payRreDesc == ""){
		alert('请输入支付类型内容');
		return;
	}
	
	//获取照片的文件名
    var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf("\\") + 1, imgLogoPicture.length);
	alert(payPreInfo2);
    if(payPreInfo!=""&&payPreInfo2!=""&&payPreInfo2!=undefined){
    	payPreInfo=payPreInfo+"###"+payPreInfo2;
	}else if(payPreInfo==""&&payPreInfo2!=""&&payPreInfo2!=undefined){
		payPreInfo=payPreInfo2;
	}
    
	var params = {
			payName : payName,
			payPreDate : payPreDate,
			payPreInfo : payPreInfo,
			payRreDesc : payRreDesc,
			logoFileName : logoFileName
		};
	
	$.ajaxFileUpload({
		data : params,
		url : "/admin/myIncome/paymentInsert.htm",
		secureuri : false,
		fileElementId :'logo_input',
		dataType : "json",
		type : "POST",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
			
			if (data.result == 'S'){

				alert("${label.添加成功}"+".");
				location.href="/admin/myIncome/myIncome.htm";
			} else {
				
				alert("${label.请检查信息}"+","+"${label.重新点击添加}"+".");
			}
		},
		error : function(a, msg, c){
			
//			alert("error: " + msg);
		}
	});
}

function paymentDetail(shopId,payTypeId){
	var params = {
			shopId : shopId,
			payTypeId : payTypeId
		};
	
	$.ajax({
		data : params,
		dataType : "json",
		type : "POST",
		cache : false,
		url : "/admin/myIncome/paymentDetail.htm",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success : function(data){
			if(data!=null){
				$("#payName").val(data.PAY_NAME);
				$("#payPreDate").val(data.PAY_PRE_DT);
				var payPreInfo=data.PAY_PRE_INFO;
				if(payPreInfo.split("###").length>1){
					trAdd();
				}
				$("#payPreInfo").val(payPreInfo.split("###")[0]);
				$("#payPreInfo2").val(payPreInfo.split("###")[1]);
				document.getElementById('preview').innerHTML = '<img src="' + data.LOGO_URL + '" />';
				$("#payRreDesc").val( data.PAY_PRE_DESC);
				$('.poupMessageDisplay').bPopup({
					modalClose: false,//弹出框深色区域，关闭的响应
					modalColor: "#aeaeae",
					opacity: 0.3,
					fadeSpeed: 'slow', //弹出速度  string ('slow'/'fast') or int (1500)   
					closeClass:'exitPoup'
				});
			}
		},
		error : function(a, msg, c){
			
			alert("error: " + msg);
		}
	});
}

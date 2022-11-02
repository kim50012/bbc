	var click_count = 0; 
	var documentID = ''; 
	var deleteType = '';
 	function showBpopup_RemoveKeyword(){
	 	showBpopup({
			id : 'Poup-delete',
			width :375,
			top:180,
			left:20
		});	
	}
	
	function removeKeyword(){
		$('#Poup-delete').bPopup().close();
		var keywordIndex = "";
		if(deleteType == 'deleteType'){
			keywordIndex = $('#keyWordBefore').val();
			var params = {
 		 			keywordIndex : keywordIndex
 		 		}
	    	$.ajax({
				data : params,
		 		url : '/wxi/dkf/removeKeyword.htm',
		 		success : function(data){
		 			if(data.result != 0){
		 				deleteType ='';
		 				mainView.router.reloadPreviousPage('/wxi/dkf/keyWordList.jsp');
						showbPoupMsgDivBack('保存成功');
		 			}else{
		 				deleteType ='';
		 				showbPoupMsgDiv('操作失败');
		 			}
	 	 		},
		 		error : function(a, msg, c){
		 			deleteType ='';
		 			alert('error: ' + msg);
		 		}
			})
		}else{
			$('.selected').each(function(){  
				keywordIndex += $(this).data('id') + '|'
			});
			if(keywordIndex != ""){
	 		    	var params = {
		 		 			keywordIndex : keywordIndex
		 		 		}
			    	$.ajax({
						data : params,
				 		url : '/wxi/dkf/removeKeyword.htm',
				 		success : function(data){
		 		 			if(data.result != 0){
	 	 		 				showbPoupMsgDivRefresh('操作成功');
	 			 			}else{
				 				showbPoupMsgDiv('操作失败');
				 			}
	 		 	 		},
				 		error : function(a, msg, c){
				 			alert('error: ' + msg);
				 		}
					})
	 			
			}else{
				showbPoupMsgDiv("没有选中任何关键词")
			}
		}
	}
	
	function msg_select(args){
		var divid = "";
		$('.keyword-add-msg_tuwen').each(function(){  
			var divid = $(this).data('id');
			$("#"+divid).addClass("msg_display");
	  	});
		$("#"+args).removeClass("msg_display");
	
	}
	
	function tuwen_add(){
		if(click_count >=7){
			showbPoupMsgDiv('图文消息最多能添加八个！');
			return;
		}
		click_count++;
 		tuwen_html();
	}
	
	function tuwen_remove(){
		if(click_count == 0){
			return;
		}
		click_count--;
 		tuwen_html();
	}
	
	function tuwen_html(){
		
 		var html = "";
 		for(var i=0;i<click_count;i++){
 			var titleValue = "";
 			var imageValue = "";
 			var contentValue = "";
 			var urlValue = "";
 			$('input[name="arsTitle_newsPic"]').each(function(){  
 				var inputId = $(this).data('id');
  				if(inputId == i){
 	 				titleValue = $('#arsTitle'+inputId).val() 
    	 		}	
 			});
 			$('input[name="arsImage"]').each(function(){  
 				var inputId = $(this).data('id');
  				 if(inputId == i){
  					imageValue = $('#arsImage_'+inputId).val() 	
    	 		}	
 			});
 			$('textarea[name="arsContent"]').each(function(){  
 				var inputId = $(this).data('id');
    			if(inputId == i){
  	 				contentValue = $('#arsContent'+i).val() 
   				}	
 			});
 			$('input[name="arsUrl"]').each(function(){  
 				var inputId = $(this).data('id');
    			if(inputId == i){
  	 				urlValue = $('#arsUrl'+i).val() 
   				}	
 			});
 			
    		html += '<tr>';
 			html += '<td style="width:7%"></td>';
 			html += '<td style="padding-top:20px;padding-bottom: 20px;">标题:</td>';
 			html += '<td style="padding-top:20px;">';
 			if(titleValue == undefined){
 				html += '<input type="text" id="arsTitle'+ i +'" data-id="'+ i +'" name="arsTitle_newsPic" value=""/>';	
 			}else{
 				html += '<input type="text" id="arsTitle'+ i +'" data-id="'+ i +'" name="arsTitle_newsPic" value="'+ titleValue +'"/>';	
 			}
 			html += '</td>';
 			html += '<td style="width:7%"></td>';
 			html += '</tr>';
 			html += '<tr>';
 			html += '<td style="width:7%"></td>';
 			html += '<td style="padding-top:20px;vertical-align: top;">图片:</td>';
 			html += '<td style="padding-top:20px;" >';	
 			if(imageValue == ""){
 				html += '<input type="hidden" id="arsImage_'+ i +'" data-id="'+ i +'" value="" name="arsImage"/>';
 			}else{
 				html += '<input type="hidden" id="arsImage_'+ i +'" data-id="'+ i +'" value="'+ imageValue +'" name="arsImage"/>';
 			}
  			html += '<div type="button" class="file_button" id="image_thu_'+ i +'">';
 			if(imageValue == ""){
  	 			html += '<div onclick="imageSelect('+ i +')" class="file_select">选择</div>';
 	 			html += '<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>'; 
 			}else{
 				html += '<img onclick="imageSelect('+ i +')" style="cursor:pointer;width:50%;height:100%" alt="" src="'+ imageValue +'">';
 			}
 			html += '</div>';
 			html += '</td>';
 			html += '<td style="width:7%"></td>';
 			html += '</tr>';
 			html += '<tr>';
 			html += '<td style="width:7%"></td>';
 			html += '<td style="padding-top:20px;vertical-align: top;">描述:</td>';
 			html += '<td style="padding-top:20px;">';
 			html += '<textarea id="arsContent'+ i +'" data-id="'+ i +'" name="arsContent" style="height: 60px;width: 100%;border-radius: 5px;">';
 			if(contentValue != ""){
 				html += contentValue
 			}
 			html +='</textarea>';
 			html += '</td>';
 			html += '<td style="width:7%"></td>';
 			html += '</tr>';
 			html += '<tr>';
 			html += '<td style="width:7%;padding-bottom: 20px;"></td>';
 			html += '<td style="padding-top:20px;padding-bottom: 20px;">URL:</td>';
 			html += '<td style="padding-top:20px;padding-bottom: 20px;">';
 			if(urlValue == ""){
 				html += '<input type="text" value="" id="arsUrl'+ i +'" data-id="'+ i +'" name="arsUrl"/>';
 			}else{
 				html += '<input type="text" value="'+ urlValue +'" id="arsUrl'+ i +'" data-id="'+ i +'" name="arsUrl"/>';
 			}
  			html += '</td>';
 			html += '<td style="width:7%;padding-bottom: 20px;"></td>';
 			html += '</tr>';
 			html += '<tr>';
 			html += '<td colspan="2"></td>';
 			html += '<td style="text-align: right;padding-bottom: 20px;">';
 			html += '<span style="padding-right: 20px;cursor: pointer;" onclick="tuwen_add()">';
 			html += '<img alt="" src="/wxi/image/dkfManager/icon_add.png">';
 			html += '</span>';
 			html += '<span style="cursor: pointer;" onclick="tuwen_remove()">';
 			html += '<img alt="" src="/wxi/image/dkfManager/icon_delete.png">';
 			html += '</span>';
 			html += '</td>';
 			html += '<td style="width:7%;"></td>';
 			html += '</tr>';
 		}
		$("#tuwen_add_div").html(html)
		
	}
	
	function keyword_add_alert(){
 		 
		var keywordGroup = ""; //关键词组
		var keyword = ""; // 关键词
		var newsPicType = ""; // 图文消息类型
		var arsTitle = ""; //图文消息标题
		var arsTitle_tuwen = ""; 
		var arsTitle_text = "";
		var arsImage = ""; //图文消息图片
		var arsImage_image = $("#arsImage").val();
		var arsImage_tuwen = "";
		var arsContent = ""; //图文消息内容
		var arsUrl = ""; //图文消息链接
		var keywordType = "";
		
		
		arsTitle_text = $("#arsTitle_text").val();
		$('input[name="arsTitle_newsPic"]').each(function(){  
			arsTitle_tuwen += $(this).val() + '|'
		});
		$('input[name="arsImage"]').each(function(){  
			arsImage_tuwen += $(this).val() + '|'
		});
		$('textarea[name="arsContent"]').each(function(){  
			arsContent += $(this).val() + '|'
		});
		$('input[name="arsUrl"]').each(function(){  
			arsUrl += $(this).val() + '|'
		});
		
		if($('.tabs .tab.active').attr("id") == "tab_dkf"){
			keywordGroup = $("#keywordGroup_dkf").val();
			keyword = $("#keyword_dkf").val();
			newsPicType = "";
			arsTitle = "";
			arsImage = "";
			arsContent = "";
			arsUrl = "";
			keywordType = "DKF";
			 if(keywordGroup == ""){
				 showbPoupMsgDiv("请选择关键词分组");
				 return "";
			 }
			 if(keyword == ""){
				 showbPoupMsgDiv("请填写关键词");
				 return "";
			 }
 		}else{
			
			keywordGroup = $("#keywordGroup_ars").val();
			keyword = $("#keyword_ars").val();
			newsPicType = $("#arsType").val();
			if(newsPicType == "1"){
				arsTitle = arsTitle_text;
			}else if(newsPicType == "3"){
				arsTitle = arsTitle_tuwen;
			}else{
				arsTitle = "";
			}
			if(newsPicType == "2"){
				arsImage = arsImage_image;
			}else if(newsPicType == "3"){
				arsImage = arsImage_tuwen;
			}else{
				arsImage = "";
			}
			arsContent = arsContent;
			arsUrl = arsUrl;
			keywordType = "ARS";
			 if(keywordGroup == ""){
				 showbPoupMsgDiv("请选择关键词分组");
				 return "";
			 }
			 if(keyword == ""){
				 showbPoupMsgDiv("请填写关键词");
				 return "";
			 }
			 if(newsPicType == ""){
				 showbPoupMsgDiv("请选择消息类型");
				 return "";
			 }	
 			 if(newsPicType == "1"){
				if(arsTitle_text == ""){
					showbPoupMsgDiv("请填写文本消息内容");
					return "";
				}
			 }else if(newsPicType == "2"){
				if(arsImage_image == ""){
					showbPoupMsgDiv("请上传图片消息图片");
					return "";
				}
			 }else if(newsPicType == "3"){
				if(arsTitle == "|"){
					showbPoupMsgDiv("请填写图文消息标题");
					return "";
				}
				if(arsImage_tuwen == "|"){
					showbPoupMsgDiv("请上传图文消息图片");
					return "";
				}
				if(arsContent == "|"){
					showbPoupMsgDiv("请填写图文消息内容");
					return "";
				}
				if(arsUrl == "|"){
					showbPoupMsgDiv("请填写图文消息URL");
					return "";
				}
			 }
		}	
		keyword_add_submit();
	}
	
	function keyword_add_submit(){
 		var basePath = $("#basePath").val();
		var keywordGroup = ""; //关键词组
		var keyword = ""; // 关键词
		var newsPicType = ""; // 图文消息类型
		var arsTitle = ""; //图文消息标题
		var arsTitle_tuwen = ""; 
		var arsTitle_text = "";
		var arsImage = ""; //图文消息图片
		var arsImage_image = $("#arsImage").val();
		var arsImage_tuwen = "";
		var arsContent = ""; //图文消息内容
		var arsUrl = ""; //图文消息链接
		var keywordType = "";
		
		arsTitle_text = $("#arsTitle_text").val();
		$('input[name="arsTitle_newsPic"]').each(function(){  
			arsTitle_tuwen += $(this).val() + '|'
		});
		$('input[name="arsImage"]').each(function(){  
			arsImage_tuwen += basePath + $(this).val() + '|'
		});
		$('textarea[name="arsContent"]').each(function(){  
			arsContent += $(this).val() + '|'
		});
		$('input[name="arsUrl"]').each(function(){  
			arsUrl += $(this).val() + '|'
		});
		
		if($('.tabs .tab.active').attr("id") == "tab_dkf"){
			keywordGroup = $("#keywordGroup_dkf").val();
			keyword = $("#keyword_dkf").val();
			newsPicType = "";
			arsTitle = "";
			arsImage = "";
			arsContent = "";
			arsUrl = "";
			keywordType = "DKF";
		}else{
			keywordGroup = $("#keywordGroup_ars").val();
			keyword = $("#keyword_ars").val();
			newsPicType = $("#arsType").val();
			if(newsPicType == "1"){
				arsTitle = arsTitle_text;
			}else if(newsPicType == "3"){
				arsTitle = arsTitle_tuwen;
			}else{
				arsTitle = "图片标题";
			}
			if(newsPicType == "2"){
				arsImage = arsImage_image;
			}else if(newsPicType == "3"){
				arsImage = arsImage_tuwen;
			}else{
				arsImage = "";
			}
			arsContent = arsContent;
			arsUrl = arsUrl;
			keywordType = "ARS";
		}
 		var params = {
			keywordGroup : keywordGroup,
			keyword : keyword,
			newsPicType : newsPicType,
			arsTitle : arsTitle,
			arsImage : arsImage,
			arsContent : arsContent,
			arsUrl : arsUrl,
			keywordType : keywordType
		}
		
		$.ajax({
			data : params,
	 		url : '/wxi/dkf/addKeyword.htm',
	 		success : function(data){
  	 			if(data == 1){
  	 				showbPoupMsgDiv("请勿保存重复关键词");
	 			}else if(data == 0){
 	 				mainView.router.reloadPreviousPage('/wxi/dkf/keyWordList.jsp');
	 				showbPoupMsgDivBack('保存成功');
 	 			}else{
	 				showbPoupMsgDiv("保存失败");
	 			}
  	 		},
	 		error : function(a, msg, c){
	 			alert('error: ' + msg);
	 		}
		})
	}
	
	function uploadImagesMsg(file){
  		if(checkNewsPic(file)){
 			var imgLogoPicture = document.getElementById('logo_input').value;
			var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
			var param = {fileName : logoFileName}
 			$.ajaxFileUpload ({
				data : param,
				url :'/wxi/dkf/saveHeadImage.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
				secureuri : false,
				fileElementId : 'logo_input',
				dataType : 'json',
				type : 'post',
				success : function (data){
					if(data.resultLogoImg == 'success'){
 						$('#image_thu').html("");
 						 var html = '<img onclick="logo_input.click()" style="width:50%;cursor:pointer;height:100%" alt="" src="'+ data.fileUrl +'">'
 						$('#image_thu').html(html);
 						$("#arsImage").val(data.fileUrl);
					}else{
						
					}
				},
				error: function (data, e){
					alert(e );
				}
			});	
		} 
	}
	
	function imageSelect(documentId){
 		$('#newsPicId').trigger('click');
  		documentID = documentId;
 	}
	
	function uploadNewsPic(file){ 
  		if(checkNewsPic(file)){
 			var imgLogoPicture = document.getElementById('newsPicId').value;
			var logoFileName = imgLogoPicture.substring(imgLogoPicture.lastIndexOf('\\') + 1, imgLogoPicture.length);
			var param = {
					fileName : logoFileName,
 			}
 			$.ajaxFileUpload ({
				data : param,
				url :'/wxi/dkf/saveNewsPic.htm',   //调用AdminShopCreateAction类中的savefile()方法存储logo图片
				secureuri : false,
				fileElementId : 'newsPicId',
				dataType : 'json',
				type : 'post',
				success : function (data){
					if(data.resultLogoImg == 'success'){
						var args = documentID;
   						$('#image_thu_'+args).html("");
 						var html = '<img onclick="imageSelect('+ args +')" style="cursor:pointer;width:50%;height:100%" alt="" src="'+ data.fileUrl +'">'
 						$('#image_thu_'+args).html(html);
 						$('#arsImage_'+args).val(data.fileUrl);
 					}else{
						
					}
				},
				error: function (data, e){
					alert(e );
				}
			});	
		} 
   		 
	}

	//检查上传文件是否为图片
	 function checkNewsPic(file){
 	 	var picPath = file.value;
  	 	if(picPath == ''){
	 		return false;
	 	}
	      var type = picPath.substring(picPath.lastIndexOf('.') + 1, picPath.length).toLowerCase();
 	      if (type != 'jpg' && type != 'png') {
	          alert('<ui:i18n key="请上传正确的图片格式"/>');
	          return false;
	      }
	 	return true;
	 }

	 function closeBpoupSave(){
		 $('#msgPoup-save').bPopup().close();
  	 }
	 
	 
	 function closeDelete(){
		$('#Poup-delete').bPopup().close();
 	}
	 
	 
	 //当类型为图文消息时候，添加图文
	 function newsFeedAdd(){
		 var numLimit = Number($('#newsFeedNum').val());
		 //alert(numLimit+1);
		 var lengthTbody = $('#3').find('tbody').size();
		 if(lengthTbody >= 8){
			 showbPoupMsgDiv('图文消息最多能添加八个！');
			 return;
		 }
		 var htm ='<tbody id="newsFeed'+numLimit+'">'+
						'<tr>'+
							'<td style="width:7%"></td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;width:31px;">标题:</td>'+
							'<td style="padding-top:20px;">'+
								'<input type="text" value="" data-id="10000" id="arsTitle_newsPic" name="arsTitle_newsPic"/>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'<tr>'+
							'<td style="width:7%"></td>'+
							'<td style="padding-top:20px;vertical-align: top;width:31px;">图片:</td>'+
							'<td style="padding-top:20px;" >'+
								'<input type="hidden" id="arsImage_'+numLimit+'" value="" data-id="10000" name="arsImage"/>'+
								'<div type="button" class="file_button" id="image_thu_'+numLimit+'">'+
									'<div onclick="imageSelect('+numLimit+')" class="file_select">选择</div>'+
									'<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>'+
								'</div>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'<tr>'+
							'<td style="width:7%"></td>'+
							'<td style="padding-top:20px;vertical-align: top;width:31px;">描述:</td>'+
							'<td style="padding-top:20px;">'+
								'<textarea id="arsContent10000" name="arsContent" data-id="10000" style="height: 60px;width: 100%;border-radius: 5px;"></textarea>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'<tr>'+
							'<td style="width:7%;padding-bottom: 20px;"></td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;width:31px;">URL:</td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;">'+
								'<input type="text" value="" name="arsUrl" data-id="10000" id="arsUrl"/>'+
							'</td>'+
							'<td style="width:7%;padding-bottom: 20px;"></td>'+
						'</tr>'+
						'<tr>'+
							'<td colspan="2"></td>'+
							'<td style="text-align: right;padding-bottom: 20px;">'+
								'<span style="padding-right: 20px;cursor: pointer;" onclick="newsFeedAdd()">'+
									'<img alt="" src="/wxi/image/dkfManager/icon_add.png">'+
								'</span>'+
								'<span style="cursor: pointer;" onclick="newsFeedDelete('+numLimit+')">'+
									'<img alt="" src="/wxi/image/dkfManager/icon_delete.png">'+
								'</span>'+
							'</td>'+
							'<td style="width:7%;"></td>'+
							 
						'</tr>'+
					'</tbody>';
		 //alert(htm);
		 $('#3').append(htm);
		 $('#newsFeedNum').val(numLimit+1);
	 }
	 //当类型为图文消息时候，删除图文
	 function newsFeedDelete(id){
		 var lengthTbody = $('#3').find('tbody').size();
		 if(lengthTbody == 1){
			 showbPoupMsgDiv('该图文消息不可删除！');
		 }else{
			 $('#newsFeed'+id).remove();
		 }
	 }
	 //保存修改的关键字信息
	 function keyword_update_alert(){
		 var basePath = $("#basePath").val();
			var keywordGroup = ""; //关键词组
			var keyword = ""; // 关键词
			var newsPicType = ""; // 图文消息类型
			var arsTitle = ""; //图文消息标题
			var arsTitle_tuwen = ""; 
			var arsTitle_text = "";
			var arsImage = ""; //图文消息图片
			var arsImage_image = $("#arsImage").val();
			var arsImage_tuwen = "";
			var arsContent = ""; //图文消息内容
			var arsUrl = ""; //图文消息链接
			var keywordType = "";
			var keyWordBefore = $('#keyWordBefore').val();
			arsTitle_text = $("#arsTitle_text").val();
			$('input[name="arsTitle_newsPic"]').each(function(){  
				arsTitle_tuwen += $(this).val() + '|'
			});
			$('input[name="arsImage"]').each(function(){
				var index = $(this).val().indexOf(basePath);
				if(index >= 0){
					arsImage_tuwen += $(this).val() + '|';
				}else{
					arsImage_tuwen += basePath + $(this).val() + '|';
				}
			});
			$('textarea[name="arsContent"]').each(function(){  
				arsContent += $(this).val() + '|'
			});
			$('input[name="arsUrl"]').each(function(){  
				arsUrl += $(this).val() + '|'
			});
			
			keywordGroup = $("#keywordGroup_ars").val();
			keyword = $("#keyword_ars").val();
			newsPicType = $("#arsType").val();
			if(newsPicType == "1"){
				arsTitle = arsTitle_text;
			}else if(newsPicType == "3"){
				arsTitle = arsTitle_tuwen;
			}else{
				arsTitle = "图片标题";
			}
			if(newsPicType == "2"){
				arsImage = arsImage_image;
			}else if(newsPicType == "3"){
				arsImage = arsImage_tuwen;
			}else{
				arsImage = "";
			}
			arsContent = arsContent;
			arsUrl = arsUrl;
			keywordType = "ARS";
			var flagBreak = false;
			if(keywordGroup == ""){
				 showbPoupMsgDiv("请选择关键词分组");
				 return "";
			 }
			 if(keyword == ""){
				 showbPoupMsgDiv("请填写关键词");
				 return "";
			 }
			 if(newsPicType == ""){
				 showbPoupMsgDiv("请选择消息类型");
				 return "";
			 }	
			 if(newsPicType == "1"){
				if(arsTitle_text == ""){
					showbPoupMsgDiv("请填写文本消息内容");
					return "";
				}
			 }else if(newsPicType == "2"){
				if(arsImage_image == ""){
					showbPoupMsgDiv("请上传图片消息图片");
					return "";
				}
			 }else if(newsPicType == "3"){
				 var titleNum = 0;
				 var imgNum = 0;
				 var descNum = 0;
				 var urlNum = 0;
				 $('input[name="arsTitle_newsPic"]').each(function(){  
					titleNum ++;
				 	if($(this).val() == ''){
				 		flagBreak = true;
						showbPoupMsgDiv('请填写第'+titleNum+'个图文消息的标题');
						return false;
					}
				 	var elements = document.getElementsByName('arsTitle_newsPic').length;
				 	if(titleNum == elements){
				 		$('input[name="arsImage"]').each(function(){  
							imgNum ++;
						 	if($(this).val() == ''){
						 		flagBreak = true;
								showbPoupMsgDiv('请选择第'+imgNum+'个图文消息的图片');
								return false;
							}
						 	if(imgNum == elements){
						 		$('textarea[name="arsContent"]').each(function(){  
									descNum ++;
								 	if($(this).val() == ''){
								 		flagBreak = true;
										showbPoupMsgDiv('请填写第'+descNum+'个图文消息的描述');
										return false;
									}
								 	if(descNum == elements){
								 		$('input[name="arsUrl"]').each(function(){  
											urlNum ++;
										 	if($(this).val() == ''){
										 		flagBreak = true;
												showbPoupMsgDiv('请填写第'+urlNum+'个图文消息的URL');
												return false;
											}
										});
								 	}
								});
						 	}
						});
				 	}
				 	
				});
				
			 }
			 if(flagBreak){
				 return;
			 }
	 		var params = {
				keywordGroup : keywordGroup,
				keyword : keyword,
				newsPicType : newsPicType,
				arsTitle : arsTitle,
				arsImage : arsImage,
				arsContent : arsContent,
				arsUrl : arsUrl,
				keywordType : keywordType,
				keyWordBefore : keyWordBefore
			}
			
			$.ajax({
				data : params,
		 		url : '/wxi/dkf/saveUpdateKeyword.htm',
		 		success : function(data){
	  	 			if(data == 1){
	  	 				showbPoupMsgDiv("请勿保存重复关键词");
		 			}else if(data == 0){
	 	 				mainView.router.reloadPreviousPage('/wxi/dkf/keyWordList.jsp');
		 				showbPoupMsgDivBack('保存成功');
	 	 			}else{
		 				showbPoupMsgDiv("保存失败");
		 			}
	  	 		},
		 		error : function(a, msg, c){
		 			alert('error: ' + msg);
		 		}
			});
	 }
	 //切换消息类型时候的显示操作
	 function msg_update_select(args){
			var divid = "";
			$('.keyword-add-msg_tuwen').each(function(){  
				var divid = $(this).data('id');
				$("#"+divid).addClass("msg_display");
		  	});
			var html = '<tbody>'+
							'<tr>'+
								'<td style="width:7%"></td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;">'+
								'<textarea id="arsTitle_text" style="height: 60px;width: 100%;border-radius: 5px;"></textarea>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'</tbody>';
			$('#1').html(html);
			html = '<tbody>'+
						'<tr>'+
							'<td style="width:7%"></td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;">'+
							'<input type="file" id="logo_input" name="logo_input" onchange="uploadImagesMsg(this)" style="display:none"/>'+ 
							'<input type="hidden" id="arsImage" value=""/>'+
								'<div type="button" class="file_button" id="image_thu">'+
								'<div onclick="logo_input.click()" class="file_select">选择</div>'+
								'<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>'+  
							'</div>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
					'</tbody>';
			$('#2').html(html);
			html = '<tbody id="newsFeed0">'+
						'<tr>'+
								'<td style="width:7%"></td>'+
								'<td style="padding-top:20px;padding-bottom: 20px;width:31px;">标题:</td>'+
							'<td style="padding-top:20px;">'+
								'<input type="text" value="" data-id="10000" id="arsTitle_newsPic" name="arsTitle_newsPic"/>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'<tr>'+
								'<td style="width:7%"></td>'+
								'<td style="padding-top:20px;vertical-align: top;width:31px;">图片:</td>'+
							'<td style="padding-top:20px;" >'+
								'<input type="hidden" id="arsImage_0" value="" data-id="10000" name="arsImage"/>'+
									'<div type="button" class="file_button" id="image_thu_0">'+
									'<div onclick="imageSelect(0)" class="file_select">选择</div>'+
									'<div style="margin-top: 5px;font-style: italic;">支持JPG,PNG格式,较好的效果为大图640*320</div>'+
								'</div>'+
								'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
							'<tr>'+
								'<td style="width:7%"></td>'+
								'<td style="padding-top:20px;vertical-align: top;width:31px;">描述:</td>'+
							'<td style="padding-top:20px;">'+
								'<textarea id="arsContent10000" name="arsContent" data-id="10000" style="height: 60px;width: 100%;border-radius: 5px;"></textarea>'+
							'</td>'+
							'<td style="width:7%"></td>'+
						'</tr>'+
						'<tr>'+
								'<td style="width:7%;padding-bottom: 20px;"></td>'+
								'<td style="padding-top:20px;padding-bottom: 20px;width:31px;">URL:</td>'+
							'<td style="padding-top:20px;padding-bottom: 20px;">'+
								'<input type="text" value="" name="arsUrl" data-id="10000" id="arsUrl"/>'+
							'</td>'+
							'<td style="width:7%;padding-bottom: 20px;"></td>'+
						'</tr>'+
						'<tr>'+
							'<td colspan="2"></td>'+
								'<td style="text-align: right;padding-bottom: 20px;">'+
									'<span style="padding-right: 20px;cursor: pointer;" onclick="newsFeedAdd()">'+
										'<img alt="" src="/wxi/image/dkfManager/icon_add.png">'+
									'</span>'+
									'<span style="cursor: pointer;" onclick="newsFeedDelete(0)">'+
										'<img alt="" src="/wxi/image/dkfManager/icon_delete.png">'+
									'</span>'+
								'</td>'+
								'<td style="width:7%;"></td>'+
								 
							'</tr>'+
						'</tbody>';
			$('#3').html(html);
			$('#newsFeedNum').val(1);
			$("#"+args).removeClass("msg_display");
		
		}
	 
	 //修改ARS关键字时候删除关键字
	 function showBpopup_RemoveKeywordUpdate(){
		 deleteType = 'deleteType';
		 showBpopup({
				id : 'Poup-delete',
				width :375,
				top:180,
				left:20
			});
	 }
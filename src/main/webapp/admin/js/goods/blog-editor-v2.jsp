<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ include file="/admin/template/tagsInc.jsp"%>  
<script type="text/javascript">
//获取商品组的下拉框
var shopGoodsClassLevelOneCombo = [];
$.ajax({
	url : "/admin/combo/list.htm?t=101",
	success : function(data) {
		shopGoodsClassLevelOneCombo = data ||[];
		
		//console.log('<<<<<<<');
		//console.log(shopGoodsClassLevelOneCombo);
	},
	error : function(xhr, status, e) {
		alert("error: " + status);
	}
});
</script>

<script type="text/javascript">
 var gcNm = '';
var gg_goodsId = '';
var gg_gcId = '';
var isPublishing = false;
var editor = '';	


var ggTempId = '';
 
//在编辑器页面中图片slider功能
function imgSlider(selector) {
	
	var $context = $(selector);
	var sWidth = $context.width(); //获取焦点图的宽度（显示面积）
	var len = $("ul li", $context).length; //获取焦点图个数 
	var index = 0;
	var picTimer;

	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = '<div class="sliderbtnBg"></div>' + '<div class="sliderBtn">';
	for (var i = 0; i < len; i++) {
		btn += '<span></span>';
	}
	btn += '</div>';
	//  +	  '<div class="preNext pre"></div>'
	// +	  '<div class="preNext next"></div>';

	$context.append(btn);
	$(".sliderbtnBg", $context).css("opacity", 0.5);

	//为小按钮添加鼠标滑入事件，以显示相应的内容
	$(".sliderBtn span", $context).css("opacity", 0.4).mouseover(function() {
		index = $(".sliderBtn span", $context).index(this);
		showPics(index);
	}).eq(0).trigger("mouseover");

	/****
	//上一页、下一页按钮透明度处理 
	$(".preNext",$context).css("opacity",0.2).hover(function() {
		$(this).stop(true,false).animate({"opacity":"0.5"},300);
	},function() {
		$(this).stop(true,false).animate({"opacity":"0.2"},300);
	});

	//上一页按钮
	$(".pre",$context).click(function() {
		index -= 1;
		if(index == -1) {index = len - 1;}
		showPics(index);
	});

	//下一页按钮
	$(".next",$context).click(function() {
		index += 1;
		if(index == len) {index = 0;}
		showPics(index);
	});
	 ****/

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("ul", $context).css("width", sWidth * (len));

	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$context.hover(function() {
		clearInterval(picTimer);
	}, function() {
		picTimer = setInterval(function() {
			showPics(index);
			index++;
			if (index == len) {
				index = 0;
			}
		}, 4000); //此4000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");

	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) { //普通切换
		var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
		$("ul", $context).stop(true, false).animate({
			"left" : nowLeft
		}, 300); //通过animate()调整ul元素滚动到计算出的position
		//$("#sliderImg .sliderBtn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
		$(".sliderBtn span", $context).stop(true, false).animate({
			"opacity" : "0.4"
		}, 300).eq(index).stop(true, false).animate({
			"opacity" : "1"
		}, 300); //为当前的按钮切换到选中的效果
	}
}

</script>





<script type="text/javascript">
function init(){
	 //页面初始化绑定参数
   	$('.ui-sortable').sortable({ axis: "y"});  
	$( ".ui-sortable" ).disableSelection(); 
	//console.log('.app-field. size==' +$('.app-field').size());
	$('.app-field').unbind('click').click(fnBindShowAppSidebar);
	  
	  $('.app-field .actions .action.delete').click(function(){
		  	//var id = $(this).attr('data-id');
		  	//console.log('delete id=' + id);
	  		$(this).closest('.app-field').remove(); 
	  		$('.app-sidebar').hide();
	  		$('.js-fields-region .app-field:last-of-type').click();
	  });
	
}

 
/***********************************************************/
 </script>
  <script type="text/javascript">
  function fnChooseHeadSlider(array){
	  console.log('====== fnChooseHeadSlider ======');
	  
	  var $editing = $('#app-field-header');
	  var item = $editing.data('fieldItem') || [] ;
	  
	  for(var i = 0 ; i < array.length; i++){
		  array[i].tempId = _.random(1000000000, 9999999999);
		  item.push(array[i]);
	  }
	  
	  item = _.last(item, 5);
	  
	  $editing.data('fieldItem',item);
	  
	  initHeaderSlider();
	  
	  fnCloseHeadSlider();
}
  

function initHeaderSlider(){
	 console.log('====== initHeaderSlider ======');
	var $editing = $('#app-field-header');
	var item = $editing.data('fieldItem') || [] ;
	//console.log(item);
	if(item.length > 0){
		$('.js-top-slider-region' , $editing).hide();
		$('.sliderImg' , $editing).html('<ul></ul>') ;
		$('.sliderImg' , $editing).show();
		for(var i = 0; i < item.length;i++){
			$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + item[i].fileUrl + '" alt="' + item[i].fileNm + '" /></a></li>');
			;
		}
		$(".sliderImg", $editing).each(function(){
			imgSlider($(this));
		});
	}else{
		$('.js-top-slider-region' , $editing).show();
		$('.sliderImg' , $editing).hide();
	}
  
  
	 $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=3&conformMethod=fnChooseHeadSlider&clsoeMethod=fnCloseHeadSlider' //参数 fileGroup 必选 1：商品   2：素材    3：Blog
																			// max 可选择的图片张数 可选  （不填写时可以选择任意张）
																			// conformMethod 可选（在弹出窗口点击确认时调用的父页面函数 默认函数：choosePicture）
																			// clsoeMethod 可选（在弹出窗口点击取消时调用的父页面函数 默认函数：closeWindow）
			});	
	   });
	
	
  $('.js-slider-pic-warp .form-pic').remove();
  
  for(var i = 0 ; i < item.length;i++){
		var tpl =  template('tpl_pic_item', item[i]);
		$('.js-slider-pic-warp .js-add-pic').before(tpl);
 }
  
  
  $('.js-slider-pic-warp .js-pic-del').click(function (){
	 	  var id = $(this).data('id');
	 	
		  var $editing = $('#app-field-header');
		  var item = $editing.data('fieldItem') || [] ;
		  
		  	var tempItem =[];
			for(var i in item){
			 	if(item[i].tempId != id ){
			 		tempItem.push(item[i]);
			 	} 
			} 
			 $editing.data('fieldItem', tempItem) ;
			 initHeaderSlider();
	 });
}


function fnCloseHeadSlider(){
	//console.log('====== fnCloseHeadSlider ======');
	 closeBpopupWindow('bpopupPicture');
}

</script>
<script type="text/javascript">

function fnChooseType01(array){
	console.log('====== fnChooseType01 ======');
	  var $editing = $('.app-field.editing');
	  var item = $editing.data('fieldItem') || [] ;
	  
	  for(var i = 0 ; i < array.length; i++){
		  array[i].tempId = _.random(1000000000, 9999999999);
		  array[i].linkUrl = '';
		  item.push(array[i]);
	  }
	  
	  item = _.last(item, 5);
	  
	  $editing.data('fieldItem',item);
	  
	  initEvent01();
	  fnClosePicture();
	 
}

function initEvent01(){
	console.log('====== initEvent01 ======');
	var $editing = $('.app-field.editing');
	var item = $editing.data('fieldItem') || [] ;
	
	  item = _.last(item, 5);
	  
	  $editing.data('fieldItem',item);
	 // initHeaderSlider(item);
	 
	  if(item.length > 0){
			$('.type01' , $editing).hide();
			$('.sliderImg' , $editing).html('<ul></ul>') ;
			$('.sliderImg' , $editing).show();
			for(var i = 0; i < item.length; i++){
				$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + item[i].fileUrl + '" alt="' + item[i].fileNm + '" /></a></li>');
				;
			}
			$(".sliderImg", $editing).each(function(){
				imgSlider($(this));
			});
		}else{
			$('.type01' , $editing).show();
			$('.sliderImg' , $editing).hide();
		}
	  
	  
	  $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=3&conformMethod=fnChooseType01&clsoeMethod=fnClosePicture' 
			});	
		 });
	  
	  
	  $('.js-pic-list li').remove();
	  
	  for(var i = 0 ; i < item.length;i++){
			var tpl =  template('tpl_pic_item_url', item[i]);
			$('.js-pic-list ul').append(tpl);
	 }
	  
	  
	  $('.js-pic-list .js-pic-del').click(function(){
			 var id = $(this).data('id');
			 	
			  var $editing = $('.app-field.editing');
			  var item = $editing.data('fieldItem') || [] ;
			 // console.log('id=' + id);
			 // console.log('item=' + item);
			  	var tempItem =[];
				for(var i in item){
				 	if(item[i].tempId != id ){
				 		tempItem.push(item[i]);
				 	} 
				} 
				$editing.data('fieldItem',tempItem);
				
				initEvent01();
		 });
	  
	  $('.js-pic-list .js-link-url').unbind('keyup').keyup(setLinkUrl);
	  $('.js-pic-list .js-btn-choose').unbind('click').click(openLink);
}


function setLinkUrl(){
	var tempId = $(this).data('id')
	   ,val = $(this).val()
	   ,$editing =  $('.app-field.editing') 
	   ,array = $editing.data('fieldItem') || [] ;
	   //console.log('val=' +val);
		for(var i= 0 ; i < array.length ; i++){
			if(array[i].tempId == tempId){
				array[i].linkUrl = val;
				$editing.data('fieldItem',array);
				
				//console.log('>>');
				break;
			}
		}
	
}

//选择链接窗口-打开
function openLink(){
	 var tempId = $(this).data('id');
	 ggTempId = tempId;
	   
	   showIframeBpopupWindow({
			id : 'bpopupLink',
			title : '<ui:i18n key="选择链接"/>', // 标题 option
			width : 840, 
			height : 462, 
			action : '/admin/master/file/link.htm?conformMethod=chooseLink&clsoeMethod=closeLinkWindow'  
					
	 });	
}
 
//选择链接窗口-确认
function chooseLink(link){
	//console.log('-------chooseLink');
	 //obj为返回的数组 格式 
	 $('.js-pic-list .js-link-url').each(function(){
		 if($(this).data('id') == ggTempId){
			 $(this).val(link.url).trigger('keyup');
			 return false; 
		 }
	 });
 
	 closeLinkWindow();
	}
//选择链接窗口-确认
function chooseLink20(link){
	//console.log('-------chooseLink');
	$('.js-link-url20').val(link.url).trigger('keyup');
 
	 closeLinkWindow();
	}
//选择链接窗口-关闭
function closeLinkWindow(){
	ggTempId = '';
 	closeBpopupWindow('bpopupLink');
}	

function fnClosePicture(){
	//console.log('====== fnClosePicture ======');
	 closeBpopupWindow('bpopupPicture');
}
</script>
<script type="text/javascript">
function initEvent12(){
	console.log('====== initEvent12 ======');
	var $editing = $('.app-field.editing');
	var item = $editing.data('fieldItem') || [] ;
	
	  item = _.last(item, 1);
	  
	  $editing.data('fieldItem',item);
	  
	  if(item.length > 0){
		  $editing.find('.type12').find('img').attr('src',item[0].fileUrl); 
	  }else{
		  $editing.find('.type12').find('img').attr('src','/admin/images/widget/good-image1.png');
	  }
	  
	  $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=3&max=1&conformMethod=fnChooseType12&clsoeMethod=fnClosePicture' 
			});	
		 });
	  
	  
	  $('.js-pic-list li').remove();
	  
	  for(var i = 0 ; i < item.length;i++){
			var tpl =  template('tpl_pic_item_url', item[i]);
			$('.js-pic-list ul').append(tpl);
	  }
	  
	  $('.js-pic-list .js-pic-del').click(function(){
			 var id = $(this).data('id');
			 	
			  var $editing = $('.app-field.editing');
			  var item = $editing.data('fieldItem') || [] ;
			  //console.log('id=' + id);
			  //console.log('item=' + item);
			  	var tempItem =[];
				for(var i in item){
				 	if(item[i].tempId != id ){
				 		tempItem.push(item[i]);
				 	} 
				} 
				$editing.data('fieldItem',tempItem);
				
				initEvent12();
		 });
	  
	  $('.js-pic-list .js-link-url').unbind('keyup').keyup(setLinkUrl);
	  $('.js-pic-list .js-btn-choose').unbind('click').click(openLink);
}

function fnChooseType12(array){
	console.log('====== fnChooseType12 ======');
	//console.log('array');
	//console.log(array);
	  var $editing = $('.app-field.editing');
	 
	  array[0].tempId = _.random(1000000000, 9999999999);
	  array[0].linkUrl = '';
	  
	  var item = array[0];
	 $editing.data('fieldItem',[item]); 
	 
	 initEvent12();
	 fnClosePicture();
	 
}
</script>
<script type="text/javascript">
function initEvent13(){
	console.log('====== initEvent13 ======');
	var $editing = $('.app-field.editing');
	var item = $editing.data('fieldItem') || [] ;
	
	  item = _.last(item, 2);
	  
	  $editing.data('fieldItem',item);
	  
	  $editing.find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
	  for(var i = 0; i < item.length; i++){
			$editing.find('.dispaly-img')[i].src = item[i].fileUrl;
	 }
	  
	  $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=3&max=3&conformMethod=fnChooseType13&clsoeMethod=fnClosePicture' 
			});	
		 });
	  
	  
	  $('.js-pic-list li').remove();
	  
	  for(var i = 0 ; i < item.length;i++){
			var tpl =  template('tpl_pic_item_url', item[i]);
			$('.js-pic-list ul').append(tpl);
	  }
	  
	  $('.js-pic-list .js-pic-del').click(function(){
			 var id = $(this).data('id');
			 	
			  var $editing = $('.app-field.editing');
			  var item = $editing.data('fieldItem') || [] ;
			 // console.log('id=' + id);
			 // console.log('item=' + item);
			  	var tempItem =[];
				for(var i in item){
				 	if(item[i].tempId != id ){
				 		tempItem.push(item[i]);
				 	} 
				} 
				$editing.data('fieldItem',tempItem);
				
				initEvent13();
		 });
	  
	  
	  $('.js-pic-list .js-link-url').unbind('keyup').keyup(setLinkUrl);
	  $('.js-pic-list .js-btn-choose').unbind('click').click(openLink);
	  
	  
	  var leftWidth  =  $editing.data('fieldLeftWidth') || 50 
		 ,imgLeftName = $editing.data('imgLeftName') || ''
  	     ,imgRightName = $editing.data('imgRightName') || '';
  	    
  	  $( ".js-img-width-slider" ).slider({
		     // range: true,
		     // min: 0,
		     // max: 500,
		     // values: [ 75, 300 ],
		      range: "max",
		      min: 20,
		      max: 80,
		      value: leftWidth,
		      slide: function( event, ui ) {
		        $( ".js-img-left-width" ).val(  ui.value + '%');
		        $( ".js-img-right-width" ).val( (100 - ui.value)  + '%');
		        
		        $editing.find('.js-img-left').css('width',ui.value + '%');
		        $editing.find('.js-img-right').css('width',(100 - ui.value) + '%');
		        
		        $editing.data('fieldLeftWidth',ui.value || 50) ;
		      }
		    });
		 	
  	  		
  	 
  	  		$('.js-img-left-name').val(imgLeftName);
  	  		$('.js-img-right-name').val(imgRightName);
  	  
  	  		$( ".js-img-left-width" ).val( $( ".js-img-width-slider" ).slider( "value" )    + '%');
		 	$( ".js-img-right-width" ).val((100 - $( ".js-img-width-slider" ).slider( "value" ) )    + '%');
		 	
		 	
		 	$('.js-img-left-name').unbind('keyup').keyup(function(){
	   			var val = $(this).val();
	   			$editing.data('imgLeftName', val);
	   		});
	   		$('.js-img-right-name').unbind('keyup').keyup(function(){
	   			var val = $(this).val();
	   			$editing.data('imgRightName', val);
	   		});
	  
}

function fnChooseType13(array){
	console.log('====== fnChooseType13 ======');
	 var $editing = $('.app-field.editing');
	 var item = $editing.data('fieldItem') || [] ;
	  
	 for(var i = 0 ; i < array.length; i++){
		  array[i].tempId = _.random(1000000000, 9999999999);
		  array[i].linkUrl = '';
		  item.push(array[i]);
	  }
	  
	  item = _.last(item, 2);
	 $editing.data('fieldItem',item); 
	 
	 initEvent18();
	 fnClosePicture();
}
</script>
<script type="text/javascript">
function initEvent18(){
	console.log('====== initEvent18 ======');
	var $editing = $('.app-field.editing');
	var item = $editing.data('fieldItem') || [] ;
	
	  item = _.last(item, 3);
	  
	  $editing.data('fieldItem',item);
	  
	  $editing.find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
	  for(var i = 0; i < item.length; i++){
			$editing.find('.dispaly-img')[i].src = item[i].fileUrl;
	 }
	  
	  $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/picture.htm?fileGroup=3&max=3&conformMethod=fnChooseType18&clsoeMethod=fnClosePicture' 
			});	
		 });
	  
	  
	  $('.js-pic-list li').remove();
	  
	  for(var i = 0 ; i < item.length;i++){
			var tpl =  template('tpl_pic_item_url', item[i]);
			$('.js-pic-list ul').append(tpl);
	  }
	  
	  $('.js-pic-list .js-pic-del').click(function(){
			 var id = $(this).data('id');
			 	
			  var $editing = $('.app-field.editing');
			  var item = $editing.data('fieldItem') || [] ;
			 // console.log('id=' + id);
			 // console.log('item=' + item);
			  	var tempItem =[];
				for(var i in item){
				 	if(item[i].tempId != id ){
				 		tempItem.push(item[i]);
				 	} 
				} 
				$editing.data('fieldItem',tempItem);
				
				initEvent18();
		 });
	  
	  $('.js-pic-list .js-link-url').unbind('keyup').keyup(setLinkUrl);
	  $('.js-pic-list .js-btn-choose').unbind('click').click(openLink);
}

function fnChooseType18(array){
	console.log('====== fnChooseType18 ======');
	 var $editing = $('.app-field.editing');
	 var item = $editing.data('fieldItem') || [] ;
	  
	 for(var i = 0 ; i < array.length; i++){
		  array[i].tempId = _.random(1000000000, 9999999999);
		  array[i].linkUrl = '';
		  item.push(array[i]);
	  }
	  
	  item = _.last(item, 3);
	 $editing.data('fieldItem',item); 
	 
	 initEvent18();
	 fnClosePicture();
}
</script>
<script type="text/javascript">
function initEvent20(){
	console.log('====== initEvent20 ======');
	var $editing = $('.app-field.editing')
	,linkNm = $editing.data('linkNm') || ''
	,linkUrl = $editing.data('linkUrl') || ''
	,linkType = $editing.data('linkType') || 1;
	
	$editing.find('.js-type19-title').text(linkNm || '<ui:i18n key="标题"/>');
	
	$('.js-link-title').val(linkNm);
	$('.js-link-url20').val(linkUrl);
	
	$('.js-link-title').unbind('keyup').keyup(function(){
		var val = $(this).val();
		$editing.data('linkNm', val);
		$editing.find('.js-type19-title').text(val || '<ui:i18n key="标题"/>');
		
	});
	$('.js-link-url20').unbind('keyup').keyup(function(){
		var val = $(this).val();
		$editing.data('linkUrl', val);
	});
	
	  $('.js-link-url-choose').unbind('click').click(function(){
		  showIframeBpopupWindow({
				id : 'bpopupLink',
				title : '<ui:i18n key="选择链接"/>', // 标题 option
				width : 840, 
				height : 462, 
				action : '/admin/master/file/link.htm?conformMethod=chooseLink20&clsoeMethod=closeLinkWindow'  
						
		 });
	  });
	  
	   $('.app-sidebar').find('.icradio').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	});
	   
	   $('.app-sidebar').find('.icradio').each(function(){
		   if($(this).val() == linkType){
		   		$(this).iCheck('check');
		   }
	   });
	   
	   
	   $('.app-sidebar').find('.icradio').on('ifChecked', function(event){
			$editing.data('linkType', $(this).val());
		});
}
 
</script>
<script type="text/javascript">
function initEvent05(){
	console.log('====== initEvent05 ======');
	var $editing = $('.app-field.editing')
	,goodsGroup = $editing.data('goodsGroup') || ''
	,goodsSize = $editing.data('goodsSize') || 1;
	
	
	var $combo = $('.app-sidebar').find('.js-goods-group');
	
	 $combo.select2({
		minimumResultsForSearch:5
		,allowClear: true 
	 });
	 
	 $combo.select2('val','');
	 $combo.html('<option value="" ></option>');//清空select内容  
	 
	 for(var i = 0 ; i < shopGoodsClassLevelOneCombo.length; i++){
		 $combo.append('<option value="' + shopGoodsClassLevelOneCombo[i].comboKey + '">' + shopGoodsClassLevelOneCombo[i].comboValue + '</option>');
	 }
	 
	 $combo.change(function(e){ 
		$editing.data('goodsGroup', $(this).val());
	 });	
	 
	 $combo.select2('val',goodsGroup).trigger("change");
	
	   $('.app-sidebar').find('.js-goods-size').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	});
	   
	   $('.app-sidebar').find('.js-goods-size').each(function(){
		   if($(this).val() == goodsSize){
		   		$(this).iCheck('check');
		   }
	   });
	   
	   
	   $('.app-sidebar').find('.js-goods-size').on('ifChecked', function(event){
			var goodsSize = $(this).val()
			,tpl = template('tpl_type_05_inner',{goodsSize : goodsSize});
		   
		    $editing.data('goodsSize', goodsSize);
		    $editing.find('.control-group ul').after(tpl).remove();
		});
	   
}
 
</script>
<script type="text/javascript">
function initEvent52(){
	console.log('====== initEvent52 ======');
	var $editing = $('.app-field.editing')
	,goodsSize = $editing.data('goodsSize') || 1
	,item  =  $editing.data('fieldItem') || [] ;
	
	if(goodsSize == 0){
		item = _.last(item, 3);
	}else{
		item = _.last(item, 4);
	}
	$editing.data('fieldItem',item);
	
	
	  $editing.find('.control-group ul')
	  	.after(_.template($('#tpl_type_52_inner').html())({
				goodsSize: goodsSize ,
				item : item
		 	})).remove();
	
	   $('.app-sidebar').find('.js-goods-size').iCheck({
	 	    checkboxClass: 'icheckbox_square-firebrick',
	 	    radioClass: 'iradio_square-firebrick',
	 	    increaseArea: '0%' // optional
	 	});
	   
	   $('.app-sidebar').find('.js-goods-size').each(function(){
		   if($(this).val() == goodsSize){
		   		$(this).iCheck('check');
		   }
	   });
	   
	   
	   $('.app-sidebar').find('.js-goods-size').on('ifChecked', function(event){
		   var val = $(this).val();
			$editing.data('goodsSize', val);
			initEvent52();
		});
	   
	   
	   $('.js-add-pic').unbind('click').click(function(){
			showIframeBpopupWindow({
				id : 'bpopupPicture',
				title : '<ui:i18n key="选择图片"/>', // 标题 option
				width : 840, 
				height : 462, 
				action: '/admin/goods/showLinkTypeWindow.htm?type=1&linkType=3'
			});	
		 });
	   
	   
	   $('.js-pic-list li').remove();
		 for(var i = 0 ; i < item.length;i++){
			    item[i].idx = i + 1;
				var tpl =  template('tpl_pic_item_url_52', item[i]);
				$('.js-pic-list ul').append(tpl);
		  }
		 
		 $('.js-pic-list .js-pic-del').click(function(){
			 var id = $(this).data('id');
			 	
			  var $editing = $('.app-field.editing');
			  var item = $editing.data('fieldItem') || [] ;
			  
			  	var tempItem =[];
				for(var i in item){
				 	if(item[i].tempId != id ){
				 		tempItem.push(item[i]);
				 	} 
				} 
				$editing.data('fieldItem',tempItem);
				initEvent52();
		 });
}
 
function setttingType52Image(imageArray){
	console.log("========setttingType52Image()===========");
	var $editing = $('.app-field.editing')
	,goodsSize = $editing.data('goodsSize')
	,item  =  $editing.data('fieldItem') || [] ;
	
	
	for(var i = 0 ; i < imageArray.length; i++){
		imageArray[i].tempId = _.random(1000000000, 9999999999);
		item.push(imageArray[i]);
	}
	
	if(goodsSize == 0){
		item = _.last(item, 3);
	}else{
		item = _.last(item, 4);
	}
	
	$editing.data('fieldItem',item);

 
	/*  id: 10119
	 imgFileId: 10912
	 imgFileUrl: "/uploads/12/2015/04/29/12_shop_2015_04_29_14_16_13_20968.jpg"
	 linkUrl: "/front/detail/detail.htm?shopId=12&displayId=10119&goodsId=40"
	 pageId: 10119
	 pageName: "非油炸健康香葱汤方便面 ，吃到最后也劲道"
	 tempId: 4613053606 */ 
	 initEvent52();
	fnClosePicture();
	   
}
</script>
<script type="text/javascript">
function initEvent99(){
	console.log('====== initEvent99 ======');
	var $editing = $('.app-field.editing')
	
	editor = UE.getEditor('js-editor', {
           autoHeight: false
        , toolbars: [[
                    'undo', 'redo', '|',
                     'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                     'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                     'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                     'directionalityltr', 'directionalityrtl', 'indent', '|',
                     'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                     'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                     'simpleupload', 'insertvideo',  'emotion', 'music', 'map',  'template', 'background', '|',
                     'horizontal', 'date', 'time', 'spechars',  '|',
                     'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                     'searchreplace', 'help' 
                 ]]
       	// ,initialFrameWidth :480
       	  ,initialFrameHeight :300
       	 ,elementPathEnabled : false
        });
	
	 editor.ready(function() {
        	editor.setContent($editing.find('.js-richtext').html()); 
        	editor.addListener('selectionchange',function(type,event){
        		//$('#result').html(editor.getContent());
        		$editing.find('.js-richtext').html(editor.getContent());
        	 });
        });
	  
}
 
</script>
<script type="text/javascript">
   function fnBindShowAppSidebar(){
		var $this = $(this);
	
		var type = $this.data('fieldType')
		,top = $this.position().top
		,data = {};
		
	 	console.log('=====bindShowSidebar()======');
	   	console.log('type===' + type);
	   	
	   	if(type == 'detail'){
    		return ;
    	}
	   	
	   	$('.app-field').removeClass('editing');
	   	$this.addClass('editing');
	   	$('.app-sidebar').show().css("margin-top", top + 'px');
	   	
     	
     	if(type == 'header'){
     		$('.app-sidebar').css("margin-top", (top + 66) + 'px');
     	}
     	
     	
     	data.type = type;
   
     	if(type == 'header'){
     		 data.item = $this.data('fieldItem') || [];
     		$('.js-sidebar-editor').html(template('tpl_sidebar_header', data));
     		initHeaderSlider();
     	}else if(type == 'type-01'){
     		data.item = $this.data('fieldItem') || [];
     		$('.js-sidebar-editor').html(template('tpl_sidebar_01', data));
     		initEvent01();
     	}else if(type == 'type-05'){
   			$('.js-sidebar-editor').html(template('tpl_sidebar_05', data));
   			initEvent05();
     	}else if(type == 'type-52'){
     		data.item =  $this.data('fieldItem') || [];
     		$('.js-sidebar-editor').html(template('tpl_sidebar_52', data));
     		initEvent52();
     	}else if(type == 'type-12'){
     		data.item =  $this.data('fieldItem') || [];
     		$('.js-sidebar-editor').html(template('tpl_sidebar_12', data));
     		initEvent12();
     	}else if(type == 'type-13'){
     		data.item =  $this.data('fieldItem') || [];
 	   		$('.js-sidebar-editor').html(template('tpl_sidebar_13', data));
 	   		initEvent13();
     	 }else if(type == 'type-18'){
     		data.item =  $this.data('fieldItem') || [];
     		$('.js-sidebar-editor').html(template('tpl_sidebar_18', data));
     		initEvent18();
     	 }else if(type == 'type-20'){
     	   	$('.js-sidebar-editor').html(template('tpl_sidebar_20', data)); 
     		initEvent20();
     	}else if(type == 'type-99'){
     		if(!!editor){
     			editor.destroy();
     			$('#js-editor').remove();
     			$('#containerWarp').html('');
     		}
     		$('.js-sidebar-editor').html(template('tpl_sidebar_99', data)); 
     		initEvent99();
     	}else{
     		
     	}
     		
     	
	}
	
   $(function(){
	  
	   init();
	   
		//点击添加组件响应事件 
	   $('.js-new-field').click(function(){
		  var $this = $(this);
		  $('.app-field.editing').removeClass('editing');   
		  
		  var $fields =  $('.js-fields-region .app-fields');
		  var fieldType = $this.data('fieldType') ; 
		  var tpl = ''; 
		  var paramObj = {
				  type :  fieldType
				  //,id : _.random(1000000000, 9999999999)
		  };
		  
		  if(fieldType == 'type-01'){
			  paramObj.item = [];
			  tpl = template('tpl_type_01',paramObj);
		  }else if(fieldType == 'type-05'){
			  paramObj.goodsGroup = 2;
			  paramObj.goodsSize = 1;
			  tpl = template('tpl_type_05',paramObj);
		  }else if(fieldType == 'type-52'){
			  paramObj.goodsSize = 1;
			  paramObj.item = [];
			  tpl = template('tpl_type_52',paramObj);
		  }else if(fieldType == 'type-12'){
			  paramObj.item = [];
			  tpl = template('tpl_type_12',paramObj);
		  }else if(fieldType == 'type-13'){
			  paramObj.item = [];
			  tpl = template('tpl_type_13',paramObj);
		  }else if(fieldType == 'type-18'){
			  paramObj.item = [];
			  tpl = template('tpl_type_18',paramObj);
		  }else if(fieldType == 'type-20'){
			  tpl = template('tpl_type_20',paramObj);
		  }else if(fieldType == 'type-99'){
			  tpl = template('tpl_type_99',paramObj);
		  }else{
			  tpl = template('tpl_type_00',paramObj);
		  }
		    
		  //console.log('fieldType=' + fieldType)  ;
		  //console.log('tpl=' + tpl)  ;
		  
		  $fields.append(tpl);
		  
		  $('html, body').animate({scrollTop: $(document).height()}, 300); 

		 
		  $('.ui-sortable').sortable({ axis: "y"});  
		  $( ".ui-sortable" ).disableSelection(); 
		  $('.app-field').unbind('click').click(fnBindShowAppSidebar);
		  
		  $('.app-field:last').trigger("click");
		  
		  $('.app-field .actions .action.delete').click(function(){
			  	//var id = $(this).attr('data-id');
			  	//console.log('delete id=' + id);
		  		$(this).closest('.app-field').remove(); 
		  		$('.app-sidebar').hide();
		  		$('.js-fields-region .app-field:last-of-type').click();
		  });
		  
		});
	 
	});
	 

/***********************************************************/
</script>
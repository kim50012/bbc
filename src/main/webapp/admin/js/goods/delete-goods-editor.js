var gcNm = '';
var gexingGcNm = '';
var gcId = '';
var goodsId = '';
var isPublishing = false;
var editor = '';	
//alert('goods-editor.js文件已经废弃');
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

/***********************************************************/

function render07(){
	  var size 			=  $('.form-horizontal input[name="size"]:checked').val();
	  var goods_number_type =  $('.form-horizontal input[name="goods_number_type"]:checked').val();
	  var  goods_group = $('[name=goods_group_list]').val();
	 
	  var paramObj = {
			  type:'type-05',
			   goods_group : goods_group,
			 size: size ,
			 goods_number_type:goods_number_type
		 };
	 var tpl = template('tpl_type_05', paramObj);

	 $('.editing').after(tpl).remove();
	 $('.app-field').unbind('click').click(bindShowSidebar);
 }

//在Banner展示区(type-header)的 app-sidebar中删除图片触发事件
function fnRemoveHeaderSlider(){
	$editing = $('.app-field.editing');
	var id = $(this).closest('.sort').attr('data-goods-id');
  	$(this).closest('.sort').remove();
	var array  =  $editing.attr('data-field-item2') || '[]' ;
	array = JSON.parse(array);
    var item =[];
	for(var i in array){
	 	if(array[i].tempId != id ){
	 		item.push(array[i]);
	 	} 
	} 
	$editing.attr('data-field-item2',JSON.stringify(item));
	if(item.length > 0){
		$('.goods-details-block' , $editing).hide();
		$('.sliderImg' , $editing).html('<ul></ul>') ;
		for(var ii = 0; ii < item.length;ii++){
			$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + item[ii].attachment_url + '" alt="' + item[ii].title + '" /></a></li>');
		}
	 
		$('.sliderImg' , $editing).show();
		$(".sliderImg", $editing).each(function(){
			imgSlider($(this));
		});
	}else{
		$('.goods-details-block' , $editing).show();
		$('.sliderImg' , $editing).hide();
	}
}

//在图片滚动(type-01)编辑器的 app-sidebar中删除图片触发事件
function fnReSlider(){
   $editing = $('.app-field.editing');
	var tempId = $(this).closest('.sort').attr('data-goods-id');
  	$(this).closest('.sort').remove();
  	var array  =  $editing.attr('data-field-item') || '[]' ;
	array = JSON.parse(array);
    var item =[];
	for(var i in array){
	 	if(array[i].tempId != tempId ){
	 		item.push(array[i]);
	 	} 
	} 
	$editing.attr('data-field-item',JSON.stringify(item));
	if(item.length > 0){
		$('.type01' , $editing).hide();
		$('.sliderImg' , $editing).html('<ul></ul>') ;
		for(var ii = 0; ii < item.length;ii++){
			$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + item[ii].attachment_url + '" alt="' + item[ii].title + '" /></a></li>');
		}
	 
		$('.sliderImg' , $editing).show();
		$(".sliderImg", $editing).each(function(){
			imgSlider($(this));
		});
	}else{
		$('.type01' , $editing).show();
		$('.sliderImg' , $editing).hide();
	}
		 
}
//在2张图(type-13)编辑器的 app-sidebar中删除图片触发事件
   function fnSidebar2ImgRemove(){
		
		var tempId = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
	  	var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
		array = JSON.parse(array);
	    var array2 =[];
		for(var i in array){
		 	if(array[i].tempId != tempId ){
		    	array2.push(array[i]);
		 	} 
		} 
		$('.app-field.editing').attr('data-field-item',JSON.stringify(array2));
		
		$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
		for(var i = 0; i < array2.length; i++){
			$('.app-field.editing').find('.dispaly-img')[i].src = array2[i].attachment_url;
		}
			 
   }
 //在1张图(type-12)编辑器的 app-sidebar中删除图片触发事件
   function fnSidebar1ImgRemove(){
		var id = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
		$('.app-field.editing').attr('data-field-item','');
		$('.app-field.editing').find('.type12').find('img').attr('src','/admin/images/widget/good-image1.png');
  }
   
 //在2张图(type-18)编辑器的 app-sidebar中删除图片触发事件
   function fnSidebar3ImgRemove(){
		
		var tempId = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
	  	var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
		array = JSON.parse(array);
	    var array2 =[];
		for(var i in array){
		 	if(array[i].tempId != tempId ){
		    	array2.push(array[i]);
		 	} 
		} 
		$('.app-field.editing').attr('data-field-item',JSON.stringify(array2));
		
		$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
		for(var i = 0; i < array2.length; i++){
			$('.app-field.editing').find('.dispaly-img')[i].src = array2[i].attachment_url;
		}
			 
  }
   
 //在商品主图片的 app-sidebar中删除图片触发事件
   function fnReGoodsMainImg(){
		var id = $(this).closest('.sort').attr('data-goods-id');
	  	$(this).closest('.sort').remove();
		$('#goods-main-img-add').data('field-item','');
		 
 }
/***********************************************************/
   //有关Modal操作
   //获取Modal中Goods列表 
   function showData(id){
		var $this = $(id);
		$.ajax({
	  	 	data:{
	  	 		 pageCurr : $this.data('pageNo') || 1
		 		 ,pageUnit : $this.data('pageSize') || 8
	  	 	},
			type : "POST",
			url : "/admin/goods/goodsListNew.htm",
			success : function(data) {
				
				$this.find('.modal-body').html(template('tpl-modal_goods', data));
				
				var list = data.data || [];
				if(list.length > 0 ){
					/* $('#modal_header_01_pageSize').text(pageUnit); */
					$( id + '_pageTotal').text(list[0].TOTAL_CNT);
					if(data.fisrtPage){
						$this.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
					 }else{
						 $this.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
					 }
					 
					 if(data.hasPreviousPage){
						 $this.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
					 }else{
						 $this.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
					 }
					 if(data.hasNextPage){
						 $this.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
					 }else{
						 $this.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
					 }
					 
					 if(data.lastPage){
						 $this.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
					 }else{
						 $this.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
					 }
					 
					 var  totalMsg = '${label.每页}'+ data.pageSize + '${label.条}, ${label.共}' + data.totalCount + '${label.条}';
					 $this.find('.js-totalSum').html(totalMsg);
					 
					 var $combo2 = $(id + '_currentPage');
					 $combo2.html('');
					 for(var i = 1; i <= data.totalPageCount ; i++){
						 $combo2.append('<option value="' + i + '">' + i + '</option>');
					 }
					 $combo2.select2('val',data.pageNo).trigger('change.default');
					 
					 $this.data('pageNo',data.pageNo);
					 $this.data('pageSize',data.pageSize);
					 $this.data('totalPageCount',data.totalPageCount);
				}
				
				$this.find('.js-choose').click(function(){
					 if($(this).hasClass('btn-selected')){
						 $(this).removeClass('btn-selected').html('${label.选取}');
					 } else{
						 $(this).addClass('btn-selected').html('${label.取消}');
					 }
				 });
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
		
	}  
   
   
   function showLinkData(id){
		
		var serachTitle = '';
		var serachLinkType = '';
		
		if(id == '#modal_20'){
			serachTitle = $('#serachTitle').val();
			serachLinkType = $('#serachLinkType').val()
		}else if(id == '#modal_1_link'){
			serachTitle = $('#modal_1_link_serach-title').val();
			serachLinkType = $('#modal_1_link_link-type').val()
		}
		
		var $this = $(id);
		$.ajax({
	  	 	data:{
	  	 		  pageCurr : $this.data('pageNo') || 1
		 		 ,pageUnit : $this.data('pageSize') || 10
		 		 ,serachTitle : serachTitle
		  	 	  ,serachLinkType : serachLinkType
	  	 	},
			type : "POST",
			url : "/admin/goods/linkList.htm",
			success : function(data) {
				$this.find('.modal-body').html(template('tpl_modal_20', data));
				
				var list = data.data || [];
				if(list.length > 0 ){
					/* $('#modal_header_01_pageSize').text(pageUnit); */
					$( id + '_pageTotal').text(list[0].TOTAL_CNT);
					if(data.fisrtPage){
						$this.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
					 }else{
						 $this.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
					 }
					 
					 if(data.hasPreviousPage){
						 $this.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
					 }else{
						 $this.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
					 }
					 if(data.hasNextPage){
						 $this.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
					 }else{
						 $this.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
					 }
					 
					 if(data.lastPage){
						 $this.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
					 }else{
						 $this.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
					 }
					 
					 var  totalMsg = '${label.每页}'+ data.pageSize + '${label.条}, ${label.共}' + data.totalCount + '${label.条}';
					 $this.find('.js-totalSum').html(totalMsg);
					 
					 var $combo2 = $(id + '_currentPage');
					 $combo2.html('');
					 for(var i = 1; i <= data.totalPageCount ; i++){
						 $combo2.append('<option value="' + i + '">' + i + '</option>');
					 }
					 $combo2.select2('val',data.pageNo).trigger('change.default');
					 
					 $this.data('pageNo',data.pageNo);
					 $this.data('pageSize',data.pageSize);
					 $this.data('totalPageCount',data.totalPageCount);
				}
				
				$this.find('.js-choose').click(function(){
					 if($(this).hasClass('btn-selected')){
						 $(this).removeClass('btn-selected').html('${label.选取}');
					 } else{
						 $(this).addClass('btn-selected').html('${label.取消}');
					 }
				 });
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
	}
   
   
 //获取Modal中Goods列表 
   function showBlogData(id){
		var $this = $(id);
		 
		$.ajax({
	  	 	data:{
	  	 		 pageCurr : $this.data('pageNo') || 1
		 		 ,pageUnit : $this.data('pageSize') || 8
	  	 	},
			type : "POST",
			url : "/admin/blog/blogImageList.htm",
			success : function(data) {
				
				$this.find('.modal-body').html(template('tpl-modal_goods', data));
				
				var list = data.data || [];
				if(list.length > 0 ){
					/* $('#modal_header_01_pageSize').text(pageUnit); */
					$( id + '_pageTotal').text(list[0].TOTAL_CNT);
					if(data.fisrtPage){
						$this.find('.js-page-first').removeClass('page-first').addClass('page-first-disabled');
					 }else{
						 $this.find('.js-page-first').removeClass('page-first-disabled').addClass('page-first');
					 }
					 
					 if(data.hasPreviousPage){
						 $this.find('.js-page-preview').removeClass('page-preview-disabled').addClass('page-preview');
					 }else{
						 $this.find('.js-page-preview').removeClass('page-preview').addClass('page-preview-disabled');
					 }
					 if(data.hasNextPage){
						 $this.find('.js-page-next').removeClass('page-next-disabled').addClass('page-next');
					 }else{
						 $this.find('.js-page-next').removeClass('page-next').addClass('page-next-disabled');
					 }
					 
					 if(data.lastPage){
						 $this.find('.js-page-last').removeClass('page-last').addClass('page-last-disabled');
					 }else{
						 $this.find('.js-page-last').removeClass('page-last-disabled').addClass('page-last');
					 }
					 
					 var  totalMsg = '${label.每页}'+ data.pageSize + '${label.条}, ${label.共}' + data.totalCount + '${label.条}';
					 $this.find('.js-totalSum').html(totalMsg);
					 
					 var $combo2 = $(id + '_currentPage');
					 $combo2.html('');
					 for(var i = 1; i <= data.totalPageCount ; i++){
						 $combo2.append('<option value="' + i + '">' + i + '</option>');
					 }
					 $combo2.select2('val',data.pageNo).trigger('change.default');
					 
					 $this.data('pageNo',data.pageNo);
					 $this.data('pageSize',data.pageSize);
					 $this.data('totalPageCount',data.totalPageCount);
				}
				
				$this.find('.js-choose').click(function(){
					 if($(this).hasClass('btn-selected')){
						 $(this).removeClass('btn-selected').html('${label.选取}');
					 } else{
						 $(this).addClass('btn-selected').html('${label.取消}');
					 }
				 });
			},
			error : function(xhr, status, e) {
				alert("error: " + status);
			}
		});
		
	}  
/***********************************************************/
   /***********************************************************/
   $(function(){
		$('#modal_blog_currentPage').bind('change.defalut',$.noop);
		$('#modal_blog_currentPage').bind('change.change',function(){
			$('#modal_header_01').data('pageNo',$(this).val());
			showBlogData('#modal_blog');
		});
		
		$('#modal_blog').on('show.bs.modal', function () {
			var id = '#modal_blog';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showBlogData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showBlogData(id);
	    	});
	      	
		 });

		$('#modal_blog').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() == 0){
			  				alert('${label.没有选定内容}!');
			  				
			  			}else if($this.find('.js-choose.btn-selected').size() == 1){
			  				
			  				//
			  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
						 	var title =$this.find('.js-choose.btn-selected').attr('data-title');
						 	var attachment_url = $this.find('.js-choose.btn-selected').attr('data-attachment_url');
						 
						 	var data =  {
								 tempId:_.random(1000000000, 9999999999),
								 id : id,
								 title:title,
								 attachment_url : attachment_url,
								 linkUrl : ''
							 }
							var tpl =  template('tpl-modal_goods_item', data);
					 
							//$('.module-goods-list #li-goods-one-add').siblings().remove();
							//$('.module-goods-list #li-goods-one-add').before(tpl);
							$('#blog-main-img-add').siblings().remove();
							$('#blog-main-img-add').before(tpl);
			  				
			  				//
							$('#blog-main-img-add').data('field-item',[data]);
							$('#blog-main-img-add').siblings().hover(function(){
							  	$(this).find('.close-modal').removeClass('hide');
					   		} ,function(){
					   			$(this).find('.close-modal').addClass('hide');
					   		});
						  	$('.js-main-img a.close-modal').click(fnReGoodsMainImg);
						  	 
							 
						  	$this.modal('hide');
			  				 
			  			}else if($this.find('.js-choose.btn-selected').size() > 1){
			  				alert('${label.只能选择1个}!');
			  			}
			  });
			   
		   });
		
	});      
/***********************************************************/
   $(function(){
		$('#modal_header_01_currentPage').bind('change.defalut',$.noop);
		$('#modal_header_01_currentPage').bind('change.change',function(){
			$('#modal_header_01').data('pageNo',$(this).val());
			showData('#modal_header_01');
		});
		
		$('#modal_header_01').on('show.bs.modal', function () {
			var id = '#modal_header_01';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
	      	
		 });

		$('#modal_header_01').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() == 0){
			  				alert('${label.没有选定内容}!');
			  				
			  			}else if($this.find('.js-choose.btn-selected').size() == 1){
			  				
			  				//
			  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
						 	var title =$this.find('.js-choose.btn-selected').attr('data-title');
						 	var attachment_url = $this.find('.js-choose.btn-selected').attr('data-attachment_url');
						 
						 	var data =  {
								 tempId:_.random(1000000000, 9999999999),
								 id : id,
								 title:title,
								 attachment_url : attachment_url,
								 linkUrl : ''
							 }
							var tpl =  template('tpl-modal_goods_item', data);
					 
							//$('.module-goods-list #li-goods-one-add').siblings().remove();
							//$('.module-goods-list #li-goods-one-add').before(tpl);
							$('#goods-main-img-add').siblings().remove();
							$('#goods-main-img-add').before(tpl);
			  				
			  				//
							$('#goods-main-img-add').data('field-item',[data]);
							$('#goods-main-img-add').siblings().hover(function(){
							  	$(this).find('.close-modal').removeClass('hide');
					   		} ,function(){
					   			$(this).find('.close-modal').addClass('hide');
					   		});
						  	$('.js-main-img a.close-modal').click(fnReGoodsMainImg);
						  	 
							 
						  	$this.modal('hide');
			  				 
			  			}else if($this.find('.js-choose.btn-selected').size() > 1){
			  				alert('${label.只能选择1个}!');
			  			}
			  });
			   
		   });
		
	});   
/***********************************************************/
   $(function(){
		
		$('#modal_header_02_currentPage').bind('change.defalut',$.noop);
		$('#modal_header_02_currentPage').bind('change.change',function(){
			$('#modal_header_02').data('pageNo',$(this).val());
			showData('#modal_header_02');
		});
		
		$('#modal_header_02').on('show.bs.modal', function () {
			var id = '#modal_header_02';
			var $this = $(id);
			 $this.data('pageNo',1);
			 showData(id);
	      	$( id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
			///
	       
			});

		$('#modal_header_02').on('shown.bs.modal', function () {
			   var $this = $(this);	
			   var $editing = $('.app-field.editing');
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() == 0){
			  				alert('${label.没有选定内容}!');
			  				return;
			  			}
			  			////////////
			  			var array  =  $editing.attr('data-field-item2') || '[]' ;
						array = JSON.parse(array);
		  		
			  			$this.find('.js-choose.btn-selected').each(function(){
			  				var id = $(this).attr('data-id');
							var title =$(this).attr('data-title');
							var attachment_url = $(this).attr('data-attachment_url');
							 
							var data =  {
									tempId:_.random(1000000000, 9999999999),
									id : id,
									title:title,
									attachment_url : attachment_url,
									linkUrl : ''
							}
							array.push(data);
						 });
			  		 
			  			array = _.last(array, 5);
			  			$editing.attr('data-field-item2',JSON.stringify(array));
			  			
			  			if(array.length > 0){
			   				$('.goods-details-block' , $editing).hide();
			   				$('.sliderImg' , $editing).html('<ul></ul>') ;
			   				$('.sliderImg' , $editing).show();
			   				for(var ii = 0; ii < array.length;ii++){
			   					$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + array[ii].attachment_url + '" alt="' + array[ii].title + '" /></a></li>');
			   					;
			   				}
			   				$(".sliderImg", $editing).each(function(){
			   					imgSlider($(this));
			   				});
			   			}else{
			   				$('.goods-details-block' , $editing).show();
			   				$('.sliderImg' , $editing).hide();
			   			}
			  			
			  			$('.module-goods-list #li-goods-add').siblings().remove();
			  			for(var i = 0 ; i < array.length;i++){
			  				var tpl =  template('tpl-modal_goods_item', array[i]);
							$('.module-goods-list #li-goods-add').before(tpl);
			  			}
			  			
			  			$('.module-goods-list li.sort').hover(function(){
						  	$(this).find('.close-modal').removeClass('hide');
				   		} ,function(){
				   			$(this).find('.close-modal').addClass('hide');
				   		});
			  			$('.module-goods-list a.close-modal').unbind('click').click(fnRemoveHeaderSlider);
						$this.modal('hide');
			  			/////////////
			  			 
			  });
		   });
		
	});   
/***********************************************************/
   $(function(){
		$('#modal_01_currentPage').bind('change.defalut',$.noop);
		$('#modal_01_currentPage').bind('change.change',function(){
			$('#modal_01').data('pageNo',$(this).val());
			showData('#modal_01');
		});
		
		$('#modal_01').on('show.bs.modal', function () {
			var id = '#modal_01';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
	      	
		 });

		   $('#modal_01').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			   var $editing = $('.app-field.editing');
		   		$this.find('.js-btn-select').unbind('click').click(function(){
		   			$this.find('.js-choose.btn-selected').each(function(){
		   				var id = $(this).attr('data-id');
						 var title =$(this).attr('data-title');
						 var attachment_url = $(this).attr('data-attachment_url');
						 
						 var data =  {
								 tempId:_.random(1000000000, 9999999999),
								 id : id,
								 title:title,
								 attachment_url : attachment_url,
								 linkUrl : ''
							 }
						var tpl =  template('tpl-modal_goods_item_new', data);
					 
						$('.js-img-area').append(tpl);
						  
						var array  =  $editing.attr('data-field-item') || '[]' ;
						array = JSON.parse(array);
						array.push(data);
						$editing.attr('data-field-item',JSON.stringify(array));
		   				
		   			});
		   			
		   			var item = $editing.attr('data-field-item') || '[]';
		   			item = JSON.parse(item);
		   			if(item.length > 0){
		   				$('.type01' , $editing).hide();
		   				$('.sliderImg' , $editing).html('<ul></ul>') ;
		   				$('.sliderImg' , $editing).show();
		   				for(var ii = 0; ii < item.length;ii++){
		   					$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + item[ii].attachment_url + '" alt="' + item[ii].title + '" /></a></li>');
		   					;
		   				}
		   				$(".sliderImg", $editing).each(function(){
		   					imgSlider($(this));
		   				});
		   			}else{
		   				$('.type01' , $editing).show();
		   				$('.sliderImg' , $editing).hide();
		   			}
		   			
		   			$('.js-img-area li.sort').hover(function(){
					  	$(this).find('.close-modal').removeClass('hide');
			   		} ,function(){
			   			$(this).find('.close-modal').addClass('hide');
			   		});
		   			$('.js-img-area a.close-modal').unbind('click').click(fnReSlider);
		   			
		   			$('.js-img-area .js-url-input').unbind('click').click(function(){
				  	});
				  	$('.js-img-area .js-url-select').unbind('click').click(function(){
				  		
				  		$this = $(this);
				  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
				  		
				  		$('#modal_1_link').modal({
						  	backdrop: 'static', 
						  	keyboard: false
						  	//,  remote:'/admin/goods/list.htm'
						 }).css({  
							  width: '600px',  
							 'margin-left': function () {  
							    return -($(this).width() / 2);  
							   }  
						});  
				  	});
				  	
				  	
				  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
						   var val = $(this).val();
						   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
						    
						    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
							array = JSON.parse(array);
							for(var i= 0 ; i < array.length ; i++){
								if(array[i].tempId == tempId){
									array[i].linkUrl = val || '';
									$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
									break;
								}
							}
							//array.push(data);
							//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
						    
					   });
		   			
		   			$this.modal('hide');
		  			 
		  		});
		   	 
		    });
		
	});
/***********************************************************/
   $(function(){
		$('#modal_12_currentPage').bind('change.defalut',$.noop);
		$('#modal_12_currentPage').bind('change.change',function(){
			$('#modal_12').data('pageNo',$(this).val());
			showData('#modal_12');
		});
		
		$('#modal_12').on('show.bs.modal', function () {
			var id = '#modal_12';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
	      	
		 });
	 
		   $('#modal_12').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() == 0){
			  				alert('${label.没有选定内容}!');
			  				
			  			}else if($this.find('.js-choose.btn-selected').size() == 1){
			  				
			  				//
			  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
						 	var title =$this.find('.js-choose.btn-selected').attr('data-title');
						 	var attachment_url = $this.find('.js-choose.btn-selected').attr('data-attachment_url');
						 
						 	var data =  {
								 tempId:_.random(1000000000, 9999999999),
								 id : id,
								 title:title,
								 attachment_url : attachment_url,
								 linkUrl : ''
							 }
							var tpl =  template('tpl-modal_goods_item_new', data);
						 	//alert(attachment_url);
					 
							$('.js-img-area').html(tpl);
							//$('.module-goods-list #li-goods-add').siblings().remove();
							//$('.module-goods-list #li-goods-add').before(tpl);
			  				
							
			  				//
							$('.app-field.editing').attr('data-field-item',JSON.stringify([data]));
			  				
							$('.app-field.editing').find('.type12').find('img').attr('src',attachment_url);
							
							
							$('.js-img-area li.sort').hover(function(){
							  	$(this).find('.close-modal').removeClass('hide');
					   		} ,function(){
					   			$(this).find('.close-modal').addClass('hide');
					   		});
						  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar1ImgRemove);
				   			
				   			$('.js-img-area .js-url-input').unbind('click').click(function(){
						  		
						  		 
						  	});
						  	$('.js-img-area .js-url-select').unbind('click').click(function(){
						  		
						  		$this = $(this);
						  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
						  		
						  		$('#modal_1_link').modal({
								  	backdrop: 'static', 
								  	keyboard: false
								  	//,  remote:'/admin/goods/list.htm'
								 }).css({  
									  width: '600px',  
									 'margin-left': function () {  
									    return -($(this).width() / 2);  
									   }  
								});  
						  	});
						  	
						  	
						  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
								   var val = $(this).val();
								   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
								    
								    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
									array = JSON.parse(array);
									for(var i= 0 ; i < array.length ; i++){
										if(array[i].tempId == tempId){
											array[i].linkUrl = val || '';
											$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
											break;
										}
									}
									//array.push(data);
									//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
								    
							   });
							 
						  	$this.modal('hide');
			  				 
			  			}else if($this.find('.js-choose.btn-selected').size() > 1){
			  				alert('${label.只能选择1个}!');
			  			}
			  });
		   });
		
	});
/***********************************************************/
   $(function(){
		$('#modal_13_currentPage').bind('change.defalut',$.noop);
		$('#modal_13_currentPage').bind('change.change',function(){
			$('#modal_13').data('pageNo',$(this).val());
			showData('#modal_13');
		});
		
		$('#modal_13').on('show.bs.modal', function () {
			var id = '#modal_13';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
	      	
		 });
	 
		   $('#modal_13').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() < 1){
			  				alert('${label.没有选定内容}!');
			  			}else if($this.find('.js-choose.btn-selected').size() >2){
			  				alert('${label.只能选择2个图片}!');
			  			}else{

			  		////////////
			  				var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
							array = JSON.parse(array);
			  		
				  			$this.find('.js-choose.btn-selected').each(function(){
				  				var id = $(this).attr('data-id');
								var title =$(this).attr('data-title');
								var attachment_url = $(this).attr('data-attachment_url');
								 
								var data =  {
										tempId:_.random(1000000000, 9999999999),
										id : id,
										title:title,
										attachment_url : attachment_url,
										linkUrl : ''
								}
								array.push(data);
							 });
				  		 
				  			array = _.last(array, 2);
				  			$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
				  			
				  			$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
				  			for(var i = 0; i < array.length; i++){
				  				$('.app-field.editing').find('.dispaly-img')[i].src = array[i].attachment_url;
				  			}
				  			 
				  			
				  			
				  			$('.js-img-area').html('');
				  			
				  			//$('.module-goods-list #li-goods-add').siblings().remove();
				  			for(var i = 0 ; i < array.length;i++){
				  				//var tpl =  template('tpl-modal_goods_item', array[i]);
								//$('.module-goods-list #li-goods-add').before(tpl);
								
								var tpl =  template('tpl-modal_goods_item_new', array[i]);
								$('.js-img-area').append(tpl);
				  			}
				  			 
				  			$('.js-img-area li.sort').hover(function(){
							  	$(this).find('.close-modal').removeClass('hide');
					   		} ,function(){
					   			$(this).find('.close-modal').addClass('hide');
					   		});
						  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar2ImgRemove);
				   			
				   			$('.js-img-area .js-url-input').unbind('click').click(function(){
						  		 
						  	});
						  	$('.js-img-area .js-url-select').unbind('click').click(function(){
						  		
						  		$this = $(this);
						  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
						  		
						  		$('#modal_1_link').modal({
								  	backdrop: 'static', 
								  	keyboard: false
								  	//,  remote:'/admin/goods/list.htm'
								 }).css({  
									  width: '600px',  
									 'margin-left': function () {  
									    return -($(this).width() / 2);  
									   }  
								});  
						  	});
						  	
						  	
						  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
								   var val = $(this).val();
								   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
								    
								    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
									array = JSON.parse(array);
									for(var i= 0 ; i < array.length ; i++){
										if(array[i].tempId == tempId){
											array[i].linkUrl = val || '';
											$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
											break;
										}
									}
									//array.push(data);
									//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
								    
							   });
				  			
				  			 $this.modal('hide');
			  			} 
			  });
		   });
		   
		
	});
/***********************************************************/
   $(function(){
		$('#modal_18_currentPage').bind('change.defalut',$.noop);
		$('#modal_18_currentPage').bind('change.change',function(){
			$('#modal_18').data('pageNo',$(this).val());
			showData('#modal_18');
		});
		
		$('#modal_18').on('show.bs.modal', function () {
			var id = '#modal_18';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showData(id);
	    	});
	      	
		 });

		   $('#modal_18').on('shown.bs.modal', function () {
			   var $this = $(this);	  
			   
			  		$this.find('.js-btn-select').unbind('click').click(function(){
			  			if($this.find('.js-choose.btn-selected').size() < 1){
			  				alert('${label.没有选定内容}!');
			  			}else if($this.find('.js-choose.btn-selected').size() >3){
			  				alert('${label.只能选择3个图片}!');
			  			}else{

			  				var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
							array = JSON.parse(array);
			  		
				  			$this.find('.js-choose.btn-selected').each(function(){
				  				var id = $(this).attr('data-id');
								var title =$(this).attr('data-title');
								var attachment_url = $(this).attr('data-attachment_url');
								 
								var data =  {
										tempId:_.random(1000000000, 9999999999),
										id : id,
										title:title,
										attachment_url : attachment_url,
										linkUrl : ''
								}
								array.push(data);
							 });
				  		 
				  			array = _.last(array, 3);
				  			$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
				  			$('.app-field.editing').find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
				  			for(var i = 0; i < array.length; i++){
				  				$('.app-field.editing').find('.dispaly-img')[i].src = array[i].attachment_url;
				  			}
				  			
				  			$('.js-img-area').html('');
				  			
				  			//$('.module-goods-list #li-goods-add').siblings().remove();
				  			for(var i = 0 ; i < array.length;i++){
				  				//var tpl =  template('tpl-modal_goods_item', array[i]);
								//$('.module-goods-list #li-goods-add').before(tpl);
								
								var tpl =  template('tpl-modal_goods_item_new', array[i]);
								$('.js-img-area').append(tpl);
				  			}
				  			 
				  			$('.js-img-area li.sort').hover(function(){
							  	$(this).find('.close-modal').removeClass('hide');
					   		} ,function(){
					   			$(this).find('.close-modal').addClass('hide');
					   		});
						  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar3ImgRemove);
				   			
				   			$('.js-img-area .js-url-input').unbind('click').click(function(){
						  		
						  		alert('shoudong');
						  	});
						  	$('.js-img-area .js-url-select').unbind('click').click(function(){
						  		
						  		$this = $(this);
						  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
						  		
						  		$('#modal_1_link').modal({
								  	backdrop: 'static', 
								  	keyboard: false
								  	//,  remote:'/admin/goods/list.htm'
								 }).css({  
									  width: '600px',  
									 'margin-left': function () {  
									    return -($(this).width() / 2);  
									   }  
								});  
						  	});
						  	
						  	
						  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
								   var val = $(this).val();
								   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
								    
								    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
									array = JSON.parse(array);
									for(var i= 0 ; i < array.length ; i++){
										if(array[i].tempId == tempId){
											array[i].linkUrl = val || '';
											$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
											break;
										}
									}
									//array.push(data);
									//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
								    
							   });
				  			
				  			 $this.modal('hide');
			  			} 
			  });
		   });
		
	});
/***********************************************************/
   $(function(){
		$('#modal_20_currentPage').bind('change.defalut',$.noop);
		$('#modal_20_currentPage').bind('change.change',function(){
			$('#modal_20').data('pageNo',$(this).val());
			showLinkData('#modal_20');
		});
		
		$('#modal_20').on('show.bs.modal', function () {
			var id = '#modal_20';
			 var $this = $(this);
			 $this.data('pageNo',1);
			 showLinkData(id);
	      	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
	    		var $th = $(this);
	    		if($th.attr('class').indexOf('-disabled') > -1 ){
	    			return ;
	    		}
	    		if($th.hasClass('js-page-first')){
	    			$this.data('pageNo',1);
	    		}else if($th.hasClass('js-page-preview')){
	    			var pageNo = $this.data('pageNo') || 1;
	    			$this.data('pageNo',_.max([1, --pageNo]));
	    		}else if($th.hasClass('js-page-next')){
	    			var pageNo = $this.data('pageNo') || 2  ;
	    			$this.data('pageNo',++pageNo);
	    		}else if($th.hasClass('js-page-last')){
	    			$this.data('pageNo',$this.data('totalPageCount'));
	    		}
	    		showLinkData(id);
	    	});
	      	
		 });
	   
	   $('#modal_20').on('shown.bs.modal', function () {
			   var $this = $(this);	
			   $('#modal_20_serach').unbind('click').click(function(){
				   showLinkData('#modal_20');
			   });
			   
		  		$this.find('.js-btn-select').unbind('click').click(function(){ 
		  			if($this.find('.js-choose.btn-selected').size() > 0){
		  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
						 var link = $this.find('.js-choose.btn-selected').attr('data-link');
						 var name = $this.find('.js-choose.btn-selected').attr('data-name');
						 var data =  {
								 id : id,
								 link : link,
								 name : name  
							 }
						 
						 //$('.app-field.editing').attr('data-field-item',JSON.stringify(data));
						 $('.app-field.editing').attr('data-field-id',id).attr('data-field-link',link).attr('data-field-name',name)  ;
						 $('.app-field.editing').find('.js-type19-title').html(name);
						 
						 $('.js-sidebar-region [name=title]').val(name);
						 $('.js-sidebar-region [name=url]').val(link);
						 
						 $this.modal('hide');
		  			}else{
		  				alert('${label.没有选定内容}!');
		  			}
		  });
	   });
	   
		
	});
/***********************************************************/
   $(function(){
		$('#modal_1_link_currentPage').bind('change.defalut',$.noop);
		$('#modal_1_link_currentPage').bind('change.change',function(){
			$('#modal_1_link').data('pageNo',$(this).val());
			showLinkData('#modal_1_link');
		});
		
		
		$('#modal_1_link').on('show.bs.modal', function () {
				var id = '#modal_1_link';
				 var $this = $(this);
				 $this.data('pageNo',1);
				 showLinkData(id);
		     	$(id + ' .page-navi .page-icon').unbind('click').click(function(){
		   		var $th = $(this);
		   		if($th.attr('class').indexOf('-disabled') > -1 ){
		   			return ;
		   		}
		   		if($th.hasClass('js-page-first')){
		   			$this.data('pageNo',1);
		   		}else if($th.hasClass('js-page-preview')){
		   			var pageNo = $this.data('pageNo') || 1;
		   			$this.data('pageNo',_.max([1, --pageNo]));
		   		}else if($th.hasClass('js-page-next')){
		   			var pageNo = $this.data('pageNo') || 2  ;
		   			$this.data('pageNo',++pageNo);
		   		}else if($th.hasClass('js-page-last')){
		   			$this.data('pageNo',$this.data('totalPageCount'));
		   		}
		   		showLinkData(id);
		   	});   	 
	    });
	   
	   $('#modal_1_link').on('shown.bs.modal', function () {
			   var $this = $(this);	
			   $('#modal_1_link_serach').unbind('click').click(function(){ 
				   showLinkData('#modal_1_link');
			   });
			   
		  		$this.find('.js-btn-select').unbind('click').click(function(){ 
		  			if($this.find('.js-choose.btn-selected').size() > 0){
		  				var id = $this.find('.js-choose.btn-selected').attr('data-id');
						 var link = $this.find('.js-choose.btn-selected').attr('data-link');
						 var name = $this.find('.js-choose.btn-selected').attr('data-name');
						 var data =  {
						 	link : link 
						 }
						 $('.js-img-area .js-active').find('input').val(link).trigger('keypress');
						 $this.modal('hide');
		  			}else{
		  				alert('${label.没有选定内容}!');
		  			}
		  	});
	   });
		
	   
	   
		$('#modal_1_link').on('show.bs.modal', function (event) {
		   //alert('show.bs.modal');
		   //var button = $(event.relatedTarget) // Button that triggered the modal
		   /****
		   var recipient = button.data('whatever') // Extract info from data-* attributes
		   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		   var modal = $(this)
		   modal.find('.modal-title').text('New message to ' + recipient)
		   modal.find('.modal-body input').val(recipient)
		   
		   ***/
		});
	   	$('#modal_1_link').on('shown.bs.modal', function (event) {
		   //alert('shown.bs.modal');
		   /****
		   var button = $(event.relatedTarget) // Button that triggered the modal
		   var recipient = button.data('whatever') // Extract info from data-* attributes
		   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		   var modal = $(this)
		   modal.find('.modal-title').text('New message to ' + recipient)
		   modal.find('.modal-body input').val(recipient)
		   
		   ***/
		});
	   	$('#modal_1_link').on('hide.bs.modal', function (event) {
		   //alert('hide.bs.modal');
		});
	   	$('#modal_1_link').on('hidden.bs.modal', function (event) {
		   //alert('hidden.bs.modal');
		});
	   	$('#modal_1_link').on('loaded.bs.modal', function (event) {
		   //alert('loaded.bs.modal');
		});
	   
	});
/***********************************************************/
   
   
 //显示编辑器功能
   function bindShowSidebar(){ 
   	var $this = $(this);
   	var type = $this.attr('data-field-type') ;
     	if(type == 'detail'){
     		return ;
     	}
   	
       var top = $this.position().top; 
      	$('.app-field').removeClass('editing');
      	$this.addClass('editing');
      	$('.app-sidebar').show();
      	$('.app-sidebar').css("margin-top", top + 'px');
     	// $this.addClass('editing').siblings().removeClass('active'); ;
     	
    //  alert($this.attr('data-field-type') + ',' + e.data.type);
     	var data = {};
     	
     	if(type == 'header'){
     		data = {};
     		$('.app-sidebar').css("margin-top", (top + 66) + 'px');
     	}
      
      data.type = type;
     	if(type == 'header'){
     	   var item2 = $this.attr('data-field-item2') || '[]';
    	   data.item2 = JSON.parse(item2);
    	   //data.item2 = JSON.parse($this.data('field-item2') || []);
    	   
    	   $('.app-sidebar').html(template('tpl_sidebar_header', data));
    	 
    	   $('.js-add-goods').click(function(){
    		   showBpopupWindow({
    			   id:'bpopup',
    			   action: '/admin/materialManage/showImageWindow.htm?fileGroup=1&type=3'
    		   }); 
    	   });
    	  
    	 	$('.module-goods-list li.sort').hover(function(){
   	  			$(this).find('.close-modal').removeClass('hide');
    	 	} ,function(){
    	 		$(this).find('.close-modal').addClass('hide');
    	 	});
    	 	
    	 	$('.module-goods-list a.close-modal').unbind('click').click(fnRemoveHeaderSlider);
    	   
     	}else if(type == 'type-01'){
     		var item = $this.attr('data-field-item') || '[]';
     		data.item = JSON.parse(item);
     		$('.app-sidebar').html(template('tpl_sidebar_01', data));
   	 
   		  	$('.js-add-goods').click(function(){
   		  		
   		  		showBpopupWindow({
   		  			id:'bpopup',
   		  			action: '/admin/materialManage/showImageWindow.htm?fileGroup=1&type=4'
   		  		}); 
   		  		
   			  	/*$('#modal_01').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});*/
   		  });
   		  $('.js-img-area li.sort').hover(function(){
   			  	$(this).find('.close-modal').removeClass('hide');
   	   		} ,function(){
   	   			$(this).find('.close-modal').addClass('hide');
   	   	  });
   		  	
   		  $('.js-img-area a.close-modal').unbind('click').click(fnReSlider);
   	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
   		  });
   	  	
   	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
   		  		$this = $(this);
   		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
   		  		$('#modal_1_link').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});
   		  	});
   			  	 
   		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
   				   var val = $(this).val();
   				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
   				    
   				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
   					array = JSON.parse(array);
   					for(var i= 0 ; i < array.length ; i++){
   						if(array[i].tempId == tempId){
   							array[i].linkUrl = val || '';
   							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   							break;
   						}
   					}
   					//array.push(data);
   					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   			   });
   		  
      }else if(type == 'type-05'){
   		data.goods_number_type = $this.attr('data-field-goods_number_type');
   	    data.goods_group = $this.attr('data-field-goods_group');
   		data.size = $this.attr('data-field-size');
   		data.goods_group_list = shopGoodsClassLevelOneCombo;
   		$('.app-sidebar').html(template('tpl_sidebar_05', data));
   		
   		$('.form-horizontal [name=goods_group_list]').change(render07);
   		$('.form-horizontal input:radio,.form-horizontal input:checkbox').click(render07);
   		$('.form-horizontal [name=goods_group_list]').trigger('change');  
      
      }else if(type == 'type-12'){
    	 
   	   var item = $this.attr('data-field-item') || '[]';
   	   data.item = JSON.parse(item);
   		$('.app-sidebar').html(template('tpl_sidebar_12', data));
   		 
   		  $('.js-add-goods').click(function(){
   			  
   			  showBpopupWindow({
		  			id:'bpopup',
		  			action: '/admin/materialManage/showImageWindow.htm?fileGroup=1&type=5'
		  		});
   			   return false;
   			  	/*$('#modal_12').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});*/
   		  });
   		  $('.js-img-area li.sort').hover(function(){
   	   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
   			  	$(this).find('.close-modal').removeClass('hide');
   	   		} ,function(){
   	   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
   	   			$(this).find('.close-modal').addClass('hide');
   	   	  });
   		  	
   		  $('.js-img-area a.close-modal').unbind('click').click(fnSidebar1ImgRemove);
   	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
   				alert('shoudong');
   		  });
   	  	
   	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
   		  		$this = $(this);
   		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
   		  		$('#modal_1_link').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});
   		  	});
   			  	 
   		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
   				   var val = $(this).val();
   				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
   				    
   				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
   					array = JSON.parse(array);
   					for(var i= 0 ; i < array.length ; i++){
   						if(array[i].tempId == tempId){
   							array[i].linkUrl = val || '';
   							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   							break;
   						}
   					}
   					//array.push(data);
   					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   			   });
   		   
      }else if(type == 'type-13'){
	   	   var item = $this.attr('data-field-item') || '[]';
	   	   var leftWidth =  $('.app-field.editing').attr('data-field-left-width') || 50 ;
	   	   data.item = JSON.parse(item);
	   	   data.imgLeftName = $('.app-field.editing').data('img-left-name') || '';
	   	   data.imgRightName = $('.app-field.editing').data('img-right-name') || '';
	   		$('.app-sidebar').html(template('tpl_sidebar_13', data));
	   		
	   		$('.js-img-left-name').unbind('keyup').keyup(function(){
	   			var $this =  $(this);
	   			var val = $this.val();
	   			$('.app-field.editing').data('imgLeftName', val);
	   		});
	   		$('.js-img-right-name').unbind('keyup').keyup(function(){
	   			var $this =  $(this);
	   			var val = $this.val();
	   			$('.app-field.editing').data('imgRightName', val);
	   		});
   		
   		  $('.js-add-goods').click(function(){
   			  
   			showBpopupWindow({
	  			id:'bpopup',
	  			action: '/admin/materialManage/showImageWindow.htm?fileGroup=1&type=6'
	  		});
			 /*  return false;
   			  
   			  	$('#modal_13').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});*/
   		  });
   		  
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
   		        
   		        $('.app-field.editing').find('.js-img-left').css('width',ui.value + '%');
   		        $('.app-field.editing').find('.js-img-right').css('width',(100 - ui.value) + '%');
   		        
   		        $('.app-field.editing').attr('data-field-left-width',ui.value || 50) ;
   		      }
   		  
   		    });
   		 		 $( ".js-img-left-width" ).val( $( ".js-img-width-slider" ).slider( "value" )    + '%');
   		 		 $( ".js-img-right-width" ).val((100 - $( ".js-img-width-slider" ).slider( "value" ) )    + '%');
   		  
   		 		 
   		 		$('.js-img-area li.sort').hover(function(){
   		   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
   				  	$(this).find('.close-modal').removeClass('hide');
   		   		} ,function(){
   		   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
   		   			$(this).find('.close-modal').addClass('hide');
   		   	  });
   			  	
   			  $('.js-img-area a.close-modal').unbind('click').click(fnSidebar2ImgRemove);
   		   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
   					alert('shoudong');
   			  });
   		  	
   		   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
   			  		$this = $(this);
   			  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
   			  		$('#modal_1_link').modal({
   					  	backdrop: 'static', 
   					  	keyboard: false
   					  	//,  remote:'/admin/goods/list.htm'
   					 }).css({
   						 'position':'absolute',
   						  'top':'100px',
   						  width: '700px',  
   							 'margin-left': function () {  
   							    return -($(this).width() / 2);  
   							   }  
   						});
   			  	});
   				  	 
   			  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
   					   var val = $(this).val();
   					   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
   					    
   					    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
   						array = JSON.parse(array);
   						for(var i= 0 ; i < array.length ; i++){
   							if(array[i].tempId == tempId){
   								array[i].linkUrl = val || '';
   								$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   								break;
   							}
   						}
   						//array.push(data);
   						//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   				   });
   		//$('.form-horizontal [name=goods_group_list]').change(render07);
   		//$('.form-horizontal input:radio,.form-horizontal input:checkbox').click(render07);
   		   
      }else if(type == 'type-18'){
     
   	   var item = $this.attr('data-field-item') || '[]';
   	    data.item = JSON.parse(item);
   		$('.app-sidebar').html(template('tpl_sidebar_18', data));
   		 
   		  $('.js-add-goods').click(function(){
   			  
   			showBpopupWindow({
	  			id:'bpopup',
	  			action: '/admin/materialManage/showImageWindow.htm?fileGroup=1&type=7'
	  		});
			   return false;
   			  
   			  	$('#modal_18').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});
   		  });
   		  
   		  $('.js-img-area li.sort').hover(function(){
   	   			//$(this).closest('.sort').find('.close-modal').removeClass('hide');
   			  	$(this).find('.close-modal').removeClass('hide');
   	   		} ,function(){
   	   			//$(this).closest('.sort').find('.close-modal').addClass('hide');
   	   			$(this).find('.close-modal').addClass('hide');
   	   	  });
   		  	
   		  $('.js-img-area a.close-modal').unbind('click').click(fnSidebar3ImgRemove);
   	   	  $('.js-img-area .js-url-input').unbind('click').click(function(){
   				alert('shoudong');
   		  });
   	  	
   	   	  $('.js-img-area .js-url-select').unbind('click').click(function(){
   		  		$this = $(this);
   		  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
   		  		$('#modal_1_link').modal({
   				  	backdrop: 'static', 
   				  	keyboard: false
   				  	//,  remote:'/admin/goods/list.htm'
   				 }).css({
   					 'position':'absolute',
   					  'top':'100px',
   					  width: '700px',  
   						 'margin-left': function () {  
   						    return -($(this).width() / 2);  
   						   }  
   					});
   		  	});
   			  	 
   		  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
   				   var val = $(this).val();
   				   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
   				    
   				    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
   					array = JSON.parse(array);
   					for(var i= 0 ; i < array.length ; i++){
   						if(array[i].tempId == tempId){
   							array[i].linkUrl = val || '';
   							$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   							break;
   						}
   					}
   					//array.push(data);
   					//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
   			   });
   		   
      }else if(type == 'type-20'){
   	   data.name = $this.attr('data-field-name') || '';
   	   data.link = $this.attr('data-field-link') || '';
   	   data.linkType = $this.attr('data-field-link-type') || 1;
   	   
   	   $('.app-sidebar').html(template('tpl_sidebar_20', data)); 
   	   
   	   $('.js-sidebar-region [name=title]').keyup(function(){
   		   var title = $(this).val();
   		    $('.app-field.editing').attr('data-field-name',title);
   	   });
   	   $('.js-sidebar-region [name=url]').keypress(function(){
   		   var val = $(this).val();
   		    $('.app-field.editing').attr('data-field-link',val);
   	   });
   	   
   	   $('.js-sidebar-region [name=linkType]').click(function(){
   		   var val = $(this).val();
   		    $('.app-field.editing').attr('data-field-link-type',val);
   	   });
   	   ////***
   	   
   	   
   	   /////
   	   
   	   $('.js-url-input').click(function(){
   		  $(this).siblings('[name=url]').removeAttr('readonly')  ; 
   	   });
   	   $('.js-url-select').click(function(){
   		    $(this).siblings('[name=url]').attr('readonly',true)  ; 
   		    $('#modal_20').modal({
   			  	backdrop: 'static', 
   			  	keyboard: false
   			  	//,  remote:'/admin/goods/list.htm'
   			 }).css({
   				 'position':'absolute',
   				  'top':'100px',
   				  width: '700px',  
   					 'margin-left': function () {  
   					    return -($(this).width() / 2);  
   					   }  
   				});

   	   });	
      }else if(type == 'type-99'){
   	   if(!!editor){
   		   editor.destroy();
   		   $('#js-editor').remove();
   		   $('#containerWarp').html('');
   	   }
   	   
   		$('.app-sidebar').html(template('tpl_sidebar_99', data));
   		  
   		   editor = UE.getEditor('js-editor', {
   	           autoHeight: false
   	            , toolbars: [
   	            	['undo', 'redo', '|','bold', 'italic', 'underline','fontborder', 'strikethrough', 'forecolor', 'backcolor','removeformat', 'formatmatch','blockquote', '|','selectall' ]
   	               	,['simpleupload', 'insertvideo',   'emotion', 'link',   '|', 'paragraph' , 'fontsize', '|','justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|' , 'insertorderedlist', 'insertunorderedlist']
                 	,['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow',  'insertcol','deleterow', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts' ]
   	             ]
   	       	// ,initialFrameWidth :480
   	       	  ,initialFrameHeight :300
   	       	 ,elementPathEnabled : false
   	        });
   		 
   	        editor.ready(function() {
   	        	editor.setContent($('.app-field.editing').find('.js-richtext').html()); 
   	        	editor.addListener("selectionchange",function(type,event){
   	        		//$('#result').html(editor.getContent());
   	        		$('.app-field.editing').find('.js-richtext').html(editor.getContent()  );
   	        	 })
   	         
   	        });
   		
      }else{
   	   $('.app-sidebar').html('no content');
      }
     
   } ;
   
   
   
   $(function(){
		//点击添加组件响应事件 
	   $('.js-new-field').click(function(){
		  var $this = $(this);
		  $('.app-field.editing').removeClass('editing');   
		  
		  var $fields =  $('.js-fields-region .app-fields');
		  var dataFieldType = $this.attr('data-field-type') ;
		  var tpl = ''; 
		  var paramObj = {};
		  
		  if(dataFieldType == 'type-01'){
			  paramObj = {
				      type :dataFieldType,
				      item : []
				 };
			  tpl = template('tpl_type_01',paramObj);
		  }else if(dataFieldType == 'type-05'){
			  paramObj = {
				      type :dataFieldType ,
				  	  size: 1 ,
				  	  goods_number_type:0
				 };
			  tpl = template('tpl_type_05',paramObj);
		  }else if(dataFieldType == 'type-12'){
			  paramObj = {
				      type :dataFieldType,
				      item : []
				 };
			  tpl = template('tpl_type_12',paramObj);
		  }else if(dataFieldType == 'type-13'){
			  paramObj = {
				      type :dataFieldType,
				      item : []
				 };
			  tpl = template('tpl_type_13',paramObj);
		  }else if(dataFieldType == 'type-18'){
			  paramObj = {
				      type :dataFieldType ,
				      item : []
				 };
			  tpl = template('tpl_type_18',paramObj);
		  }else if(dataFieldType == 'type-20'){
			  paramObj = {
				      type :dataFieldType
				 };
			  tpl = template('tpl_type_20',paramObj);
		  }else if(dataFieldType == 'type-99'){
			  paramObj = {
				      type :dataFieldType
				 };
			  tpl = template('tpl_type_99',paramObj);
		  }else{
			  paramObj = {
				      type :dataFieldType  
				 };
			  tpl = template('tpl_type_00',paramObj);
		  }
		    
		  $fields.append(tpl);
		  
		  $('html, body').animate({scrollTop: $(document).height()}, 300); 

		 
		  $('.ui-sortable').sortable({ axis: "y"});  
		  $( ".ui-sortable" ).disableSelection(); 
		  $('.app-field').unbind('click').click(bindShowSidebar);
		  
		  $('.app-field:last').trigger("click");
		  
		  $('.app-field .actions .action.delete').click(function(){
		  		$(this).closest('.app-field').remove(); 
		  		$('.app-sidebar').hide();
		  		$('.js-fields-region .app-field:last-of-type').click();
		  });
		  
		});
	   
	    $('.app-field').click(bindShowSidebar);
	    
	    $("#fileupload").fileupload({
	        url:"/admin/upload",//文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{},//如果需要额外添加参数可以在这里添加
	        done:function(e,res){
	            //done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
	            //注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
	            //返回的数据在res.result中，假设我们服务器返回了一个json对象
	            
	           $.each(res.result, function (index, file) {
	        	   if(file.success){
	        	   		//$('#resultImg').append('<li><img src="' + file.imgUrl + '" width="50px" height="50px"></li>') ;
	        	   	   $('.modal.fade.hide.in select.js-current-page').trigger('change');
	        		  // modal fade hide in
	        	   }else{
	        		   alert(file.message);
	        	   }
	            });
	        }
	    });
	 
	 $('.js-file-upload').click(function(){
		 $('#files').click();
	 });
	});
	 

/***********************************************************/
 function closeWindow(id){
	closeBpopupWindow(id);
}

function settingMainImgae(data){
 
		var tpl =  template('tpl-modal_goods_item', data);

		$('#goods-main-img-add').siblings().remove();
		$('#goods-main-img-add').before(tpl);
			
			//
		$('#goods-main-img-add').data('field-item',[data]);
		$('#goods-main-img-add').siblings().hover(function(){
		  	$(this).find('.close-modal').removeClass('hide');
  		} ,function(){
  			$(this).find('.close-modal').addClass('hide');
  		});
	  	$('.js-main-img a.close-modal').click(fnReGoodsMainImg);
	  	closeBpopupWindow('bpopup');
}
  

function setttingHeaderSliderImages(imageArray){
	var $editing = $('.app-field.editing');
	var array  =  $editing.attr('data-field-item2') || '[]' ;
	array = JSON.parse(array);
	
	for(var i = 0 ; i < imageArray.length; i++){
		array.push(imageArray[i]);
	}
	
	array = _.last(array, 5);
	$editing.attr('data-field-item2',JSON.stringify(array));
	
	if(array.length > 0){
		$('.goods-details-block' , $editing).hide();
		$('.sliderImg' , $editing).html('<ul></ul>') ;
		$('.sliderImg' , $editing).show();
		for(var ii = 0; ii < array.length;ii++){
			$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + array[ii].attachment_url + '" alt="' + array[ii].title + '" /></a></li>');
			;
		}
		$(".sliderImg", $editing).each(function(){
			imgSlider($(this));
		});
	}else{
		$('.goods-details-block' , $editing).show();
		$('.sliderImg' , $editing).hide();
	}

	$('.module-goods-list #li-goods-add').siblings().remove();
	for(var i = 0 ; i < array.length;i++){
		var tpl =  template('tpl-modal_goods_item', array[i]);
		$('.module-goods-list #li-goods-add').before(tpl);
	}

	$('.module-goods-list li.sort').hover(function(){
		$(this).find('.close-modal').removeClass('hide');
	} ,function(){
		$(this).find('.close-modal').addClass('hide');
	});
	$('.module-goods-list a.close-modal').unbind('click').click(fnRemoveHeaderSlider);
	closeBpopupWindow('bpopup');
	
}


function setttingType01SliderImages(imageArray){
	var $editing = $('.app-field.editing');
	var array  =  $editing.attr('data-field-item') || '[]' ;
	array = JSON.parse(array);
	
	for(var i = 0 ; i < imageArray.length; i++){
		var tpl =  template('tpl-modal_goods_item_new', imageArray[i]);
		$('.js-img-area').append(tpl);
		array.push(imageArray[i]);
	}
	
	$editing.attr('data-field-item',JSON.stringify(array));
	
	if(array.length > 0){
		$('.type01' , $editing).hide();
		$('.sliderImg' , $editing).html('<ul></ul>') ;
		$('.sliderImg' , $editing).show();
		for(var ii = 0; ii < array.length;ii++){
			$('.sliderImg ul' , $editing).append('<li><a href="javascript:void(0);"><img src="' + array[ii].attachment_url + '" alt="' + array[ii].title + '" /></a></li>');
			;
		}
		$(".sliderImg", $editing).each(function(){
			imgSlider($(this));
		});
	}else{
		$('.type01' , $editing).show();
		$('.sliderImg' , $editing).hide();
	}
	
	$('.js-img-area li.sort').hover(function(){
	  	$(this).find('.close-modal').removeClass('hide');
		} ,function(){
			$(this).find('.close-modal').addClass('hide');
		});
		$('.js-img-area a.close-modal').unbind('click').click(fnReSlider);
		
		$('.js-img-area .js-url-input').unbind('click').click(function(){
  	});
  	$('.js-img-area .js-url-select').unbind('click').click(function(){
  		
  		$this = $(this);
  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
  		
  		$('#modal_1_link').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		 }).css({  
			  width: '600px',  
			 'margin-left': function () {  
			    return -($(this).width() / 2);  
			   }  
		});  
  	});
  	
  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
		   var val = $(this).val();
		   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
		    
		    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
			array = JSON.parse(array);
			for(var i= 0 ; i < array.length ; i++){
				if(array[i].tempId == tempId){
					array[i].linkUrl = val || '';
					$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
					break;
				}
			}
	   });
	
	/////////////////////////
	 
	closeBpopupWindow('bpopup');
	
}

function setttingTypeOneImage(data){
	var $editing = $('.app-field.editing');
	 
	var tpl =  template('tpl-modal_goods_item_new', data);
	$('.js-img-area').html(tpl);
	
	$editing.attr('data-field-item',JSON.stringify([data]));
		
	$editing.find('.type12').find('img').attr('src',data.attachment_url);
	
	
	$('.js-img-area li.sort').hover(function(){
	  	$(this).find('.close-modal').removeClass('hide');
		} ,function(){
			$(this).find('.close-modal').addClass('hide');
		});
  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar1ImgRemove);
		
	$('.js-img-area .js-url-input').unbind('click').click(function(){
  		 
  	});
		
	$('.js-img-area .js-url-select').unbind('click').click(function(){
  		$this = $(this);
  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
  		
  		$('#modal_1_link').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		 }).css({  
			  width: '600px',  
			 'margin-left': function () {  
			    return -($(this).width() / 2);  
			   }  
		});  
  	});
	
	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
		   var val = $(this).val();
		   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
		    
		    var array  =  $('.app-field.editing').attr('data-field-item') || '[]' ;
			array = JSON.parse(array);
			for(var i= 0 ; i < array.length ; i++){
				if(array[i].tempId == tempId){
					array[i].linkUrl = val || '';
					$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
					break;
				}
			}
			//array.push(data);
			//$('.app-field.editing').attr('data-field-item',JSON.stringify(array));
		    
	   });
		
	closeBpopupWindow('bpopup');
	
}

function setttingTypeTwoImage(imageArray){
	var $editing = $('.app-field.editing');
	var array  =  $editing.attr('data-field-item') || '[]' ;
	array = JSON.parse(array);
	
	for(var i = 0 ; i < imageArray.length; i++){
		array.push(imageArray[i]);
	}
	
	array = _.last(array, 2);
	$editing.attr('data-field-item',JSON.stringify(array));
	
	$editing.find('.dispaly-img').attr('src','/admin/images/widget/good-image2.png');
	for(var i = 0; i < array.length; i++){
		$editing.find('.dispaly-img')[i].src = array[i].attachment_url;
	}
	
	$('.js-img-area').html('');
	
	for(var i = 0 ; i < array.length;i++){
		var tpl =  template('tpl-modal_goods_item_new', array[i]);
		$('.js-img-area').append(tpl);
	}
	
	$('.js-img-area li.sort').hover(function(){
	  	$(this).find('.close-modal').removeClass('hide');
		} ,function(){
			$(this).find('.close-modal').addClass('hide');
		});
  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar2ImgRemove);
		
	$('.js-img-area .js-url-input').unbind('click').click(function(){
  		 
  	});
	
	$('.js-img-area .js-url-select').unbind('click').click(function(){
  		
  		$this = $(this);
  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
  		
  		$('#modal_1_link').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		 }).css({  
			  width: '600px',  
			 'margin-left': function () {  
			    return -($(this).width() / 2);  
			   }  
		});  
  	});
	
	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
		   var val = $(this).val();
		   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
		    
		    var array  =  $editing.attr('data-field-item') || '[]' ;
			array = JSON.parse(array);
			for(var i= 0 ; i < array.length ; i++){
				if(array[i].tempId == tempId){
					array[i].linkUrl = val || '';
					$editing.attr('data-field-item',JSON.stringify(array));
					break;
				}
			}
	  });

	closeBpopupWindow('bpopup');
	
}


function setttingTypeThreeImage(imageArray){
	var $editing = $('.app-field.editing');
	var array  =  $editing.attr('data-field-item') || '[]' ;
	array = JSON.parse(array);
	
	for(var i = 0 ; i < imageArray.length; i++){
		array.push(imageArray[i]);
	}
	
	array = _.last(array, 3);
	$editing.attr('data-field-item',JSON.stringify(array));
	
	$editing.find('.dispaly-img').attr('src','/admin/images/widget/good-image3.png');
	for(var i = 0; i < array.length; i++){
		$editing.find('.dispaly-img')[i].src = array[i].attachment_url;
	}
	
	$('.js-img-area').html('');
	
	for(var i = 0 ; i < array.length;i++){
		var tpl =  template('tpl-modal_goods_item_new', array[i]);
		$('.js-img-area').append(tpl);
	}
	
	$('.js-img-area li.sort').hover(function(){
	  	$(this).find('.close-modal').removeClass('hide');
		} ,function(){
			$(this).find('.close-modal').addClass('hide');
		});
  	$('.js-img-area a.close-modal').unbind('click').click(fnSidebar3ImgRemove);
		
	$('.js-img-area .js-url-input').unbind('click').click(function(){
  		 
  	});
	
	$('.js-img-area .js-url-select').unbind('click').click(function(){
  		
  		$this = $(this);
  		$this.closest('li.sort').addClass('js-active').siblings().removeClass('js-active');
  		
  		$('#modal_1_link').modal({
		  	backdrop: 'static', 
		  	keyboard: false
		  	//,  remote:'/admin/goods/list.htm'
		 }).css({  
			  width: '600px',  
			 'margin-left': function () {  
			    return -($(this).width() / 2);  
			   }  
		});  
  	});
  	
  	
  	$('.js-img-area .js-link').unbind('keypress').keypress(function(){
		   var val = $(this).val();
		   var tempId =  $(this).closest('li.sort').attr('data-goods-id');
		    
		    var array  =  $editing.attr('data-field-item') || '[]' ;
			array = JSON.parse(array);
			for(var i= 0 ; i < array.length ; i++){
				if(array[i].tempId == tempId){
					array[i].linkUrl = val || '';
					$editing.attr('data-field-item',JSON.stringify(array));
					break;
				}
			}
	   }); 

	closeBpopupWindow('bpopup');
	
}
   
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/
   /***********************************************************/    
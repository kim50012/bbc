<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  
 
 <script id="tpl_popover_1" type="text/template"> 
<%--
{{
	inputClass  = inputClass|| 'w27';
}}
--%>
<div class="popover-content-warp" >
	<div class="popover-input">
		<input type="text" class="js-popover-input {{=inputClass}}"  placeholder="{{=placeholder}}">
	</div>
	<div class="popover-actions">
		<span class="button bg-orange js-btn-confirm">
			<span class="button-icon conform"></span>
			<span class="button-name"><ui:i18n key="保存"/></span>	
		</span>
		<span class="button bg-orange  js-btn-cancel">
			<span class="button-icon cancel"></span>
			<span class="button-name"><ui:i18n key="取消"/></span>	
		</span>
	</div>
</div>
</script>


 <script id="tpl_main_img" type="text/template"> 
<div class="form-pic" data-file-id="{{=fileId }}" data-file-nm="{{=fileNm}}" data-file-url="{{=fileUrl}}">
	<img alt="{{=fileNm }}" src="{{=fileUrl }}">
	<div class="pic-del-mask">
		<div class="pic-del" onclick="delMainPic(this);"></div>
	</div>
</div>
</script>
 
 
 <!-- ==================  编辑器类型模板  ======================== -->
 <script id="tpi-grid-stock" type="text/template">   
{{  
	var rowspans = [1];  
	var linesize = 1;
	var itemsLen = items.length;  
	for(var i = items.length - 1 ; i > -1  ; i--){
		rowspans.unshift(linesize *= items[i].subitems.length);  
	} 
	linesize =  rowspans.shift();  
}}


<div class="form-label" style="vertical-align:top;" >
	<ui:i18n key="商品库存"/><a class="label-required"></a> : 
</div>
<div class="form-control">
<table id="goods-stock" class="table goods-stock" style="width: 500px; ">
	<thead>
		<tr> 
{{ 
	for(var i = 0; i < items.length  ; i++){   
}}
			<th style="width: {{=60/items.length}}%;">{{=items[i].value}}</th> 
{{	 
	}	
}}  
			<th style="width: 20%;"><ui:i18n key="原价"/></th>
			<th style="width: 20%;"><ui:i18n key="单价"/></th>
			<th style="width: 20%;"><ui:i18n key="库存"/></th>
		</tr>
	</thead>
	<tbody> 
{{  
	for(var i = 0; i < linesize  ; i++){ 
}}
		<tr>
{{
		for(var j = 0; j < rowspans.length ; j++){ 
			if(i % rowspans[j] == 0){ 
				if(j == 0){
}}
			<td class="text-center" data-spec-id="{{=items[j].subitems[i / rowspans[j]].code }}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[i / rowspans[j]].value}}</td>  
{{
				}else{
}}
			<td class="text-center" data-spec-id="{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].code}}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].value }}</td>

{{
				}
			}
		}

		var ids='';
		for(var j = 0; j < rowspans.length ; j++){  
 			ids +=  items[j].code + '-' + items[j].subitems[parseInt(i / rowspans[j]) % items[j].subitems.length].code + '|'; 
		} 

		ids = ids.substring(0,ids.length-1);
}}
 
			<td><input type="text" name="sku_price" class="js-price"	 data-id="{{=ids}}" data-type="price" data-name="原价" value=""  style="width: 50px;text-align:center;" ></td>
			<td><input type="text" name="sku_price" class="js-unit"	 	 data-id="{{=ids}}" data-type="unit" data-name="单价" value=""  style="width: 50px;text-align:center;" ></td>
			<td><input type="text" name="stock_num" class="js-stock-num" data-id="{{=ids}}" data-type="stock" data-name="库存" value=""  style="width: 50px;text-align:center;" ></td>  
		</tr>
{{ 
	}  
}}

	</tbody>
</table> 
</div>
</script>
 
 <script id="tpl_type_00"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" >
		<div class="control-group"> 
			<div style="height: 200px;border: 1px solid red; margin: 5px;"> 
				${label.未实现}...
			</div>  
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

<script id="tpl_type_01"  type="javascript/html">
	<div class="app-field clearfix editing"  data-field-type="{{type}}" >
		<div class="control-group"> 
 		
			<div class="type01"> 
				<ul>
					<li class="left js-img-left">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image5.png"  /></span>
					</li>
				</ul>
			</div>  
		    	<div class="sliderImg" style="display:none;">
					<ul></ul>
				</div>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>
 
<script id="tpl_type_05"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" data-goods-group="{{goodsGroup}}" data-goods-size="{{goodsSize}}" data-goods-number-type="0">
		<div class="control-group">
			 {{include 'tpl_type_05_inner'}}
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script> 
<script id="tpl_type_05_inner"  type="javascript/html">
<ul class="sc-goods-list clearfix size-{{goodsSize}} card {{if goodsSize < 3}}pic{{else}}list{{/if}}">
	{{if goodsSize == 0}}
		<!-- 大图  -->
		{{each [1,2,3] as item idx}}
			<li class="goods-card big-pic card">
				<a href="javascript: void(0);" class="link js-goods clearfix">
					<div class="photo-block">
						<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
					</div>
				</a>
			</li>
		{{/each}}
	{{else if goodsSize == 1}}
		<!-- 小图  -->
		{{each [1,2,3,4] as item idx}}
			<li class="goods-card small-pic card">
				<a href="javascript: void(0);" class="link js-goods clearfix">
					<div class="photo-block">
						<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
					</div>
				</a>
			</li>
		{{/each}}
	{{else if goodsSize == 2}}
		<!-- 一大两小  -->
		<li class="goods-card big-pic card">
			<a href="javascript: void(0);" class="link js-goods clearfix">
				<div class="photo-block">
					<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
				</div>
			</a>
		</li>
		{{each [1,2] as item idx}}
			<li class="goods-card small-pic card">
				<a href="javascript: void(0);" class="link js-goods clearfix">
					<div class="photo-block">
						<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
					</div>
				</a>
			</li>
		{{/each}}
	{{else}}
		<!-- 详细列表 -->
		{{each [1,2,3,4] as item idx}}
			<li class="goods-card card ">
				<a href="javascript: void(0);" class="link js-goods clearfix">
					<div class="photo-block">
						<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
					</div>
				</a>
			</li>
		{{/each}}
	{{/if}}
</ul>
</script> 

<script id="tpl_type_52"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" data-goods-size="{{goodsSize}}" >
		<div class="control-group">
			{{include 'tpl_type_05_inner'}}
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script> 

 <script id="tpl_type_52_inner" type="text/template">   
<ul class="sc-goods-list clearfix size-{{goodsSize}} card {{if(goodsSize < 3){ }}pic{{ }else { }}list{{ } }}">
				{{
					if(goodsSize == 0){

					var max = 3;
					item = _.last(item, max); 
					var diff = max - item.length;
					
					_.each(item, function(it){
				}}
				 <!-- 大图  -->
				<li class="goods-card big-pic card">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img alt="{{=it.pageName}}" class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}" style="width:100%; height:auto;">
						</div>
					</a>
				</li>
                 {{ 
					 }); 

					for( var i = 0 ;  i < diff; i++){
				}}
					 <!-- 大图  -->
					<li class="goods-card big-pic card">
						<a href="javascript: void(0);" class="link js-goods clearfix">
							<div class="photo-block">
								<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
							</div>
						</a>
					</li>
				 
				{{ 		
						}
					}else if(goodsSize == 1) { 

					var max = 4;
					item = _.last(item, max); 
					var diff = max - item.length;
					
					  _.each(item, function(it) {  
				}}
					<!-- 小图  -->
					<li class="goods-card small-pic card ">
						<a href="javascript: void(0);" class="link js-goods clearfix">
							<div class="photo-block">
								<img alt="{{=it.pageName}}" class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}" style="width:100%; height:auto;">
							</div>
						</a>
					</li>
				{{ 
					 }); 

					for( var i = 0 ;  i < diff; i++){
				}}
				<!-- 小图  -->
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png" >
						</div>
						
					</a>
				</li>
				 
				{{		
						}
					}else { 
					
						var max = 4;
						item = _.last(item, max); 
						var diff = max - item.length;
					
					 	 _.each(item, function(it) {
					
				}}
				<!-- 详细列表 -->
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img alt="{{=it.pageName}}" class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}">
						</div>
						
					</a>
				</li>
				 
				{{
					}); 

					for( var i = 0 ;  i < diff; i++){
					
				}}
					<!-- 详细列表 -->
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>

				{{
						}
					}
				}}
				
			</ul>
</script> 

<script id="tpl_type_12"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type12"> 
				<ul>
					<li>
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image1.png"  /></span>
					</li>
				</ul>
			</div>  
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

 <script id="tpl_type_13"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group" style="display:none;">
			<div class="type13"> 
				<ul>
					<li class="left js-img-left">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image2.png"  /></span>
					</li>
					<li class="right js-img-right">
						<span class="good-img-block"><img class="dispaly-img" src="/admin/images/widget/good-image2.png"  /></span>
					</li>
				</ul>
			</div>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

<script id="tpl_type_18"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type18"> 
				<ul>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
					<li class="left">
						<img  class="dispaly-img" src="/admin/images/widget/good-image3.png"  />
					</li>
				</ul>
			</div>
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

 <script id="tpl_type_20"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}">
		<div class="control-group">
			<div class="type19" > 
				<div class="type19-title js-type19-title"><ui:i18n key="标题"/></div>
				<div class="type19-disc" >
					<h3 class="type19-icon type-icon-1">+</h3>
				</div>
			</div> 
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit" style="top:5px;">${label.编辑}</span>
				<span class="action delete" style="top:5px;">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

 <script id="tpl_type_99"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" >
		<div class="control-group">
			<div class="type99"> 
				<div class="richtext js-richtext" style="min-height:100px;">
					${label.富文本区域}
				</div>
			</div> 
			<div class="component-border"></div>
		</div>
		<div class="actions">
			<div class="actions-wrap">
				<span class="action edit">${label.编辑}</span>
				<span class="action delete">${label.删除}</span>
			</div>
		</div>
		<div class="sort">
			<i class="sort-handler"></i>
		</div>
	</div>
</script>

 <!-- ==================  编辑器类型模板 END ======================== -->
 <!-- ==================  Sidebar 模板  ======================== -->
 <script id="tpl_sidebar_header" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="商品展示图" /> <a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="js-slider-pic-warp clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="control-warp">
        <div class="form-label">
        </div>
        <div class="form-control pic-tip2">
            <ui:i18n key="图片推荐尺寸" />：(640px * 600px)
        </div>
    </div>
</div>
</script>  

<script id="tpl_sidebar_01" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="选择图片" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
                <div class="pic-tip">
                    <ui:i18n key="图片推荐尺寸" />： <ui:i18n key="宽度" /> 640px
                </div>
            </div>
        </div>
    </div> 

	<div class="control-warp">
        <div class="js-pic-list pic-list">
            <ul>
            </ul>
        </div>
	</div>
</div>	 
</script>
 
<script id="tpl_sidebar_05" type="text/html">
<div class="form-warp clearfix">
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="商品来源" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <select data-placeholder=" <ui:i18n key="请选择" />" class="js-goods-group select2 sw30">
            </select>
        </div>
    </div>
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="列表样式" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="0">
            &nbsp;&nbsp;
            <ui:i18n key="大图" />
            &nbsp;&nbsp;&nbsp;    
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="1">
            &nbsp;&nbsp;
            <ui:i18n key="小图" />
            &nbsp;&nbsp;&nbsp;
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="3">
            &nbsp;&nbsp;
            <ui:i18n key="详细列表" />
        </div>
    </div>
</div>
</script> 
 
<script id="tpl_sidebar_52" type="text/html">
<div class="form-warp clearfix">
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="列表样式" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="0">
            &nbsp;&nbsp;
            <ui:i18n key="大图" />
            &nbsp;&nbsp;&nbsp;
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="1">
            &nbsp;&nbsp;
            <ui:i18n key="小图" />
            &nbsp;&nbsp;&nbsp;
            <input class="icradio js-goods-size" type="radio" name="goods-size" value="3">
            &nbsp;&nbsp;
            <ui:i18n key="详细列表" />
        </div>
    </div>
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="选择图片" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
                <div class="pic-tip">
                    <ui:i18n key="图片推荐尺寸" />： (<ui:i18n key="最大宽度" /> 150px) 
                </div>
            </div>
        </div>
    </div> 

	<div class="control-warp">
        <div class="js-pic-list pic-list">
            <ul>
            </ul>
        </div>
	</div>
</div>
</script> 


<script id="tpl_sidebar_12" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="选择图片" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
                <div class="pic-tip">
                    <ui:i18n key="图片推荐尺寸" />： <ui:i18n key="宽度" /> 640px
                </div>
            </div>
        </div>
    </div> 

	<div class="control-warp">
        <div class="js-pic-list pic-list">
            <ul>
            </ul>
        </div>
	</div>
</div>
</script> 

<script id="tpl_sidebar_13" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp clearfix" style="padding-bottom: 4px;">
        <div style="width: 50%;float: left;">
            <span style="width: 80px; display: inline-block;">
                <ui:i18n key="图片名" />1:
            </span>
            <input type="text" class="js-img-left-name w12" value="">
        </div>
        <div style="width: 50%; float: left;">
            <span style="width: 80px; display: inline-block;">
                <ui:i18n key="图片名" />2:
            </span>
            <input type="text" class="js-img-right-name w12" value="">
        </div>
    </div>
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="选择图片" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
                <div class="pic-tip">
                    <ui:i18n key="图片推荐尺寸" />：(<ui:i18n key="最大宽度" /> 300px) 
                </div>
            </div>
        </div>
    </div> 

	<div class="control-warp">
        <div class="js-pic-list pic-list">
            <ul>
            </ul>
        </div>
	</div>

	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="图片宽度" /><a class="label-required"></a>:
        </div>
        <div class="form-control slider-control">
            <div>
                <div class="js-img-width-slider img-width-slider">
                </div>
            </div>
        </div>
    </div>
    <div class="control-warp" style="margin: 10px 0;">
        <div class="form-label">
        </div>
        <div class="form-control">
            <div>
                <ui:i18n key="左侧图片" />
                &nbsp;
                <input type="text" class="js-img-left-width w6" disabled="disabled">
                &nbsp;&nbsp;
                <ui:i18n key="右侧图片" />
                &nbsp;
                <input type="text" class="js-img-right-width w6" disabled="disabled">
            </div>
        </div>
    </div>
</div>
</script> 
 

<script id="tpl_sidebar_18" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp ">
        <div class="form-label clearfix" style="vertical-align: top; margin-top: 45px;">
            <ui:i18n key="选择图片" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <div class="clearfix" style="width: 400px;">
                <div class="pic-add js-add-pic">
                    <span>
                        <ui:i18n key="添加图片" />
                    </span>
                </div>
                <div class="pic-tip">
                    <ui:i18n key="图片推荐尺寸" />： (<ui:i18n key="最大宽度" /> 150px) 
                </div>
            </div>
        </div>
    </div> 

	<div class="control-warp">
        <div class="js-pic-list pic-list">
            <ul>
            </ul>
        </div>
	</div>
</div>
</script>  

<script id="tpl_sidebar_20" type="text/html"> 
<div class="form-warp clearfix">
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="标题名" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <input type="text" placeholder="" class="js-link-title w30" maxlength="10" />
        </div>
    </div>
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="链接地址" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <input type="text" class="js-link-url20 w30" maxlength="200" />
            <span class="button bg-orange  js-link-url-choose">
                <span class="button-name">
                    <ui:i18n key="选择" />
                </span>
            </span>
        </div>
    </div>
	<div class="control-warp">
        <div class="form-label">
            <ui:i18n key="布局风格" /><a class="label-required"></a>:
        </div>
        <div class="form-control">
            <input class="icradio" type="radio" name="linkType" value="1">&nbsp;&nbsp;<ui:i18n key="长" />
            &nbsp;&nbsp;&nbsp;
            <input class="icradio" type="radio" name="linkType" value="2">&nbsp;&nbsp;<ui:i18n key="短" />
        </div>
    </div>
</div>
</script>  
 

<script id="tpl_sidebar_99" type="text/html"> 
<div class="form-warp clearfix">
 	<div class="control-warp">
		<div id="containerWarp">
			<div id="js-editor" class="js-editor edui-default" style=""></div>
		</div>
	</div> 
	<textarea name="editorValue" id="ueditor_textarea_editorValue" style="display: none;"></textarea>	
</div>
</script>

<script id="tpl_pic_item" type="text/html">
 <div class="form-pic" data-id="{{tempId}}">
                    <img alt="{{fileNm}}" src="{{fileUrl}}">
                    <div class="pic-del-mask">
                        <div class="pic-del js-pic-del" data-id="{{tempId}}">
                        </div>
                    </div>
                </div>
</script> 

<script id="tpl_pic_item_url" type="text/html">
<li  data-id="{{tempId}}">
	<div class="pic-item clearfix">
    	<div class="form-pic">
        	<img alt="{{fileNm}}" src="{{fileUrl}}">
         	<div class="pic-del-mask">
            	<div class="js-pic-del pic-del" data-id="{{tempId}}">
              	</div>
           	</div>
     	</div>
		<div class="form-pic-detail">
   			<div class="pic-label">
          		URL:
      		</div>
         	<div class="pic-url">
            	<input type="text" placeholder="" class="js-link-url w30" value="{{linkUrl}}" data-id="{{tempId}}" />
          		<span class="button bg-orange  js-btn-choose"  data-id="{{tempId}}">
             		<span class="button-name">
                    	<ui:i18n key="选择" />
                 	</span>
              	</span>
         	</div>
      	</div>
	</div>
</li>
</script> 

<script id="tpl_pic_item_url_52" type="text/html">
<li  data-id="{{tempId}}">
	<div class="pic-item clearfix">
    	<div class="form-pic">
        	<img alt="{{pageName}}" src="{{imgFileUrl}}">
         	<div class="pic-del-mask">
            	<div class="js-pic-del pic-del" data-id="{{tempId}}">
              	</div>
           	</div>
     	</div>
		<div class="form-pic-detail">
   			<div class="pic-label">
          		<ui:i18n key="商品" />{{idx}}:&nbsp;&nbsp;{{pageName}}
      		</div>
      	</div>
	</div>
</li>
</script> 
 
  
 
 <!-- ==================  Sidebar 模板 END  ======================== -->
 <!-- ==================  ModalArea  ======================== -->
         
 <!-- ==================  ModalArea End  ======================== -->
 
 <script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>
<!-- ▼ bpopup area -->
	<ui:template id="bpopupGoodsClass"/>
	<ui:template id="bpopupPicture"/>
	<ui:template id="bpopupLink"/>
	<!-- ▲ bpopup area -->	
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  

 <form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
        <input id="files" type="file" name="files[]" multiple style="display: none;" >  
   </form>
<style>
*{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
</style>
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


<div class="form-label" style="float: left;width:150px;"  >
	<a class="label-prefix"></a>${label.商品库存}<a class="label-required"></a> : 
 </div>

<table class="table goods-stock" style="width: 500px; ">
	<thead>
		<tr> 
{{ 
	for(var i = 0; i < items.length  ; i++){   
}}
			<th style="width: {{=60/items.length}}%;">{{=items[i].value}}</th> 
{{	 
	}	
}}  
			<th style="width: 20%;">${label.原价}</th>
			<th style="width: 20%;">${label.单价}</th>
			<th style="width: 20%;">${label.库存}</th>
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
			<td data-spec-id="{{=items[j].subitems[i / rowspans[j]].code }}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[i / rowspans[j]].value}}</td>  
{{
				}else{
}}
			<td data-spec-id="{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].code}}" rowspan="{{=rowspans[j]}}">{{=items[j].subitems[(i % rowspans[j - 1]) / rowspans[j]].value }}</td>

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
	<div class="app-field clearfix editing" data-field-type="{{type}}" data-field-size="{{size}}" 
			data-field-goods_number_type="{{goods_number_type}}" data-field-goods_group="{{goods_group}}">
		<div class="control-group">
			<ul class="sc-goods-list clearfix size-{{size}} card {{if size < 3}}pic{{else}}list{{/if}}">
				{{if size == 0}}
				 <!-- 大图  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				{{else if size == 1}}
				<!-- 小图  -->
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				 
				{{else if size == 2}}
				<!-- 一大两小  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				{{else}}
				<!-- 详细列表 -->
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				{{/if}}
				
			</ul>
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

<script id="tpl_type_52"  type="javascript/html">
	<div class="app-field clearfix editing" data-field-type="{{type}}" data-field-size="{{size}}" >
		<div class="control-group">
			<ul class="sc-goods-list clearfix size-{{size}} card {{if size < 3}}pic{{else}}list{{/if}}">
				{{if size == 0}}
				 <!-- 大图  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
						</div>
					</a>
				</li>
				{{else if size == 1}}
				<!-- 小图  -->
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				 
				{{else if size == 2}}
				<!-- 一大两小  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card small-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/goods-img2.png">
						</div>
						
					</a>
				</li>
				{{else}}
				<!-- 详细列表 -->
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				<li class="goods-card card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image2.png">
						</div>
						
					</a>
				</li>
				{{/if}}
				
			</ul>
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

 <script id="tpl_type_52_u" type="text/template">   
			<ul class="sc-goods-list clearfix size-{{size}} card {{if(size < 3){ }}pic{{ }else { }}list{{ } }}">
				{{
					if(size == 0){ 

					var max = 3;
					item = _.last(item, max); 
					var diff = max - item.length;
					
					  _.each(item, function(it) {  
				}}
				 <!-- 大图  -->
				<li class="goods-card big-pic card ">
					<a href="javascript: void(0);" class="link js-goods clearfix">
						<div class="photo-block">
							<img class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}" style="width:100%; height:auto;">
						</div>
					</a>
				</li>
                 {{ 
					 }); 

					for( var i = 0 ;  i < diff; i++){
				}}
					 <!-- 大图  -->
					<li class="goods-card big-pic card ">
						<a href="javascript: void(0);" class="link js-goods clearfix">
							<div class="photo-block">
								<img class="goods-photo js-goods-lazy" src="/admin/images/widget/good-image1.png">
							</div>
						</a>
					</li>
				 
				{{ 		
						}
					}else if(size == 1) { 

					var max = 4;
					item = _.last(item, max); 
					var diff = max - item.length;
					
					  _.each(item, function(it) {  
				}}
					<!-- 小图  -->
					<li class="goods-card small-pic card ">
						<a href="javascript: void(0);" class="link js-goods clearfix">
							<div class="photo-block">
								<img class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}" style="width:100%; height:auto;">
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
							<img class="goods-photo js-goods-lazy" src="{{=it.imgFileUrl}}">
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
			<div class="component-border"></div>
	  
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
		<div class="control-group">
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
				<div class="type19-title js-type19-title">${label.热销产品}</div>
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
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
<%-- 			<div class="control-group">
					<label class="control-label">商品主图片：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							 {{if item.length > 0}}
								{{each item}}
								<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<a href="javascript:void(0);" >
											<img src="{{$value.attachment_url}}" alt="商品图" width="50" height="50">
										</a>
										<a class="close-modal js-delete-goods small hide" data-id="" title="删除">×</a>
									</li>
								{{/each}}
							 {{/if}} 
							 
							<li id="li-goods-one-add">
								<a href="javascript:void(0);" class="js-add-one-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
					</div>
				</div> 
	--%>	 			
				<div class="control-group">
					<label class="control-label">${label.商品展示图}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							{{if item2.length > 0}}
								{{each item2}}
								<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<a href="javascript:void(0);" >
											<img src="{{$value.attachment_url}}" alt="${label.商品图}" width="50" height="50">
										</a>
										<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
									</li>
								{{/each}}
							 {{/if}} 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : </span>
						<br />
						<span style="color:red;">(640px * 600px)</span>
					</div>
				</div> 

			</form>
		</div>
	</div>
</script>  

<script id="tpl_sidebar_01" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label" style="width:120px;text-align:center">${label.选择图片}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : (640px * 600px)</span>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="${label.商品图}"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">${label.手输}</button>
												<button class="btn js-url-select" type="button">${label.选择}</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script>
 
<script id="tpl_sidebar_05" type="text/html">
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label" style="width:120px;text-align:center">${label.商品来源}：</label>
					<div class="controls">
						<label class="combo inline"> 
							<select name="goods_group_list" class="select2">
								{{each goods_group_list}} 
									<option value="{{$value.comboKey}}" {{if goods_group == $value.comboKey }}selected=""{{/if}}>{{$value.comboValue}}</option>
								{{/each}}
							</select>
						</label>
					</div>
				</div>
				<div class="control-group" style="display:none;">
					<label class="control-label">${label.显示个数}：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="0" {{if goods_number_type == 0 }}checked=""{{/if}}>6
						</label>
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="1" {{if goods_number_type == 1 }}checked=""{{/if}}>12
						</label>
						<label class="radio inline">
							<input type="radio" name="goods_number_type" value="2" {{if goods_number_type == 2 }}checked=""{{/if}}>18
						</label>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" style="width:120px;text-align:center">${label.列表样式}：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="size" value="0" {{if size == 0 }}checked=""{{/if}}>${label.大图}
						</label>
						<label class="radio inline">
							<input type="radio" name="size" value="1" {{if size == 1 }}checked=""{{/if}}>${label.小图}
						</label>
<%-- 
						<label class="radio inline">
							<input type="radio" name="size" value="2" {{if size == 2 }}checked=""{{/if}}>一大两小
						</label>
 --%>
						<label class="radio inline">
							<input type="radio" name="size" value="3" {{if size == 3 }}checked=""{{/if}}>${label.详情列表}
						</label>
					 	
					</div>
				</div>
			</form>
		</div>
	</div>
</script> 


<script id="tpl_sidebar_52" type="text/html">
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">

				<div class="control-group">
					<label class="control-label" style="width:100px;text-align:right;padding-right:20px;">${label.列表样式}：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="size" value="0" {{if size == 0 }}checked=""{{/if}}>${label.大图}
						</label>
						<label class="radio inline">
							<input type="radio" name="size" value="1" {{if size == 1 }}checked=""{{/if}}>${label.小图}
						</label>
<%-- 
						<label class="radio inline">
							<input type="radio" name="size" value="2" {{if size == 2 }}checked=""{{/if}}>一大两小
						</label>
 --%>
						<label class="radio inline">
							<input type="radio" name="size" value="3" {{if size == 3 }}checked=""{{/if}}>${label.详情列表}
						</label>
					 	
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"style="width:100px;text-align:right;padding-right:20px;">${label.商品}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : (${label.最大宽度} 150px)</span>
					</div>
				</div>
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item }} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.imgFileUrl}}" alt="{{$value.pageName}}"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
											</div>
											<div class="div-img-link">
												${label.商品}  {{$index+1}}：<br>{{$value.pageName}}
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script> 

<script id="tpl_sidebar_12" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label" style="width:120px;text-align:center">${label.选择图片}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : (${label.宽度} 640px)</span>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="${label.商品图}"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">${label.手输}</button>
												<button class="btn js-url-select" type="button">${label.选择}</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script> 

<script id="tpl_sidebar_13" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region" style="width:500px">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group inline" style="width:500px">
        			<label class="control-label">${label.图片名}1:</label>
        			<div class="controls inline">
            			 <input type="text" class="js-img-left-name" style="width:130px;" value="{{imgLeftName}}" >
						&nbsp;&nbsp;${label.图片名}2:&nbsp;
						<input type="text" class="js-img-right-name" style="width:130px;" value="{{imgRightName}}"   > 
        			</div>
    			</div>
				<div class="control-group">
					<label class="control-label" style="width:120px;text-align:center">${label.选择图片}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : (${label.最大宽度}  300px)</span>
					</div>
				</div> 
				<div class="control-group">
						<ul  class="js-img-area" > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="${label.商品图}"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">${label.手输}</button>
												<button class="btn js-url-select" type="button">${label.选择}</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div>
				<div class="control-group">
        			<label class="control-label" style="width:120px;text-align:center"><em class="required">*</em>${label.图片宽度}：</label>
        			<div class="controls controls-slider">
						<div  class="js-img-width-slider"></div>
        			</div>
    			</div>
				<div class="control-group inline">
        			<label class="control-label"></label>
        			<div class="controls inline">
            			 ${label.左侧图片}&nbsp;<input type="text" class="js-img-left-width" readonly  style="width:60px;"  >&nbsp;&nbsp;
						${label.右侧图片}&nbsp;<input type="text" class="js-img-right-width" readonly   style="width:60px;"    >
 
        			</div>
    			</div>
			</form>
		</div>
	</div>
</script> 

<script id="tpl_sidebar_18" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<label class="control-label"style="width:120px;text-align:center">${label.选择图片}：</label>
					<div class="controls">
						<ul class="module-goods-list clearfix ui-sortable" name="goods"> 
							<li id="li-goods-add">
								<a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-plus2"></i></a>
							</li>
						</ul>
						<span style="color:red;">${label.图片推荐尺寸} : (${label.最大宽度} 150px)</span>
					</div>
				</div>
				<div class="control-group">
						<ul  class="js-img-area"  > 
							 {{if item.length > 0}}
								{{each item}} 
									<li class="sort" data-goods-id="{{$value.tempId}}"> 
										<div class="div-img-warp">
											<div class="div-img">
								 				<a href="javascript:void(0);" >
													<img src="{{$value.attachment_url}}" alt="${label.商品图}"  >
								 				</a>
								 				<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
											</div>
											<div class="div-img-link">
												URL：<br><input type="text" class="js-link"  style="width:240px;" value="{{$value.linkUrl}}" />

												<button class="btn js-url-input" type="button">${label.手输}</button>
												<button class="btn js-url-select" type="button">${label.选择}</button>
											</div>
										</div>
									</li>

								{{/each}}
							{{/if}}
						</ul>
					 
				</div> 
			</form>
		</div>
	</div>
</script>

<script id="tpl_sidebar_20" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
        			<label class="control-label"><em class="required">*</em>${label.标题名}：</label>
        			<div class="controls">
            			<input type="text" name="title" value="{{name}}" maxlength="10"> 
        			</div>
    			</div>
				<div class="control-group">
        			<label class="control-label"><em class="required">*</em>${label.链接地址}：</label>
        			<div class="controls">
            			<input type="text" name="url"  value="{{link}}" maxlength="200">
 						<button class="btn js-url-input" type="button">${label.手输}</button>
						<button class="btn js-url-select" type="button">${label.选择}</button>
        			</div>
    			</div>

				<div class="control-group">
					<label class="control-label" style="width:122px;text-align:center">${label.布局风格}：</label>
					<div class="controls">
						<label class="radio inline">
							<input type="radio" name="linkType" value="1" {{if linkType == 1 }}checked=""{{/if}}>${label.长}
						</label>
						<label class="radio inline">
							<input type="radio" name="linkType" value="2"  {{if linkType == 2 }}checked=""{{/if}}>${label.短}
						</label>
						<label class="radio inline" style="display:none;">
							<input type="radio" name="linkType" value="3" {{if linkType == 3 }}checked=""{{/if}}>3
						</label>
						<label class="radio inline" style="display:none;">
							<input type="radio" name="linkType" value="4" {{if linkType == 4}}checked=""{{/if}}>4
						</label>
						<label class="radio inline" style="display:none;">
							<input type="radio" name="linkType" value="5" {{if linkType == 5}}checked=""{{/if}}>5
						</label>
					</div>
				</div>
			</form>
		</div>
	</div>
</script>

<script id="tpl_sidebar_99" type="text/html"> 
	<div class="arrow"></div>
	<div class="app-sidebar-inner js-sidebar-region">
		<div>
			<form class="form-horizontal" novalidate="">
				<div class="control-group">
					<div id="containerWarp">
					 <div id="js-editor" class="js-editor edui-default" style=""></div>
					</div>
				</div> 
				<textarea name="editorValue" id="ueditor_textarea_editorValue" style="display: none;"></textarea>	
			</form>
		</div>
	</div>
</script>

<script id="tpl-modal_goods" type="text/html">
	<table class="table">
		<colgroup>
			<col class="modal-col-img">
			<col class="modal-col-title">
			<col class="modal-col-time" span="2">
			<col class="modal-col-action">
		</colgroup> 
		<!-- 表格头部 -->
		<thead>    
			<tr>
				<th class="title">${label.图片}</th>
				<th class="title">${label.名称}</th>
				<th class="time">${label.时间}</th>
				<th class="opts">${label.操作}</th>
			</tr> 
		</thead>
		<!-- 表格数据区 -->
		<tbody> 
		{{each data}} 
			<tr>
				<td class="img"><img src="{{$value.FULL_URL}}" width="50" height="60" /></td> 
				<td class="title">{{$value.FILE_ID}}-{{$value.FILE_NM}}</td> 
				<td class="time">{{$value.CREATED_DT}}</td>
				<td class="opts"> 
					<span class="js-choose choose-btn" data-id="{{$value.FILE_ID}}" data-title="{{$value.FILE_NM}}"  
						data-attachment_url="{{$value.FULL_URL}}"  >${label.选取}</span>
				</td> 
			</tr>
		{{/each}}
		
		</tbody>
	</table>
</script>
<script id="tpl-modal_goods_item" type="text/html">
	<li class="sort" data-goods-id="{{tempId}}"> 
		<a href="javascript:void(0);" target="_blank">
		<img src="{{attachment_url}}" alt="${label.商品图}" width="50" height="50"></a>
		<a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
	</li> 
</script> 
<script id="tpl-modal_goods_item_new" type="text/html">
	<li class="sort" data-goods-id="{{tempId}}"> 
		<div class="div-img-warp">
			<div class="div-img">
				 <a href="javascript:void(0);" >
					<img src="{{attachment_url}}" alt="${label.商品图}"  >
				 </a>
				 <a class="close-modal js-delete-goods small hide" data-id="" title="${label.删除}">×</a>
			</div>
			<div class="div-img-link">
				URL：<br><input type="text" class="js-link" style="width:240px;" />
				<button class="btn js-url-input" type="button">${label.手输}</button>
				<button class="btn js-url-select" type="button">${label.选择}</button>
			</div>
		</div>
	</li>
</script> 
<script id="tpl-modal_goods_item_52" type="text/html">
	<li class="sort" data-goods-id="{{tempId}}"> 
		<div class="div-img-warp">
			<div class="div-img">
				 <a href="javascript:void(0);" >
					<img src="{{imgFileUrl}}" alt="{{pageName}}"  >
				 </a>
				 <a class="close-modal js-delete-goods small hide" data-id="{{tempId}}" title="${label.删除}">×</a>
			</div>
			<div class="div-img-link">
			<%--
			${label.商品} {{idx}}：<br><input type="text" class="js-link" style="width:300px;" readonly="readonly" value="{{pageName}}" />
			 --%>	
${label.商品} {{idx}}：<br>{{pageName}}
			</div>
		</div>
	</li>
</script> 
<script id="tpl_modal_20" type="text/html">
	<table class="table">
		<colgroup>
			<col class="modal-col-name">
			<col class="modal-col-link" >
			<col class="modal-col-select"  >
		</colgroup> 
		<!-- 表格头部 -->
		<thead>    
			<tr>
				<th class="name">${label.标题}</th>
				<th class="link">${label.链接}</th>
				<th class="options">
<%--
					<form class="form-search">
	              	<div class="search-warp" style="">  
	                 	<input type="text" class="input-medium" />
						<a href="javascript:void(0);" class="search-btn js-fetch-page"></a>  
					</div>
	            </form>
	            
	            --%>
				</th>
			</tr> 
		</thead>
		<!-- 表格数据区 -->
		<tbody> 
		{{each data}} 
			<tr>
				<td class="name">{{$value.PAGE_NM}}</td> 
				<td class="link">{{$value.URL}}</td>
				<td class="options" > 
					<span class="js-choose choose-btn" href="javascript:void(0);" 
						data-id="{{$value.PAGE_ID}}" data-link="{{$value.URL}}"  
						data-name="{{$value.PAGE_NM}}">${label.选取}</span>
				</td> 
			</tr>
		{{/each}}
		</tbody>
	</table>
 </script>
<script id="tpl_goods-search-result" type="text/html">
		{{each data}} 
			 <tr>
			   <td class="textalign" style="text-align: right;">
				 <input type="checkbox" name="goods-checked" data-goods-id="{{$value.GOODS_ID}}" data-gc-id="{{$value.GC_ID_LV2}}" />
			   </td>
				<td style="text-align: left;" class="goodsitem ">
					<div class="js-big-img big-img"><img alt="{{$value.GOODS_NM}}" src="{{$value.GOODS_LIST_IMG_URL}}" > </div>
					<img class="goodsShortIcon" alt="{{$value.GOODS_NM}}" src="{{$value.GOODS_LIST_IMG_URL}}" > 
					{{$value.GOODS_NM}}
				</td>
				<td class="js-grid-gc-nm">{{$value.GC_NM_LV1}} > {{$value.GC_NM_LV2}} > {{$value.GC_NM_LV3}}</td>
				<td class="js-grid-gexing-nm">{{$value.CREATED_DT}} </td>
			</tr>
		{{/each}}
 </script>
 <!-- ==================  Sidebar 模板 END  ======================== -->
 <!-- ==================  ModalArea  ======================== -->
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_blog" tabindex="-1" role="dialog" aria-labelledby="modal_blog_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	        <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_blog_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_header_01_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 
 
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_header_01" tabindex="-1" role="dialog" aria-labelledby="modal_header_01_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	        <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_header_01_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_header_01_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_header_02" tabindex="-1" role="dialog" aria-labelledby="modal_header_02_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	        <div class="page-navigation" >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_header_02_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_header_02_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    			 
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_01" tabindex="-1" role="dialog" aria-labelledby="modal_01_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_01_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_01_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_12" tabindex="-1" role="dialog" aria-labelledby="modal_12_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_12_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_12_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade hide" id="modal_13" tabindex="-1" role="dialog" aria-labelledby="modal_13_label" aria-hidden="true">
   <div class="modal-dialog">
     <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_13_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_13_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_18" tabindex="-1" role="dialog" aria-labelledby="modal_18_label" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择图片} | <a class="title-upload js-file-upload" >${label.上传图片}</a></span> 
            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_18_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_18_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_20" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.选择链接}</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
      
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	<table style="width: 100%;  ">
         		<tr>
         			<td style="width:10%;">${label.标题}</td>
         			<td style="width:30%;"><input type="text" id="serachTitle" clsss="js-serach-title" style="width: 90%;margin-bottom: 0;"  ></td>
         			<td style="width:5%;">&nbsp;</td>
         			<td style="width:10%;">${label.链接类型}</td>
         			<td style="width:5%;">&nbsp;</td>
         			<td style="width:30%;">
         				<select data-placeholder="${label.请选择}" id="serachLinkType" class="select2" style="width: 99%;"   >
						  <option value=""></option> 
						  <option value="1">${label.店铺基本页面}</option> 
						  <option value="2" selected="selected">${label.商品分类}</option> 
						  <option value="3">${label.商品}</option> 
						  <option value="4">${label.自定义页面}</option>
						  <option value="5">${label.微杂志页面}</option>
						  <option value="6">${label.店铺主页}</option>
						</select>
					</td>
					<td style="width:10%;" align="center">
						<span id="modal_20_serach" style=" 
						display: inline-block;
						padding: 2px 10px;
						background: #eee;
						border-radius: 2px;
						border: 1px solid #e5e5e5;
						cursor: pointer;
						 ">${label.查询}</span>
					</td>
         		</tr>
         	</table>
         </div>
         <br>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	         <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_20_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_20_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_1_link" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header" >
         	 <span class="modal-title" >${label.选择链接}</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	<table style="width: 100%; ">
         		<tr>
         			<td style="width:15%;">${label.标题}</td>
         			<td style="width:30%;">
         				<input type="text" id="modal_1_link_serach-title" class="js-serach-title" style="width: 90%;margin-bottom: 0;"  >
         			</td>
         			<td style="width:15%;">${label.链接类型}</td>
         			<td style="width:30%;">
         				<select data-placeholder="${label.请选择}" id="modal_1_link_link-type" class="select2 js-serach-link-type" style="width: 99%;"   >
						  <option value=""></option> 
						  <option value="1">${label.店铺基本页面}</option> 
						  <option value="2">${label.商品分类}</option> 
						  <option value="3">${label.商品}</option> 
						  <option value="4">${label.自定义页面}</option>
						  <option value="5">${label.微杂志页面}</option>
						  <option value="6">${label.店铺主页}</option>
						</select>
					</td>
					<td style="width:10%;" align="center">
						<span id="modal_1_link_serach" style=" 
						display: inline-block;
						padding: 2px 10px;
						background: #eee;
						border-radius: 2px;
						border: 1px solid #e5e5e5;
						cursor: pointer;
						
						 ">${label.查询}</span>
					</td>
         		</tr>
         	</table>
         </div>
         <div class="modal-body">
            	
         </div>
         <div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">${label.确定选择}</span>
	        </div>
	        <div class="page-navigation"  >
	         	<a class="page-navi"><span class="page-icon js-page-first page-first-disabled"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-preview page-preview-disabled"></span></a>
	         	<select id="modal_1_link_currentPage" class="page-select select2 js-current-page" >
	         		 
	         	</select>
	         	<a class="page-navi"><span class="page-icon js-page-next page-next"></span></a>
	         	<a class="page-navi"><span class="page-icon js-page-last page-last"></span></a>
	           <%-- <select id="modal_1_link_pageUnit" class="page-select select2 js-page-unit" >
	         		<option value="10">10</option>
	         		<option value="20">20</option>
	         		<option value="30">30</option>
	         		<option value="50">50</option>
	         	</select>   --%>
	         	<%--  <span > 条&nbsp;&nbsp;/&nbsp;&nbsp; 页 </span> --%>
	    		<div  class="js-totalSum" style="float: right;text-align: right;right: 0; letter-spacing: 2px;padding-right: 10px;">
	    		</div>  
	    	</div>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <!-- 模态框（Modal） -->
<div class="modal fade hide" id="modal_test" tabindex="-1" role="dialog"  aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         	 <span class="modal-title" >${label.添加商品分类}</span> 
             <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">×</button>
         </div>
         <div class="serachArea" style="padding: 15px 15px 0 15px ; ">
         	 
         </div>
         <div class="modal-body">
            	 <iframe id="ifr_001" style="zoom: 0.6;" height="460"   src="" frameborder="1" width="99.6%"></iframe> 
         </div>
          <%--<div class="modal-footer">
	         <div class="confirm-choose js-confirm-choose">
	            <span type="button" class="apply-btn  js-btn-select">确定选择</span>
	        </div> 
         </div>--%>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 <!-- ==================  ModalArea End  ======================== -->
 
  <!-- ▼ bpopup area -->
		<div class="bpopup" id="bpopup">
		 	<div class="bpopupWarp">
		 		 <div class="bpopupHeaderWarp">
					<h3 class="bpopupTitle js-title">${label.选择图片 }</h3>
					<div class="bpopupColseWarp">
						<img class="b-close" src="/admin/images/goodsSell/close.png" />
					</div>
				</div>
		 		 <div class="bpopupContentWarp js-content"> 
		 		 	<iframe class="js-content-iframe"  width="100%" height="100%" frameBorder=0 scrolling=yes  src=""></iframe>
		 		 </div>
		 	</div>
		</div>
		<!-- ▲ bpopup area -->
 
 
 <script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>
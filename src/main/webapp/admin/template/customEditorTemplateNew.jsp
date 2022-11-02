<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/template/tagsInc.jsp"%>  

 <form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
        <input id="files" type="file" name="files[]" multiple style="display: none;" >  
   </form>
<style>
*{font-family: "Microsoft YaHei", "Malgun Gothic","맑은 고딕", Arial;}
</style>
 <!-- ==================  编辑器类型模板  ======================== -->
 
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

 <!-- ==================  编辑器类型模板 END ======================== -->
 <!-- ==================  Sidebar 模板  ======================== -->
 
<script id="tpl_sidebar_20" type="text/html"> 
	
						<button class="btn js-url-select" type="button">${label.选择}</button>
        		
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

 <!-- ==================  Sidebar 模板 END  ======================== -->
 <!-- ==================  ModalArea  ======================== -->
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
						  <option value="2">${label.商品分类}</option> 
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
 <!-- ==================  ModalArea End  ======================== -->
 
<script type="text/javascript" src="/admin/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/admin/js/ueditor/ueditor.all.min.js"></script>
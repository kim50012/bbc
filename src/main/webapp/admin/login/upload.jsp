<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0L);
	
	if(request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control","no-cache");
	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="basePath" value="<%=basePath %>" />
 
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
    <script src="/admin/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="/admin/js/ajaxfileupload.js" type="text/javascript"></script>
    
    <!-- ============================================================== -->
    <script src="/admin/js/fileupload/vendor/jquery.ui.widget.js" type="text/javascript"></script> <!-- jQuery UI Widget   -->
    <script src="/admin/js/fileupload/jquery.iframe-transport.js" type="text/javascript"></script> <!--  扩展iframe数据传输  -->
    <script src="/admin/js/fileupload/jquery.fileupload.js" type="text/javascript"></script>  <!-- jQuery File Upload核心类  -->
    <script src="/admin/js/cors/jquery.xdr-transport.js" type="text/javascript"></script>  <!-- 在IE下应载入此文件解决跨域问题   -->
   
  <%--  <script src="/admin/js/jquery.fileupload-process.js" type="text/javascript"></script>
   <script src="/admin/js/jquery.fileupload-image.js" type="text/javascript"></script>
   <script src="/admin/js/jquery.fileupload-validate.js" type="text/javascript"></script>
   <script src="/admin/js/jquery.fileupload-ui.js" type="text/javascript"></script>
    --%>
    <script type="text/javascript">
        function ajaxFileUpload() {
            $.ajaxFileUpload
            (
                {
                    url: '/admin/login/uploadFile.htm', //用于文件上传的服务器端请求地址
                    secureuri: false, //一般设置为false
                    fileElementId: 'file', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                    dataType: 'json', //返回值类型 一般设置为json
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        $("#img1").attr("src", data.imgurl);
                        if (typeof (data.error) != 'undefined') {
                            if (data.error != '') {
                                alert(data.error);
                            } else {
                                alert(data.msg);
                            }
                        }
                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
                     
                        alert(e);
                    }
                }
            )
            return false;
        }
    </script>
</head>
<body>
    
    
    <input type="file" id="file" name="file"  value="上传" accept="image/*;capture=camera"  onchange="ajaxFileUpload()"/><br>
    <p><img id="img1" alt="22" src="" style="width: 20%;height: 20%;" /></p>  
    
    
    <hr />
    
    <form  id="fileupload" action="" method="POST" enctype="multipart/form-data">
    	<div id="ddd">Click</div>
         <input id="files" type="file" name="files[]" multiple style="display: none;" >  
    </form>
    
    <ul id="resultImg"  >
    </ul>
    
    <script type="text/javascript">
    
    $('#ddd').click(function(){
    	$('#files').click();
    });
    
	 
	 $("#fileupload").fileupload({
	        url:"/admin/upload",//文件上传地址，当然也可以直接写在input的data-url属性内
	        formData:{},//如果需要额外添加参数可以在这里添加
	        done:function(e,res){
	            //done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
	            //注意result要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
	            //返回的数据在res.result中，假设我们服务器返回了一个json对象
	            
	           $.each(res.result, function (index, file) {
	        	   if(file.success){
	        	   		$('#resultImg').append('<li><img src="' + file.fileUrl + '" width="50px" height="50px"></li>') ;
	        	   }
	            });
	        }
	    });
    
    </script>
    
    
</body>
</html> 
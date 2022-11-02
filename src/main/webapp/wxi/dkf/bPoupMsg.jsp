<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div class="bPoup-msg-div" id="bPoupMsgDivFlag">
		<div>提示信息
			<img  src="/wxi/image/seatManage/close_img.png"  onclick="closeBpoupMsgDiv()"/>
		</div>
		<p id="bPoupMsgText">是否删除该内容？</p>
		<span class="submit-true" onclick="deleteSubmit();">是</span>
		<span  class="submit-false" onclick="closeBpoupMsgDiv()">否</span>
		<span  class="submit-know" onclick="closeBpoupMsgDiv()">确认</span>
		<input type="hidden" value="" id="refreshFlag"/>
	</div>
	
	<div id="Poup-delete" class="poup-div-msg-delete">
	  		<table>
	  			<div class="bpopupColseWarp">
					 <img class="b-close"  src="/wxi/image/dkfManager/close.png" />
				</div>
				
	  			<thead>
		  			<tr>
		  				<td colspan="2" style="border:none">
		  					<span class="know-msg-show-delete">
		  						是否删除该内容?
		  					</span>
		  				</td>
		  			</tr>
		  		</thead>
	  		</table>
	  		<div class="keywork-warp" style="margin-bottom:20px;">
				<ul class="clearfix" style="text-align:center">
					<li style="width:105px;float:none" class="popupBtn-pass" onclick="removeKeyword()" style="border: 1px solid #009900"><span class="" data-id="">是</span></li>
 					<li style="width:105px;float:none" class="popupBtn-close" onclick="closeDelete()" style="border: 1px solid #009900"><span class="" data-id="">否</span></li>  
	 			</ul>
			</div>
	  	</div>
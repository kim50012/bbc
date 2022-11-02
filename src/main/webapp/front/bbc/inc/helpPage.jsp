<c:if test="${(helpTag == '')}">
	<c:set var="helpTag" value="15" />
</c:if>
<a onclick="$('html, body').animate({scrollTop:0}, 1);$('#pop-up-help').show();" class="r_pg_help show" style="bottom: ${helpTag}px;">홈으로</a>

<div class="pop-up-wrap pop-up-wrap-club" id='pop-up-help' style="display:none;">
		<ul class="pop-up-content" style="overflow:visible;">
			<li class="level" style="width:4.6rem;height:0.6rem; border-bottom:1px dashed #d2d2d2;padding-top:0.2rem;">
				Help
				<div class="buttons" style="position:absolute;margin-top: -0.4rem;left: 4.2rem;">
					<span class="cancel" onclick="$('#pop-up-help').hide()" >X</span>
				</div>
			</li>
			<li class="level" style="width:4.6rem;padding-top:0.2rem;">
				${helpMsg}
			</li>
		</ul>	
</div>
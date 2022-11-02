<%@ include file="/front/skin/common.jsp"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, target-densitydpi=medium-dpi">
<meta name="format-detection" content="telephone=no" />
<title>HEADER</title>
<style type="text/css">
	.header{
		width: 100%;
		height: 56px;
		vertical-align:middle;
	}
	.header_left{
		width: 15%;
		height: 56px;
		padding-left: 5px;
	}
	.header_center{
		width: 50%;
		text-align: center;
	}
	.header_right{
		width: 35%;
		text-align: right;
		padding-right: 5px;
	}
	.img_size{
		width: 28px;
		height: 28px;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<div class="header">
		<table>
			<tr>
				<td class="header_left">
					<img alt="" src="/front/skin/main/img/main_menu.png" class="img_size">
				</td>
				<td class="header_center">
					<img alt="" src="/front/skin/main/img/shop_logo.png">
				</td>
				<td class="header_right">
					<img alt="" src="/front/skin/main/img/main_search.png" class="img_size">
					<img alt="" src="/front/skin/main/img/main_cart.png" class="img_size">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
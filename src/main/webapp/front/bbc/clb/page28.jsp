<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.waremec.framework.utilities.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="label" value="<%=LabelUtil.getLabelBbcMap(application)%>" />
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>년간비용분석</title>
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<link rel="stylesheet" type="text/css" href="../css/date.css" />
<script>var intClbSq = "${amsClb.CLB_SQ}";</script>
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/headerBBC.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script> 
<style>
.app {
	padding-top: 0;
}

.app-header {
	position: relative;
}

.app-header .logo img {
	width: 0.60rem;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
		$("#appHD").prepend(htm)
		$(".logo")
				.click(
						function() {
							window.location.href = '/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
						});
	});
</script>
<style>
.subBtn {
	padding: 0.2rem 0.1rem;
}
.title1 .bold {
    font-size: 0.33rem;
}
.container {
	padding: 0;
	background: #f0f0f0;
}
.pb12 {
    padding-bottom: 0.12rem;
	background: #fff;
	padding-right: 0.32rem;
	padding-left: 0.32rem;
}
.title2 {
	background: #fff;
	padding-right: 0.32rem;
	padding-left: 0.32rem;
}
.table3 {
    padding-bottom: 0.22rem;
}
</style>
</head>

<body>
<div class="app top5App" id="app">
	<div class="content">
		<div class="scroll-wrap refresh-wrap" id="appHD">
			<div class="container">
				            
				<div class="date mt10 date_schedule pb12" style="padding-top: 0.4rem;padding-bottom:0.3rem;" id="idCalendar"></div>

				<div class="title2">
					<span class="font24 bold">년간 내역</span><span class="font20 fontOrange">기준 : 1월 1일 ~ 12월 31일</span>
				</div>
				<div class="table" id="dailyFeeList">
					<table class="drag-table noWrapTable alignRightTable" id="table1" cellspacing="0" cellpadding="2" width="120%" border="1">
						
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

	$(function() {
		var mm = "${amsClb.FEEMONTH}";
		var year = mm.substring(0,4);
		getData(year);
	});

	function getData(para3) {

		var para1 = "FEE_ANALYS_YEAR";
		var para2 = "${intClbsq }";
		var para4 = "TIME";

		var load = loading();
		load.show()

		$
				.ajax({
					data : {
						para1 : para1,
						para2 : para2,
						para3 : para3,
						para4 : para4
					},
					type : "POST",
					url : "/front/bbc/clb/getData.htm",
					success : function(data) {

						if (data.list.length != 0) {

							var htmTitle = '';
							htmTitle = ''
								+ '<tr>'
								+ '	<th class="noWrapCell">대분류</th>'
								+ '	<th class="noWrapCell">소분류</th>'
								+ '	<th class="noWrapCell">금액</th>'
								+ '</tr>'
								;

							$("#table1").html(htmTitle);
								
							var feeDt = "";
							
							for (var i = 0; i < data.list.length; i++) {
								var htm = '';

								if (data.list[i].LEVEL1 == "합계") {
// 									htm = ''
// 									+ '<tr>'
// 									+ '	<td class="center" colspan="3" style="background: rgb(255, 246, 246);">'+data.list[i].RDT+'</td>'
// 									+ '	<td onclick="modFee(\''+data.list[i].LEVEL1+'\', \''+data.list[i].FEE_SQ+'\');" class="right" style="font-weight:bold;">'+data.list[i].AMT+'</td>'
// 									+ '	<td onclick="modFee(\''+data.list[i].LEVEL1+'\', \''+data.list[i].FEE_SQ+'\');">'+data.list[i].DSC+'</td>'
// 									+ '</tr>'					
// 									;
									htm = ''
										+ '<tr>'
										+ '	<td class="center" colspan="2" style="font-weight:bold;background: rgb(255, 246, 246);">'+data.list[i].LEVEL1+'</td>'
										+ '	<td class="right" style="font-weight:bold;background: rgb(255, 246, 246);" '+data.list[i].AMT_TAG+'>'+data.list[i].AMT+'</td>'
										+ '</tr>'					
										;
								}
								else if (data.list[i].LEVEL1 == "수입" || data.list[i].LEVEL1 == "지출") {
									if (data.list[i].AMT != "0") {
										htm = ''
											+ '<tr>'
											+ '	<td class="left" style="font-weight:bold;background: rgb(246, 246, 255);">'+data.list[i].LEVEL1+'</td>'
											+ '	<td class="left" style="font-weight:bold;background: rgb(246, 246, 255);">'+data.list[i].LEVEL2+'</td>'
											+ '	<td class="right" style="font-weight:bold;background: rgb(246, 246, 255);" '+data.list[i].AMT_TAG+'>'+data.list[i].AMT+'</td>'
											+ '</tr>'					
											;
									}
								}
								else {

									htm = ''
										+ '<tr>'
										+ '	<td class="left">'+data.list[i].LEVEL1+'</td>'
										+ '	<td class="left">'+data.list[i].LEVEL2+'</td>'
										+ '	<td class="right" '+data.list[i].AMT_TAG+'>'+data.list[i].AMT+'</td>'
										+ '</tr>'					
										;
								}
								$("#table1").append(htm);
								

							}
						} else {
							//$("#mbrList").html('');
						}
						load.hide()

					},
					error : function(xhr, status, e) {
						load.hide()
						alert("Error : " + status);
					}
				});
	}
	
	var Class = {
		create : function() {
			return function() {
				this.initialize.apply(this, arguments);
			}
		}
	}
	Object.extend = function(destination, source) {
		for ( var property in source) {
			destination[property] = source[property];
		}
		return destination;
	}
	
	var date = Class.create();
	date.prototype = {
		initialize : function(container, table, options) {
			this.Container = document.getElementById(container);
			this.tables = document.getElementById(table);
			this.Days = []; //日期对象列表
			this.SetOptions(options);
			this.Year = this.options.Year;
			this.Month = this.options.Month;
			this.Day = this.options.Day;
			this.pre = 0;
			this.next = 0;

			this.lModelTitle = this.Draw();
		},
		//设置默认属性
		SetOptions : function(options) {

			var date = parseDt('${amsClb.FEEDAY }');
		    this.options = {
				Year : date.getFullYear(), //显示年
				Month : ("0" + (date.getMonth()+1)).slice(-2), //显示月
				Day : date.getDate(), // 日
			};
			Object.extend(this.options, options || {});
		},
		  //上一个月
		  PreMonth: function(options) {
				this.Year = this.Year-1;
		    this.Draw();
		    console.log(this.Year+"-"+this.Month);
		    getData(this.Year);
		  },
		  //下一个月
		  NextMonth: function(options) {
			this.Year = this.Year+1;
		    this.Draw();
		    console.log(this.Year+"-"+this.Month);
		    getData(this.Year);
		  },
		Draw : function() {
			//日期列表
			var arr = [], preArr = [], nextArr = [];
			// 上月天数
			// 当月天数

			this.Days = [];

			var dateTitle = document.createElement("div");
			dateTitle.className = "date-title";
			var lBtn = document.createElement("div");
			lBtn.className = "date-lbtn";
			var that = this;
			lBtn.onclick = function() {
				that.PreMonth(lBtnClick())
				//lBtnClick()
			};
			
			var con = document.createElement("div");
			con.className = "date-con";
			con.innerHTML = "<span>" + this.Year + "년"
					+ "</span>";
			var rBtn = document.createElement("div");
			rBtn.className = "date-rbtn";
			rBtn.onclick = function() {
				that.NextMonth(rBtnClick())
				//rBtnClick()
			};
			dateTitle.appendChild(lBtn);
			dateTitle.appendChild(con);
			dateTitle.appendChild(rBtn);

		    while(this.Container.hasChildNodes()) {
		      this.Container.removeChild(this.Container.firstChild);
		    }
			this.Container.appendChild(dateTitle);
		}
	}

	$(function() {
		var day = new date("idCalendar", "tableWrap", {});
		$("#tableUp").click(function() {
			$("#tableWrap").slideUp()
		})
	})
	
	function lBtnClick(date) {
      	return {}
	}
	function rBtnClick(date) {
		return {}
	}
	function parseDt(str) {
	    var y = str.substr(0, 4);
	    var m = str.substr(5, 2);
	    var d = str.substr(8, 2);
	    return new Date(y,m-1,d);
	}
</script>
</html>

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
<title>회비내역 다운로드</title>
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
.headerTitle {
	width: 5.2rem;
	overflow: initial;
	padding-left: 0.2rem;
	font-size: 0.3rem;
	line-height: 1;
	font-weight: bold;
}
</style>
<script>
	$(function() {
		var htm = '<header class="app-header" style="position: relative;"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image><p class="headerTitle">${amsClb.CLB_NM}</p></div><div class="menu"><div class="menu-list" onclick="goMenuList()"><i class="fourDPlex icon-liebiao"></i></div></div></header>'
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
				
				<div class="table" style="padding-top:0.1rem;background: #fff;">
					<table class="drag-table noWrapTable alignRightTable" id="tableHeader" cellspacing="0" cellpadding="2" width="120%" border="1">
						<caption>합계</caption>
						<thead>
						<tr>
							<th class="noWrapCell" colspan="2">이월금액</th>
							<th class="noWrapCell" colspan="2">월수입</th>
							<th class="noWrapCell" colspan="2">월지출</th>
							<th class="noWrapCell" colspan="2">월합계</th>
						</tr>
						</thead>
						<tr>
							<td class="center" id="TotalFee" style="font-size:0.3rem;" colspan="2">0</td>
							<td class="center" id="monthP" style="color:blue;font-size:0.3rem;" colspan="2">0</td>
							<td class="center" id="monthM" style="color:red;font-size:0.3rem;" colspan="2">0</td>
							<td class="center" id="monthFee" style="font-weight:bold;font-size:0.3rem;" colspan="2">0</td>
						</tr>
					</table>
				</div>
				
				<div class="title2">
					<span class="font24 bold">회비 상세 내역</span><span class="font20 fontOrange">기준 : 1일 ~ 말일</span>
				</div>
				<div class="table" id="dailyFeeList">
		        	<table class="drag-table alignRightTable" id="table" cellspacing="0" cellpadding="2" border="1">
						<caption>회비 사용 내역</caption>
						<thead>
		                <tr>
							<th class="noWrapCell">No</th>
							<th class="noWrapCell">일자</th>
							<th class="noWrapCell">대분류</th>
							<th class="noWrapCell">중분류</th>
							<th class="noWrapCell" colspan="2">금액</th>
							<th class="noWrapCell" colspan="2">내역</th>
		                </tr>
						</thead>
		                <tbody id="areaSlist">
						<!-- START Data Loop -->
		         		</tbody>
		       		</table>
				</div>
				

		        <c:if test="${amsClb.CLB_GD == 'A'}">
		       	<div>
		      		<div class="blueBtn subBtn f-col font26" id="resetMatch" onclick="fnExcelReport('table', '회비사용내역', 'tableHeader');">엑셀다운로드</div>
		      	</div>
		      	</c:if>				
				
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

	$(function() {
		getData("${amsClb.FEEMONTH}");
	});

	function modFee(level, id) {
		if (level == "회비") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page4&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "가입비") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page5&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "코트수입-벙개") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page6&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "이벤트") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page7&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "협찬") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page8&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "기타") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page9&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "코트비") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page10&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "운영비") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page11&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "교류전비용") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page12&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "유니폼비용") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page13&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "송년회비용") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page14&intClbsq=${intClbsq }&para2="+id;	
		}
		if (level == "운영진비용") {
			window.location.href="/front/bbc/clb/getPage.htm?pageName=page15&intClbsq=${intClbsq }&para2="+id;	
		}
	}
	

	function getData(para3) {

		var para1 = "FEE_LIST_EXCEL";
		var para2 = "${intClbsq }";
		var para4 = "TIME";

		var load = loading();
		load.show()
		
		
		$("#areaSlist").html('');
		
		$.ajax({
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

					var strTitle = "";
					
					console.log(data.list);
					
					$("#TotalFee").html(0);
					$("#monthP").html(0);
					$("#monthM").html(0);
					$("#monthFee").html(0);
					
					for (var i = 0; i < data.list.length; i++) {
						

						if (data.list[i].LEVEL1 == "합계") {
							$("#TotalFee").html(data.list[i].AMT);
						} else if (data.list[i].LEVEL1 == "소계") {
							$("#monthP").html(data.list[i].AMTP);
							$("#monthM").html(data.list[i].AMTM);
							$("#monthFee").html(data.list[i].AMT);
						}
						else {
							var fontColorTag = "color: blue;";
							var formattedString = data.list[i].AMT;
							var cleanString = formattedString.replace(/,/g, '');
							var numb = parseInt(cleanString, 10);
							if (numb < 0) {
								fontColorTag = "color: red;";
							}
							
							
							htm = ''
								+ '			<tr>'
								+ '				<td class="center">'+data.list[i].FEE_SQ+'</td>'
								+ '				<td class="center">'+data.list[i].FEE_DT+'</td>'
								+ '				<td class="center">'+data.list[i].LEVEL1+'</td>'
								+ '				<td class="center">'+data.list[i].LEVEL2+'</td>'
								+ '				<td class="center" style="text-align: right !important;'+fontColorTag+'" colspan="2">'+data.list[i].AMT+'</td>'
								+ '				<td class="center" colspan="2">'+data.list[i].DSC+'</td>'
								+ '			</tr>'
								;
							$("#areaSlist").append(htm);
						}
					}
					
				}
				load.hide()

			},
			error : function(xhr, status, e) {
				load.hide()
				alert("Error : " + status);
			}
		});
	}
	
	function phoneHtml(a) {
		
		if (a == "") {
			return "";
		}
		else {
			return '<a href="tel:'+a+'">전화걸기</a>';
		}
		
		return b
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
		    //先取得上一个月的日期对象
		    var d = new Date(this.Year, this.Month - 2, 1);
		    //再设置属性
		    this.Year = d.getFullYear();
		    this.Month = ("0" + (d.getMonth() + 1)).slice(-2);
		    //重新画日历
		    this.Draw();
		    getData(this.Year+'-'+this.Month);
		  },
		  //下一个月
		  NextMonth: function(options) {
		    var d = new Date(this.Year, this.Month, 1);
		    this.Year = d.getFullYear();
		    this.Month = ("0" + (d.getMonth() + 1)).slice(-2);
		    this.Draw();
		    getData(this.Year+'-'+this.Month);
		  },
		Draw : function() {
			//日期列表
			var arr = [], preArr = [], nextArr = [];
			// 上月天数
			var PreMonth = new Date(this.Year, (this.Month - 1), 1).getDay();
			//console.log("PreMonth:"+PreMonth);
			this.pre = PreMonth - 1;
			// 当月天数
			var Month = new Date(this.Year, this.Month, 0).getDate()
			//console.log("new Date(this.Year, this.Month, 0):"+new Date(this.Year, this.Month, 0));
			
			// 下月天数 最终获取的天数是本页面上包含的所有的上月、本月、下月的天数
			var NextMonth = 42 - arr.length;
			
			this.Days = [];
			// 这里是头部
			//  var dateTitle = '<div class="date-title"><i class="date-lbtn" onclick="'+this.PreMonth+'"> < </i><span>2018年7月</span><i class="date-rbtn"> > </i></div>'
			// 日历头部
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
			con.innerHTML = "<span>" + this.Year + "년&nbsp;" + this.Month + "월"
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
      	return {
			a1: [1,2,12,30],
			a2: [1,13],
			d1: [1],
			d2: [1],
			lModelTitle: '선적 예정 현황',
			lMTno1: 2,
			lMTno2: 4,
			rModelTitle: '오픈 예정 현황',
			rMTno1: 2,
			rMTno2: 4,
		}
	}
	function rBtnClick(date) {
		return {
			a1: [1,2,12,30],
			a2: [1,13],
			d1: [1],
			d2: [1],
			lModelTitle: '선적 예정 현황',
			lMTno1: 2,
			lMTno2: 4,
			rModelTitle: '오픈 예정 현황',
			rMTno1: 2,
			rMTno2: 4,
		}
	}
	function parseDt(str) {
	    var y = str.substr(0, 4);
	    var m = str.substr(5, 2);
	    var d = str.substr(8, 2);
	    return new Date(y,m-1,d);
	}

	function fnExcelReport(id, title, id2) {
		var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		tab_text = tab_text
				+ '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		tab_text = tab_text
				+ '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		tab_text = tab_text + '<x:Name>' + title + '</x:Name>';
		tab_text = tab_text
				+ '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		tab_text = tab_text
				+ '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		tab_text = tab_text + "<table border='1px'>";
		var headerTable = $('#' + id2).clone();
		headerTable.find('input').each(function(index, elem) {
			$(elem).remove();
		});
		var exportTable = $('#' + id).clone();
		exportTable.find('input').each(function(index, elem) {
			$(elem).remove();
		});
		tab_text = tab_text + headerTable.html() + "</table><table><tr><td></td></tr></table><table border='1px'>" + exportTable.html();
		tab_text = tab_text + '</table></body></html>';
		var data_type = 'data:application/vnd.ms-excel';
		var ua = window.navigator.userAgent;
		var msie = ua.indexOf("MSIE ");
		var fileName = title + '.xls';
		//Explorer 환경에서 다운로드
		if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			if (window.navigator.msSaveBlob) {
				var blob = new Blob([ tab_text ], {
					type : "application/csv;charset=utf-8;"
				});
				navigator.msSaveBlob(blob, fileName);
			}
		} else {
			var blob2 = new Blob([ tab_text ], {
				type : "application/csv;charset=utf-8;"
			});
			var filename = fileName;
			var elem = window.document.createElement('a');
			elem.href = window.URL.createObjectURL(blob2);
			elem.download = filename;
			document.body.appendChild(elem);
			elem.click();
			document.body.removeChild(elem);
		}
	}		
</script>
</html>

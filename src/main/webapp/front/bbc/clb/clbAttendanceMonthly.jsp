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
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>월간 민턴 일정</title>
<!--bootstarp：公用-->
<link rel="stylesheet" type="text/css" href="../css/font.css" />
<!--字体图标：公用-->
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<!--reset：公用-->
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<!--公共：公用-->
<link rel="stylesheet" type="text/css" href="../css/button.css" />
<!--按钮：公用-->
<link rel="stylesheet" type="text/css" href="../css/date.css" />
<!--首页：index-->
<script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script>
<!--jquery公用-->
<script src="../js/rem.js" type="text/javascript" charset="utf-8"></script>
<!--rem公用-->
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
<!--bootstarp公用-->
<script src="../js/header.js" type="text/javascript" charset="utf-8"></script>
<script src="../js/common.js" type="text/javascript" charset="utf-8"></script>
<!--run 首页用-->
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
    .orange-hollow:before {
    	background: url(../image/orangeDoshed.png) no-repeat;
    	width: 0.2rem;
    	height: 0.2rem;
    	background-size: 0.2rem auto;
    	margin-left: 0.23rem;
    }
    .green-solid:before {
    	background: url(../image/greenDoshed.png) no-repeat;
    	width: 0.2rem;
    	height: 0.2rem;
    	background-size: 0.2rem auto;
    	margin-left: 0.23rem;
    }
    .date-sign .d1 {
	    width: 0.22rem;
	    height: 0.22rem;
	    background-size: 0.15rem auto;
    }
    .date-sign .d2 {
	    width: 0.22rem;
	    height: 0.22rem;
	    background-size: 0.15rem auto;
    }
    .date-sign .a1 {
	    width: 0.22rem;
	    height: 0.22rem;
	    background-size: 0.15rem auto;
    }
    .date-sign .a2 {
	    width: 0.22rem;
	    height: 0.22rem;
	    background-size: 0.15rem auto;
    }
    .date-item span {
	    font-size: 0.28rem;
	    font-weight: bold;
	}
	.title2 {
	    padding-bottom: 0.44rem;
	}
	.subBtn {
		padding: 0.18rem 0.1rem;
	}
	.orange-solid:before {
	    background: url(../image/orangeCircle.png) no-repeat;
	    width: 0.2rem;
	    height: 0.2rem;
	    background-size: 0.2rem auto;
	    margin-left: 0.23rem;
	    content: "";
	    position: absolute;
	    left: 0rem;
	    margin-top: 0.05rem;
	}
	.green-hollow:before {
	    background: url(../image/greenCircle.png) no-repeat;
	    width: 0.2rem;
	    height: 0.2rem;
	    background-size: 0.2rem auto;
	    margin-left: 0.23rem;
	    content: "";
	    position: absolute;
	    left: 0rem;
	    margin-top: 0.05rem;
	}
</style>
<script>
   $(function() {
		//if($("body > div").attr("id") === 'appGameTody') {
		  // 这里是生成header
		  var htm = '<header class="app-header"><div class="logo"><image src="${amsClb.CLB_MAI_IMG_PTH}"></image></div><div class="font24 bold">${amsClb.CLB_NM}</div></header>'
		  $("#appMbrMonthly").prepend(htm)
		//}
		$(".app-header").click(function() {
			window.location.href='/front/bbc/clb/clbDetMy.htm?intClbsq=${intClbsq }';
		});
	});
</script>
</head>

<body>
	<div class="app schedule">
		<div class="content">
			<div class="scroll-wrap refresh-wrap" id="appMbrMonthly">
				<div class="container mt10">
					<div class="title2">
						<span class="font24 bold">출석 조회</span>
					</div>
					<div class="date mt10 date_schedule pb12" id="idCalendar"></div>
					<div id="tableWrap">
						<div class="title1">
							<div>
								<i class="fourDPlex icon-sanjiao"></i> <span class="bold">상세현황</span>
							</div>
							<i class="fourDPlex icon-jian" id="tableUp"></i>
						</div>
						<div class="table">
							<table class="drag-table" id="table1" cellspacing="0" cellpadding="2" width="100%" border="1">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript" charset="utf-8">
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
				this.a1 = this.options.a1;
				this.a2 = this.options.a2;
				this.d1 = this.options.d1;
				this.d2 = this.options.d2;

				this.lModelTitle = this.options.lModelTitle,
						this.lMTno1 = this.options.lMTno1,
						this.lMTno2 = this.options.lMTno2,
						this.rModelTitle = this.options.rModelTitle,
						this.rMTno1 = this.options.rMTno1,
						this.rMTno2 = this.options.rMTno2,
						// 这里有4中情况
						this.Draw();
			},
			//设置默认属性
			SetOptions : function(options) {

				var date = parseDt('${amsClb.THISMONTH}-01');
			    this.options = {
					Year : date.getFullYear(), //显示年
					Month : ("0" + (date.getMonth()+1)).slice(-2), //显示月
					Day : date.getDate(), // 日
					a1 : options.a1,
					a2 : options.a2,
					d1 : options.d1,
					d2 : options.d2,
					lModelTitle : options.lModelTitle,
					lMTno1 : options.lMTno1,
					lMTno2 : options.lMTno2,
					rModelTitle : options.rModelTitle,
					rMTno1 : options.rMTno1,
					rMTno2 : options.rMTno2,
				};
				Object.extend(this.options, options || {});
			},
			Draw : function() {
				//日期列表
				var arr = [], preArr = [], nextArr = [];
				// 上月天数
				var PreMonth = new Date(this.Year, (this.Month - 1), 1).getDay();
				//console.log("PreMonth:"+PreMonth);
				this.pre = PreMonth - 1;
				for (var i = PreMonth; i > 0; i--) {
					var PreDay = new Date(this.Year, this.Month - 1, 0)
							.getDate()
							- i + 1
					preArr.push(PreDay)
					arr.push(PreDay);
				}
				// 当月天数
				var Month = new Date(this.Year, this.Month, 0).getDate()
				//console.log("new Date(this.Year, this.Month, 0):"+new Date(this.Year, this.Month, 0));
				
				for (var i = 1; i <= Month; i++) {
					arr.push(i);
				}
				// 下月天数 最终获取的天数是本页面上包含的所有的上月、本月、下月的天数
				var NextMonth = 42 - arr.length;
				this.next = NextMonth - 1;
				for (var i = 1; i <= NextMonth; i++) {
					nextArr.push(i)
					arr.push(i);
				}
				while (nextArr.length < arr.length) {
					nextArr.unshift('')
				}
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
					//that.PreMonth(lBtnClick())
					lBtnClick(parseDt('${amsClb.THISMONTH}-01'))
				};
				var con = document.createElement("div");
				con.className = "date-con";
				con.innerHTML = "<span onclick='showTr();'>" + this.Year + "년" + this.Month + "</span>";
				var rBtn = document.createElement("div");
				rBtn.className = "date-rbtn";
				rBtn.onclick = function() {
					//that.NextMonth(rBtnClick())
					rBtnClick(parseDt('${amsClb.THISMONTH}-01'))
				};
				dateTitle.appendChild(lBtn);
				dateTitle.appendChild(con);
				dateTitle.appendChild(rBtn);
				// 日历上面的数据
				if (this.lModelTitle) {
					var dateModel = document.createElement("div");
					dateModel.className = "date-model";
					var lModel = document.createElement("div");
					lModel.className = "left-model";
					lModel.innerHTML = "<p>" + this.lModelTitle
							+ "</p><h4><span>" + this.lMTno1 + "</span>/<span>"
							+ this.lMTno2 + "</span></h4>"

					var rModel = document.createElement("div");
					rModel.className = "right-model";
					rModel.innerHTML = "<p>" + this.rModelTitle
							+ "</p><h4><span>" + this.rMTno1 + "</span>/<span>"
							+ this.rMTno2 + "</span></h4>"
					dateModel.appendChild(lModel);
					dateModel.appendChild(rModel);
				}

				// 日历首行
				var firstRow = document.createElement("div");
				firstRow.className = 'date-head-list';
				var week = [ '일', '월', '화', '수', '목', '금', '토' ]
				for (var i = 1; i <= 7; i++) {
					var cell = document.createElement("div");
					cell.className = 'date-item';
					if (week.length > 0) {
						var d = week.shift();
						cell.innerHTML = "<span>" + d + "</span>";
					}
					firstRow.appendChild(cell);
				}
				var dayWrap = document.createElement("div");
				dayWrap.className = 'day-wrap';
				// 月历上可能会出现两个相同的天数，所以拿开关进行控制，如果已经有一个今天，则后面不会再出现(小日期是用)
				var today = true;
				var l = 0;
				// 记录当前月份
				
				var date = parseDt('${datFrdt}-01');
				var m = date.getMonth()+1;
				//console.log("m:"+m);
				while (arr.length > 0) {
					//每个星期插入一个tr
					var row = document.createElement("div");
					row.className = 'date-item-list';
					//每个星期有7天
					for (var i = 1; i <= 7; i++) {
						l++;
						var cell = document.createElement("div");
						cell.className = 'date-item';
						if (arr.length > 0) {
							var d = arr.shift();
							var preD = preArr.shift();
							var nextD = nextArr.shift();
							var num = document.createElement("div")
							num.className = 'date-num';
							var sign = document.createElement("div")
							sign.className = 'date-sign';

							if (d == preD) {
								num.innerHTML = "<span class='pre-day'>"
										+ d + "</span>";
							} else if (d == nextD) {
								num.innerHTML = "<span class='next-day'>"
										+ d + "</span>";
							} else {
								num.innerHTML = "<span>" + d + "</span>";
							}
								
							num.onclick = function() {
								//console.log($(this).children('span:first').html());
								var numHtml = $(this).children('span:first').html();
								numHtml = ("0" + (numHtml)).slice(-2);
								if (this.children[0].className
										.indexOf('pre-day') < 0
										&& this.children[0].className
												.indexOf('next-day') < 0) {
									var selected = document
											.getElementsByClassName('selected')[0]
									if (selected) {
										selected.classList.remove("selected")
									}
									this.classList.add("selected")
									$(that.tables).slideDown()
									$(".hideTr").hide()
									$("#tr${datFrdt}-"+numHtml).show()
									
								}
							}
							var signA1 = null;
							var signA2 = null;
							var signD1 = null;
							var signD2 = null;
							for (var k = 0; k < this.a1.length; k++) {
								var a1 = this.a1[k]
								if (a1 == d && a1 > 15 && arr.indexOf(a1) <= 0
										&& m == this.Month) {
									signA1 = document.createElement("i")
									signA1.classList.add("a1");
								} else if (a1 == d && a1 <= 15
										&& l < 42 - NextMonth) {
									signA1 = document.createElement("i")
									signA1.classList.add("a1");
								}
							}
							for (var k = 0; k < this.a2.length; k++) {
								var a2 = this.a2[k]
								if (a2 == d && a2 > 15 && arr.indexOf(a2) <= 0
										&& m == this.Month) {
									signA2 = document.createElement("i")
									signA2.classList.add("a2");
								} else if (a2 == d && a2 <= 15
										&& l < 42 - NextMonth) {
									signA2 = document.createElement("i")
									signA2.classList.add("a2");
								}
							}
							for (var k = 0; k < this.d1.length; k++) {
								var d1 = this.d1[k]
								if (d1 == d && d1 > 15 && arr.indexOf(d1) <= 0
										&& m == this.Month) {
									signD1 = document.createElement("i")
									signD1.classList.add("d1");
								} else if (d1 == d && d1 <= 15
										&& l < 42 - NextMonth) {
									signD1 = document.createElement("i")
									signD1.classList.add("d1");
								}
							}
							for (var k = 0; k < this.d2.length; k++) {
								var d2 = this.d2[k]
								if (d2 == d && d2 > 15 && arr.indexOf(d2) <= 0
										&& m == this.Month) {
									signD2 = document.createElement("i")
									signD2.classList.add("d2");
								} else if (d2 == d && d2 <= 15
										&& l < 42 - NextMonth) {
									signD2 = document.createElement("i")
									signD2.classList.add("d2");
								}
							}
							if (signA1 != null) {
								sign.appendChild(signA1);
							}
							if (signA2 != null) {
								sign.appendChild(signA2);
							}
							if (signD1 != null) {
								sign.appendChild(signD1);
							}
							if (signD2 != null) {
								sign.appendChild(signD2);
							}
							cell.appendChild(num);
							cell.appendChild(sign);
						}
						row.appendChild(cell);
					}
					dayWrap.appendChild(row);
				}
				
				//console.log(dayWrap);
				
				//先清空内容再插入(ie的table不能用innerHTML)
				while (this.Container.hasChildNodes()) {
					this.Container.removeChild(this.Container.firstChild);
				}
				this.Container.appendChild(dateTitle);
				if (dateModel) {
					this.Container.appendChild(dateModel);
				}

				this.Container.appendChild(firstRow);
				this.Container.appendChild(dayWrap);
			}
		}

		$(function() {
			var day = new date("idCalendar", "tableWrap", {
				a1 : [ ${amsClb.TTEXCDT_1002} ],
				a2 : [ ${amsClb.MYEXCDT_1002} ],
				d1 : [ ${amsClb.TTEXCDT_1001} ],
				d2 : [ ${amsClb.MYEXCDT_1001} ],
				lModelTitle : '벙개(교류전)운동',
				lMTno1 : ${amsClb.MY_CNT_1002},
				lMTno2 : ${amsClb.TT_CNT_1002},
				rModelTitle : '정규운동',
				rMTno1 : ${amsClb.MY_CNT_1001},
				rMTno2 : ${amsClb.TT_CNT_1001},
			});
			$("#tableUp").click(function() {
				$("#tableWrap").slideUp()
			})
		})
		function lBtnClick(date) {
			date.setMonth(date.getMonth() - 1);
			var gMonth = ("0" + (date.getMonth()+1)).slice(-2);
			var gYear = date.getFullYear().toString();
			//console.log(gYear+'-'+gMonth);
			window.location.href='/front/bbc/clb/clbAttendanceMonthly.htm?intClbsq=${intClbsq}&intMbrsq=${intMbrsq}&datFrdt='+gYear+'-'+gMonth;
		}
		function rBtnClick(date) {
			date.setMonth(date.getMonth() + 1);
			var gMonth = ("0" + (date.getMonth()+1)).slice(-2);
			var gYear = date.getFullYear().toString();
			//console.log(gYear+'-'+gMonth);
			window.location.href='/front/bbc/clb/clbAttendanceMonthly.htm?intClbsq=${intClbsq}&intMbrsq=${intMbrsq}&datFrdt='+gYear+'-'+gMonth;
		}
		function parseDt(str) {
		    var y = str.substr(0, 4);
		    var m = str.substr(5, 2);
		    var d = str.substr(8, 2);
		  //console.log("parseDt:"+y+m+d);
		    return new Date(y,m-1,d);
		}
		function showTr() {
			$(".hideTr").show();
			$("#tableWrap").show();
		}
	</script>
</body>
</html>
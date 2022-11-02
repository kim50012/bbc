function FSocket() {
	var e = this;
	e.ws = null, 
	this.isOpen = !1, 
	this.interval = null, 
	e.sendCount = 0, 
	e.getCount = 0, 
	e.requestID = 1, 
	e.requests = {}, 
	e.requestHandlers = {}, 
	e.eventHandlers = {}
}
var DEFAULT_TIMEOUT = 6e4;
FSocket.prototype.getRId = function() {
	var e = this,
		t = e.requestID;
	return e.requestID++, e.requestID > 1e6 && (e.requestID = 1), t
};
var temp = {};
temp.type = "heart";
var HEARTMESSAGE = JSON.stringify(temp),
	HINTERVAL = 6e4;
FSocket.prototype.connect = function(e, t) {
	var n = this;
	n.ws = new WebSocket(e), n.ws.onopen = function() {
		n.isOpen = !0, n.interval = setInterval(function() {
			n.intervalCheck()
		}, HINTERVAL), t()
	}, n.ws.onclose = function() {
		n.close()
	}, n.ws.onerror = function() {
		n.close()
	}, n.ws.onmessage = function(e) {
		n.getCount < 0 ? n.getCount = 1 : n.getCount += 1;
		var t = JSON.parse(e.data);
		if ("message" == t.type) n.processMessage && n.processMessage(t.message);
		else if ("reply" == t.type) {
			var i = n.requests[t.requestID];
			i && (delete n.requests[t.requestID], t.success ? i(null, t.data) : i("调用错误"))
		} else if ("request" == t.type) {
			var s = t.requestID,
				o = t.method,
				a = t.args;
			n.processRequest(o, a, function(e, t) {
				var i = {};
				e ? i.success = !1 : (i.success = !0, i.data = t), i.type = "reply", i.requestID = s, n._send(JSON.stringify(i))
			})
		}
	}
}, 
FSocket.prototype.processRequest = function(e, t, n) {
	var i = this;
	if (i.requestHandlers[e]) {
		var s = i.requestHandlers[e];
		s(t, function(e, t) {
			n(e, t)
		})
	} else n("没有这个方法")
}, 
FSocket.prototype.addHandler = function(e, t) {
	var n = this;
	n.requestHandlers[e] = t
}, 
FSocket.prototype.intervalCheck = function() {
	var e = this;
	e.sendCount > 0 ? e.sendCount = 0 : e._send(HEARTMESSAGE), e.getCount > 0 ? e.getCount = 0 : (e.getCount -= 1, e.getCount < -5 && e.close())
}, 
FSocket.prototype.regist = function(e, t) {
	var n = this;
	n.eventHandlers[e] || (n.eventHandlers[e] = []), n.eventHandlers[e].push(t)
}, 
FSocket.prototype.fire = function(e) {
	var t = this;
	if (t.eventHandlers[e]) for (var n = 0; n < t.eventHandlers[e].length; n++) {
		var i = t.eventHandlers[e][n];
		i()
	}
}, 
FSocket.prototype.close = function() {
	var e = this;
	e.isOpen && e.fire("close"), e.isOpen = !1, clearInterval(e.interval);
	for (var t in e.requests) {
		var n = e.requests[t];
		n("连接异常")
	}
	e.requests = {}, e.ws && e.ws.close()
}, 
FSocket.prototype.sendMessage = function(e) {
	var t = this;
	t.sendCount += 1;
	var n = {};
	n.type = "message", n.message = e;
	var i = JSON.stringify(n);
	t._send(i)
}, 
FSocket.prototype.request = function(e, t, n) {
	var i = this;
	i.isOpen || n("连接异常"), i.sendCount += 1;
	var s = {};
	s.method = e, s.args = t, s.type = "request", s.requestID = i.getRId(), i.requests[s.requestID] = n, setTimeout(function() {
		var e = i.requests[s.requestID];
		e && (delete i.requests[s.requestID], e("超时"))
	}, DEFAULT_TIMEOUT);
	var t = JSON.stringify(s);
	i._send(t)
}, 
FSocket.prototype._send = function(e) {
	var t = this;
	t.isOpen && t.ws.send(e)
}, 
define("components/wsocket/fsocket", function() {}), 
define("components/message/model", ["require", "underscore", "backbone", "components/wsocket/fsocket"], function(e) {
	var t = (e("underscore"), e("backbone"));
	e("components/wsocket/fsocket");
	var n = function() {
			function e() {
				return Math.floor(65536 * (1 + Math.random())).toString(16).substring(1)
			}
			return function() {
				return e() + e() + "-" + e() + "-" + e() + "-" + e() + "-" + e() + e() + e()
			}
		}(),
		i = t.Model.extend({
			defaults: {
				weixin_unread: 0,
				weibo_unread: 0,
				order_unread: 0
			},
			initialize: function() {
				var e = this;
				e.init()
			},
			init: function() {
				var e = this;
				e.socket = new FSocket, e.connect(), e.handleDisconnect(), e.handleMessage()
			},
			connect: function() {
				var e = this,
					t = window._global.url.ws;
				e.socket.connect(t, function() {
					e.resetTryCounter();
					var t = n(),
						i = JSON.stringify({
							mp_id: window._global.kdt_id,
							client_id: t,
							admin_id: window._global.user_id,
							con_type: "unread_count"
						});
					e.socket.request("inner_setKey", i, function(e, t) {})
				})
			},
			resetTryCounter: function() {
				var e = this;
				e.tryCounter = 0, e.tryTimer && window.clearTimeout(e.tryTimer)
			},
			handleDisconnect: function() {
				var e = this;
				e.socket.regist("close", function() {
					e.tryTimer = setTimeout(function() {}, 1e4), e.tryReconnect()
				})
			},
			tryReconnect: function() {
				var e = this;
				e.tryCounter += 1, e.connect()
			},
			handleMessage: function() {
				var e = this;
				e.socket.addHandler("message", function(t, n) {
					n(null, "message_received");
					var i = JSON.parse(t);
					e.set(i)
				})
			}
		});
	return i
}), 
define("text!components/notify/templates/notify.html", [], function() {
	return '<div class="alert">\n    <button type="button" class="js-close close" data-dismiss="alert">&times;</button>\n    <div class="notify-cont">\n        <% var wb_total = wb_at_number + wb_tome_number + wb_private_number; %>\n        <% if (wx_number > 0) { %>\n        微信：你有 <a href="<%=wx_url %>"><%=wx_number %></a> 条未读信息<% if (wb_total > 0) { %>；&nbsp;&nbsp;&nbsp;&nbsp;<% } else { %>。<% } %>\n        <% } %>\n    </div>\n    <div class="notify-setting">\n        <% if (audio) { %>\n        <a href="javascript:void(0);" class="js-toggle-audio audio-on">\n            已开启\n        </a>\n        <% } else { %>\n        <a href="javascript:void(0);" class="js-toggle-audio audio-off">\n            已关闭\n        </a>\n        <% } %>\n    </div>\n</div>\n'
}), 
define("components/notify/notify", ["backbone", "text!components/notify/templates/notify.html"], function(e, t) {
	var n, i = e.View.extend({
		el: ".js-notify",
		template: _.template(t),
		events: {
			"click .js-close": "close",
			"click .js-toggle-audio": "toggleAudio"
		},
		initialize: function() {
			this.status = {
				wx_url: "",
				wx_number: 0,
				wb_at_url: "",
				wb_at_number: 0,
				wb_private_url: "",
				wb_private_number: 0,
				wb_tome_url: "",
				wb_tome_number: 0,
				audio: !0
			}, this.statekey = "mp-" + window._global.kdt_id + "-adm-" + window._global.user_id + "-msg"
		},
		render: function() {
			this.$el.html(this.template(this.status))
		},
		close: function() {
			this.$el.removeClass("fadeInUpBig"), window.NC.trigger("notify:close")
		},
		show: function() {
			this.$el.removeClass("hide"), this.$el.addClass("fadeInUpBig"), window.NC.trigger("notify:show")
		},
		hide: function() {
			this.$el.removeClass("fadeInUpBig"), this.$el.addClass("hide"), window.NC.trigger("notify:close")
		},
		setStatus: function(e) {
			_.isObject(e) && (this.status = e), this.canPlayAudio(), this.render(), this.show()
		},
		clear: function() {
			this.remove()
		},
		canPlayAudio: function() {
			var e;
			e = window.localStorage && "0" == window.localStorage.getItem(this.statekey + "-playAudio") ? !1 : !0, this.status.audio = e
		},
		toggleAudio: function() {
			window.localStorage && (this.status.audio ? window.localStorage.setItem(this.statekey + "-playAudio", 0) : window.localStorage.setItem(this.statekey + "-playAudio", 1)), this.setStatus()
		}
	});
	return {
		initialize: function(e) {
			return _.isUndefined(n) && (n = new i), _.isObject(e) && n.setStatus(e), n
		}
	}
}), 
define("components/message/view", ["require", "underscore", "backbone", "components/notify/notify", "core/event"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = e("components/notify/notify");
	e("core/event");
	var i = t.View.extend({
		initialize: function() {
			var e = this;
			e.initNotifyConfig(), e.initTitleNotify(), e.initSoundNotify(), e.listenTo(e.model, "change", e.showNotify), window.NC.on("notify:close", e.stopNotify, e)
		},
		initNotifyConfig: function() {
			var e = this,
				t = window._global.kdt_id,
				n = window._global.user_id;
			e.stateKey = "mp-" + t + "-adm-" + n + "-msg"
		},
		initTitleNotify: function() {
			var e = this;
			e.titleTimer = null, e.titleNotifying = !1, e.originalTitle = document.title, e.titleNotifyMsg = "您有未读消息"
		},
		render: function() {
			var e = this;
			return e
		},
		showNotify: function() {
			var e = this;
			e.showNotifyBar(), e.stopTitleNotify(), e.showTitleNotify(), e.playNotifySound()
		},
		stopNotify: function() {
			var e = this;
			e.stopTitleNotify()
		},
		showNotifyBar: function() {
			var e = this,
				t = e.model.get("weixin_unread");
			n.initialize({
				wx_number: t,
				wx_url: window._global.url.v1 + "/messages/my?type=unread",
				wb_tome_number: 0,
				wb_tome_url: "",
				wb_private_number: 0,
				wb_private_url: "",
				wb_at_number: 0,
				wb_at_url: ""
			})
		},
		switchTitle: function() {
			var e = this;
			document.title = e.titleNotifying ? e.originalTitle : e.titleNotifyMsg, e.titleNotifying = !e.titleNotifying
		},
		showTitleNotify: function() {
			var e = this;
			e.switchTitle(), e.titleTimer = window.setTimeout(function() {
				e.showTitleNotify()
			}, 1e3)
		},
		stopTitleNotify: function() {
			var e = this;
			window.clearTimeout(e.titleTimer), e.titleTimer = null, document.title = e.originalTitle, e.titleNotifying = !1
		},
		initSoundNotify: function() {
			var e = this;
			return e.checkAudioSupport(), e.isSupportAudio ? (e.notifySound = new Audio, void(e.notifySound.src = window._global.url.static + "/media/notify.wav")) : !1
		},
		checkAudioSupport: function() {
			var e = this;
			e.isSupportAudio = !! document.createElement("audio").canPlayType
		},
		playNotifySound: function() {
			var e = this,
				t = window.localStorage.getItem(e.stateKey + "-playAudio"),
				n = "0" == t;
			return !e.isSupportAudio || n ? !1 : void e.notifySound.play()
		},
		showDesktopNotify: function() {}
	});
	return i
}), 
define("components/message/message_bot_lite", ["require", "underscore", "backbone", "core/utils", "components/message/model", "components/message/view"], function(e) {
	var t = (e("underscore"), e("backbone"), e("core/utils"), e("components/message/model")),
		n = e("components/message/view"),
		i = {
			init: function() {
				var e = this;
				return window._global.js.message_report ? 1 != _global.team_status.weixin_server && 1 != _global.team_status.weixin_oldsub ? !1 : void e._init() : !1
			},
			_init: function() {
				var e = this;
				e.messageModel = new t;
				new n({
					el: "body",
					model: e.messageModel
				})
			}
		};
	return i
}), define("commons/utils", ["require", "underscore", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("core/utils"),
		i = {};
	return t.extend(i, {
		fetchSaleProperty: function(e, t) {
			var i = window._global.url.www + "/showcase/paipai/saleproperty.json";
			$.ajax({
				url: i,
				type: "GET",
				dataType: "json",
				cache: !1,
				data: e,
				success: function(e) {
					0 === e.code ? t(e) : n.errorNotify(e.msg)
				},
				error: function() {
					n.errorNotify("加载销售属性失败。")
				},
				complete: function() {}
			})
		},
		fnCallCount: function(e) {
			window[e] = "undefined" == typeof window[e] ? 0 : window[e] + 1
		},
		removeSkuKeyValue: function(e, t) {
			for (var n = 3; n > t; n--) {
				var i = "sku_name_" + n,
					s = i + "_value";
				e.unset(i, {
					silent: !0
				}), e.unset(s, {
					silent: !0
				})
			}
		},
		needConfirm: function(e, t, n) {
			var i = window.confirm(e);
			i ? t && "function" == typeof t && t.apply() : n && "function" == typeof n && n.apply()
		},
		button: function(e, t, n) {
			return e ? (e = $(e), void e.text(t).prop("disabled", n)) : !1
		},
		decimalFix: function(e, n) {
			if (!e) return "";
			var i = Number(e);
			if (isNaN(i)) return i;
			if (t.isUndefined(n)) return i;
			var s = i.toFixed(n);
			return s
		},
		originValueFix: function(e) {
			var n, i, s, o = e.match(/([^\d￥]*)[￥]?(\d+\.?\d*)(.*)$/),
				a = e;
			return o && o.length > 2 && (i = o[1], n = +o[2], s = o[3], t.isNumber(n) && (n = n.toFixed(2, 10)), s || (s = ""), a = i + "￥" + n + s), a
		},
		buyUrlValueFix: function(e) {
			var t = n.urlCheck(e);
			return t
		},
		booleanConverter: function(e, t) {
			return t = +t
		},
		numberValueFix: function(e) {
			var t = Number(e),
				n = isNaN(t) ? e : t.toFixed(2);
			return n
		},
		showLog: function(e) {
			e.toJSON()
		},
		getIdxOfCollection: function(e) {
			var t = e.collection,
				n = t.indexOf(e);
			return n
		}
	}), i
}), define("components/showcase/2.0.0/base/models/base", ["require", "underscore", "backbone"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = n.Model.extend({
			position: function() {
				return this.collection.indexOf(this)
			},
			index: function() {
				return this.collection.indexOf(this)
			},
			hasChanged: function() {
				return n.Model.prototype.hasChanged.call(this) ? !0 : this.has("sub_entry") ? this.get("sub_entry").any(function(e) {
					return e.hasChanged()
				}) : void 0
			},
			checkValid: function() {
				var e = !1,
					n = this.get("sub_entry");
				return t.isFunction(this.validate) && (e = this.validate()), n && n.each(function(n) {
					if (t.isFunction(n.validate)) {
						var i = n.validate();
						!e && i && n.trigger("valid:error", n), e = e || i
					}
				}), e
			}
		});
	return i
}), define("models/config", ["require", "underscore", "backbone", "components/showcase/2.0.0/base/models/base", "core/reqres", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("components/showcase/2.0.0/base/models/base"),
		s = e("core/reqres"),
		o = e("core/utils"),
		a = i.extend({
			idAttribute: "goods_id",
			defaults: function() {
				return {
					type: "config",
					goods_type: "",
					goods_platform: "",
					origin_goods_id: "",
					fx_shipper_type: "",
					class_type: "0",
					class_1: "",
					class_2: "",
					goods_class: [],
					cid: "",
					selling_way: "0",
					shop_method: "1",
					attrs: null,
					tag: [],
					shipment: "0",
					start_auction_time: "",
					auction_type: "3",
					auction_start_price: "",
					auction_end_price: .01,
					auction_step_time: 1,
					auction_step_price: "",
					stock: [],
					hide_stock: "0",
					total_stock: 0,
					goods_no: "",
					title: "",
					picture: [],
					picture_height: "320",
					price: "",
					origin: "淘价：",
					buy_url: "",
					postage: "",
					delivery_template_id: "0",
					quota: "0",
					province_id: "0",
					province: "",
					city_id: "0",
					city: "",
					messages: [],
					sold_time: "0",
					start_sold_time: "",
					take_down_time: "",
					join_level_discount: "1",
					invoice: "0",
					warranty: "0",
					content: ""
				}
			},
			calculateImage: function() {
				var e = this,
					n = 0;
				t.each(e.get("picture"), function(e) {
					var i = Number(e.width) / 320;
					i = 1 > i ? 1 : i;
					var s = t.isUndefined(e.height) || 0 === Number(e.height) ? 320 : Number(e.height) / i;
					n = s > n ? s : n
				}), n = n > 420 ? 420 : n, 0 === n && (n = 320), e.set("picture_height", n)
			},
			initialize: function() {
				var e = this;
				e.isFx = "10" == e.get("goods_type"), e.priceXhr = e.loadFxPriceLimit(), e.setupPriceRangeResp()
			},
			setupPriceRangeResp: function() {
				var e = this;
				s.setHandler("price_range:get", function(t) {
					var n = e.getPriceRange(t);
					return n && (n.min = Number(n.min), n.max = Number(n.max)), n
				})
			},
			loadFxPriceLimit: function() {
				var e = this,
					t = e.get("origin_goods_id");
				if (!e.isFx || !t) return !1;
				var n = window._global.url.fenxiao + "/supplier/goods/retailpricelimitation.jsonp?goods_id=" + t,
					i = o.ajax({
						url: n,
						type: "GET",
						dataType: "jsonp",
						data: {
							format: 1
						}
					}).done(function(t) {
						e.fxPriceLimit = t
					}).fail(function(e) {
						o.errorNotify(e)
					});
				return i
			},
			getPriceRange: function(e) {
				var t = this,
					n = {
						min: .01,
						max: 9999999
					};
				return t.isFx && e && t.fxPriceLimit && (n = t.fxPriceLimit[e]), n
			},
			validation: {
				auction_type: function(e, t, n) {
					return "1" == n.selling_way && "" === e ? "必须选择一种拍卖类型。" : void 0
				},
				auction_start_price: function(e, t, n) {
					var i = +e;
					if ("1" == n.selling_way) {
						if ("" === e) return "请填写起拍价格。";
						if (isNaN(i) || .01 > i) return "起拍价格最小不能小于 0.01 元。";
						if (i > 9999999) return "起拍价格最大不能超过 9999999 元。"
					}
				},
				auction_end_price: function(e, t, n) {
					var i = +e;
					if ("1" == n.selling_way) {
						if ("" === e) return "请填写结束价格。";
						if (isNaN(i) || .01 > i) return "结束价格最小不能小于 0.01 元。";
						if (i > 9999999) return "结束价格最大不能超过 9999999 元。";
						if (i >= Number(n.auction_start_price)) return "结束价格必须小于起拍价格。"
					}
				},
				auction_step_time: function(e, t, n) {
					var i = +e;
					if ("1" == n.selling_way) {
						if ("" === e) return "请填写降价幅度规则。";
						if (isNaN(i) || 0 >= i) return "请填写大于 0 的值。"
					}
				},
				auction_step_price: function(e, t, n) {
					var i = +e;
					if ("1" == n.selling_way) {
						if ("" === e) return "请填写降价幅度规则";
						if (isNaN(i) || .01 > i) return "降价幅度最小不能小于 0.01 元。";
						if (i > 9999999) return "降价幅度最大不能超过 9999999 元。";
						if (i >= Number(n.auction_start_price)) return "降价幅度必须小于起拍价"
					}
				},
				class_1: function(e, t, n) {
					return "0" == n.class_type && "" === e ? "必须选择一个商品类目。" : void 0
				},
				class_2: function(e, t, n) {
					return "0" == n.class_type && "" === e ? "必须选择一个商品类目。" : void 0
				},
				goods_class: function(e, n, i) {
					return "1" == i.class_type && !e && t.isEmpty(e) ? "必须选择一个商品类目。" : void 0
				},
				title: {
					rangeLength: [1, 100],
					msg: "商品名长度不能少于一个字或者多于100个字"
				},
				picture: function(e) {
					return t.isArray(e) && e.length <= 0 ? "商品图至少有一张。" : t.isArray(e) && e.length > 15 ? "商品图片最多支持 15 张。" : void 0
				},
				postage: function(e) {
					return n.Validation.patterns.number.test(+e) ? void 0 : "邮费必须为数字。"
				},
				price: function(e, i, o) {
					var a = this,
						l = +e,
						c = s.request("price_range:get", "total") || {
							min: .01,
							max: 9999999
						};
					if (c.max = t.isObject(c) && c.max > 9999999 ? 9999999 : c.max, "0" == o.selling_way && t.isEmpty(o.stock)) {
						var l = +e;
						if (!e) return "商品价格不能为空";
						if (!n.Validation.patterns.number.test(l)) return "商品价格必须为数字。";
						if (0 >= l) return "商品价格必须大于0元。";
						if (a.isFx && (l < Number(c.min) || l > Number(c.max))) return "分销商品价格只能设置成" + c.min + "元 ~ " + c.max + "元 区间内"
					}
				},
				buy_url: function(e, t, i) {
					if ("0" == i.shop_method) {
						if (!e) return "购买地址不能为空。";
						if (!n.Validation.patterns.url.test(e)) return "购买地址必须是一个合法网址。"
					}
				},
				total_stock: function(e, t, i) {
					if ("0" != i.shop_method) {
						var s = +e;
						if (!n.Validation.patterns.number.test(+e)) return "总库存必须是数字。";
						if (0 > s) return "总库存不能小于 0。";
						if (s > 999999999) return "总库存最大不能超过 999999999。";
						if ("1" == i.selling_way && 0 >= s) return "降价拍商品总库存必须大于 0。"
					}
				},
				quota: function(e) {
					return n.Validation.patterns.number.test(+e) ? void 0 : "限购数量必须是数字"
				},
				sold_time: function(e, t, n) {
					return 1 === +e && "" === n.start_sold_time ? "请选择一个开售时间" : void 0
				},
				take_down_time: function(e, t, n) {
					var i = +new Date,
						s = +new Date(n.start_sold_time) || 0,
						o = +new Date(e);
					return "" !== e && 6e4 > o - i ? "下架时间必须大于当前时间至少一分钟" : "1" == n.sold_time && "" !== e && 6e4 > o - s ? "下架时间必须大于定时开售时间至少一分钟" : void 0
				},
				messages: function(e, t, n) {
					if ("1" == n.shop_method) {
						var i = e.length;
						if (i > 20) return "留言最多 20 个。";
						for (var s = i - 1; s >= 0; s--) {
							if ("" === $.trim(e[s].name)) return "留言名称不能为空";
							if (e[s].name.length > 5) return "留言名称不能多于5个字。"
						}
					}
				},
				tag: function(e) {
					if (t.isArray(e)) {
						for (var n = e.length - 1; n >= 0; n--) e[n] = +e[n];
						var i = t.difference(e, window._global.defaultTag);
						return i.length > 10 ? "商品标签最多 10 个。" : void 0
					}
				}
			}
		});
	return a
}), define("components/showcase/2.0.0/base/storage", ["require", "underscore"], function(e) {
	var t = e("underscore"),
		n = window.JSON,
		i = window.localStorage,
		s = function(e, t) {
			var n = t.id;
			this.name = "mp-" + window._global.kdt_id + "-adm-" + window._global.user_id + "-", this.name += n ? e + "-" + n : e
		};
	return t.extend(s.prototype, {
		set: function(e, t) {
			if (i) {
				t = n.stringify(t);
				try {
					i.setItem(e, t)
				} catch (s) {
					"QuotaExceededError" === s.name && (i.clear(), i.setItem(e, t))
				}
			}
		},
		get: function(e) {
			return i ? n.parse(i.getItem(e)) : void 0
		},
		remove: function(e) {
			i && i.removeItem(e)
		},
		setItem: function(e) {
			this.set(this.name, e)
		},
		getItem: function() {
			return this.get(this.name)
		},
		removeItem: function() {
			this.remove(this.name)
		}
	}), s
}), define("components/showcase/2.0.0/base/collections/base", ["require", "backbone", "core/utils", "models/config", "jquery", "underscore", "components/showcase/2.0.0/base/storage"], function(e) {
	var t = e("backbone"),
		n = e("core/utils"),
		i = e("models/config"),
		s = e("jquery"),
		o = e("underscore"),
		a = e("components/showcase/2.0.0/base/storage");
	return t.Collection.extend({
		url: "",
		storageName: "",
		model: function(e, t) {
			if (!window.SHOWCASE_CONFIG.models) return new i(e, t);
			if (!(e.type in window.SHOWCASE_CONFIG.models)) {
				if ("config" === e.type) return new i(e, t);
				throw "type error"
			}
			return window.SHOWCASE_CONFIG.models[e.type].initialize(e, t)
		},
		initialize: function(e, t) {
			this.options = t || {}, o.isUndefined(this.options.id) || (this.id = this.options.id), this.storage = new a(this.storageName, t), this.changed = !1, this.listenTo(this, "add remove sort reset", this._changed), this.listenTo(this, "sync", this._unchanged)
		},
		_changed: function() {
			this.changed = !0
		},
		_unchanged: function() {
			this.changed = !1
		},
		validate: function() {
			return this.some(function(e) {
				var t = e.checkValid();
				return t && e.trigger("valid:error"), t
			})
		},
		parse: function(e) {
			var t = o.reject(e, function(e) {
				return window.SHOWCASE_CONFIG.models ? o.isArray(e) || o.isEmpty(e) || !(e.type in window.SHOWCASE_CONFIG.models) && "config" !== e.type : o.isArray(e) || o.isEmpty(e)
			});
			return o.isEmpty(t) && !this.noConfig && (t.push(o.clone(o.result(i.prototype, "defaults"))), o.isFunction(this.parseEmptyData)) ? this.parseEmptyData(t) : o.isFunction(this.onParse) ? this.onParse(t) : t
		},
		localSync: function() {
			return this.length ? void(this.hasChanged() && this.storage.setItem(this.toJSON())) : void this.clearLocalData()
		},
		localFetch: function() {
			return this.storage.getItem()
		},
		clearLocalData: function() {
			this.storage.removeItem()
		},
		fetch: function(e) {
			var t = this.url + "?id=" + this.id;
			return n.ajax(t, e).done(o.bind(this._fetchDone, this)).fail(o.bind(this.error, this))
		},
		_fetchDone: function(e) {
			e = this.parseResponseData(e), this.set(e.data, {
				parse: !0,
				silent: !0
			}), this.trigger("sync")
		},
		sync: function(e) {
			if (e = e || {}, this.validate()) return s(".form-actions .btn").button("reset"), s.Deferred();
			this.beforeSync();
			var t = e.id || this.id,
				i = e.url || this.url,
				a = e.method || (t ? "PUT" : "POST"),
				l = o.extend({
					data: JSON.stringify(this),
					is_display: 0
				}, o.pick(this, "is_display", "alias", "title", "id", "num", "start_sold_item", "valid", "out_id"), e),
				c = {
					url: i,
					type: a,
					data: this.parseRequestData(l)
				};
			return n.ajax(c).done(o.bind(this._syncDone, this)).fail(o.bind(this.error, this))
		},
		parseResponseData: function(e) {
			o.extend(this, o.pick(e, "is_display", "alias", "title", "id", "num", "start_sold_item", "valid", "out_id"));
			var t = e.is_default;
			return t && e.data.length > 0 && "config" == e.data[0].type && (e.data[0].is_default = t), e
		},
		parseRequestData: function(e) {
			return this.handleData(e)
		},
		handleData: function(e) {
			return e
		},
		beforeSync: function() {
			var e = this.at(0);
			"config" === e.get("type") && (this.includeFullscreenModel() ? e.set("has_fullscreen_component", "1") : e.unset("has_fullscreen_component"))
		},
		_syncDone: function(e) {
			o.isUndefined(this.id) && (this.id = e.id), this.clearLocalData()
		},
		error: function(e) {
			n.errorNotify(e)
		},
		hasChanged: function() {
			return this.changed ? !0 : this.any(function(e) {
				return e.hasChanged()
			})
		},
		includeConfigModel: function() {
			var e = this.first();
			return !!e && "config" === e.attributes.type
		},
		includeFullscreenModel: function() {
			return this.any(function(e) {
				return !!e.get("is_fullscreen_component")
			})
		}
	})
}), define("collections/field", ["require", "components/showcase/2.0.0/base/collections/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/collections/base"),
		n = t.extend({
			url: window._global.url.www + "/showcase/goods/item.json",
			storageName: "feature"
		});
	return n
}), define("models/class_info", ["require", "underscore", "backbone"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = n.Model.extend({
			defaults: {
				class_type: "0",
				class_1: "",
				class_2: "",
				goods_class: [],
				cid: "",
				selling_way: "0",
				shop_method: "1"
			},
			initialize: function() {
				var e = this,
					n = e.get("cid"),
					i = e.get("goods_class");
				if (!i) return !1;
				var s = t(i).last();
				!n && s && e.set("cid", s.cid, {
					silent: !0
				})
			},
			validation: {
				selling_way: function(e, t, n) {
					return "0" == n.class_type && "" === e ? "必须选择一种出售方式。" : void 0
				},
				class_1: function(e, t, n) {
					return "0" == n.class_type && "" === e ? "必须选择一个商品品类。" : void 0
				},
				class_2: function(e, t, n) {
					return "0" == n.class_type && "" === e ? "必须选择一个商品品类。" : void 0
				},
				goods_class: function(e, n, i) {
					return "1" == i.class_type && t.isEmpty(e) ? "必须选择一个综合类目。" : void 0
				}
			}
		});
	return i
}), function(e) {
	"function" == typeof define && define.amd ? define("backbone.modelbinder", ["underscore", "jquery", "backbone"], e) : e(_, jQuery, Backbone)
}(function(e, t, n) {
	if (!n) throw "Please include Backbone.js before Backbone.ModelBinder.js";
	return n.ModelBinder = function() {
		e.bindAll.apply(e, [this].concat(e.functions(this)))
	}, n.ModelBinder.SetOptions = function(e) {
		n.ModelBinder.options = e
	}, n.ModelBinder.VERSION = "1.0.5", n.ModelBinder.Constants = {}, n.ModelBinder.Constants.ModelToView = "ModelToView", n.ModelBinder.Constants.ViewToModel = "ViewToModel", e.extend(n.ModelBinder.prototype, {
		bind: function(e, n, i, s) {
			this.unbind(), this._model = e, this._rootEl = n, this._setOptions(s), this._model || this._throwException("model must be specified"), this._rootEl || this._throwException("rootEl must be specified"), i ? (this._attributeBindings = t.extend(!0, {}, i), this._initializeAttributeBindings(), this._initializeElBindings()) : this._initializeDefaultBindings(), this._bindModelToView(), this._bindViewToModel()
		},
		bindCustomTriggers: function(e, t, n, i, s) {
			this._triggers = n, this.bind(e, t, i, s)
		},
		unbind: function() {
			this._unbindModelToView(), this._unbindViewToModel(), this._attributeBindings && (delete this._attributeBindings, this._attributeBindings = void 0)
		},
		_setOptions: function(t) {
			this._options = e.extend({
				boundAttribute: "name"
			}, n.ModelBinder.options, t), this._options.modelSetOptions || (this._options.modelSetOptions = {}), this._options.modelSetOptions.changeSource = "ModelBinder", this._options.changeTriggers || (this._options.changeTriggers = {
				"": "change",
				"[contenteditable]": "blur"
			}), this._options.initialCopyDirection || (this._options.initialCopyDirection = n.ModelBinder.Constants.ModelToView)
		},
		_initializeAttributeBindings: function() {
			var t, n, i, s, o;
			for (t in this._attributeBindings) {
				for (n = this._attributeBindings[t], e.isString(n) ? i = {
					elementBindings: [{
						selector: n
					}]
				} : e.isArray(n) ? i = {
					elementBindings: n
				} : e.isObject(n) ? i = {
					elementBindings: [n]
				} : this._throwException("Unsupported type passed to Model Binder " + i), s = 0; s < i.elementBindings.length; s++) o = i.elementBindings[s], o.attributeBinding = i;
				i.attributeName = t, this._attributeBindings[t] = i
			}
		},
		_initializeDefaultBindings: function() {
			var e, n, i, s, o;
			for (this._attributeBindings = {}, n = t("[" + this._options.boundAttribute + "]", this._rootEl), e = 0; e < n.length; e++) i = n[e], s = t(i).attr(this._options.boundAttribute), this._attributeBindings[s] ? this._attributeBindings[s].elementBindings.push({
				attributeBinding: this._attributeBindings[s],
				boundEls: [i]
			}) : (o = {
				attributeName: s
			}, o.elementBindings = [{
				attributeBinding: o,
				boundEls: [i]
			}], this._attributeBindings[s] = o)
		},
		_initializeElBindings: function() {
			var e, n, i, s, o, a, l;
			for (e in this._attributeBindings) for (n = this._attributeBindings[e], i = 0; i < n.elementBindings.length; i++) if (s = n.elementBindings[i], o = "" === s.selector ? t(this._rootEl) : t(s.selector, this._rootEl), 0 === o.length) this._throwException("Bad binding found. No elements returned for binding selector " + s.selector);
			else for (s.boundEls = [], a = 0; a < o.length; a++) l = o[a], s.boundEls.push(l)
		},
		_bindModelToView: function() {
			this._model.on("change", this._onModelChange, this), this._options.initialCopyDirection === n.ModelBinder.Constants.ModelToView && this.copyModelAttributesToView()
		},
		copyModelAttributesToView: function(t) {
			var n, i;
			for (n in this._attributeBindings)(void 0 === t || -1 !== e.indexOf(t, n)) && (i = this._attributeBindings[n], this._copyModelToView(i))
		},
		copyViewValuesToModel: function() {
			var e, n, i, s, o, a;
			for (e in this._attributeBindings) for (n = this._attributeBindings[e], i = 0; i < n.elementBindings.length; i++) if (s = n.elementBindings[i], this._isBindingUserEditable(s)) if (this._isBindingRadioGroup(s)) a = this._getRadioButtonGroupCheckedEl(s), a && this._copyViewToModel(s, a);
			else for (o = 0; o < s.boundEls.length; o++) a = t(s.boundEls[o]), this._isElUserEditable(a) && this._copyViewToModel(s, a)
		},
		_unbindModelToView: function() {
			this._model && (this._model.off("change", this._onModelChange), this._model = void 0)
		},
		_bindViewToModel: function() {
			e.each(this._options.changeTriggers, function(e, n) {
				t(this._rootEl).delegate(n, e, this._onElChanged)
			}, this), this._options.initialCopyDirection === n.ModelBinder.Constants.ViewToModel && this.copyViewValuesToModel()
		},
		_unbindViewToModel: function() {
			this._options && this._options.changeTriggers && e.each(this._options.changeTriggers, function(e, n) {
				t(this._rootEl).undelegate(n, e, this._onElChanged)
			}, this)
		},
		_onElChanged: function(e) {
			var n, i, s, o;
			for (n = t(e.target)[0], i = this._getElBindings(n), s = 0; s < i.length; s++) o = i[s], this._isBindingUserEditable(o) && this._copyViewToModel(o, n)
		},
		_isBindingUserEditable: function(e) {
			return void 0 === e.elAttribute || "text" === e.elAttribute || "html" === e.elAttribute
		},
		_isElUserEditable: function(e) {
			var t = e.attr("contenteditable");
			return t || e.is("input") || e.is("select") || e.is("textarea")
		},
		_isBindingRadioGroup: function(e) {
			var n, i, s = e.boundEls.length > 0;
			for (n = 0; n < e.boundEls.length; n++) if (i = t(e.boundEls[n]), "radio" !== i.attr("type")) {
				s = !1;
				break
			}
			return s
		},
		_getRadioButtonGroupCheckedEl: function(e) {
			var n, i;
			for (n = 0; n < e.boundEls.length; n++) if (i = t(e.boundEls[n]), "radio" === i.attr("type") && i.attr("checked")) return i;
			return void 0
		},
		_getElBindings: function(e) {
			var t, n, i, s, o, a, l = [];
			for (t in this._attributeBindings) for (n = this._attributeBindings[t], i = 0; i < n.elementBindings.length; i++) for (s = n.elementBindings[i], o = 0; o < s.boundEls.length; o++) a = s.boundEls[o], a === e && l.push(s);
			return l
		},
		_onModelChange: function() {
			var e, t;
			for (e in this._model.changedAttributes()) t = this._attributeBindings[e], t && this._copyModelToView(t)
		},
		_copyModelToView: function(e) {
			var i, s, o, a, l, c;
			for (l = this._model.get(e.attributeName), i = 0; i < e.elementBindings.length; i++) for (s = e.elementBindings[i], o = 0; o < s.boundEls.length; o++) a = s.boundEls[o], a._isSetting || (c = this._getConvertedValue(n.ModelBinder.Constants.ModelToView, s, l), this._setEl(t(a), s, c))
		},
		_setEl: function(e, t, n) {
			t.elAttribute ? this._setElAttribute(e, t, n) : this._setElValue(e, n)
		},
		_setElAttribute: function(t, i, s) {
			switch (i.elAttribute) {
			case "html":
				t.html(s);
				break;
			case "text":
				t.text(s);
				break;
			case "enabled":
				t.prop("disabled", !s);
				break;
			case "displayed":
				t[s ? "show" : "hide"]();
				break;
			case "hidden":
				t[s ? "hide" : "show"]();
				break;
			case "css":
				t.css(i.cssAttribute, s);
				break;
			case "class":
				var o = this._model.previous(i.attributeBinding.attributeName),
					a = this._model.get(i.attributeBinding.attributeName);
				e.isUndefined(o) && e.isUndefined(a) || (o = this._getConvertedValue(n.ModelBinder.Constants.ModelToView, i, o), t.removeClass(o)), s && t.addClass(s);
				break;
			default:
				t.attr(i.elAttribute, s)
			}
		},
		_setElValue: function(e, t) {
			if (e.attr("type")) switch (e.attr("type")) {
			case "radio":
				e.prop("checked", e.val() === t);
				break;
			case "checkbox":
				e.prop("checked", !! t);
				break;
			case "file":
				break;
			default:
				e.val(t)
			} else e.is("input") || e.is("select") || e.is("textarea") ? e.val(t || (0 === t ? "0" : "")) : e.text(t || (0 === t ? "0" : ""))
		},
		_copyViewToModel: function(e, i) {
			var s, o, a;
			i._isSetting || (i._isSetting = !0, s = this._setModel(e, t(i)), i._isSetting = !1, s && e.converter && (o = this._model.get(e.attributeBinding.attributeName), a = this._getConvertedValue(n.ModelBinder.Constants.ModelToView, e, o), this._setEl(t(i), e, a)))
		},
		_getElValue: function(e, t) {
			switch (t.attr("type")) {
			case "checkbox":
				return t.prop("checked") ? !0 : !1;
			default:
				return void 0 !== t.attr("contenteditable") ? t.html() : t.val()
			}
		},
		_setModel: function(e, t) {
			var i = {},
				s = this._getElValue(e, t);
			return s = this._getConvertedValue(n.ModelBinder.Constants.ViewToModel, e, s), i[e.attributeBinding.attributeName] = s, this._model.set(i, this._options.modelSetOptions)
		},
		_getConvertedValue: function(e, t, n) {
			return t.converter ? n = t.converter(e, n, t.attributeBinding.attributeName, this._model, t.boundEls) : this._options.converter && (n = this._options.converter(e, n, t.attributeBinding.attributeName, this._model, t.boundEls)), n
		},
		_throwException: function(e) {
			if (!this._options.suppressThrows) throw e;
			console && console.error
		}
	}), n.ModelBinder.CollectionConverter = function(t) {
		if (this._collection = t, !this._collection) throw "Collection must be defined";
		e.bindAll(this, "convert")
	}, e.extend(n.ModelBinder.CollectionConverter.prototype, {
		convert: function(e, t) {
			return e === n.ModelBinder.Constants.ModelToView ? t ? t.id : void 0 : this._collection.get(t)
		}
	}), n.ModelBinder.createDefaultBindings = function(e, n, i, s) {
		var o, a, l, c, r = {};
		for (o = t("[" + n + "]", e), a = 0; a < o.length; a++) if (l = o[a], c = t(l).attr(n), !r[c]) {
			var d = {
				selector: "[" + n + '="' + c + '"]'
			};
			r[c] = d, i && (r[c].converter = i), s && (r[c].elAttribute = s)
		}
		return r
	}, n.ModelBinder.combineBindings = function(t, n) {
		return e.each(n, function(e, n) {
			var i = {
				selector: e.selector
			};
			e.converter && (i.converter = e.converter), e.elAttribute && (i.elAttribute = e.elAttribute), t[n] = t[n] ? [t[n], i] : i
		}), t
	}, n.ModelBinder
}), define("text!templates/class_info.html", [], function() {
	return '<% if(class_type == \'0\') { %>\n<div class="class-block">\n    <div class="js-class-block control-group">\n        <strong class="control-label" style="width: auto; padding-left: 16px;">商品品类：</strong>\n        <input type="hidden" name="class_type" value="0" />\n        <div class="js-blur-class controls <% if (class_type != \'0\') { %>hide<% } %>">\n            <input type="hidden" class="input-medium js-class-1" name="class_1" value="<%= class_1 %>">\n            <input type="hidden" class="input-medium js-class-2" name="class_2" value="<%= class_2 %>">\n        </div>\n    </div>\n    <% if(!(goods_type == \'10\' || goods_platform == \'10\')) { %>\n    <div class="js-class-block js-blur-class control-group <% if (class_type != \'0\' || shop_method == \'0\') { %>hide<% } %>" style="margin-bottom: 0px;">\n        <strong class="control-label" style="width: auto; padding-left: 16px;">出售方式：</strong>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="selling_way" value="0" <% if (selling_way == \'0\') { %>checked<% } %>>一口价\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="selling_way" value="1" <% if (selling_way == \'1\') { %>checked<% } %>>拍卖\n            </label>\n        </div>\n    </div>\n    <% } %>\n</div>\n<% } else if(class_type == \'1\') { %>\n<div class="class-block">\n    <div class="js-class-block control-group">\n        <label class="<% if (class_type == \'1\') { %>js-blur-label<% } %> radio inline">\n            <input <% if (class_type == \'1\') { %>disabled<% } %> type="radio" name="class_type" value="0" <% if (class_type == \'0\') { %>checked<% } %>><strong>使用模糊类目</strong>\n            <p>适合实体商户、非常规商品。商品只上架到有赞微店铺，如有同步其它店铺（如拍拍店铺）的需求，请使用综合类目。</p>\n        </label>\n        <div class="js-blur-class controls <% if (class_type != \'0\') { %>hide<% } %>">\n            <input type="hidden" class="input-medium js-class-1" name="class_1" value="<%= class_1 %>">\n            <input type="hidden" class="input-medium js-class-2" name="class_2" value="<%= class_2 %>">\n        </div>\n    </div>\n    <% if(_global.show_selling_way && !(goods_type == \'10\' || goods_platform == \'10\')) { %>\n    <div class="js-class-block js-blur-class control-group <% if (class_type != \'0\' || shop_method == \'0\') { %>hide<% } %>" style="margin-bottom: 0px;">\n        <strong class="control-label" style="width: auto; padding-left: 16px;">出售方式：</strong>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="selling_way" value="0" <% if (selling_way == \'0\') { %>checked<% } %>>一口价\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="selling_way" value="1" <% if (selling_way == \'1\') { %>checked<% } %>>拍卖\n            </label>\n        </div>\n    </div>\n    <% } %>\n</div>\n<div class="js-class-block control-group class-block">\n    <label class="<% if (class_type == \'0\' && shop_method == \'0\') { %>js-composite-label<% } %> radio inline">\n        <input <% if (class_type == \'0\' && shop_method == \'0\') { %>disabled<% } %> type="radio" name="class_type" value="1" <% if (class_type == \'1\') { %>checked<% } %>><strong>使用综合类目(推荐)</strong>\n        <p>如果您想同步商品到您的其它店铺（如拍拍店铺），请使用综合类目。<em>已经是综合类目商品，不能切换为模糊类目。</em></p>\n    </label>\n    <div id="recent-class-region" class="js-recent-used-class recent-used-class <% if (class_type != \'1\') { %>hide<% } %>">\n        <div class="dropdown hover dropdown-right">\n            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">\n                选择最近使用的类目\n                <i class="caret"></i>\n            </a>\n            <ul class="js-recent-list dropdown-menu">\n            </ul>\n        </div>\n    </div>\n    <div class="js-composite-class controls <% if (class_type != \'1\') { %>hide<% } %>">\n        <div id="class-group-region1" class="class-group"></div>\n        <div id="class-group-region2" class="class-group"></div>\n        <div id="class-group-region3" class="class-group"></div>\n        <div id="class-group-region4" class="class-group"></div>\n        <div class="class-path-name"><span>你当前选择的类目是：</span><span class="js-path-name">未选择</span></div>\n        <input type="hidden" name="goods_class" />\n    </div>\n</div>\n<% } %>\n'
}), define("models/class_item", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			idAttribute: "cid",
			defaults: {
				cid: "",
				name: "",
				parent_id: "",
				has_child: "0",
				pinyin: "",
				active: 0
			},
			initialize: function() {},
			toggleActive: function(e) {
				var t = this;
				t.set("active", e)
			}
		});
	return n
}), define("collections/class_list", ["require", "underscore", "backbone", "core/utils", "models/class_item"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = e("core/utils"),
		i = e("models/class_item"),
		s = t.Collection.extend({
			url: function() {},
			model: i,
			initialize: function() {},
			inactiveOther: function() {
				var e = this,
					t = e.findCurrentActive();
				return t ? void t.toggleActive(0) : !1
			},
			findCurrentActive: function() {
				var e = this,
					t = e.findWhere({
						active: 1
					});
				return t
			},
			parse: function(e) {
				return 0 === e.code ? e.data : (n.errorNotify(e.msg), !1)
			},
			findNotMatched: function(e) {
				var t = this;
				e = e.toLowerCase();
				var n = t.filter(function(t) {
					var n = t.get("name").toLowerCase(),
						i = t.get("pinyin").toLowerCase(),
						s = -1 === n.indexOf(e) && -1 === i.indexOf(e);
					return s
				});
				return n
			}
		});
	return s
}), define("text!templates/class_item.html", [], function() {
	return '<a title="<%-name %>" href="javascript:;" data-class-id="<%=cid %>">\n    <%=name %>\n    <% if(has_child === \'1\') { %><span>&gt;</span><% } %>\n</a>\n'
}), define("views/class_item", ["require", "underscore", "backbone", "marionette", "core/event", "text!templates/class_item.html"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = (e("core/event"), e("text!templates/class_item.html")),
		s = n.ItemView.extend({
			tagName: "li",
			className: "",
			template: t.template(i),
			events: {
				click: "onClicked"
			},
			modelEvents: {
				change: "render",
				"view:hide": "hideSelf"
			},
			initialize: function() {},
			onRender: function() {
				var e = this;
				e.toggleActive()
			},
			toggleActive: function() {
				var e = this,
					t = !! e.model.get("active");
				e.$el.toggleClass("active", t)
			},
			onShow: function() {},
			onClicked: function(e) {
				var t = this;
				e.preventDefault();
				var n = t.model;
				if (n.get("active")) return !1;
				var i = (n.get("cid"), n.collection);
				i.inactiveOther(), t.model.toggleActive(1), i.trigger("class_item:choosed", t.model)
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return s
}), define("text!templates/class_group.html", [], function() {
	return '<div class="class-search">\n    <input type="text" class="js-txt-search txt-search" placeholder="请输入类目名称" />\n    <button type="button" class="btn">搜</button>\n</div>\n<ul class="js-class-item-container"></ul>\n'
}), define("views/class_group", ["require", "underscore", "backbone", "marionette", "core/event", "core/utils", "views/class_item", "text!templates/class_group.html"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = e("core/event"),
		s = (e("core/utils"), e("views/class_item")),
		o = e("text!templates/class_group.html"),
		a = n.CompositeView.extend({
			tagName: "div",
			className: "class-group-inner",
			template: t.template(o),
			itemView: s,
			itemViewContainer: ".js-class-item-container",
			ui: {
				container: ".js-class-item-container",
				searchTxt: ".js-txt-search"
			},
			events: {
				"input @ui.searchTxt": "onSearchTxtInput"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.groupId = e.groupId, t.initDataUrl(), t.listenTo(t.collection, "data:refresh", t.refreshData), t.listenTo(t.collection, "data:empty", t.emptyData), t.listenTo(t.collection, "class_item:choosed", t.onClassItemChoosed)
			},
			onRender: function() {},
			onShow: function() {
				var e = this;
				e.toggleShow()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initDataUrl: function() {
				var e = this,
					t = window._global.url.www,
					n = t + "/showcase/paipai/category.json";
				e.dataUrl = n
			},
			refreshData: function(e, t) {
				var n = this;
				n.emptyItemContainer();
				var i = {
					parent_id: e || "0",
					cid: t || "0"
				};
				n.fetchData(i)
			},
			emptyItemContainer: function() {
				var e = this;
				e.ui.container.empty()
			},
			fetchData: function(e) {
				var t = this;
				t.abortOldFetch(), t.xhr = t.collection.fetch({
					url: t.dataUrl,
					data: e,
					cache: !0,
					reset: !0,
					success: function() {
						t.toggleShow()
					},
					error: function() {}
				})
			},
			abortOldFetch: function() {
				var e = this,
					t = e.xhr;
				t && t.readyState > 0 && t.readyState < 4 && t.abort()
			},
			emptyData: function() {
				var e = this;
				e.collection.reset([]), e.hideSelf()
			},
			onClassItemChoosed: function(e) {
				var t = this,
					n = e.toJSON();
				i.trigger("class_group:update", t.groupId, n)
			},
			onSearchTxtInput: function() {
				var e = this,
					t = e.ui.searchTxt.val();
				t = $.trim(t), e.localSearch(t)
			},
			localSearch: function(e) {
				var t = this;
				t.showAllItems(), t.hideNotMatchedItems(e)
			},
			showAllItems: function() {
				var e = this;
				e.children.each(function(e) {
					e.showSelf()
				})
			},
			hideNotMatchedItems: function(e) {
				var n = this,
					i = n.collection.findNotMatched(e);
				t(i).each(function(e) {
					var t = n.children.findByModel(e);
					t.hideSelf()
				})
			},
			toggleShow: function() {
				var e = this,
					t = e.collection.size();
				t > 0 ? e.showSelf() : e.hideSelf()
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return a
}), define("core/cache", ["require", "underscore"], function(e) {
	var t = (e("underscore"), {
		data: {},
		get: function(e) {
			var t = this,
				n = t.data[e];
			return n
		},
		set: function(e, t) {
			var n = this;
			n.data[e] = t
		},
		"delete": function(e) {
			var t = this,
				n = t.get(e);
			return n ? (delete t.data[e], n) : "CACHE_NOT_FOUND"
		},
		list: function() {},
		gc: function() {}
	});
	return window.CA ? window.CA : (window.CA = t, t)
}), define("text!templates/recent_class_item.html", [], function() {
	return '<a title="<%-text %>" href="javascript:;">\n    <%=text %>\n</a>\n'
}), define("views/recent_class_item", ["require", "underscore", "backbone", "marionette", "core/event", "text!templates/recent_class_item.html"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = e("core/event"),
		s = e("text!templates/recent_class_item.html"),
		o = n.ItemView.extend({
			tagName: "li",
			className: "",
			template: t.template(s),
			events: {
				click: "onClicked"
			},
			modelEvents: {},
			initialize: function() {},
			onRender: function() {},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var n = t(e.class_data).pluck("name"),
					i = n.join(">>");
				return e.text = i, e
			},
			onShow: function() {},
			onClicked: function(e) {
				var t = this;
				e.preventDefault();
				var n = t.model.get("class_data");
				i.trigger("recent_class:choosed", n)
			}
		});
	return o
}), define("text!templates/recent_class.html", [], function() {
	return '<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">\n    选择最近使用的类目\n    <i class="caret"></i>\n</a>\n<ul class="js-recent-list dropdown-menu">\n</ul>\n'
}), define("models/recent_class_item", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			idAttribute: "cid",
			defaults: {
				class_data: []
			},
			initialize: function() {}
		});
	return n
}), define("collections/recent_class_list", ["require", "underscore", "backbone", "core/utils", "models/recent_class_item"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = e("core/utils"),
		i = e("models/recent_class_item"),
		s = t.Collection.extend({
			url: function() {
				var e = window._global.url.www;
				return e + "/showcase/paipai/recentUsedCategory.json"
			},
			model: i,
			initialize: function() {},
			parse: function(e) {
				return 0 === e.code ? e.data : (n.errorNotify(e.msg), !1)
			}
		});
	return s
}), define("views/recent_class", ["require", "underscore", "backbone", "marionette", "core/cache", "core/event", "core/utils", "views/recent_class_item", "text!templates/recent_class.html", "collections/recent_class_list"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = e("core/cache"),
		s = (e("core/event"), e("core/utils"), e("views/recent_class_item")),
		o = e("text!templates/recent_class.html"),
		a = e("collections/recent_class_list"),
		l = n.CompositeView.extend({
			tagName: "div",
			className: "dropdown hover dropdown-right",
			template: t.template(o),
			itemView: s,
			itemViewContainer: ".js-recent-list",
			collectionEvents: {
				reset: "toggleShow"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.initDataList()
			},
			onRender: function() {},
			onShow: function() {
				var e = this;
				e.toggleShow()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initDataList: function() {
				var e = this,
					n = i.set("recent_class") || [];
				e.collection = new a(n), t.isEmpty(n) && e.fetchData()
			},
			fetchData: function() {
				var e = this;
				e.collection.fetch({
					cache: !1,
					reset: !0,
					success: function(t) {
						e.cacheRecentClass()
					},
					error: function() {}
				})
			},
			cacheRecentClass: function() {
				var e = this,
					t = e.collection.toJSON();
				i.set("recent_class", t)
			},
			toggleShow: function() {
				var e = this,
					t = e.collection.size();
				t > 0 ? e.showSelf() : e.hideSelf()
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return l
}), define("views/class_info", ["require", "underscore", "backbone", "marionette", "components/validation/validate", "core/reqres", "core/event", "core/utils", "commons/utils", "select2", "backbone.modelbinder", "text!templates/class_info.html", "collections/class_list", "views/class_group", "views/recent_class"], function(e) {
	{
		var t = e("underscore"),
			n = e("backbone"),
			i = e("marionette"),
			s = (e("components/validation/validate"), e("core/reqres"), e("core/event")),
			o = e("core/utils");
		e("commons/utils")
	}
	e("select2"), e("backbone.modelbinder");
	var a = e("text!templates/class_info.html"),
		l = e("collections/class_list"),
		c = e("views/class_group"),
		r = e("views/recent_class"),
		d = i.Layout.extend({
			tagName: "div",
			className: "",
			template: t.template(a),
			ui: {
				classBlock: ".js-class-block",
				classSelect1: ".js-class-1",
				classSelect2: ".js-class-2",
				classTypeRadio: 'input[name="class_type"]',
				blurLabel: ".js-blur-label",
				blurClass: ".js-blur-class",
				compositeLabel: ".js-composite-label",
				compositeClass: ".js-composite-class",
				recentUsedClass: ".js-recent-used-class",
				pathName: ".js-path-name"
			},
			events: {
				"click @ui.blurLabel": "onBlurLabelClick",
				"click @ui.compositeLabel": "onCompositeLabelClick",
				"change @ui.classTypeRadio": "onClassTypeRadioChange"
			},
			regions: {
				classGroupRegion1: "#class-group-region1",
				classGroupRegion2: "#class-group-region2",
				classGroupRegion3: "#class-group-region3",
				classGroupRegion4: "#class-group-region4",
				recentClassRegion: "#recent-class-region"
			},
			maxGroups: 4,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.goodsClass = [], t.classNames = [], n.Validation.bind(t), t._modelBinder = new n.ModelBinder, t.listenTo(t.model, "change:class_type", t.onClassTypeChanged), t.listenTo(t.model, "change:class_1", t.updateClass2), t.listenTo(s, "class_group:update", t.updateClassGroups), t.listenTo(s, "recent_class:choosed", t.showChoosedRecentClass)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {},
			onShow: function() {
				var e = this;
				e.initClassSelect(), e.initClassGroups(), e.showCurrentGoodsClass(), e.initRecentClass(), e.initDataBindings(), e.setupValidation()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			setupValidation: function() {
				var e = this;
				n.Validation.bind(e), e.listenTo(e.model, "change", e.validateModel)
			},
			initClassSelect: function() {
				var e = this,
					t = e.model.get("class_type");
				"0" == t && (e.initClass1(), e.initClass2())
			},
			getClass1: function() {
				var e = window._global.defaultClass,
					n = [];
				return t.each(e, function(e) {
					var t = {};
					t.id = e.id, t.text = e.name, n.push(t)
				}), n
			},
			getClass2: function(e) {
				if (!e) return [];
				var n = window._global.defaultClass,
					i = t.where(n, {
						id: e
					})[0],
					s = [];
				return t.each(i.list, function(e) {
					var t = {};
					t.id = e.id, t.text = e.name, s.push(t)
				}), s
			},
			initClass1: function() {
				var e = this,
					t = e.ui.classSelect1,
					n = e.model.get("class_1") || void 0;
				t.select("destroy"), t.off("select2-selecting").select2({
					placeholder: "一级类目",
					data: e.getClass1()
				}).on("select2-selecting", function(t) {
					e.model.set("class_1", t.val), e.ui.classSelect2.select2("open")
				}).select2("val", n)
			},
			initClass2: function() {
				var e = this,
					t = e.ui.classSelect2,
					n = e.model.get("class_2") || void 0;
				t.select2("destroy"), t.off("select2-selecting").select2({
					placeholder: "二级类目",
					data: e.getClass2(e.model.get("class_1"))
				}).on("select2-selecting", function(t) {
					e.model.set("class_2", t.val)
				}).select2("val", n)
			},
			updateClass2: function(e) {
				var t = this;
				e.set("class_2", ""), t.initClass2()
			},
			initClassGroups: function() {
				for (var e = this, t = 1; t <= e.maxGroups; t++) {
					var n = new l([]),
						i = new c({
							groupId: t,
							collection: n
						});
					e["classList" + t] = n, e["classGroupView" + t] = i, e["classGroupRegion" + t].show(i)
				}
			},
			showCurrentGoodsClass: function() {
				var e = this,
					n = e.model.get("goods_class") || [];
				t.isEmpty(n) ? e.initFirstGroup() : e.showGoodsClass(n)
			},
			initRecentClass: function() {
				var e = this,
					t = new r;
				e.recentClassRegion.show(t)
			},
			initFirstGroup: function() {
				var e = this;
				e.tiggerListEvent(1, "refresh")
			},
			updateClassGroups: function(e, t) {
				var n = this,
					i = "0";
				t && (i = t.cid);
				var s = t.has_child;
				n.tiggerClassEvent(e, i, s), "0" == s ? (n.updateCid(t.cid), n.updateClassData()) : (n.updateCid(""), n.resetClassData()), n.updateClassPath(), n.updateClassModel()
			},
			tiggerClassEvent: function(e, t, n) {
				var i = this;
				if (e >= i.maxGroups) return !1;
				var s = e + 1;
				for ("1" == n && i.tiggerListEvent(s, "refresh", t); s <= i.maxGroups;) i.tiggerListEvent(s, "empty"), s += 1
			},
			showChoosedRecentClass: function(e) {
				var t = this;
				t.showGoodsClass(e), t.reverseUpdateData(e)
			},
			showGoodsClass: function(e) {
				for (var t, n, i = this, s = 0, o = 0, a = e.length; a > o;) n = e[o], s = n.parent_id, t = n.cid, o += 1, i.tiggerListEvent(o, "refresh", s, t);
				for (; o < i.maxGroups;) o += 1, i.tiggerListEvent(o, "empty")
			},
			reverseUpdateData: function(e) {
				var n = this;
				n.resetClassData(), n.goodsClass = e, n.classNames = t(e).pluck("name");
				var i = t(e).last();
				i && n.updateCid(i.cid), n.updateClassPath(), n.updateClassModel()
			},
			tiggerListEvent: function(e, t, n, i) {
				var s = this,
					o = s["classList" + e];
				return o ? void o.trigger("data:" + t, n, i) : !1
			},
			updateClassPath: function() {
				var e = this,
					t = e.classNames.join(">>") || "未选择";
				e.ui.pathName.html(t)
			},
			updateClassData: function() {
				var e = this;
				e.resetClassData();
				for (var t, n, i = "", s = 1; s <= e.maxGroups; s++) t = e["classList" + s], 0 !== t.size() && (n = t.findCurrentActive(), n && (e.goodsClass.push({
					cid: n.get("cid"),
					name: n.get("name"),
					parent_id: n.get("parent_id"),
					has_child: n.get("has_child")
				}), i = n.get("name"), e.classNames.push(i)))
			},
			resetClassData: function() {
				var e = this;
				e.goodsClass = [], e.classNames = []
			},
			updateCid: function(e) {
				var t = this;
				t.model.set("cid", e, {
					silent: !0
				})
			},
			updateClassModel: function() {
				var e = this;
				e.model.set({
					goods_class: e.goodsClass
				})
			},
			onBlurLabelClick: function(e) {
				e.preventDefault(), o.errorNotify("综合类目商品，不能切换为模糊类目。")
			},
			onCompositeLabelClick: function(e) {
				e.preventDefault(), o.errorNotify("使用模糊类目的外部购买商品，不能切换为综合类目。")
			},
			onClassTypeRadioChange: function(e) {
				var t = this,
					n = $(e.target),
					i = n.val();
				t.model.set({
					class_type: i
				})
			},
			onClassTypeChanged: function(e, t) {
				var n = this;
				n.toggleClassShow(t), n.resetSellingWay(), n.resetValidate()
			},
			resetSellingWay: function() {
				var e = this;
				e.model.set("selling_way", "0")
			},
			toggleClassShow: function(e) {
				var t = this;
				"0" == e ? (t.ui.blurClass.removeClass("hide"), t.ui.compositeClass.addClass("hide"), t.ui.recentUsedClass.addClass("hide")) : (t.closeSelect2(), t.ui.blurClass.addClass("hide"), t.ui.compositeClass.removeClass("hide"), t.ui.recentUsedClass.removeClass("hide"))
			},
			closeSelect2: function() {
				var e = this;
				e.ui.classSelect1.select2("close"), e.ui.classSelect2.select2("close")
			},
			initDataBindings: function() {
				var e = this,
					t = e.model.get("goods_type"),
					n = e.model.get("goods_platform");
				if (!_global.show_selling_way || "10" == t || "10" == n) return !1;
				var i = {
					selling_way: '[name="selling_way"]'
				};
				e._modelBinder.bind(e.model, e.el, i)
			},
			resetValidate: function() {
				var e = this;
				e.ui.classBlock.removeClass("error")
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return d
}), define("text!templates/step1.html", [], function() {
	return '<div id="class-info-region" class="goods-info-group"></div>\n<div class="app-actions">\n    <div class="form-actions text-center">\n        <button data-next-step="2" class="btn btn-primary js-switch-step">下一步</button>\n    </div>\n</div>\n'
}), define("views/step1", ["require", "underscore", "backbone", "marionette", "vendor/nprogress", "core/reqres", "core/event", "core/utils", "commons/utils", "models/class_info", "views/class_info", "text!templates/step1.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = (e("vendor/nprogress"), e("core/reqres")),
		o = (e("core/event"), e("core/utils"), e("commons/utils"), e("models/class_info")),
		a = e("views/class_info"),
		l = e("text!templates/step1.html"),
		c = i.Layout.extend({
			tagName: "form",
			className: "form-horizontal fm-goods-info",
			template: t.template(l),
			regions: {
				classInfoRegion: "#class-info-region"
			},
			initialize: function() {
				var e = this;
				e.setAttrsResp()
			},
			onRender: function() {
				var e = this;
				e.$el.attr("novalidate", !0)
			},
			onShow: function() {
				var e = this;
				e.initModules()
			},
			initModules: function() {
				var e = this;
				e.initClassInfo(), e.setupValidation(), e.setupClassInfoResp(), e.setupHasChangedResp(), e.setupValidationResp()
			},
			setupValidation: function() {
				var e = this;
				n.Validation.bind(e), e.listenTo(e.model, "change", e.validateModel)
			},
			setAttrsResp: function() {
				var e = this,
					t = e.model;
				s.setHandler("class_attr:get", function(e) {
					var n = t.get(e);
					return n
				})
			},
			setupValidationResp: function() {
				var e = this;
				s.setHandler("step1:validate", function() {
					var t = e.classInfoModel.validate();
					return t
				})
			},
			setupClassInfoResp: function() {
				var e = this;
				s.setHandler("class_info:get", function(t) {
					var n;
					return t ? n = e.classInfoModel.get(t) : (n = e.classInfoModel.toJSON(), e.pureData(n)), n
				})
			},
			setupHasChangedResp: function() {
				var e = this;
				s.setHandler("class_info:has_changed", function() {
					var t = e.classInfoModel.hasChanged();
					return t
				})
			},
			pureData: function(e) {
				"0" == e.class_type ? e.goods_class = [] : (e.class_1 = "", e.class_2 = "")
			},
			validateModel: function(e) {
				e.validate(e.changed)
			},
			initClassInfo: function() {
				var e = this,
					n = e.model.toJSON(),
					i = t(n).pick("class_type", "class_1", "class_2", "goods_class", "cid", "shop_method", "selling_way", "goods_type", "goods_platform");
				e.classInfoModel = new o(i);
				var s = e.classInfoView = new a({
					model: e.classInfoModel
				});
				e.classInfoRegion.show(s)
			}
		});
	return c
}), define("components/help_notes/com", ["require", "jquery", "components/pop/pop"], function(e) {
	var t = e("jquery"),
		n = e("components/pop/pop"),
		i = null,
		s = 1,
		o = 1,
		a = 200,
		l = "",
		c = 2,
		r = ".js-intro-popover",
		d = ".js-intro-popover .popover-inner",
		p = function(e) {
			var s = "js-intro-popover popover popover-help-notes " + l;
			2 !== c && (s = "js-intro-popover popover popover-intro " + l), o = 0, i && clearTimeout(i), i = setTimeout(function() {
				t(r).remove(), n.initialize({
					type: "help_notes",
					target: t(e.target),
					className: s
				})
			}, a)
		},
		u = function() {
			i && clearTimeout(i), i = setTimeout(function() {
				o && s && t(r).hide()
			}, a)
		};
	t("body").on("mouseover", ".js-help-notes, .js-help-notes-btn-copy", function(e) {
		var n = t(this);
		l = n.data("class") || "bottom", c = n.data("ui-version") || 2, p(e)
	}).on("mouseout", ".js-help-notes, #global-zeroclipboard-html-bridge", function() {
		o = 1, u()
	}), t("body").on("mouseover", d, function() {
		s = 0
	}).on("mouseout", d, function() {
		s = 1, u()
	})
}), define("models/attr_item", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			idAttribute: "pid",
			defaults: {
				cid: "",
				pid: "",
				name: "",
				value: "",
				is_sale: "0",
				is_necessary: "0",
				type: "UT_RADIO",
				order_flag: "",
				option: []
			},
			actionText: {
				UT_CHECKBOX: "选择",
				UT_RADIO: "选择",
				UT_TEXT: "填写"
			},
			initialize: function() {},
			validation: {
				value: function(e, t, n) {
					return "1" == n.is_necessary && "" === e ? "请" + this.actionText[n.type] + n.name : void 0
				}
			}
		});
	return n
}), define("collections/attr_list", ["require", "underscore", "backbone", "core/utils", "models/attr_item"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = (e("core/utils"), e("models/attr_item")),
		i = t.Collection.extend({
			model: n
		});
	return i
}), define("text!templates/attr_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label" for="attr-item-<%=pid %>"><% if(is_necessary == \'1\') { %><em class="required">*</em><% } %><%-name %></label>\n    <div class="controls">\n        <input name="value" id="attr-item-<%=pid %>" class="js-attr-input input-medium" type="text" value="<%=value %>" />\n        <% if(name == \'品牌\') { %>\n        <span class="block-help">\n            <a href="javascript:void(0);" class="js-help-notes circle-help">?</a>\n            <div class="js-notes-cont hide">\n                <p>如无贵公司品牌，请选择“其他”。该品牌库随拍拍网同步更新，无法单独新增。</p>\n            </div>\n        </span>\n        <% } %>\n    </div>\n</div>\n'
}), define("views/attr_item", ["require", "underscore", "backbone", "marionette", "components/validation/validate", "core/event", "commons/utils", "backbone.modelbinder", "text!templates/attr_item.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = (e("components/validation/validate"), e("core/event"), e("commons/utils"));
	e("backbone.modelbinder");
	var o = e("text!templates/attr_item.html"),
		a = i.ItemView.extend({
			tagName: "li",
			className: "",
			template: t.template(o),
			ui: {
				attrInput: ".js-attr-input"
			},
			events: {},
			_modelBinder: void 0,
			initialize: function() {
				var e = this;
				e._modelBinder = new n.ModelBinder, e.listenTo(e.model, "change", s.showLog)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {},
			onShow: function() {
				var e = this,
					t = e.model.get("type");
				"UT_TEXT" === t ? e.initDataBindings() : e.initSelect2(t), e.setupValidation()
			},
			initSelect2: function(e) {
				var t = this,
					n = t.model.get("value") || void 0,
					i = "UT_CHECKBOX" === e;
				t.ui.attrInput.select2({
					placeholder: "请选择",
					data: t.getSelect2Data(),
					multiple: i,
					allowClear: !0
				}).on("select2-close", function() {
					var e = t.ui.attrInput.select2("val");
					t.model.set("value", e)
				}).on("select2-clearing", function() {
					t.model.set("value", "")
				}).select2("val", n)
			},
			getSelect2Data: function() {
				var e = this,
					n = e.model.get("option"),
					i = [];
				return t.each(n, function(e) {
					var t = {};
					t.id = e.option_id, t.text = e.option_value, i.push(t)
				}), i
			},
			initDataBindings: function() {
				var e = this,
					t = {
						value: ".js-attr-input"
					};
				e._modelBinder.bind(e.model, e.el, t)
			},
			setupValidation: function() {
				var e = this;
				n.Validation.bind(e), e.listenTo(e.model, "change:value", e.validateModel)
			},
			validateModel: function(e) {
				e.validate(e.changed)
			}
		});
	return a
}), define("views/attr_empty", ["require", "underscore", "marionette"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = n.ItemView.extend({
			tagName: "li",
			className: "",
			template: t.template("无")
		});
	return i
}), define("text!templates/attrs_edit.html", [], function() {
	return '<ul class="attributes-list">\n</ul>\n'
}), define("views/attrs_edit", ["require", "underscore", "backbone", "marionette", "components/validation/validate", "core/reqres", "core/event", "core/utils", "commons/utils", "views/attr_item", "views/attr_empty", "text!templates/attrs_edit.html"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = (e("components/validation/validate"), e("core/reqres")),
		s = (e("core/event"), e("core/utils"), e("commons/utils"), e("views/attr_item")),
		o = e("views/attr_empty"),
		a = e("text!templates/attrs_edit.html"),
		l = n.CollectionView.extend({
			tagName: "ul",
			className: "attributes-list",
			template: t.template(a),
			itemView: s,
			emptyView: o,
			ui: {},
			events: {},
			collectionEvents: {
				change: "reverseUpdate"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.parentModel = e.parentModel, t.setupValidateResp()
			},
			onRender: function() {},
			onShow: function() {},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			setupValidateResp: function() {
				var e = this;
				e.errorLen = 0, i.setHandler("attrs:validate", function() {
					return e.validateAttrs(), e.errorLen
				})
			},
			validateAttrs: function() {
				var e = this;
				e.errorLen = 0, e.collection.each(function(t) {
					var n = t.validate();
					n && (e.errorLen += 1)
				})
			},
			reverseUpdate: function() {
				var e = this,
					t = e.collection.toJSON();
				e.cleanAttrsOption(t), e.parentModel.set({
					attrs: t
				}, {
					silent: !0
				})
			},
			cleanAttrsOption: function(e) {
				for (var t = 0, n = e.length; n > t; t++) delete e[t].option
			}
		});
	return l
}), define("text!templates/base_info.html", [], function() {
	return '<div class="info-group-title vbox">\n    <div class="group-inner">基本信息</div>\n</div>\n<div class="info-group-cont vbox">\n    <div class="group-inner">\n        <div class="control-group">\n            <label class="control-label">商品类目：</label>\n            <div class="controls">\n                <div class="js-goods-class static-value">\n                    <% if(goods_class) { %>\n                        <%-goods_class %>\n                    <% } else { %>\n                        无 <a style="margin-left: 20px;" data-next-step="1" class="js-switch-step" href="javascript:;">去选择商品品类</a>\n                    <% } %>\n                </div>\n                <input type="hidden" class="input-medium" name="class_2" value="<%= class_2 %>">\n                <input type="hidden" class="input-medium" name="goods_class" value="<%= goods_class %>">\n            </div>\n        </div>\n        <% if(class_type == \'0\' && !(goods_type == \'10\' || goods_platform == \'10\')) { %>\n        <div class="control-group">\n            <label class="control-label">购买方式：</label>\n            <div class="controls">\n                <% if(selling_way == \'0\') { %>\n                <label class="radio inline">\n                    <input type="radio" name="shop_method" value="1" <% if (shop_method == \'1\') { %>checked<% } %>>在有赞购买\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="shop_method" value="0" <% if (shop_method == \'0\') { %>checked<% } %>>链接到外部购买\n                    <span class="js-outbuy-tip <% if (shop_method != \'0\') { %>hide<% } %>">(每家店铺仅支持50个外部购买商品)</span>\n                </label>\n                <% } else { %>\n                <div class="static-value">在有赞购买</div>\n                <% } %>\n            </div>\n        </div>\n        <% } %>\n        <% if(class_type == \'1\') { %>\n        <div class="js-attrs-edit control-group">\n            <label class="control-label">商品属性：</label>\n            <div class="js-attrs-controls controls">\n                <div id="attrs-edit-region" class="attributes">\n                </div>\n            </div>\n        </div>\n        <% } %>\n        <div class="control-group">\n            <label class="control-label">商品分组：</label>\n            <div class="controls">\n                <select class="js-tag chosen-select" name="tag" data-selected-id="<%- tag %>" multiple data-placeholder="选择商品分组">\n                </select>\n                <p class="help-inline">\n                    <a class="js-refresh-tag" href="javascript:;">刷新</a>\n                    <span>|</span>\n                    <a class="new_window" target="_blank" href="/v2/showcase/tag#create">新建分组</a>\n                    <span>|</span>\n                    <a class="new_window" target="_blank" href="http://wap.koudaitong.com/v2/showcase/feature?alias=djbj0hb7">帮助</a>\n                </p>\n                <p class="help-desc js-tag-desc hide">\n                    使用“列表中隐藏”分组，商品将不出现在商品列表中\n                </p>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">商品类型：</label>\n            <div class="controls">\n                <label class="radio inline">\n                    <input type="radio" name="shipment" value="0" <% if (shipment == \'0\') { %>checked<% } %>>实物商品\n                    <span class="gray">（物流发货）</span>\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="shipment" value="1" disabled <% if (shipment == \'1\') { %>checked<% } %>>虚拟商品\n                    <span class="gray">（无需物流）</span>\n                    <a class="new-window" target="_blank" href="http://bbs.youzan.com/forum.php?mod=viewthread&amp;tid=342">申请内测</a>\n                </label>\n            </div>\n        </div>\n    </div>\n</div>\n'
}), define("views/base_info", ["require", "underscore", "backbone", "marionette", "components/validation/validate", "core/event", "commons/utils", "backbone.modelbinder", "chosen", "components/help_notes/com", "collections/attr_list", "views/attrs_edit", "text!templates/base_info.html"], function(e) {
	{
		var t = e("underscore"),
			n = e("backbone"),
			i = e("marionette");
		e("components/validation/validate"), e("core/event"), e("commons/utils")
	}
	e("backbone.modelbinder"), e("chosen"), e("components/help_notes/com");
	var s = e("collections/attr_list"),
		o = e("views/attrs_edit"),
		a = e("text!templates/base_info.html"),
		l = i.Layout.extend({
			tagName: "div",
			className: "goods-info-group-inner",
			template: t.template(a),
			ui: {
				shopMethodRadio: '[name="shop_method"]',
				outbuyTip: ".js-outbuy-tip",
				attrsEdit: ".js-attrs-edit",
				goodsClass: ".js-goods-class",
				tagSelect: ".js-tag",
				tagDesc: ".js-tag-desc"
			},
			regions: {
				attrsEditRegion: "#attrs-edit-region"
			},
			events: {
				"change @ui.shopMethodRadio": "onShopMethodRadioChange"
			},
			_modelBinder: void 0,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.attrsOptions = e.attrsOptions, n.Validation.bind(t), t._modelBinder = new n.ModelBinder, t.listenTo(t.model, "change:shop_method", t.onShopMethodChanged), t.listenTo(t.model, "change:goods_class", t.updateGoodsClass), t.listenTo(t.model, "change:tag", t.onTagChange)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var t = this;
				return e.goods_class = t.generateGoodsClass(e), e
			},
			generateGoodsClass: function(e) {
				var n = this;
				e || (e = n.model.toJSON());
				var i = [],
					s = "";
				return i = "0" == e.class_type ? n.getClassNameArr(e) : t(e.goods_class).pluck("name") || [], s = i.join(">>")
			},
			getClassNameArr: function(e) {
				var n = [];
				if (!e.class_1 || !e.class_2) return n;
				var i = window._global.defaultClass,
					s = t(i).findWhere({
						id: e.class_1
					});
				if (!s) return n;
				n.push(s.name);
				var o = t(s.list).findWhere({
					id: e.class_2
				});
				return o ? (n.push(o.name), n) : n
			},
			onShow: function() {
				var e = this;
				e.initAttrsEdit(), e.initTagChosen(), e.initDataBindings()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			updateGoodsClass: function() {
				var e = this,
					t = e.generateGoodsClass();
				e.ui.goodsClass.html(t)
			},
			initTagChosen: function() {
				var e = this,
					t = e.ui.tagSelect,
					n = t.chosen({
						no_results_text: "木有找到这个分类：",
						width: "200px"
					});
				e.$(".js-refresh-tag").on("click", function(i) {
					var s = e.model.get("tag");
					$.get(window._global.url.www + "/showcase/tag/option", {
						selected: s
					}, function(i) {
						t.html(i), n.trigger("chosen:updated"), e.model.trigger("change:tag")
					}), i.preventDefault()
				}).trigger("click"), t.trigger("chosen:updated")
			},
			initDataBindings: function() {
				var e = this,
					t = {
						tag: {
							selector: '[name="tag"]',
							converter: e.tagConverter
						},
						shipment: '[name="shipment"]'
					};
				e._modelBinder.bind(e.model, e.el, t)
			},
			onShopMethodRadioChange: function(e) {
				var t = this;
				e.preventDefault();
				var n = $(e.target),
					i = n.val();
				t.model.set("shop_method", i)
			},
			initAttrsEdit: function() {
				var e = this,
					t = e.attrsOptions || [];
				e.attrsList = new s(t), e.attrsEditView = new o({
					parentModel: e.model,
					collection: e.attrsList
				}), e.attrsEditRegion.show(e.attrsEditView)
			},
			onTagChange: function() {
				var e = this,
					t = e._findDefaultOption().toString(),
					n = e.model.get("tag") || "";
				n.indexOf(t) >= 0 ? e.ui.tagDesc.removeClass("hide") : e.ui.tagDesc.addClass("hide")
			},
			_findDefaultOption: function() {
				var e = this,
					t = e.ui.tagSelect.find("option");
				if (e._defaultTagId) return e._defaultTagId;
				for (var n = "", i = 0; i < t.length; i++) {
					var s = t[i],
						o = $.trim(s.innerText);
					if ("列表中隐藏" === o) {
						n = s.value;
						break
					}
				}
				return e._defaultTagId = n, n
			},
			tagConverter: function(e, t) {
				return null === t ? [] : t
			},
			onShopMethodChanged: function(e, t) {
				var n = this;
				"0" == t ? n.ui.outbuyTip.removeClass("hide") : n.ui.outbuyTip.addClass("hide")
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return l
}), define("text!templates/auction_info.html", [], function() {
	return '<div class="info-group-title vbox">\n    <div class="group-inner">拍卖规则</div>\n</div>\n<div class="info-group-cont vbox">\n    <div class="group-inner">\n        <div class="control-group">\n            <label class="control-label">拍卖类型：</label>\n            <div class="controls">\n                <label class="radio inline">\n                    <input type="radio" name="auction_type" value="3" <% if (auction_type == \'3\') { %>checked<% } %>>降价拍\n                </label>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">起拍价格：</label>\n            <div class="controls">\n                <div class="input-prepend">\n                    <span class="add-on">￥</span>\n                    <input type="text" maxlength="10" name="auction_start_price" value="<%=auction_start_price %>" class="input-small">\n                </div>\n                <input type="text" class="input-small" placeholder="淘价：" name="origin" value="<%= origin %>">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">结束价格：</label>\n            <div class="controls">\n                <div class="input-prepend">\n                    <span class="add-on">￥</span>\n                    <input type="text" maxlength="10" name="auction_end_price" value="<%=auction_end_price %>" class="input-small">\n                </div>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">开拍时间：</label>\n            <div class="controls">\n                <input name="start_auction_time" readonly class="js-start-auction-time input-medium" type="text" value="<%=start_auction_time %>" />\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">降价幅度：</label>\n            <div class="controls">\n                <span class="static-value">每</span>\n                <input type="text" name="auction_step_time" value="<%=auction_step_time %>" class="input-mini">\n                <span class="static-value">分钟下降</span>\n                <div class="input-prepend">\n                    <span class="add-on">￥</span>\n                    <input type="text" maxlength="10" name="auction_step_price" value="<%=auction_step_price %>" class="input-mini">\n                </div>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">持续时间：</label>\n            <div class="controls">\n                <span class="js-auction-duration static-value"></span>\n                <button type="button" class="js-calc-duration btn">计算持续时间</button>\n                <p class="help-desc">下降到结束价格后还会持续一个时间周期。</p>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">结束时间：</label>\n            <div class="controls">\n                <div class="js-end-auction-time static-value"></div>\n            </div>\n        </div>\n\n    </div>\n</div>\n'
}), define("views/auction_info", ["require", "underscore", "backbone", "marionette", "components/validation/validate", "core/event", "commons/utils", "backbone.modelbinder", "jqueryui", "datetimepicker", "text!templates/auction_info.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = (e("components/validation/validate"), e("core/event"), e("commons/utils"));
	e("backbone.modelbinder"), e("jqueryui"), e("datetimepicker");
	var o = e("text!templates/auction_info.html"),
		a = i.Layout.extend({
			tagName: "div",
			className: "goods-info-group-inner",
			template: t.template(o),
			ui: {
				startAuctionTxt: ".js-start-auction-time",
				endAuctionTime: ".js-end-auction-time",
				auctionDuration: ".js-auction-duration"
			},
			events: {
				"click .js-calc-duration": "onCalcDurationClicked"
			},
			_modelBinder: void 0,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), n.Validation.bind(t), t._modelBinder = new n.ModelBinder
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {
				var e = this;
				e.updateDuration()
			},
			onShow: function() {
				var e = this;
				e.initTimepicker(), e.initDataBindings(), e.initPrice()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initPrice: function() {
				var e = this,
					t = e.model.get("price"),
					n = e.model.get("auction_start_price");
				t && !n && e.model.set("auction_start_price", t)
			},
			initDataBindings: function() {
				var e = this,
					t = {
						auction_type: '[name="auction_type"]',
						auction_start_price: {
							selector: '[name="auction_start_price"]',
							converter: e.priceConverter
						},
						origin: {
							selector: '[name="origin"]',
							converter: e.originConverter
						},
						auction_end_price: {
							selector: '[name="auction_end_price"]',
							converter: e.priceConverter
						},
						auction_step_time: {
							selector: '[name="auction_step_time"]',
							converter: e.stepTimeConverter
						},
						auction_step_price: {
							selector: '[name="auction_step_price"]',
							converter: e.priceConverter
						}
					};
				e._modelBinder.bind(e.model, e.el, t)
			},
			originConverter: function(e, t) {
				return t = s.originValueFix(t)
			},
			stepTimeConverter: function(e, t) {
				return t = Math.floor(t)
			},
			priceConverter: function(e, t) {
				var n = s.decimalFix(t, 2);
				return n
			},
			onCalcDurationClicked: function(e) {
				var t = this;
				e.preventDefault(), t.updateDuration()
			},
			updateDuration: function() {
				var e = this,
					t = e.calcAuctionDuration(),
					n = e.formatDurationToStr(t);
				e.renderAuctionDuration(n);
				var i = e.calcEndAuctionTime(t);
				e.renderEndAuctionTime(i)
			},
			calcAuctionDuration: function(e) {
				var t = this;
				e = e || t.model.toJSON();
				var n = e.auction_type,
					i = Number(e.auction_start_price) || 0,
					s = Number(e.auction_end_price) || .01,
					o = Number(e.auction_step_time) || 0,
					a = Number(e.auction_step_price) || 0,
					l = 0;
				if (!i || !o || !a) return l;
				var c = i - s;
				switch (n) {
				case "1":
					break;
				case "2":
					break;
				case "3":
					l = (Math.ceil(c / a) + 1) * o
				}
				return l = l || 0
			},
			formatDurationToStr: function(e) {
				var t = 1440;
				e = isNaN(e) ? 0 : e.toFixed(0);
				var n = "",
					i = Math.floor(e / t),
					s = Math.floor(e % t / 60),
					o = e % 60;
				return i > 0 ? n = i + "天" + s + "小时" + o + "分钟" : s > 0 ? n = s + "小时" + o + "分钟" : o > 0 && (n = o + "分钟"), n = n ? "约为" + n : ""
			},
			calcEndAuctionTime: function(e) {
				var t = this,
					n = "",
					i = t.model.get("start_auction_time");
				if (!i) return n;
				var s = new Date(i),
					o = new Date(s.getTime() + 6e4 * e);
				return n = "预计 " + o.toLocaleString() + " 结束"
			},
			renderAuctionDuration: function(e) {
				var t = this;
				t.ui.auctionDuration.html(e)
			},
			renderEndAuctionTime: function(e) {
				var t = this;
				t.ui.endAuctionTime.html(e)
			},
			initTimepicker: function() {
				var e = this,
					t = e.ui.startAuctionTxt,
					n = +new Date,
					i = new Date(n + 6e4);
				t.datetimepicker({
					dateFormat: "yy-mm-dd",
					timeFormat: "HH:mm:ss",
					minDate: i,
					showSecond: !0,
					onSelect: function(n) {
						e.model.set({
							start_auction_time: n
						}), t.siblings("input").trigger("click")
					}.bind(e)
				})
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return a
}), define("text!templates/goods_info.html", [], function() {
	return '<div class="info-group-title vbox">\n    <div class="group-inner">商品信息</div>\n</div>\n<div class="info-group-cont vbox">\n    <div class="group-inner">\n        <div class="control-group">\n            <label class="control-label"><em class="required">*</em>商品名：</label>\n            <div class="controls">\n                <input class="input-xxlarge" type="text" name="title" value="<%= title %>" maxlength="100" />\n                <span class="autoread-goods">\n                    <a href="javascript: ;" class="js-autoread-goods">快速导入淘宝商品信息</a>\n                </span>\n            </div>\n        </div>\n        <% if(selling_way == \'0\') { %>\n        <div class="control-group">\n            <label class="control-label"><em class="required">*</em>价格：</label>\n            <div class="controls">\n                <div class="input-prepend">\n                    <span class="add-on">￥</span>\n                    <input type="text" maxlength="10" name="price" value="<%= price %>" class="input-small" />\n                </div>\n                <input type="text" class="input-small" placeholder="淘价：" name="origin" value="<%= origin %>">\n            </div>\n        </div>\n        <% } %>\n        <div class="control-group">\n            <label class="control-label"><em class="required">*</em>商品图：</label>\n            <div class="controls">\n                <input type="hidden" name="picture" />\n                <div class="picture-list">\n                    <ul class="js-picture-list app-image-list clearfix">\n                    <% _.each(picture, function(item, index) { %>\n                        <%= picTemplate({\'item\': item}) %>\n                    <% }); %>\n                    <li>\n                        <a href="javascript:;" class="add-goods js-add-picture">+加图</a>\n                    </li>\n                    </ul>\n                </div>\n                <p class="help-desc">建议尺寸：640 x 640 像素；您可以拖拽图片调整图片顺序。</p>\n            </div>\n        </div>\n        <div class="js-buy-url-group control-group <% if(shop_method != \'0\') { %>hide<% } %>">\n            <label class="control-label"><em class="required">*</em>外部购买地址：</label>\n            <div class="controls">\n                <input type="text" name="buy_url" value="<%= buy_url %>" class="input-xxlarge js-buy-url">\n                <a style="display: none;" href="javascript:;" class="js-help-notes circle-help">?</a>\n            </div>\n        </div>\n    </div>\n</div>\n'
}), define("text!templates/picture.html", [], function() {
	return '<li class="sort">\n    <a href="<%= Utils.fullfillImage(item.url) %>" target="_blank">\n        <img src="<%= Utils.fullfillImage(item.url, \'!100x100.jpg\') %>" />\n    </a>\n    <a class="js-delete-picture close-modal small hide">×</a>\n</li>\n'
}), define("views/goods_info", ["require", "underscore", "backbone", "marionette", "components/pop/pop", "core/event", "core/reqres", "components/validation/validate", "core/utils", "commons/utils", "backbone.modelbinder", "jqueryui", "components/image/2.0.0/app", "text!templates/goods_info.html", "text!templates/picture.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("components/pop/pop"),
		o = e("core/event"),
		a = e("core/reqres"),
		l = (e("components/validation/validate"), e("core/utils")),
		c = e("commons/utils");
	e("backbone.modelbinder"), e("jqueryui");
	var r = e("components/image/2.0.0/app"),
		d = e("text!templates/goods_info.html"),
		p = e("text!templates/picture.html"),
		u = i.Layout.extend({
			tagName: "div",
			className: "goods-info-group-inner",
			template: t.template(d),
			picTemplate: t.template(p),
			ui: {
				autoread: ".js-autoread-goods",
				priceTxt: '[name="price"]',
				originPriceTxt: '[name="origin"]',
				pictureContainer: ".js-picture-list",
				addPicture: ".js-add-picture",
				buyUrlGroup: ".js-buy-url-group",
				buyUrlRequired: ".js-buy-url-required"
			},
			events: {
				"click @ui.autoread": "autoreadGoods",
				"click @ui.addPicture": "addPicture",
				"click .js-delete-picture": "deletePicture",
				'blur [name="origin"]': "onOriginBlur",
				"blur .js-buy-url": "checkUrl"
			},
			_modelBinder: void 0,
			pictureMaxSize: 15,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), n.Validation.bind(t), t._modelBinder = new n.ModelBinder({
					modelSetOptions: {
						validate: !0
					}
				}), t.listenTo(t.model, "change", c.showLog), t.listenTo(t.model, "change:shop_method", t.onShopMethodChanged), t.listenTo(t.model, "picture:reset", t.renderAllPicture), t.listenTo(o, "stock_module:hide", t.hideStockModule), t.listenTo(o, "stock_module:show", t.showStockModule)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var t = this,
					n = Number(e.price).toFixed(2) + "";
				return e.price = n, e.picTemplate = t.picTemplate, e
			},
			onRender: function() {
				var e = this;
				e.bindUIElements()
			},
			onShow: function() {
				var e = this;
				e.initSortable(), e.initDataBindings()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initDataBindings: function() {
				var e = this,
					n = {
						title: '[name="title"]',
						buy_url: {
							selector: '[name="buy_url"]',
							converter: e.buyUrlConverter
						}
					};
				"0" == e.model.get("selling_way") && t(n).extend({
					price: {
						selector: '[name="price"]',
						converter: e.priceConverter
					},
					origin: {
						selector: '[name="origin"]',
						converter: e.originConverter
					}
				}), e._modelBinder.bind(e.model, e.el, n)
			},
			originConverter: function(e, t) {
				return t = c.originValueFix(t)
			},
			priceConverter: function(e, t) {
				var n = c.decimalFix(t, 2);
				return n
			},
			buyUrlConverter: function(e, t) {
				return t = c.buyUrlValueFix(t)
			},
			onOriginBlur: function() {
				var e = this,
					t = e.ui.originPriceTxt,
					n = t.val(),
					i = c.originValueFix(n);
				return n === i ? !1 : void t.val(i)
			},
			checkPictureMaxSize: function(e) {
				var t = this,
					n = e.length < t.pictureMaxSize;
				return n
			},
			addPicture: function() {
				var e = this;
				r.initialize({
					callback: function(n) {
						t.isArray(n) ? t.each(n, function(t) {
							e._addSinglePicture.call(e, t)
						}) : e._addSinglePicture.call(e, n), e.model.calculateImage()
					}
				})
			},
			renderAllPicture: function() {
				var e = this;
				e.ui.pictureContainer.find("li.sort").remove();
				var n = e.model.get("picture");
				t(n).each(function(t) {
					e.renderPicture(t)
				})
			},
			renderPicture: function(e) {
				var t = this;
				t.ui.pictureContainer.find("li:not(.sort)").before(t.picTemplate({
					item: e
				}))
			},
			_addSinglePicture: function(e) {
				var t = this,
					n = t.model.get("picture");
				if (!t.checkPictureMaxSize(n)) return l.errorNotify("商品图片最多支持 " + t.pictureMaxSize + " 张"), !1;
				var i = {
					url: e.attachment_url,
					id: e.attachment_id,
					width: e.width,
					height: e.height
				};
				n.push(i), t.model.set("picture", n), t.renderPicture(i)
			},
			initSortable: function() {
				var e = this;
				e.$(".picture-list").sortable({
					items: ".sort",
					cursor: "move",
					start: function(e, t) {
						t.item.data("startPos", t.item.index())
					},
					stop: function(n, i) {
						var s = i.item.data("startPos"),
							o = i.item.index();
						if (s !== o) {
							var a = [];
							t.each(e.model.get("picture"), function(e, t, n) {
								a.push(s > o ? t === o ? n[s] : t > o && s >= t ? n[t - 1] : e : t === o ? n[s] : o > t && t >= s ? n[t + 1] : e)
							}), e.model.set("picture", a)
						}
					},
					update: function() {}
				})
			},
			deletePicture: function(e) {
				var t = this,
					n = $(e.target),
					i = n.parent("li").index(),
					s = this.model.get("picture");
				s.splice(i, 1), n.parents("li.sort").first().remove(), t.model.calculateImage()
			},
			checkUrl: function(e) {
				var t = $(e.target);
				e.stopPropagation(), e.stopImmediatePropagation();
				var n = $.trim(t.val());
				n = c.buyUrlValueFix(n), t.val(n)
			},
			autoreadGoods: function(e) {
				var t = this,
					n = $(e.target);
				s.initialize({
					type: "link",
					target: n,
					content: "请粘贴 淘宝/天猫 的单品地址",
					callback: function(e) {
						l.successNotify("正在读取商品，请稍等。", void 0, {
							fade: !1
						});
						var n = $.trim(e);
						t.grabGoodsData(n)
					}
				})
			},
			grabGoodsData: function(e) {
				var t = this,
					n = window._global.url.img + "/tao/detail",
					i = {
						url: encodeURI(e),
						mp_id: window._global.kdt_id
					};
				$.ajax({
					url: n,
					type: "GET",
					dataType: "jsonp",
					timeout: 6e4,
					cache: !1,
					data: i,
					success: function(n) {
						"success" == n.status ? (t.updateGoodsModel(e, n), l.clearNotify()) : l.errorNotify("抓取商品信息出错啦:(")
					},
					error: function() {
						l.errorNotify("抓取商品信息出错啦:(")
					},
					complete: function() {}
				})
			},
			updateGoodsModel: function(e, n) {
				var i = this,
					s = {
						title: n.title,
						buy_url: e
					};
				if (0 !== n.price && (s.price = n.price), i.model.set(s), t.isEmpty(n.attachment)) return !1;
				var o = [];
				t.each(n.attachment, function(e) {
					o.push({
						url: e.attachment_url,
						id: e.attachment_id
					})
				}), i.model.set({
					picture: o
				}), i.model.trigger("picture:reset")
			},
			getData: function() {
				var e = this,
					t = e.model.toJSON();
				return t
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			},
			hideStockModule: function() {
				var e = this,
					t = e.model.get("shop_method");
				return "0" == t ? !1 : void e.ui.priceTxt.prop("readonly", !1)
			},
			showStockModule: function() {
				var e = this;
				e.ui.priceTxt.prop("readonly", !0)
			},
			onShopMethodChanged: function(e, t) {
				var n = this;
				"0" == t ? (n.ui.buyUrlGroup.removeClass("hide"), n.ui.buyUrlRequired.removeClass("hide"), n.ui.priceTxt.prop("readonly", !1)) : (n.ui.buyUrlGroup.addClass("hide"), n.ui.buyUrlRequired.addClass("hide"), n.resetPrice())
			},
			resetPrice: function() {
				var e = this,
					t = a.request("stock_module:is_show");
				if (!t) return !1;
				e.ui.priceTxt.prop("readonly", !0);
				var n = a.request("min_price:get");
				e.ui.priceTxt.val(n)
			}
		});
	return u
}), define("models/sku_item", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			idAttribute: "_id",
			defaults: {
				text: "",
				editable: "1",
				list: []
			},
			initialize: function() {}
		});
	return n
}), define("collections/sku_list", ["require", "underscore", "backbone", "models/sku_item"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = e("models/sku_item"),
		i = t.Collection.extend({
			url: function() {},
			model: n,
			checkIsExist: function(e) {
				var t = this,
					n = t.where({
						text: e
					}),
					i = n.length > 0;
				return i
			}
		});
	return i
}), define("models/sku", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			defaults: {
				group_list: null
			},
			initialize: function() {}
		});
	return n
}), define("models/sku_atom", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			idAttribute: "id",
			defaults: {
				text: ""
			},
			initialize: function() {}
		});
	return n
}), define("collections/sku_atom_list", ["require", "underscore", "backbone", "core/utils", "core/reqres", "models/sku_atom"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("core/utils"),
		s = e("core/reqres"),
		o = e("models/sku_atom"),
		a = n.Collection.extend({
			url: function() {},
			model: o,
			initialize: function(e, t) {
				var n = this;
				n.choosable = t.choosable || {}, n.customCount = 0, n.maxCount = t.choosable.count || 0, n.listenTo(n, "add remove reset", n.updateCustomCount)
			},
			updateCustomCount: function() {
				var e = this,
					n = 0,
					i = e.choosable.data || [];
				e.each(function(e) {
					var s = t(i).findWhere({
						option_value: e.get("text")
					});
					s || (n += 1)
				}), e.customCount = n
			},
			checkChooseable: function(e) {
				var t = this;
				return t.checkIsExist(e) ? !1 : t.checkCustomLimit(e) ? !1 : !0
			},
			checkIsExist: function(e) {
				var t = this,
					n = t.get(e.id);
				return n ? (i.errorNotify("已经添加了相同的规格值。"), !0) : !1
			},
			checkCustomLimit: function(e) {
				var n = this,
					o = s.request("goods_attr:get", "class_type");
				if ("0" == o) return !1;
				var a = n.choosable.data || [];
				if (t.isEmpty(a)) return !1;
				var l = t(a).findWhere({
					option_value: e.text
				});
				if (!l) {
					if (0 === n.maxCount) return i.errorNotify("该商品不支持『" + e.text + "』规格，且不支持自定义项。"), !0;
					if (n.customCount === n.maxCount) return i.errorNotify("该规格最多添加个 " + n.maxCount + " 自定义项。"), !0
				}
				return !1
			}
		});
	return a
}), define("text!templates/sku_atom.html", [], function() {
	return '<span data-atom-id="<%=id %>"><%=text %></span>\n<div class="close-modal small js-remove-sku-atom">×</div>\n'
}), define("views/sku_atom", ["require", "underscore", "backbone", "marionette", "core/event", "core/reqres", "commons/utils", "chosen", "text!templates/sku_atom.html"], function(e) {
	{
		var t = e("underscore"),
			n = (e("backbone"), e("marionette")),
			i = (e("core/event"), e("core/reqres"));
		e("commons/utils")
	}
	e("chosen");
	var s = e("text!templates/sku_atom.html"),
		o = n.ItemView.extend({
			tagName: "div",
			className: "sku-atom",
			template: t.template(s),
			ui: {},
			events: {
				"click .js-remove-sku-atom": "removeSkuAtom"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e)
			},
			onClose: function() {},
			onRender: function() {},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var t = i.request("goods_attr:get", "class_type"),
					n = "0" == t;
				return e.editable = n, e
			},
			onShow: function() {},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			removeSkuAtom: function() {
				var e = this;
				event.preventDefault(), event.stopPropagation();
				var t = e.model.collection;
				t.remove(e.model)
			},
			editSkuAtom: function(e) {
				e.preventDefault()
			}
		});
	return o
}), define("text!templates/sku_atom_list.html", [], function() {
	return '<div class="js-sku-atom-list sku-atom-list"></div>\n<a href="javascript:;" class="js-add-sku-atom add-sku">+添加</a>\n'
}), define("views/sku_atom_list", ["require", "underscore", "backbone", "marionette", "core/reqres", "core/event", "components/pop/pop", "core/utils", "commons/utils", "chosen", "views/sku_atom", "text!templates/sku_atom_list.html"], function(e) {
	{
		var t = e("underscore"),
			n = (e("backbone"), e("marionette")),
			i = e("core/reqres"),
			s = (e("core/event"), e("components/pop/pop"));
		e("core/utils"), e("commons/utils")
	}
	e("chosen");
	var o = e("views/sku_atom"),
		a = e("text!templates/sku_atom_list.html"),
		l = n.CompositeView.extend({
			template: t.template(a),
			itemView: o,
			itemViewContainer: ".js-sku-atom-list",
			ui: {
				addSkuAtom: ".js-add-sku-atom"
			},
			events: {
				"click @ui.addSkuAtom": "onAddSkuAtomClick"
			},
			collectionEvents: {
				reset: "render"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.parentModel = e.parentModel
			},
			onClose: function() {},
			onRender: function() {},
			onShow: function() {},
			toggleOpts: function(e) {
				var t = this;
				t.ui.addSkuAtom.toggle(e)
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			onAddSkuAtomClick: function(e) {
				var t = this;
				e.preventDefault();
				var n = $(e.target),
					o = t.parentModel.get("id"),
					a = t.parentModel.get("text"),
					l = i.request("atom_data:get", a);
				t.atomPop = s.initialize({
					type: "chosen",
					target: n,
					data: {
						id: o,
						atomData: l
					},
					callback: function(e) {
						t.onChooseSkuAtom(e)
					}
				})
			},
			onChooseSkuAtom: function(e) {
				var n = this;
				if (t.isEmpty(e)) return !1;
				var i = n.collection;
				t.each(e, function(e) {
					return i.checkChooseable(e) ? void i.add(e) : !1
				})
			}
		});
	return l
}), define("text!templates/sku_color.html", [], function() {
	return '<tr>\n<% _.each(color_groups, function(item, i) { %>\n    <td>\n        <h4 class="c-color-<%=i %>"><%=item.text %></h4>\n        <ul>\n            <% _.each(item.list, function(atom, j) { %>\n            <li>\n                <label class="checkbox inline" for="color_atom_<%=atom.id %>">\n                    <input class="js-color-chk" data-color-id="<%=atom.id %>" data-color-text="<%=atom.color %>" type="checkbox" id="color_atom_<%=atom.id %>">\n                    <%-atom.color %>\n                </label>\n            </li>\n            <% }); %>\n        </ul>\n    </td>\n    <% if((i + 1)%5 === 0) { %>\n    </tr><tr>\n    <% } %>\n<% }); %>\n</tr>\n<!-- <tr>\n    <td colspan="5">\n        <h4>自定义</h4>\n        <div id="custom-color-region"></div>\n    </td>\n</tr> -->\n'
}), define("text!templates/custom_color.html", [], function() {
	return '<td>\n    <h4>自定义</h4>\n    <ul id="custom-color-region" class="js-custom-list">\n    <% _.each(list, function(atom, key) { %>\n        <li>\n            <label class="checkbox inline" for="color_atom_<%=atom.id %>">\n                <input checked data-color-id="<%=atom.id %>" data-color-text="<%=atom.color %>" type="checkbox" id="color_atom_<%=atom.id %>">\n                <%-atom.color %>\n            </label>\n        </li>\n    <% }); %>\n    </ul>\n</td>\n'
}), define("views/sku_color", ["require", "underscore", "backbone", "core/reqres", "core/event", "components/pop/pop", "marionette", "views/sku_atom", "text!templates/sku_color.html", "text!templates/custom_color.html", "collections/sku_atom_list", "views/sku_atom_list"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("core/reqres"), e("core/event"), e("components/pop/pop"), e("marionette")),
		i = e("views/sku_atom"),
		s = e("text!templates/sku_color.html"),
		o = e("text!templates/custom_color.html"),
		a = (e("collections/sku_atom_list"), e("views/sku_atom_list")),
		l = n.Layout.extend({
			tagName: "table",
			className: "table-sku-color",
			template: t.template(s),
			customTemplate: t.template(o),
			itemView: i,
			itemViewContainer: ".js-sku-atom-list",
			ui: {
				customColorList: ".js-custom-list",
				addCustomColor: ".js-add-custom-color",
				customColorContainer: "tr:last-of-type"
			},
			regions: {
				customColorRegion: "#custom-color-region"
			},
			events: {
				"change .js-color-chk": "reverseUpdate",
				"click @ui.addCustomColor": "onAddCustomColorClicked"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.initColorData()
			},
			onShow: function() {
				var e = this;
				e.checkedColor()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initColorData: function() {
				var e = this,
					t = window._global.color || {};
				e.colorGroups = t
			},
			initCustomColorView: function() {
				var e = this;
				e.customListView = new a({
					parentModel: e.model,
					collection: e.collection
				})
			},
			serializeData: function() {
				var e = this,
					t = {};
				return e.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var t = this;
				return e.color_groups = t.colorGroups, e
			},
			onRender: function() {},
			checkedColor: function() {
				var e = this,
					n = e.model.get("list"),
					i = [];
				t(n).each(function(t) {
					var n = 'input[data-color-text="' + t.text + '"]',
						s = e.$el.find(n);
					s.length > 0 ? s.prop("checked", !0) : i.push(t)
				}), e.customAtom = i, e.showCustomColor()
			},
			showCustomColor: function() {
				var e = this,
					n = e.customAtom;
				if (t.isEmpty(n)) return !1;
				var i = e.customTemplate({
					list: n
				});
				e.ui.customColorContainer.append(i)
			},
			reverseUpdate: function(e) {
				var t = this;
				e.preventDefault();
				var n = $(e.target),
					i = n.prop("checked"),
					s = n.data("color-id"),
					o = n.data("color-text"),
					a = t.collection.get(s);
				i ? t.collection.add({
					id: s,
					text: o
				}) : a && t.collection.remove(a)
			}
		});
	return l
}), define("text!templates/sku_item.html", [], function() {
	return '<h3 class="sku-group-title">\n    <% if(editable == \'1\') { %>\n    <input type="hidden" name="sku_name" value="<%=id %>" class="js-sku-name">\n    <a class="js-remove-sku-group remove-sku-group">&times;</a>\n    <% } else { %>\n    <%-text %>\n    <% } %>\n</h3>\n<div class="js-sku-atom-container sku-group-cont"></div>\n'
}), define("views/sku_item", ["require", "underscore", "backbone", "marionette", "core/event", "core/reqres", "core/utils", "commons/utils", "backbone.modelbinder", "select2", "models/sku", "collections/sku_atom_list", "views/sku_atom_list", "views/sku_color", "text!templates/sku_item.html", "text!templates/sku_color.html"], function(e) {
	{
		var t = e("underscore"),
			n = (e("backbone"), e("marionette")),
			i = e("core/event"),
			s = e("core/reqres"),
			o = e("core/utils");
		e("commons/utils")
	}
	e("backbone.modelbinder"), e("select2");
	var a = (e("models/sku"), e("collections/sku_atom_list")),
		l = e("views/sku_atom_list"),
		c = e("views/sku_color"),
		r = e("text!templates/sku_item.html"),
		d = e("text!templates/sku_color.html"),
		p = n.Layout.extend({
			tagName: "div",
			className: "sku-sub-group",
			template: t.template(r),
			colorTemplate: t.template(d),
			ui: {
				skuNameEle: ".js-sku-name",
				skuGroupRemove: ".js-remove-sku-group",
				skuAtomContainer: ".js-sku-atom-container"
			},
			regions: {
				skuAtomRegion: ".js-sku-atom-container"
			},
			events: {
				"click @ui.skuGroupRemove": "removeSkuGroup"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.choosable = {}, t.skuNameList = s.request("sku_name_list:get") || [], t.classType = s.request("goods_attr:get", "class_type")
			},
			onClose: function() {
				var e = this;
				e.skuAtomListView && e.skuAtomListView.close()
			},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				return e.id || (e.id = -1), e
			},
			onRender: function() {},
			onShow: function() {
				var e = this;
				e.initSkuName(), e.initChoosable(), e.initSkuAtomListView()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initSkuName: function() {
				var e = this,
					t = e.model.get("editable");
				return t ? void e.initSkuNameSelect2() : !1
			},
			initSkuNameSelect2: function() {
				var e = this,
					n = s.request("select2_config:get") || {};
				t(n).extend({
					data: e.skuNameList
				}), e.ui.skuNameEle.select2(n).on("select2-opening", function() {
					i.trigger("chosen:hide")
				}).on("select2-selecting", function(t) {
					var n = t.object;
					e.selectSkuName(n, e, t)
				})
			},
			initSkuAtomListView: function() {
				var e = this,
					t = e.model,
					n = t.get("id");
				if (!n || -1 == n) return !1;
				var i = e.model.get("list") || [];
				e.skuAtomList = new a(i, {
					choosable: e.choosable
				}), e.listenTo(e.skuAtomList, "all", e.reverseUpdate); {
					var s = e.classType,
						o = t.get("text");
					t.get("editable")
				}
				"0" != s && "颜色" === o ? e.initColorListView() : e.initOtherListView()
			},
			initColorListView: function() {
				var e = this,
					t = new c({
						model: e.model,
						collection: e.skuAtomList
					});
				e.skuAtomRegion.show(t)
			},
			initOtherListView: function() {
				var e = this;
				e.skuAtomListView = new l({
					parentModel: e.model,
					collection: e.skuAtomList
				}), e.skuAtomRegion.show(e.skuAtomListView)
			},
			reverseUpdate: function() {
				var e = this,
					t = e.skuAtomList.toJSON();
				e.model.set({
					list: t
				}), e.model.collection.trigger("item:list:change")
			},
			selectSkuName: function(e, t, n) {
				var i = this,
					s = i.model.collection;
				return s.checkIsExist(e.text) ? (o.errorNotify("规格名不能相同。"), n.preventDefault(), n.stopPropagation(), !1) : (i.model.set("id", e.id), void(-1 == e.id ? i.createSkuName(e) : i.updateAtomListView(e)))
			},
			createSkuName: function(e) {
				var t = this,
					n = window._global.url.www + "/showcase/WCGoodsSkuTree/skuTree.json",
					i = {
						text: e.text
					};
				$.ajax({
					url: n,
					type: "POST",
					dataType: "json",
					timeout: 8e3,
					cache: !1,
					data: i,
					success: function(e) {
						0 === e.code ? t.onCreateSkuNameSuccess(e.data, i) : o.errorNotify(e.msg || "新增规格类型失败。")
					},
					error: function() {},
					complete: function() {}
				})
			},
			onCreateSkuNameSuccess: function(e, t) {
				var n = this,
					i = {
						id: Number(e),
						text: t.text
					};
				n.model.set(i), n.ui.skuNameEle.select2("data", i), n.ui.skuNameEle.select2("close"), window._global.skuTree.push({
					_id: i.id,
					text: i.text
				}), n.updateAtomListView(t)
			},
			updateAtomListView: function(e) {
				var t = this;
				t.skuAtomListView || t.initSkuAtomListView(), t.updateChoosable(), t.resetAtomListData(e)
			},
			initChoosable: function() {
				var e = this;
				e.updateChoosable()
			},
			getChoosable: function() {
				var e = this,
					n = {},
					i = {},
					o = e.model.get("id"),
					a = s.request("goods_property:get") || [];
				return o && !t.isEmpty(a) && (n = t(a).findWhere({
					class_id: o
				})), i = e.processChoosable(n)
			},
			processChoosable: function(e) {
				var n = {
					data: [],
					count: 0
				};
				return !e || t.isEmpty(e.option) ? n : (t(e.option).each(function(e) {
					-1 === e.option_value.indexOf("自定义") ? n.data.push(e) : n.count += 1
				}), n)
			},
			updateChoosable: function() {
				var e = this;
				e.choosable = e.getChoosable()
			},
			resetAtomListData: function(e) {
				var n = this;
				t(e).extend({
					list: []
				}), n.model.set(e), n.skuAtomList.reset([])
			},
			removeSkuGroup: function(e) {
				var t = this;
				e.preventDefault(), e.stopPropagation();
				var n = t.model.collection;
				n.remove(t.model)
			}
		});
	return p
}), define("views/sku_empty", ["require", "underscore", "backbone", "marionette"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = n.ItemView.extend({
			tagName: "div",
			className: "sku-sub-group",
			template: t.template('<h3 class="sku-group-title">没有商品规格</h3>')
		});
	return i
}), define("text!templates/sku.html", [], function() {
	return '<div class="js-sku-list-container"></div>\n<div class="js-sku-group-opts sku-sub-group">\n    <h3 class="sku-group-title">\n        <button type="button" class="js-add-sku-group btn">添加规格项目</button>\n    </h3>\n</div>\n'
}), define("views/sku", ["require", "underscore", "backbone", "marionette", "core/event", "core/reqres", "core/utils", "commons/utils", "backbone.modelbinder", "chosen", "models/sku_item", "views/sku_item", "views/sku_empty", "text!templates/sku.html"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = e("core/event"),
		s = e("core/reqres"),
		o = (e("core/utils"), e("commons/utils"));
	e("backbone.modelbinder"), e("chosen");
	var a = e("models/sku_item"),
		l = e("views/sku_item"),
		c = (e("views/sku_empty"), e("text!templates/sku.html")),
		r = n.CompositeView.extend({
			tagName: "div",
			className: "sku-group",
			template: t.template(c),
			itemView: l,
			itemViewContainer: ".js-sku-list-container",
			ui: {
				skuGroupOpts: ".js-sku-group-opts",
				skuGroupAdd: ".js-add-sku-group"
			},
			events: {
				"click @ui.skuGroupAdd": "addSkuGroup"
			},
			collectionEvents: {
				"add remove": "checkAndReverseUpdate"
			},
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.goodsModel = e.goodsModel, t.editable = "0" == t.goodsModel.get("class_type"), t.initCustomCount(), t.initSkuName(), t.listenTo(t.collection, "item:list:change", t.reverseUpdate)
			},
			onRender: function() {
				var e = this;
				e.toggleSkuGroupOpts()
			},
			onShow: function() {
				var e = this;
				e.toggleSkuModule()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initCustomCount: function() {
				var e = this,
					n = e.goodsModel.get("class_type");
				e.propertyData = s.request("goods_property:get");
				var i = !! t(e.propertyData).findWhere({
					pid: "42914"
				});
				"0" == n ? (e.maxSize = 3, e.customMaxSize = e.maxSize) : (e.maxSize = t(e.propertyData).where({
					is_sale: "1"
				}).length, e.customMaxSize = i ? 1 : 0)
			},
			initSkuName: function() {
				var e = this;
				e.initSelect2Config(), e.initSkuNameList()
			},
			initSelect2Config: function() {
				var e = {
					multiple: !1,
					placeholder: "请选择...",
					createSearchChoice: function(e, t) {
						return 0 === $(t).filter(function() {
							return 0 === this.text.localeCompare(e)
						}).length ? {
							id: -1,
							text: e
						} : void 0
					},
					maximumInputLength: 4,
					width: 100
				};
				s.setHandler("select2_config:get", function() {
					return e
				})
			},
			initSkuNameList: function() {
				var e = this;
				e.skuNameList = [];
				var n = window._global.skuTree;
				t.each(n, function(t) {
					e.skuNameList.push({
						id: t._id,
						text: t.text || t.name
					})
				}), s.setHandler("sku_name_list:get", function() {
					return e.skuNameList
				})
			},
			addSkuGroup: function() {
				var e = this,
					t = new a;
				e.collection.add(t)
			},
			onAfterItemAdded: function(e) {
				var t = this;
				return t.isEmpty() ? !1 : void e.ui.skuNameEle.select2("open")
			},
			checkMaxSize: function() {
				var e = this,
					t = e.collection.size(),
					n = e.collection.where({
						editable: "1"
					}),
					i = n.length || 0,
					s = i < e.customMaxSize && t < e.maxSize;
				return s
			},
			toggleSkuModule: function() {
				var e = this;
				i.trigger(e.maxSize > 0 ? "sku_module:show" : "sku_module:hide")
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			},
			toggleSkuGroupOpts: function() {
				var e = this,
					t = e.checkMaxSize();
				t ? e.ui.skuGroupOpts.show() : e.ui.skuGroupOpts.hide()
			},
			checkAndReverseUpdate: function() {
				var e = this;
				e.toggleSkuGroupOpts(), e.reverseUpdate()
			},
			reverseUpdate: function() {
				var e = this,
					n = e.goodsModel,
					i = e.collection.toJSON();
				t(i).each(function(e, t) {
					if (!e.text) return !1;
					var i = t + 1,
						s = "sku_name_" + i,
						o = s + "_value",
						a = "undefined" == typeof e.editable ? "1" : e.editable,
						l = {
							id: e.id,
							text: e.text,
							editable: a
						};
					n.set(s, l, {
						silent: !0
					}), n.set(o, e.list, {
						silent: !0
					})
				}), e.removeUnnecessaryKeys(i)
			},
			removeUnnecessaryKeys: function(e) {
				var t = this,
					n = e.length;
				o.removeSkuKeyValue(t.goodsModel, n)
			}
		});
	return r
}), define("text!templates/stock.html", [], function() {
	return ""
}), define("text!templates/thead.html", [], function() {
	return '<thead>\n    <tr>\n        <% _.each(thead, function(item, index) {\n            if(item.list && item.list.length > 0) { %>\n            <th class="text-center"><%=item.text %></th>\n        <% }}); %>\n        <th class="th-price">价格（元）</th>\n        <th class="th-stock">库存</th>\n        <% if(is_fx) { %>\n        <th class="text-center">是否销售</th>\n        <% } else { %>\n        <th class="th-code">商家编码</th>\n        <% } %>\n        <th class="text-right">销量</th>\n    </tr>\n</thead>\n'
}), define("text!templates/tfoot.html", [], function() {
	return '<tfoot>\n    <tr>\n        <td colspan="<%=columns %>">\n            <div class="batch-opts">\n                批量设置：\n                <span class="js-batch-type">\n                    <a class="js-batch-price" href="javascript:;">价格</a>\n                    <% if(!is_fx) { %>\n                    &nbsp;&nbsp;\n                    <a class="js-batch-stock" href="javascript:;">库存</a>\n                    <% } %>\n                </span>\n                <span class="js-batch-form" style="display: none;">\n                    <input type="text" class="js-batch-txt input-mini" placeholder="" />\n                    <a class="js-batch-save" href="javascript:;">保存</a>\n                    <a class="js-batch-cancel" href="javascript:;">取消</a>\n                    <p class="help-desc"></p>\n                </span>\n            </div>\n        </td>\n    </tr>\n</tfoot>\n'
}), define("text!templates/td.html", [], function() {
	return '<td>\n    <input data-stock-id="<%= id %>" type="text" name="sku_price" class="js-price input-mini" value="<%=price %>" maxlength="10" />\n</td>\n<% if(is_fx) { %>\n    <td><%=stock_num %></td>\n    <td class="text-center">\n        <% if(can_sell) { %>\n            <input class="js-is-sell" type="checkbox" name="is_sell" <% if(is_sell == \'1\') { %>checked<% } %> value="1" />\n        <% } else { %>\n            <input disabled class="js-is-sell" type="checkbox" name="is_sell" />\n        <% } %>\n    </td>\n<% } else { %>\n    <td><input type="text" name="stock_num" class="js-stock-num input-mini" value="<%=stock_num %>" maxlength="9" /></td>\n    <td><input type="text" name="code" class="js-code input-small" value="<%=code %>" /></td>\n<% } %>\n<td class="text-right"><%=sold_num || 0 %></td>\n'
}), define("views/stock", ["require", "underscore", "backbone", "marionette", "core/event", "core/reqres", "commons/utils", "core/utils", "backbone.modelbinder", "text!templates/stock.html", "text!templates/thead.html", "text!templates/tfoot.html", "text!templates/td.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("core/event"),
		o = e("core/reqres"),
		a = (e("commons/utils"), e("core/utils"));
	e("backbone.modelbinder");
	var l = e("text!templates/stock.html"),
		c = e("text!templates/thead.html"),
		r = e("text!templates/tfoot.html"),
		d = e("text!templates/td.html"),
		p = i.Layout.extend({
			tagName: "table",
			className: "table-sku-stock",
			template: t.template(l),
			theadTemplate: t.template(c),
			tfootTemplate: t.template(r),
			tdTemplate: t.template(d),
			ui: {
				batchPrice: ".js-batch-price",
				batchStock: ".js-batch-stock",
				batchType: ".js-batch-type",
				batchForm: ".js-batch-form",
				batchTxt: ".js-batch-txt",
				batchSave: ".js-batch-save",
				batchCancel: ".js-batch-cancel"
			},
			events: {
				"blur .js-price": "onAtomPriceBlur",
				"input .js-price": "onAtomPriceInput",
				"change .js-is-sell": "onAtomIsSellChange",
				"blur .js-stock-num": "onAtomStockBlur",
				"input .js-stock-num": "onAtomStockInput",
				"input .js-code": "reverseUpdateStock",
				"click @ui.batchPrice": "onBatchPriceClick",
				"click @ui.batchStock": "onBatchStockClick",
				"click @ui.batchSave": "onBatchSaveClick",
				"click @ui.batchCancel": "onBatchCancelClick"
			},
			initialize: function(e) {
				var t = this;
				t.skuList = e.skuList, t.setConfig(e), t.isFx = "10" == t.model.get("goods_type"), t.stockBackup = t.model.get("stock"), t._modelBinder = new n.ModelBinder, t.setupStockResp(), t.setupPriceResp(), t.setupValidateResp(), t.listenTo(t.skuList, "add", t.rebuildStockData), t.listenTo(t.skuList, "remove", t.rebuildStockData), t.listenTo(t.skuList, "change", t.updateStockData)
			},
			onRender: function() {
				var e = this;
				e.showStockView()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			setupValidateResp: function() {
				var e = this;
				e.errorLen = 0, o.setHandler("stock:validate", function() {
					var t = e.model.get("shop_method");
					return "0" == t ? e.resetValidate() : e.validateStockData(), e.errorLen
				})
			},
			setupStockResp: function() {
				var e = this;
				e.isStockModulShow = !1, o.setHandler("stock_module:is_show", function() {
					return e.isStockModulShow
				})
			},
			setupPriceResp: function() {
				var e = this;
				e.minPrice = .01, o.setHandler("min_price:get", function() {
					return e.minPrice
				})
			},
			rebuildStockData: function() {
				var e = this,
					t = e.generateStockData();
				e.stockBackup = t, e.model.set({
					stock: t
				}, {
					silent: !0
				}), e.showStockView()
			},
			updateStockData: function() {
				var e = this,
					t = e.generateStockData();
				t = e.recoverBackup(t), e.model.set({
					stock: t
				}, {
					silent: !0
				}), e.showStockView()
			},
			generateStockData: function() {
				var e = this,
					n = [],
					i = e.skuList.toJSON();
				return t(i).each(function(i, s) {
					n = t.isEmpty(n) ? e.initSkuData(i, s) : e.appendSkuInfo(n, i, s)
				}), n
			},
			recoverBackup: function(e) {
				{
					var n = this;
					n.stockBackup
				}
				return t(e).each(function(t, i) {
					var s = n.findStockInBackup(t);
					s && (s.id && (e[i].id = s.id), e[i].stock_num = s.stock_num, e[i].price = s.price, e[i].code = s.code, e[i].sold_num = s.sold_num, e[i].is_sell = s.is_sell)
				}), e
			},
			findStockInBackup: function(e) {
				for (var t, n = this, i = n.getFilterKeys(e), s = 0, o = n.stockBackup.length; o > s; s++) {
					var a = n.stockBackup[s],
						l = n.getFilterKeys(a);
					if (i === l) {
						t = a;
						break
					}
				}
				return t
			},
			getFilterKeys: function(e) {
				e = e || {};
				for (var t = {}, n = 1; 5 >= n; n++) {
					var i = "v" + n + "_id";
					t[i] = e[i]
				}
				var s = JSON.stringify(t);
				return s
			},
			updateStockBackup: function(e) {
				var t = this;
				t.stockBackup = e
			},
			initSkuData: function(e, n) {
				var i = [],
					s = {};
				return t(e.list).each(function(t) {
					var o = {
						id: 0,
						price: "",
						stock_num: "",
						sold_num: "",
						code: "",
						is_sell: 0
					},
						a = n + 1;
					o["k" + a + "_id"] = e.id, o["k" + a] = e.text, o["v" + a + "_id"] = t.id, o["v" + a] = t.text;
					var l = "v" + a + "_id";
					s[l] = t.id, i.push(o)
				}), i
			},
			appendSkuInfo: function(e, n, i) {
				if (t.isEmpty(n.list)) return e;
				var s = [],
					o = {};
				return t(e).each(function(e) {
					t(n.list).each(function(a) {
						var l = {};
						t(e).each(function(e, t) {
							l[t] = e
						});
						var c = i + 1;
						l["k" + c + "_id"] = n.id, l["k" + c] = n.text, l["v" + c + "_id"] = a.id, l["v" + c] = a.text;
						var r = "v" + c + "_id";
						o[r] = a.id, s.push(l)
					})
				}), s
			},
			showStockView: function() {
				var e = this,
					n = e.skuList;
				return 0 === n.size() ? (e.isStockModulShow = !1, s.trigger("stock_module:hide"), !1) : (e.skuData = e.generateSkuData(), t(e.skuData).isEmpty() ? (e.isStockModulShow = !1, s.trigger("stock_module:hide"), !1) : (e.renderTable(), void e.bindUIElements()))
			},
			renderTable: function() {
				var e = this,
					t = "";
				t += e.renderHeader(), t += e.renderBody(), t += e.renderFooter(), e.$el.html(t), s.trigger("stock_module:show"), e.isStockModulShow = !0
			},
			renderHeader: function() {
				var e = this,
					t = {
						thead: e.skuList.toJSON(),
						is_fx: e.isFx
					},
					n = e.theadTemplate(t);
				return n
			},
			renderBody: function() {
				var e = this,
					n = e.skuData;
				if (t.isEmpty(n)) return !1;
				e.combine = e.calcCombine(n);
				var i = e.generateRows();
				return i
			},
			renderFooter: function() {
				var e = this,
					t = e.skuList.size();
				t = e.isFx ? t + 5 : t + 4;
				var n = e.tfootTemplate({
					columns: t,
					is_fx: e.isFx
				});
				return n
			},
			generateRows: function() {
				var e = this;
				return e.TableHtml = "<tbody>", e.outputTrTag = !1, e.trIndex = 0, e.printRow(0, e.outputTrTag), e.TableHtml += "</tbody>", e.TableHtml
			},
			generateSkuData: function() {
				var e = this,
					t = [];
				return e.skuList.each(function(e) {
					var n = e.get("list");
					n && n.length > 0 && t.push(n)
				}), t
			},
			calcCombine: function(e) {
				for (var t = [], n = e.length, i = 0; n > i; i++) {
					t[i] = 1;
					for (var s = i + 1; n > s; s++) t[i] = t[i] * e[s].length
				}
				return t
			},
			printRow: function(e, t) {
				var n = this,
					i = n.skuData,
					s = i.length;
				if (e === s) return !1; {
					var a = i[e];
					n.skuList.toJSON()
				}
				a.forEach(function(i) {
					t || (n.TableHtml += "<tr>", t = !0);
					var a = '<td data-atom-id="' + i.id + '" rowspan="' + n.combine[e] + '">' + i.text + "</td>";
					if (n.TableHtml += a, e === s - 1) {
						var l = n.getAtomStockData(n.trIndex),
							c = o.request("price_range:get", l.id);
						l.can_sell = !! c, l.is_fx = n.isFx, n.TableHtml += n.tdTemplate(l) + "</tr>", n.trIndex += 1, t = !1
					}
					var r = e + 1;
					n.printRow(r, t)
				})
			},
			getAtomStockData: function(e) {
				var t = this,
					n = t.model.get("stock"),
					i = n[e];
				return i = i || {
					id: 0,
					price: "",
					stock_num: "",
					sold_num: 0,
					code: "",
					is_sell: 0
				}
			},
			reverseUpdateStock: function(e) {
				var t = this,
					n = $(e.target),
					i = n.attr("name");
				i = "sku_price" === i ? "price" : i;
				var s = n.attr("type"),
					o = "checkbox" == s ? +n.is(":checked") : $.trim(n.val()),
					a = t.$("tr"),
					l = a.index(n.parents("tr")) - 1,
					c = t.model.get("stock");
				c[l] || (c = t.generateStockData(t.skuList)), c[l][i] = o, t.updateStockBackup(c), t.model.set({
					stock: c
				}, {
					silent: !0
				})
			},
			onAtomPriceBlur: function(e) {
				var t = this,
					n = $(e.target),
					i = Number(n.val());
				n.val(i.toFixed(2, 10)), t.validAtomInput(n, "price")
			},
			onAtomStockBlur: function(e) {
				{
					var t = this,
						n = $(e.target);
					Number(n.val())
				}
				t.validAtomInput(n, "stock")
			},
			validAtomInput: function(e, t) {
				var n, i = this,
					s = e.val(),
					o = e.parents("td"),
					a = o.find(".error-message");
				n = "price" === t ? i.validatePrice(s, e) : i.validateStockNumber(s), n ? (0 === a.length ? (a = $('<div class="error-message"></div>'), o.append(a.html(n))) : a.html(n), o.addClass("manual-valid-error"), i.errorLen += 1) : (a.remove(), o.removeClass("manual-valid-error", function() {
					i.errorLen -= 1
				}))
			},
			validAllPrice: function() {
				var e = this;
				e.$(".js-price").each(function(t, n) {
					var i = $(n);
					e.validAtomInput(i, "price")
				})
			},
			validAllStock: function() {
				var e = this;
				e.$(".js-stock-num").each(function(t, n) {
					var i = $(n);
					e.validAtomInput(i, "stock")
				})
			},
			validatePrice: function(e, t) {
				if (!e) return "价格不能为空";
				var n = Number(e);
				if (isNaN(n)) return "请输入一个数字";
				var i = {
					min: .01,
					max: 9999999
				};
				return t && (i = o.request("price_range:get", t.data("stock-id")) || i), n < i.min ? "价格最小为 " + i.min : n > i.max ? "价格最大为 " + i.max : n > 9999999 ? "价格最大不能超过 9999999" : !1
			},
			validateStockNumber: function(e) {
				if (!e) return "库存不能为空";
				var t = Number(e);
				return isNaN(t) ? "请输入一个数字" : 0 > t ? "库存不能为负数" : t > 999999999 ? "库存最大不能超过 999999999" : !1
			},
			resetValidate: function() {
				var e = this;
				e.$(".manual-valid-error").removeClass("manual-valid-error"), e.$(".error-message").hide(), e.errorLen = 0
			},
			validateStockData: function() {
				var e = this;
				e.errorLen = 0, e.isStockModulShow && (e.validAllPrice(), e.validAllStock())
			},
			onAtomPriceInput: function(e) {
				var t = this;
				t.updatePrice(), t.reverseUpdateStock(e)
			},
			onAtomIsSellChange: function(e) {
				var t = this;
				t.reverseUpdateStock(e)
			},
			onAtomStockInput: function(e) {
				var t = this;
				t.updateTotalStock(), t.reverseUpdateStock(e)
			},
			calcPrice: function() {
				var e = this,
					n = [],
					i = e.$(".js-price");
				i.each(function(e, i) {
					var s = $.trim($(i).val());
					if (t.isEmpty(s)) return !1;
					var o = Number(s);
					return isNaN(o) ? !1 : void n.push(o)
				});
				var s = t.isEmpty(n) ? 0 : t.min(n);
				return s
			},
			updatePrice: function() {
				var e = this,
					t = e.calcPrice();
				t = Number(t).toFixed(2, 10) + "", e.minPrice = t, e.model.set({
					price: t
				})
			},
			calcTotalStock: function() {
				var e = this,
					t = 0,
					n = e.$(".js-stock-num");
				return n.each(function(e, n) {
					var i = Number($(n).val());
					t += i
				}), t
			},
			updateTotalStock: function() {
				var e = this,
					t = e.calcTotalStock();
				e.model.set({
					total_stock: t
				})
			},
			onBatchPriceClick: function(e) {
				var t = this;
				e.preventDefault(), t.showBatchForm("price")
			},
			hideBatchType: function() {},
			onBatchStockClick: function(e) {
				var t = this;
				e.preventDefault(), t.showBatchForm("stock_num")
			},
			onBatchSaveClick: function(e) {
				var t = this;
				e.preventDefault(), t.executeBatch(), t.hideBatchForm()
			},
			onBatchCancelClick: function(e) {
				var t = this;
				e.preventDefault(), t.hideBatchForm()
			},
			showBatchForm: function(e) {
				var t = this;
				t.batchType = e, t.ui.batchTxt.attr("price" === e ? {
					maxlength: 10,
					placeholder: "请输入价格"
				} : {
					maxlength: 9,
					placeholder: "请输入库存"
				}), t.ui.batchType.hide(), t.ui.batchForm.show()
			},
			hideBatchForm: function() {
				var e = this;
				e.ui.batchType.show(), e.ui.batchForm.hide()
			},
			executeBatch: function() {
				var e = this,
					t = e.ui.batchTxt.val(),
					n = e.batchType;
				if ("price" === n) {
					if (e.validatePrice(t)) return a.errorNotify("请输入一个正确的价格。"), !1;
					t = Number(t).toFixed(2, 10) + "", e.$(".js-price").val(t).trigger("blur"), e.updatePrice()
				} else {
					if (e.validateStockNumber(t)) return a.errorNotify("请输入一个正确的库存值。"), !1;
					e.$(".js-stock-num").val(t).trigger("blur"), e.updateTotalStock()
				}
				e.batchUpdateStockData(n, t), e.ui.batchTxt.val("")
			},
			batchUpdateStockData: function(e, n) {
				var i = this,
					s = i.model.get("stock");
				t(s).each(function(t) {
					t[e] = n
				}), i.model.set("stock", s, {
					silent: !0
				})
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return p
}), define("text!templates/sku_stock_info.html", [], function() {
	return '<div class="info-group-title vbox">\n    <div class="group-inner">库存/规格</div>\n</div>\n<div class="info-group-cont vbox">\n    <div class="group-inner">\n        <% if(goods_type != \'10\') { %>\n        <div class="js-goods-sku control-group">\n            <label class="control-label">商品规格：</label>\n            <div id="sku-region" class="controls">\n                <% if(selling_way == \'1\') { %>\n                <div class="static-value">统一规格</div>\n                <% } %>\n            </div>\n        </div>\n        <% } %>\n        <% if(selling_way != \'1\') { %>\n        <div class="js-goods-stock control-group">\n            <label class="control-label">商品库存：</label>\n            <div id="stock-region" class="controls sku-stock">\n            </div>\n        </div>\n        <% } %>\n        <div class="control-group">\n            <label class="control-label"><em class="required">*</em>总库存：</label>\n            <div class="controls">\n                <input type="text" maxlength="9" class="input-small" name="total_stock" value="<%=total_stock %>" />\n                <label class="checkbox inline">\n                    <input <% if(goods_type == \'10\') { %>disabled<% } %> type="checkbox" name="hide_stock" value="<%= hide_stock %>" <% if (hide_stock == \'1\') { %> checked<% } %>>页面不显示商品库存\n                </label>\n                <p class="help-desc">总库存为 0 时，会上架到『已售罄的商品』列表里</p>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">商家编码：</label>\n            <div class="controls">\n                <input type="text" class="input-small" name="goods_no" value="<%=goods_no %>" />\n                <a style="display: none;" href="javascript:;" class="js-help-notes circle-help">?</a>\n            </div>\n        </div>\n    </div>\n</div>\n'
}), define("views/sku_stock_info", ["require", "underscore", "backbone", "marionette", "core/event", "components/validation/validate", "commons/utils", "backbone.modelbinder", "chosen", "collections/sku_list", "views/sku", "views/stock", "text!templates/sku_stock_info.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("core/event"),
		o = (e("components/validation/validate"), e("commons/utils"));
	e("backbone.modelbinder"), e("chosen");
	var a = e("collections/sku_list"),
		l = e("views/sku"),
		c = e("views/stock"),
		r = e("text!templates/sku_stock_info.html"),
		d = i.Layout.extend({
			tagName: "div",
			className: "goods-info-group-inner",
			template: t.template(r),
			ui: {
				goodsSkuBlock: ".js-goods-sku",
				goodsStockBlock: ".js-goods-stock",
				totalStockTxt: '[name="total_stock"]'
			},
			events: {},
			regions: {
				skuRegion: "#sku-region",
				stockRegion: "#stock-region"
			},
			_modelBinder: void 0,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t.isFx = "10" == t.model.get("goods_type"), t._modelBinder = new n.ModelBinder, t.listenTo(t.model, "change", o.showLog), t.listenTo(t.model, "change:shop_method", t.onShopMethodChanged), t.listenTo(s, "sku_module:show", t.showSkuModule), t.listenTo(s, "sku_module:hide", t.hideSkuModule), t.listenTo(s, "stock_module:show", t.showStockModule), t.listenTo(s, "stock_module:hide", t.hideStockModule), t.listenTo(s, "sku_stock:update", t.updateSkuStock)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {
				var e = this,
					t = e.model.get("shop_method");
				"0" == t && e.hideSelf()
			},
			onShow: function() {
				var e = this;
				e.initDataBindings(), e.initSkuView(), e.initStockView()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initDataBindings: function() {
				var e = this,
					t = {
						total_stock: '[name="total_stock"]',
						hide_stock: {
							selector: '[name="hide_stock"]',
							converter: o.booleanConverter
						},
						goods_no: '[name="goods_no"]'
					};
				e._modelBinder.bind(e.model, e.el, t)
			},
			initSkuView: function() {
				var e = this,
					t = e.model.get("selling_way");
				if ("0" != t) return !1;
				o.fnCallCount("initSkuView");
				var n = e.getSkuData() || [],
					i = e.skuList = new a(n);
				e.skuView = new l({
					collection: i,
					goodsModel: e.model
				}), e.skuRegion.show(e.skuView)
			},
			getSkuData: function() {
				for (var e = this, t = "sku_name_", n = [], i = e.model.toJSON(), s = 1; 6 > s; s++) {
					var o = t + s,
						a = o + "_value",
						l = i[o],
						c = i[a] || [];
					if (l) {
						var r = "undefined" == typeof l.editable ? "1" : l.editable;
						n.push({
							id: l.id,
							text: l.text,
							editable: r,
							list: c
						})
					}
				}
				return n
			},
			initStockView: function() {
				var e = this,
					t = e.model.get("selling_way");
				return "0" != t ? !1 : (e.stockView = new c({
					model: e.model,
					skuList: e.skuList
				}), void e.stockRegion.show(e.stockView))
			},
			updateSkuStock: function() {
				var e = this;
				if (!e.skuList) return !1;
				var t = e.getSkuData() || [];
				e.skuList.reset(t), e.model.set("stock", [])
			},
			openStockEdit: function() {
				var e = this;
				e.ui.goodsStockBlock.removeClass("hide")
			},
			closeStockEdit: function() {
				var e = this;
				e.ui.goodsStockBlock.addClass("hide")
			},
			onShopMethodChanged: function(e, t) {
				var n = this;
				"0" == t ? n.hideSelf() : n.showSelf()
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			},
			showSkuModule: function() {
				var e = this;
				e.ui.goodsSkuBlock.show()
			},
			hideSkuModule: function() {
				var e = this;
				e.ui.goodsSkuBlock.hide()
			},
			showStockModule: function() {
				var e = this;
				e.ui.goodsStockBlock.show(), e.ui.totalStockTxt.prop("readonly", !0)
			},
			hideStockModule: function() {
				var e = this;
				e.ui.goodsStockBlock.hide(), e.isFx ? e.ui.totalStockTxt.prop("readonly", !0) : e.ui.totalStockTxt.prop("readonly", !1)
			}
		});
	return d
}), define("components/paipai_region/region_data", ["require"], function() {
	function e() {
		return window._regionMap || (window._regionMap = {
			0: ["北京", 0,
			{
				4e4: ["北京市", 1,
				{
					40004: ["延庆县"],
					40005: ["密云县"],
					40008: ["通州区"],
					41e3: ["东城区"],
					41001: ["西城区"],
					41004: ["朝阳区"],
					41005: ["丰台区"],
					41006: ["石景山区"],
					41007: ["海淀区"],
					41008: ["门头沟区"],
					41009: ["房山区"],
					41010: ["顺义区"],
					41011: ["昌平区"],
					41012: ["大兴区"],
					41013: ["怀柔区"],
					41014: ["平谷区"]
				}]
			}],
			1: ["天津", 0,
			{
				100: ["天津市", 1,
				{
					101: ["宝坻区"],
					102: ["静海县"],
					103: ["武清区"],
					104: ["宁河县"],
					105: ["蓟县"],
					41015: ["和平区"],
					41016: ["河东区"],
					41017: ["河西区"],
					41018: ["南开区"],
					41019: ["河北区"],
					41020: ["红桥区"],
					41024: ["东丽区"],
					41025: ["西青区"],
					41026: ["津南区"],
					41027: ["北辰区"],
					42296: ["滨海新区"]
				}]
			}],
			2: ["上海", 0,
			{
				200: ["上海市", 1,
				{
					203: ["青浦区"],
					204: ["嘉定区"],
					205: ["宝山区"],
					206: ["奉贤区"],
					208: ["松江区"],
					210: ["金山区"],
					41294: ["黄浦区"],
					41296: ["徐汇区"],
					41297: ["长宁区"],
					41298: ["静安区"],
					41299: ["普陀区"],
					41300: ["闸北区"],
					41301: ["虹口区"],
					41302: ["杨浦区"],
					41303: ["闵行区"],
					41304: ["浦东新区"],
					41305: ["崇明县"]
				}]
			}],
			3: ["重庆", 0,
			{
				300: ["重庆市", 1,
				{
					2101: ["涪陵区"],
					2102: ["北碚区"],
					2103: ["江北区"],
					2107: ["永川市"],
					2131: ["綦江区"],
					2132: ["长寿区"],
					2136: ["江津市"],
					2137: ["合川区"],
					2138: ["潼南县"],
					2139: ["铜梁县"],
					2141: ["荣昌县"],
					2142: ["大足县"],
					41788: ["万州区"],
					41789: ["渝中区"],
					41790: ["大渡口区"],
					41791: ["沙坪坝区"],
					41792: ["九龙坡区"],
					41793: ["南岸区"],
					41795: ["渝北区"],
					41796: ["巴南区"],
					41797: ["黔江区"],
					41798: ["璧山县"],
					41799: ["梁平县"],
					41800: ["城口县"],
					41801: ["丰都县"],
					41802: ["垫江县"],
					41803: ["武隆县"],
					41804: ["忠县"],
					41805: ["开县"],
					41806: ["云阳县"],
					41807: ["奉节县"],
					41808: ["巫山县"],
					41809: ["巫溪县"],
					41810: ["石柱土家族自治县"],
					41811: ["秀山土家族苗族自治县"],
					41812: ["酉阳土家族苗族自治县"],
					41813: ["彭水苗族土家族自治县"],
					41814: ["南川市"]
				}]
			}],
			4: ["河北", 0,
			{
				400: ["石家庄市", 0,
				{
					444: ["藁城市"],
					445: ["栾城县"],
					446: ["正定县"],
					448: ["井陉县"],
					4131: ["元氏县"],
					4132: ["新乐市"],
					4133: ["无极县"],
					4134: ["深泽县"],
					4135: ["辛集市"],
					4137: ["赵县"],
					4138: ["赞皇县"],
					4139: ["高邑县"],
					4140: ["平山县"],
					4141: ["灵寿县"],
					4142: ["行唐县"],
					41028: ["长安区"],
					41029: ["桥东区"],
					41030: ["桥西区"],
					41031: ["新华区"],
					41032: ["井陉矿区"],
					41033: ["裕华区"],
					41034: ["晋州市"],
					41035: ["鹿泉市"]
				}],
				401: ["邯郸市", 0,
				{
					402: ["武安市"],
					403: ["临漳县"],
					404: ["磁县"],
					405: ["涉县"],
					406: ["成安县"],
					407: ["永年县"],
					408: ["鸡泽县"],
					409: ["曲周县"],
					411: ["馆陶县"],
					412: ["大名县"],
					413: ["魏县"],
					414: ["广平县"],
					415: ["肥乡县"],
					41041: ["邯山区"],
					41042: ["丛台区"],
					41043: ["复兴区"],
					41044: ["峰峰矿区"],
					41045: ["邯郸县"],
					41046: ["邱县"]
				}],
				459: ["保定市", 0,
				{
					417: ["容城县"],
					418: ["易县"],
					419: ["涞源县"],
					420: ["博野县"],
					421: ["安国市"],
					422: ["定州市"],
					423: ["曲阳县"],
					424: ["唐县"],
					425: ["阜平县"],
					449: ["徐水县"],
					451: ["雄县"],
					452: ["安新县"],
					453: ["高阳县"],
					454: ["蠡县"],
					455: ["望都县"],
					456: ["顺平县"],
					457: ["满城县"],
					458: ["清苑县"],
					4143: ["涞水县"],
					4144: ["定兴县"],
					4145: ["涿州市"],
					41050: ["新市区"],
					41051: ["北市区"],
					41052: ["南市区"],
					41053: ["高碑店市"]
				}],
				461: ["张家口市", 0,
				{
					442: ["尚义县"],
					443: ["康保县"],
					460: ["宣化县"],
					462: ["怀安县"],
					463: ["万全县"],
					464: ["张北县"],
					465: ["崇礼县"],
					466: ["赤城县"],
					467: ["怀来县"],
					468: ["涿鹿县"],
					469: ["蔚县"],
					470: ["阳原县"],
					41054: ["桥东区"],
					41055: ["桥西区"],
					41056: ["宣化区"],
					41057: ["下花园区"],
					41058: ["沽源县"]
				}],
				472: ["承德市", 0,
				{
					471: ["兴隆县"],
					473: ["承德县"],
					474: ["隆化县"],
					475: ["围场满族蒙古族自治县"],
					476: ["平泉县"],
					477: ["宽城满族自治县"],
					478: ["丰宁满族自治县"],
					479: ["滦平县"],
					41059: ["双桥区"],
					41060: ["双滦区"],
					41061: ["鹰手营子矿区"]
				}],
				490: ["唐山市", 0,
				{
					480: ["滦南县"],
					481: ["丰南区"],
					482: ["唐海县"],
					483: ["遵化市"],
					484: ["滦县"],
					485: ["乐亭县"],
					486: ["丰润区"],
					487: ["玉田县"],
					488: ["迁西县"],
					489: ["迁安市"],
					2203: ["路南区"],
					41036: ["路北区"],
					41037: ["古冶区"],
					41038: ["开平区"]
				}],
				491: ["廊坊市", 0,
				{
					492: ["永清县"],
					493: ["霸州市"],
					494: ["大城县"],
					495: ["文安县"],
					496: ["固安县"],
					497: ["香河县"],
					498: ["大厂回族自治县"],
					499: ["三河市"],
					41065: ["安次区"],
					41066: ["广阳区"]
				}],
				4108: ["沧州市", 0,
				{
					4100: ["黄骅市"],
					4101: ["海兴县"],
					4102: ["盐山县"],
					4103: ["孟村回族自治县"],
					4104: ["南皮县"],
					4105: ["东光县"],
					4106: ["吴桥县"],
					4107: ["泊头市"],
					4109: ["青县"],
					4110: ["河间市"],
					4111: ["肃宁县"],
					4112: ["任丘市"],
					4113: ["献县"],
					41062: ["新华区"],
					41063: ["运河区"],
					41064: ["沧县"]
				}],
				4114: ["衡水市", 0,
				{
					4115: ["饶阳县"],
					4116: ["武强县"],
					4117: ["武邑县"],
					4118: ["阜城县"],
					4119: ["景县"],
					4120: ["故城县"],
					4121: ["枣强县"],
					4124: ["安平县"],
					41067: ["桃城区"],
					41068: ["冀州市"],
					41069: ["深州市"]
				}],
				4125: ["邢台市", 0,
				{
					426: ["临西县"],
					427: ["内丘县"],
					428: ["临城县"],
					429: ["柏乡县"],
					430: ["宁晋县"],
					431: ["隆尧县"],
					432: ["巨鹿县"],
					433: ["新河县"],
					434: ["南宫市"],
					435: ["清河县"],
					436: ["威县"],
					437: ["广宗县"],
					438: ["平乡县"],
					439: ["南和县"],
					440: ["任县"],
					441: ["沙河市"],
					41047: ["桥东区"],
					41048: ["桥西区"],
					41049: ["邢台县"]
				}],
				4130: ["秦皇岛市", 0,
				{
					4126: ["青龙满族自治县"],
					4127: ["昌黎县"],
					4128: ["卢龙县"],
					4129: ["抚宁县"],
					4146: ["北戴河区"],
					41039: ["海港区"],
					41040: ["山海关区"]
				}]
			}],
			5: ["河南", 0,
			{
				500: ["郑州市", 0,
				{
					501: ["上街区"],
					585: ["荥阳市"],
					5105: ["新郑市"],
					5114: ["登封市"],
					5126: ["中牟县"],
					5130: ["巩义市"],
					41529: ["中原区"],
					41530: ["二七区"],
					41531: ["管城回族区"],
					41532: ["金水区"],
					41533: ["惠济区"],
					41534: ["新密市"]
				}],
				502: ["安阳市", 0,
				{
					503: ["安阳县"],
					576: ["汤阴县"],
					578: ["内黄县"],
					579: ["滑县"],
					41551: ["文峰区"],
					41552: ["北关区"],
					41553: ["殷都区"],
					41554: ["龙安区"],
					41555: ["林州市"]
				}],
				504: ["新乡市", 0,
				{
					505: ["新乡县"],
					508: ["延津县"],
					509: ["原阳县"],
					510: ["获嘉县"],
					511: ["卫辉市"],
					512: ["辉县市"],
					513: ["长垣县"],
					41559: ["红旗区"],
					41560: ["卫滨区"],
					41561: ["凤泉区"],
					41562: ["牧野区"],
					41563: ["封丘县"]
				}],
				506: ["商丘市", 0,
				{
					561: ["虞城县"],
					562: ["夏邑县"],
					563: ["永城市"],
					564: ["柘城县"],
					565: ["宁陵县"],
					567: ["民权县"],
					41579: ["梁园区"],
					41580: ["睢阳区"],
					41581: ["睢县"]
				}],
				515: ["许昌市", 0,
				{
					516: ["许昌县"],
					517: ["长葛市"],
					518: ["鄢陵县"],
					519: ["禹州市"],
					590: ["襄城县"],
					41571: ["魏都区"]
				}],
				521: ["平顶山市", 0,
				{
					520: ["舞钢市"],
					589: ["郏县"],
					591: ["叶县"],
					592: ["鲁山县"],
					593: ["宝丰县"],
					594: ["汝州市"],
					41547: ["新华区"],
					41548: ["卫东区"],
					41549: ["石龙区"],
					41550: ["湛河区"]
				}],
				522: ["信阳市", 0,
				{
					5106: ["罗山县"],
					5107: ["息县"],
					5108: ["潢川县"],
					5109: ["光山县"],
					5110: ["新县"],
					5111: ["淮滨县"],
					5112: ["固始县"],
					5113: ["商城县"],
					41582: ["浉河区"],
					41583: ["平桥区"]
				}],
				524: ["南阳市", 0,
				{
					560: ["西峡县"],
					5115: ["淅川县"],
					5116: ["方城县"],
					5117: ["社旗县"],
					5118: ["唐河县"],
					5119: ["新野县"],
					5120: ["邓州市"],
					5121: ["镇平县"],
					5122: ["南召县"],
					5123: ["桐柏县"],
					5124: ["内乡县"],
					41577: ["宛城区"],
					41578: ["卧龙区"]
				}],
				528: ["开封市", 0,
				{
					526: ["兰考县"],
					527: ["杞县"],
					529: ["开封县"],
					530: ["通许县"],
					531: ["尉氏县"],
					41535: ["龙亭区"],
					41536: ["顺河回族区"],
					41537: ["鼓楼区"],
					41538: ["禹王台区"],
					41539: ["金明区"]
				}],
				534: ["洛阳市", 0,
				{
					532: ["汝阳县"],
					533: ["嵩县"],
					535: ["孟津县"],
					536: ["偃师市"],
					537: ["伊川县"],
					538: ["宜阳县"],
					539: ["新安县"],
					541: ["洛宁县"],
					41540: ["老城区"],
					41541: ["西工区"],
					41542: ["廛河回族区"],
					41543: ["涧西区"],
					41544: ["吉利区"],
					41545: ["洛龙区"],
					41546: ["栾川县"]
				}],
				544: ["济源市"],
				546: ["焦作市", 0,
				{
					542: ["温县"],
					543: ["沁阳市"],
					545: ["修武县"],
					548: ["博爱县"],
					549: ["武陟县"],
					41564: ["解放区"],
					41565: ["中站区"],
					41566: ["马村区"],
					41567: ["山阳区"],
					41568: ["孟州市"]
				}],
				551: ["驻马店市", 0,
				{
					550: ["泌阳县"],
					552: ["遂平县"],
					553: ["汝南县"],
					554: ["确山县"],
					555: ["西平县"],
					556: ["上蔡县"],
					557: ["平舆县"],
					558: ["新蔡县"],
					559: ["正阳县"],
					41585: ["驿城区"]
				}],
				571: ["鹤壁市", 0,
				{
					568: ["浚县"],
					569: ["淇县"],
					41556: ["鹤山区"],
					41557: ["山城区"],
					41558: ["淇滨区"]
				}],
				572: ["漯河市", 0,
				{
					587: ["舞阳县"],
					588: ["郾城区"],
					41572: ["源汇区"],
					41573: ["召陵区"],
					41574: ["临颍县"]
				}],
				584: ["濮阳市", 0,
				{
					580: ["台前县"],
					581: ["范县"],
					582: ["南乐县"],
					583: ["清丰县"],
					41569: ["华龙区"],
					41570: ["濮阳县"]
				}],
				596: ["周口市", 0,
				{
					595: ["鹿邑县"],
					597: ["西华县"],
					598: ["淮阳县"],
					599: ["郸城县"],
					5100: ["沈丘县"],
					5101: ["项城市"],
					5102: ["扶沟县"],
					5103: ["太康县"],
					5104: ["商水县"],
					41584: ["川汇区"]
				}],
				5131: ["三门峡市", 0,
				{
					5125: ["卢氏县"],
					5127: ["渑池县"],
					5128: ["义马市"],
					5129: ["灵宝市"],
					41575: ["湖滨区"],
					41576: ["陕县"]
				}]
			}],
			6: ["黑龙江", 0,
			{
				600: ["哈尔滨市", 0,
				{
					612: ["通河县"],
					613: ["阿城区"],
					614: ["尚志市"],
					615: ["延寿县"],
					616: ["双城市"],
					645: ["依兰县"],
					667: ["呼兰区"],
					671: ["宾县"],
					672: ["木兰县"],
					673: ["五常市"],
					674: ["巴彦县"],
					679: ["方正县"],
					41227: ["道里区"],
					41228: ["南岗区"],
					41229: ["道外区"],
					41230: ["香坊区"],
					41232: ["平房区"],
					41233: ["松北区"]
				}],
				601: ["齐齐哈尔市", 0,
				{
					622: ["克山县"],
					623: ["拜泉县"],
					624: ["依安县"],
					625: ["龙江县"],
					626: ["讷河市"],
					627: ["泰来县"],
					629: ["甘南县"],
					630: ["富裕县"],
					669: ["克东县"],
					41234: ["龙沙区"],
					41235: ["建华区"],
					41236: ["铁锋区"],
					41237: ["昂昂溪区"],
					41238: ["富拉尔基区"],
					41239: ["碾子山区"],
					41240: ["梅里斯达斡尔族区"]
				}],
				602: ["牡丹江市", 0,
				{
					634: ["林口县"],
					635: ["穆棱市"],
					636: ["东宁县"],
					637: ["海林市"],
					638: ["宁安市"],
					639: ["绥芬河市"],
					41287: ["东安区"],
					41288: ["阳明区"],
					41289: ["爱民区"],
					41290: ["西安区"]
				}],
				603: ["佳木斯市", 0,
				{
					643: ["桦川县"],
					644: ["汤原县"],
					648: ["桦南县"],
					668: ["富锦市"],
					670: ["抚远县"],
					676: ["同江市"],
					41280: ["向阳区"],
					41281: ["前进区"],
					41282: ["东风区"],
					41283: ["郊区"]
				}],
				604: ["绥化市", 0,
				{
					617: ["肇东市"],
					651: ["明水县"],
					652: ["庆安县"],
					653: ["海伦市"],
					654: ["安达市"],
					657: ["绥棱县"],
					658: ["望奎县"],
					659: ["兰西县"],
					660: ["青冈县"],
					41293: ["北林区"]
				}],
				605: ["黑河市", 0,
				{
					662: ["北安市"],
					663: ["孙吴县"],
					664: ["逊克县"],
					666: ["嫩江县"],
					41291: ["爱辉区"],
					41292: ["五大连池市"]
				}],
				610: ["伊春市", 0,
				{
					677: ["嘉荫县"],
					678: ["铁力市"],
					41264: ["伊春区"],
					41265: ["南岔区"],
					41266: ["友好区"],
					41267: ["西林区"],
					41268: ["翠峦区"],
					41269: ["新青区"],
					41270: ["美溪区"],
					41271: ["金山屯区"],
					41272: ["五营区"],
					41273: ["乌马河区"],
					41274: ["汤旺河区"],
					41275: ["带岭区"],
					41276: ["乌伊岭区"],
					41277: ["红星区"],
					41278: ["上甘岭区"]
				}],
				611: ["大庆市", 0,
				{
					621: ["林甸县"],
					655: ["肇州县"],
					656: ["肇源县"],
					41258: ["萨尔图区"],
					41259: ["龙凤区"],
					41260: ["让胡路区"],
					41261: ["红岗区"],
					41262: ["大同区"],
					41263: ["杜尔伯特蒙古族自治县"]
				}],
				618: ["鸡西市", 0,
				{
					632: ["鸡东县"],
					633: ["密山市"],
					640: ["虎林市"],
					41241: ["鸡冠区"],
					41242: ["恒山区"],
					41243: ["滴道区"],
					41244: ["梨树区"],
					41245: ["城子河区"],
					41246: ["麻山区"]
				}],
				619: ["鹤岗市", 0,
				{
					646: ["萝北县"],
					41247: ["向阳区"],
					41248: ["工农区"],
					41249: ["南山区"],
					41250: ["兴安区"],
					41251: ["东山区"],
					41252: ["兴山区"],
					41253: ["绥滨县"]
				}],
				620: ["双鸭山市", 0,
				{
					631: ["友谊县"],
					647: ["宝清县"],
					649: ["饶河县"],
					650: ["集贤县"],
					41254: ["尖山区"],
					41255: ["岭东区"],
					41256: ["四方台区"],
					41257: ["宝山区"]
				}],
				641: ["七台河市", 0,
				{
					642: ["勃利县"],
					41284: ["新兴区"],
					41285: ["桃山区"],
					41286: ["茄子河区"]
				}],
				680: ["大兴安岭地区", 0,
				{
					606: ["呼玛县"],
					607: ["漠河县"],
					608: ["塔河县"]
				}]
			}],
			7: ["吉林", 0,
			{
				700: ["长春市", 0,
				{
					710: ["双阳区"],
					711: ["德惠市"],
					712: ["农安县"],
					713: ["九台市"],
					714: ["榆树市"],
					41206: ["南关区"],
					41207: ["宽城区"],
					41208: ["朝阳区"],
					41209: ["二道区"],
					41210: ["绿园区"]
				}],
				701: ["吉林市", 0,
				{
					715: ["永吉县"],
					716: ["磐石市"],
					717: ["桦甸市"],
					718: ["蛟河市"],
					719: ["舒兰市"],
					41211: ["昌邑区"],
					41212: ["龙潭区"],
					41213: ["船营区"],
					41214: ["丰满区"]
				}],
				703: ["四平市", 0,
				{
					727: ["公主岭市"],
					728: ["双辽市"],
					729: ["伊通满族自治县"],
					730: ["梨树县"],
					41215: ["铁西区"],
					41216: ["铁东区"]
				}],
				704: ["通化市", 0,
				{
					732: ["通化县"],
					733: ["梅河口市"],
					734: ["集安市"],
					735: ["柳河县"],
					736: ["辉南县"],
					41220: ["东昌区"],
					41221: ["二道江区"]
				}],
				705: ["白城市", 0,
				{
					740: ["洮南市"],
					741: ["镇赉县"],
					743: ["通榆县"],
					744: ["大安市"],
					41225: ["洮北区"]
				}],
				706: ["辽源市", 0,
				{
					747: ["东丰县"],
					41217: ["龙山区"],
					41218: ["西安区"],
					41219: ["东辽县"]
				}],
				707: ["松原市", 0,
				{
					708: ["前郭尔罗斯蒙古族自治县"],
					742: ["扶余县"],
					745: ["长岭县"],
					746: ["乾安县"],
					41224: ["宁江区"]
				}],
				748: ["白山市", 0,
				{
					731: ["临江市"],
					737: ["靖宇县"],
					738: ["长白朝鲜族自治县"],
					739: ["抚松县"],
					41222: ["八道江区"],
					41223: ["江源县"]
				}],
				41226: ["延边朝鲜族自治州", 0,
				{
					702: ["延吉市"],
					720: ["汪清县"],
					721: ["和龙市"],
					722: ["安图县"],
					723: ["敦化市"],
					724: ["图们市"],
					725: ["珲春市"],
					726: ["龙井市"]
				}]
			}],
			8: ["辽宁", 0,
			{
				800: ["沈阳市", 0,
				{
					801: ["辽中县"],
					802: ["新民市"],
					41137: ["和平区"],
					41138: ["沈河区"],
					41139: ["大东区"],
					41140: ["皇姑区"],
					41141: ["铁西区"],
					41142: ["苏家屯区"],
					41143: ["东陵区"],
					41145: ["于洪区"],
					41146: ["康平县"],
					41147: ["法库县"],
					42252: ["沈北新区"]
				}],
				806: ["铁岭市", 0,
				{
					803: ["昌图县"],
					804: ["开原市"],
					805: ["西丰县"],
					41197: ["银州区"],
					41198: ["清河区"],
					41199: ["铁岭县"],
					41200: ["调兵山市"]
				}],
				807: ["大连市", 0,
				{
					808: ["庄河市"],
					809: ["长海县"],
					812: ["瓦房店市"],
					41148: ["中山区"],
					41149: ["西岗区"],
					41150: ["沙河口区"],
					41151: ["甘井子区"],
					41152: ["旅顺口区"],
					41153: ["金州区"],
					41154: ["普兰店市"]
				}],
				813: ["鞍山市", 0,
				{
					814: ["海城市"],
					815: ["台安县"],
					816: ["岫岩满族自治县"],
					41155: ["铁东区"],
					41156: ["铁西区"],
					41157: ["立山区"],
					41158: ["千山区"]
				}],
				817: ["抚顺市", 0,
				{
					819: ["新宾满族自治县"],
					41159: ["新抚区"],
					41160: ["东洲区"],
					41161: ["望花区"],
					41162: ["顺城区"],
					41163: ["抚顺县"],
					41164: ["清原满族自治县"]
				}],
				820: ["本溪市", 0,
				{
					822: ["桓仁满族自治县"],
					41165: ["平山区"],
					41166: ["溪湖区"],
					41167: ["明山区"],
					41168: ["南芬区"],
					41169: ["本溪满族自治县"]
				}],
				824: ["丹东市", 0,
				{
					823: ["凤城市"],
					825: ["宽甸满族自治县"],
					41170: ["元宝区"],
					41171: ["振兴区"],
					41172: ["振安区"],
					41173: ["东港市"]
				}],
				831: ["锦州市", 0,
				{
					827: ["北镇市"],
					829: ["黑山县"],
					830: ["义县"],
					41174: ["古塔区"],
					41175: ["凌河区"],
					41176: ["太和区"],
					41177: ["凌海市"]
				}],
				834: ["营口市", 0,
				{
					41178: ["站前区"],
					41179: ["西市区"],
					41180: ["鲅鱼圈区"],
					41181: ["老边区"],
					41182: ["盖州市"],
					41183: ["大石桥市"]
				}],
				835: ["阜新市", 0,
				{
					836: ["彰武县"],
					41184: ["海州区"],
					41185: ["新邱区"],
					41186: ["太平区"],
					41187: ["清河门区"],
					41188: ["细河区"],
					41189: ["阜新蒙古族自治县"]
				}],
				838: ["辽阳市", 0,
				{
					839: ["辽阳县"],
					840: ["灯塔市"],
					41190: ["白塔区"],
					41191: ["文圣区"],
					41192: ["宏伟区"],
					41193: ["弓长岭区"],
					41194: ["太子河区"]
				}],
				843: ["朝阳市", 0,
				{
					841: ["喀喇沁左翼蒙古族自治县"],
					842: ["朝阳县"],
					844: ["建平县"],
					845: ["北票市"],
					846: ["凌源市"],
					41201: ["双塔区"],
					41202: ["龙城区"]
				}],
				847: ["盘锦市", 0,
				{
					848: ["大洼县"],
					849: ["盘山县"],
					41195: ["双台子区"],
					41196: ["兴隆台区"]
				}],
				854: ["葫芦岛市", 0,
				{
					850: ["兴城市"],
					851: ["绥中县"],
					852: ["建昌县"],
					41203: ["连山区"],
					41204: ["龙港区"],
					41205: ["南票区"]
				}]
			}],
			9: ["山东", 0,
			{
				900: ["济南市", 0,
				{
					925: ["长清区"],
					933: ["章丘市"],
					959: ["商河县"],
					961: ["济阳县"],
					997: ["平阴县"],
					41480: ["历下区"],
					41481: ["市中区"],
					41482: ["槐荫区"],
					41483: ["天桥区"],
					41484: ["历城区"]
				}],
				901: ["青岛市", 0,
				{
					935: ["胶南市"],
					936: ["胶州市"],
					937: ["平度市"],
					938: ["莱西市"],
					939: ["即墨市"],
					41485: ["市南区"],
					41486: ["市北区"],
					41487: ["四方区"],
					41488: ["黄岛区"],
					41489: ["崂山区"],
					41490: ["李沧区"],
					41491: ["城阳区"]
				}],
				903: ["淄博市", 0,
				{
					902: ["桓台县"],
					946: ["高青县"],
					9101: ["沂源县"],
					41492: ["淄川区"],
					41493: ["张店区"],
					41494: ["博山区"],
					41495: ["临淄区"],
					41496: ["周村区"]
				}],
				904: ["德州市", 0,
				{
					924: ["庆云县"],
					934: ["夏津县"],
					953: ["齐河县"],
					954: ["陵县"],
					955: ["平原县"],
					956: ["武城县"],
					957: ["宁津县"],
					958: ["乐陵市"],
					960: ["临邑县"],
					962: ["禹城市"],
					41524: ["德城区"]
				}],
				905: ["烟台市", 0,
				{
					940: ["招远市"],
					941: ["莱阳市"],
					942: ["海阳市"],
					963: ["长岛县"],
					964: ["莱州市"],
					965: ["龙口市"],
					966: ["蓬莱市"],
					967: ["栖霞市"],
					968: ["牟平区"],
					41504: ["芝罘区"],
					41505: ["福山区"],
					41506: ["莱山区"]
				}],
				906: ["潍坊市", 0,
				{
					969: ["寿光市"],
					972: ["昌邑市"],
					973: ["高密市"],
					974: ["诸城市"],
					976: ["安丘市"],
					977: ["临朐县"],
					978: ["青州市"],
					998: ["昌乐县"],
					41507: ["潍城区"],
					41508: ["寒亭区"],
					41509: ["坊子区"],
					41510: ["奎文区"]
				}],
				907: ["济宁市", 0,
				{
					979: ["梁山县"],
					982: ["曲阜市"],
					983: ["兖州市"],
					984: ["邹城市"],
					985: ["微山县"],
					986: ["鱼台县"],
					987: ["金乡县"],
					988: ["嘉祥县"],
					992: ["泗水县"],
					995: ["汶上县"],
					41511: ["市中区"],
					41512: ["任城区"]
				}],
				908: ["泰安市", 0,
				{
					991: ["新泰市"],
					993: ["宁阳县"],
					994: ["东平县"],
					996: ["肥城市"],
					41513: ["泰山区"],
					41514: ["岱岳区"]
				}],
				909: ["临沂市", 0,
				{
					989: ["苍山县"],
					999: ["平邑县"],
					9100: ["蒙阴县"],
					9102: ["沂水县"],
					9103: ["沂南县"],
					9105: ["莒南县"],
					9107: ["郯城县"],
					9108: ["费县"],
					41520: ["兰山区"],
					41521: ["罗庄区"],
					41522: ["河东区"],
					41523: ["临沭县"]
				}],
				910: ["威海市", 0,
				{
					911: ["荣成市"],
					913: ["文登市"],
					914: ["乳山市"],
					41515: ["环翠区"]
				}],
				912: ["菏泽市", 0,
				{
					916: ["巨野县"],
					917: ["定陶县"],
					918: ["成武县"],
					919: ["单县"],
					920: ["曹县"],
					921: ["东明县"],
					922: ["鄄城县"],
					923: ["郓城县"],
					41528: ["牡丹区"]
				}],
				915: ["日照市", 0,
				{
					975: ["五莲县"],
					9104: ["莒县"],
					41516: ["东港区"],
					41517: ["岚山区"]
				}],
				926: ["聊城市", 0,
				{
					927: ["临清市"],
					929: ["东阿县"],
					930: ["阳谷县"],
					931: ["莘县"],
					932: ["冠县"],
					9109: ["高唐县"],
					41525: ["东昌府区"],
					41526: ["茌平县"]
				}],
				944: ["滨州市", 0,
				{
					945: ["博兴县"],
					947: ["邹平县"],
					948: ["惠民县"],
					949: ["无棣县"],
					950: ["沾化县"],
					951: ["阳信县"],
					41527: ["滨城区"]
				}],
				970: ["东营市", 0,
				{
					943: ["利津县"],
					952: ["广饶县"],
					971: ["垦利县"],
					41502: ["东营区"],
					41503: ["河口区"]
				}],
				980: ["枣庄市", 0,
				{
					981: ["滕州市"],
					41497: ["市中区"],
					41498: ["薛城区"],
					41499: ["峄城区"],
					41500: ["台儿庄区"],
					41501: ["山亭区"]
				}],
				990: ["莱芜市", 0,
				{
					41518: ["莱城区"],
					41519: ["钢城区"]
				}]
			}],
			10: ["内蒙古", 1,
			{
				1e3: ["呼和浩特市", 0,
				{
					1003: ["武川县"],
					1005: ["托克托县"],
					1041: ["和林格尔县"],
					1055: ["清水河县"],
					41104: ["新城区"],
					41105: ["回民区"],
					41106: ["玉泉区"],
					41107: ["赛罕区"],
					41108: ["土默特左旗"]
				}],
				1008: ["包头市", 0,
				{
					1007: ["土默特右旗"],
					1009: ["固阳县"],
					1043: ["达尔罕茂明安联合旗"],
					41109: ["东河区"],
					41110: ["昆都仑区"],
					41111: ["青山区"],
					41112: ["石拐区"],
					41113: ["白云矿区"],
					41114: ["九原区"]
				}],
				1011: ["乌海市", 0,
				{
					41115: ["海勃湾区"],
					41116: ["海南区"],
					41117: ["乌达区"]
				}],
				1013: ["通辽市", 0,
				{
					1057: ["开鲁县"],
					1058: ["库伦旗"],
					1059: ["奈曼旗"],
					1060: ["扎鲁特旗"],
					1061: ["科尔沁左翼中旗"],
					1063: ["霍林郭勒市"],
					41121: ["科尔沁区"],
					41122: ["科尔沁左翼后旗"]
				}],
				1014: ["赤峰市", 0,
				{
					1015: ["阿鲁科尔沁旗"],
					1016: ["敖汉旗"],
					1017: ["宁城县"],
					1018: ["翁牛特旗"],
					1019: ["巴林左旗"],
					1020: ["巴林右旗"],
					1021: ["林西县"],
					1022: ["克什克腾旗"],
					1023: ["喀喇沁旗"],
					41118: ["红山区"],
					41119: ["元宝山区"],
					41120: ["松山区"]
				}],
				41123: ["鄂尔多斯市", 0,
				{
					1024: ["东胜区"],
					1067: ["达拉特旗"],
					1068: ["伊金霍洛旗"],
					1069: ["准格尔旗"],
					1070: ["杭锦旗"],
					1071: ["乌审旗"],
					1072: ["鄂托克旗"],
					1073: ["鄂托克前旗"]
				}],
				41124: ["呼伦贝尔市", 0,
				{
					1001: ["海拉尔区"],
					1002: ["鄂温克族自治旗"],
					1028: ["牙克石市"],
					1029: ["扎兰屯市"],
					1030: ["鄂伦春自治旗"],
					1031: ["陈巴尔虎旗"],
					1032: ["新巴尔虎左旗"],
					1033: ["新巴尔虎右旗"],
					1038: ["满洲里市"],
					1042: ["阿荣旗"],
					41125: ["莫力达瓦达斡尔族自治旗"],
					41126: ["额尔古纳市"],
					41127: ["根河市"]
				}],
				41128: ["巴彦淖尔市", 0,
				{
					1025: ["临河区"],
					1026: ["杭锦后旗"],
					1075: ["五原县"],
					1076: ["乌拉特前旗"],
					1077: ["乌拉特中旗"],
					1078: ["乌拉特后旗"],
					41129: ["磴口县"]
				}],
				41130: ["乌兰察布市", 0,
				{
					1012: ["集宁区"],
					1044: ["四子王旗"],
					1046: ["化德县"],
					1047: ["丰镇市"],
					1048: ["卓资县"],
					1049: ["商都县"],
					1050: ["兴和县"],
					1051: ["察哈尔右翼前旗"],
					1052: ["察哈尔右翼中旗"],
					1053: ["察哈尔右翼后旗"],
					1054: ["凉城县"]
				}],
				41131: ["兴安盟", 0,
				{
					1040: ["乌兰浩特市"],
					1056: ["科尔沁右翼中旗"],
					1064: ["突泉县"],
					1065: ["扎赉特旗"],
					1066: ["阿尔山市"],
					41132: ["科尔沁右翼前旗"]
				}],
				41133: ["锡林郭勒盟", 0,
				{
					1027: ["锡林浩特市"],
					1039: ["二连浩特市"],
					1080: ["多伦县"],
					1081: ["太仆寺旗"],
					1082: ["苏尼特左旗"],
					1083: ["苏尼特右旗"],
					1084: ["镶黄旗"],
					1085: ["东乌珠穆沁旗"],
					1086: ["西乌珠穆沁旗"],
					1087: ["正镶白旗"],
					1088: ["正蓝旗"],
					41134: ["阿巴嘎旗"]
				}],
				41135: ["阿拉善盟", 0,
				{
					1045: ["阿拉善左旗"],
					1079: ["阿拉善右旗"],
					41136: ["额济纳旗"]
				}]
			}],
			11: ["江苏", 0,
			{
				1100: ["南京市", 0,
				{
					1108: ["高淳县"],
					1109: ["溧水县"],
					1110: ["六合区"],
					1111: ["江宁区"],
					41306: ["玄武区"],
					41307: ["白下区"],
					41308: ["秦淮区"],
					41309: ["建邺区"],
					41310: ["鼓楼区"],
					41311: ["下关区"],
					41312: ["浦口区"],
					41313: ["栖霞区"],
					41314: ["雨花台区"]
				}],
				1101: ["无锡市", 0,
				{
					1103: ["江阴市"],
					1134: ["宜兴市"],
					41315: ["崇安区"],
					41316: ["南长区"],
					41317: ["北塘区"],
					41318: ["锡山区"],
					41319: ["惠山区"],
					41320: ["滨湖区"]
				}],
				1104: ["镇江市", 0,
				{
					1105: ["丹徒区"],
					1130: ["丹阳市"],
					1131: ["扬中市"],
					1175: ["句容市"],
					41350: ["京口区"],
					41351: ["润州区"]
				}],
				1106: ["苏州市", 0,
				{
					1135: ["常熟市"],
					1136: ["张家港市"],
					1137: ["吴江市"],
					1138: ["昆山市"],
					1139: ["太仓市"],
					41331: ["沧浪区"],
					41332: ["平江区"],
					41333: ["金阊区"],
					41334: ["虎丘区"],
					41335: ["吴中区"],
					41336: ["相城区"]
				}],
				1112: ["南通市", 0,
				{
					1113: ["通州市"],
					1114: ["如皋市"],
					1115: ["如东县"],
					1140: ["海门市"],
					1141: ["启东市"],
					1144: ["海安县"],
					41337: ["崇川区"],
					41338: ["港闸区"]
				}],
				1116: ["扬州市", 0,
				{
					1117: ["邗江区"],
					1148: ["江都市"],
					1150: ["宝应县"],
					1151: ["高邮市"],
					1174: ["仪征市"],
					41348: ["广陵区"]
				}],
				1118: ["盐城市", 0,
				{
					1153: ["东台市"],
					1154: ["大丰市"],
					1155: ["射阳县"],
					1156: ["滨海县"],
					1157: ["响水县"],
					1158: ["阜宁县"],
					1159: ["建湖县"],
					41346: ["亭湖区"],
					41347: ["盐都区"]
				}],
				1119: ["徐州市", 0,
				{
					1120: ["铜山县"],
					1160: ["睢宁县"],
					1162: ["新沂市"],
					1163: ["沛县"],
					1164: ["丰县"],
					41321: ["鼓楼区"],
					41322: ["云龙区"],
					41324: ["贾汪区"],
					41325: ["泉山区"],
					41326: ["邳州市"]
				}],
				1123: ["淮安市", 0,
				{
					1165: ["涟水县"],
					1170: ["盱眙县"],
					1171: ["金湖县"],
					1172: ["洪泽县"],
					41342: ["清河区"],
					41343: ["楚州区"],
					41344: ["淮阴区"],
					41345: ["清浦区"]
				}],
				1124: ["连云港市", 0,
				{
					1125: ["赣榆县"],
					1126: ["灌云县"],
					1127: ["东海县"],
					1173: ["灌南县"],
					41339: ["连云区"],
					41340: ["新浦区"],
					41341: ["海州区"]
				}],
				1128: ["常州市", 0,
				{
					1129: ["武进区"],
					1132: ["金坛市"],
					1133: ["溧阳市"],
					41327: ["天宁区"],
					41328: ["钟楼区"],
					41329: ["戚墅堰区"],
					41330: ["新北区"]
				}],
				1145: ["泰州市", 0,
				{
					1146: ["靖江市"],
					1149: ["兴化市"],
					1152: ["泰兴市"],
					41352: ["海陵区"],
					41353: ["高港区"],
					41354: ["姜堰市"]
				}],
				1167: ["宿迁市", 0,
				{
					1166: ["沭阳县"],
					1168: ["泗阳县"],
					1169: ["泗洪县"],
					41355: ["宿城区"],
					41356: ["宿豫区"]
				}]
			}],
			12: ["安徽", 0,
			{
				1200: ["合肥市", 0,
				{
					1207: ["肥西县"],
					1208: ["长丰县"],
					1209: ["肥东县"],
					41383: ["瑶海区"],
					41384: ["庐阳区"],
					41385: ["蜀山区"],
					41386: ["包河区"],
					42283: ["巢湖市"],
					42284: ["庐江县"]
				}],
				1205: ["滁州市", 0,
				{
					1201: ["天长市"],
					1202: ["来安县"],
					1203: ["定远县"],
					1206: ["全椒县"],
					1257: ["凤阳县"],
					41415: ["琅琊区"],
					41416: ["南谯区"],
					41417: ["明光市"]
				}],
				1210: ["蚌埠市", 0,
				{
					1211: ["固镇县"],
					1212: ["五河县"],
					1213: ["怀远县"],
					41391: ["龙子湖区"],
					41392: ["蚌山区"],
					41393: ["禹会区"],
					41394: ["淮上区"]
				}],
				1214: ["芜湖市", 0,
				{
					1215: ["芜湖县"],
					1216: ["南陵县"],
					1217: ["繁昌县"],
					41387: ["镜湖区"],
					41388: ["弋江区"],
					41389: ["鸠江区"],
					41390: ["三山区"],
					42285: ["无为县"]
				}],
				1218: ["淮南市", 0,
				{
					1219: ["凤台县"],
					41395: ["大通区"],
					41396: ["田家庵区"],
					41397: ["谢家集区"],
					41398: ["八公山区"],
					41399: ["潘集区"]
				}],
				1220: ["马鞍山市", 0,
				{
					1221: ["当涂县"],
					41400: ["金家庄区"],
					41401: ["花山区"],
					41402: ["雨山区"],
					42286: ["和县"],
					42287: ["含山县"]
				}],
				1227: ["安庆市", 0,
				{
					1222: ["岳西县"],
					1223: ["怀宁县"],
					1224: ["枞阳县"],
					1225: ["望江县"],
					1226: ["潜山县"],
					1228: ["宿松县"],
					1229: ["太湖县"],
					1230: ["桐城市"],
					41410: ["迎江区"],
					41411: ["大观区"],
					41412: ["宜秀区"]
				}],
				1232: ["宿州市", 0,
				{
					1231: ["萧县"],
					1233: ["灵璧县"],
					1234: ["泗县"],
					41422: ["埇桥区"],
					41423: ["砀山县"]
				}],
				1236: ["阜阳市", 0,
				{
					1271: ["阜南县"],
					1275: ["界首市"],
					1276: ["颍上县"],
					1277: ["太和县"],
					1278: ["临泉县"],
					41418: ["颍州区"],
					41419: ["颍东区"],
					41420: ["颍泉区"]
				}],
				1239: ["黄山市", 0,
				{
					1237: ["黟县"],
					1238: ["歙县"],
					1240: ["祁门县"],
					1242: ["休宁县"],
					1281: ["屯溪区"],
					41413: ["黄山区"],
					41414: ["徽州区"]
				}],
				1253: ["淮北市", 0,
				{
					1252: ["濉溪县"],
					41403: ["杜集区"],
					41404: ["相山区"],
					41405: ["烈山区"]
				}],
				1254: ["铜陵市", 0,
				{
					41406: ["铜官山区"],
					41407: ["狮子山区"],
					41408: ["郊区"],
					41409: ["铜陵县"]
				}],
				1266: ["六安市", 0,
				{
					1256: ["舒城县"],
					1265: ["金寨县"],
					1267: ["寿县"],
					1268: ["霍邱县"],
					1269: ["霍山县"],
					41425: ["金安区"],
					41426: ["裕安区"]
				}],
				1270: ["亳州市", 0,
				{
					1272: ["蒙城县"],
					1273: ["涡阳县"],
					1274: ["利辛县"],
					41427: ["谯城区"]
				}],
				1282: ["宣城市", 0,
				{
					1258: ["宣州区"],
					1260: ["广德县"],
					1261: ["郎溪县"],
					1262: ["宁国市"],
					1263: ["绩溪县"],
					1264: ["旌德县"],
					41429: ["泾县"]
				}],
				41428: ["池州市", 0,
				{
					1248: ["东至县"],
					1249: ["贵池区"],
					1250: ["青阳县"],
					1251: ["石台县"]
				}]
			}],
			13: ["山西", 0,
			{
				1300: ["太原市", 0,
				{
					1336: ["阳曲县"],
					1337: ["清徐县"],
					1338: ["古交市"],
					41070: ["小店区"],
					41071: ["迎泽区"],
					41072: ["杏花岭区"],
					41073: ["尖草坪区"],
					41074: ["万柏林区"],
					41075: ["晋源区"],
					41076: ["娄烦县"]
				}],
				1301: ["大同市", 0,
				{
					1341: ["天镇县"],
					1343: ["阳高县"],
					1344: ["浑源县"],
					1346: ["广灵县"],
					1347: ["灵丘县"],
					1348: ["左云县"],
					41077: ["城区"],
					41078: ["矿区"],
					41079: ["南郊区"],
					41080: ["新荣区"],
					41081: ["大同县"]
				}],
				1306: ["忻州市", 0,
				{
					1303: ["原平市"],
					1304: ["代县"],
					1349: ["偏关县"],
					1350: ["静乐县"],
					1351: ["定襄县"],
					1352: ["五台县"],
					1353: ["岢岚县"],
					1354: ["河曲县"],
					1355: ["保德县"],
					1356: ["宁武县"],
					1357: ["神池县"],
					1358: ["五寨县"],
					1391: ["繁峙县"],
					41095: ["忻府区"]
				}],
				1318: ["阳泉市", 0,
				{
					1320: ["平定县"],
					41082: ["城区"],
					41083: ["矿区"],
					41084: ["郊区"],
					41085: ["盂县"]
				}],
				1322: ["长治市", 0,
				{
					1363: ["平顺县"],
					1364: ["黎城县"],
					1366: ["襄垣县"],
					1367: ["武乡县"],
					1368: ["沁县"],
					1369: ["沁源县"],
					1370: ["屯留县"],
					1371: ["长子县"],
					1372: ["潞城市"],
					41086: ["长治县"],
					41087: ["壶关县"],
					42289: ["城区"],
					42290: ["郊区"]
				}],
				1323: ["晋城市", 0,
				{
					1359: ["高平市"],
					1360: ["阳城县"],
					1361: ["沁水县"],
					1362: ["陵川县"],
					41088: ["城区"],
					41089: ["泽州县"]
				}],
				1324: ["临汾市", 0,
				{
					1365: ["侯马市"],
					1383: ["大宁县"],
					1384: ["曲沃县"],
					1385: ["翼城县"],
					1386: ["洪洞县"],
					1387: ["霍州市"],
					1388: ["汾西县"],
					1389: ["蒲县"],
					1390: ["隰县"],
					1392: ["乡宁县"],
					1393: ["吉县"],
					1394: ["浮山县"],
					1395: ["古县"],
					41096: ["尧都区"],
					41097: ["襄汾县"],
					41098: ["安泽县"],
					41099: ["永和县"]
				}],
				1326: ["运城市", 0,
				{
					1302: ["芮城县"],
					1307: ["垣曲县"],
					1308: ["平陆县"],
					1310: ["万荣县"],
					1311: ["稷山县"],
					1312: ["河津市"],
					1313: ["新绛县"],
					1314: ["闻喜县"],
					1315: ["夏县"],
					1316: ["绛县"],
					1317: ["永济市"],
					41093: ["盐湖区"],
					41094: ["临猗县"]
				}],
				1339: ["朔州市", 0,
				{
					1305: ["山阴县"],
					1340: ["右玉县"],
					1342: ["怀仁县"],
					1345: ["应县"],
					41090: ["朔城区"],
					41091: ["平鲁区"]
				}],
				41092: ["晋中市", 0,
				{
					1321: ["榆次区"],
					1373: ["灵石县"],
					1374: ["昔阳县"],
					1375: ["和顺县"],
					1376: ["左权县"],
					1377: ["榆社县"],
					1378: ["寿阳县"],
					1379: ["太谷县"],
					1380: ["祁县"],
					1381: ["平遥县"],
					1382: ["介休市"]
				}],
				41100: ["吕梁市", 0,
				{
					1325: ["离石区"],
					1327: ["方山县"],
					1328: ["临县"],
					1329: ["汾阳市"],
					1330: ["文水县"],
					1331: ["交城县"],
					1332: ["孝义市"],
					1333: ["交口县"],
					1334: ["中阳县"],
					1335: ["兴县"],
					41101: ["柳林县"],
					41102: ["石楼县"],
					41103: ["岚县"]
				}]
			}],
			14: ["陕西", 0,
			{
				1400: ["西安市", 0,
				{
					1401: ["长安区"],
					1402: ["户县"],
					1403: ["周至县"],
					1405: ["临潼区"],
					1406: ["高陵县"],
					42050: ["新城区"],
					42051: ["碑林区"],
					42052: ["莲湖区"],
					42053: ["灞桥区"],
					42054: ["未央区"],
					42055: ["雁塔区"],
					42056: ["阎良区"],
					42057: ["蓝田县"]
				}],
				1407: ["咸阳市", 0,
				{
					1408: ["兴平市"],
					1409: ["武功县"],
					1410: ["永寿县"],
					1411: ["乾县"],
					1445: ["彬县"],
					1446: ["三原县"],
					1447: ["泾阳县"],
					1448: ["礼泉县"],
					1492: ["淳化县"],
					1493: ["长武县"],
					1494: ["旬邑县"],
					42064: ["秦都区"],
					42065: ["杨凌区"],
					42066: ["渭城区"]
				}],
				1417: ["延安市", 0,
				{
					1412: ["延川县"],
					1413: ["子长县"],
					1414: ["延长县"],
					1416: ["黄陵县"],
					1418: ["富县"],
					1419: ["黄龙县"],
					1420: ["宜川县"],
					1421: ["洛川县"],
					1422: ["志丹县"],
					1423: ["甘泉县"],
					1424: ["安塞县"],
					42068: ["宝塔区"],
					42069: ["吴起县"]
				}],
				1425: ["榆林市", 0,
				{
					1449: ["吴堡县"],
					1450: ["子洲县"],
					1451: ["佳县"],
					1452: ["府谷县"],
					1453: ["米脂县"],
					1454: ["绥德县"],
					1455: ["定边县"],
					1456: ["靖边县"],
					1457: ["神木县"],
					1465: ["清涧县"],
					42071: ["榆阳区"],
					42072: ["横山县"]
				}],
				1426: ["渭南市", 0,
				{
					1427: ["华县"],
					1458: ["大荔县"],
					1459: ["华阴市"],
					1460: ["潼关县"],
					1461: ["富平县"],
					1462: ["澄城县"],
					1463: ["韩城市"],
					1464: ["蒲城县"],
					1490: ["合阳县"],
					1491: ["白水县"],
					42067: ["临渭区"]
				}],
				1429: ["安康市", 0,
				{
					1472: ["镇坪县"],
					1473: ["岚皋县"],
					1474: ["宁陕县"],
					1475: ["汉阴县"],
					1476: ["旬阳县"],
					1477: ["白河县"],
					1478: ["紫阳县"],
					1479: ["石泉县"],
					42073: ["汉滨区"],
					42074: ["平利县"]
				}],
				1430: ["汉中市", 0,
				{
					1431: ["南郑县"],
					1480: ["留坝县"],
					1481: ["城固县"],
					1482: ["洋县"],
					1483: ["佛坪县"],
					1484: ["西乡县"],
					1485: ["镇巴县"],
					1486: ["宁强县"],
					1487: ["勉县"],
					1488: ["略阳县"],
					42070: ["汉台区"]
				}],
				1432: ["宝鸡市", 0,
				{
					1434: ["凤翔县"],
					1435: ["岐山县"],
					1436: ["扶风县"],
					1437: ["眉县"],
					1438: ["太白县"],
					1439: ["凤县"],
					1440: ["麟游县"],
					1441: ["千阳县"],
					1489: ["陇县"],
					42061: ["渭滨区"],
					42062: ["金台区"],
					42063: ["陈仓区"]
				}],
				1442: ["铜川市", 0,
				{
					1444: ["宜君县"],
					42058: ["王益区"],
					42059: ["印台区"],
					42060: ["耀州区"]
				}],
				42075: ["商洛市", 0,
				{
					1428: ["商州区"],
					1466: ["丹凤县"],
					1467: ["柞水县"],
					1468: ["镇安县"],
					1469: ["山阳县"],
					1470: ["洛南县"],
					1471: ["商南县"]
				}]
			}],
			15: ["甘肃", 0,
			{
				1500: ["兰州市", 0,
				{
					1502: ["榆中县"],
					1503: ["永登县"],
					1504: ["皋兰县"],
					1505: ["红古区"],
					42076: ["城关区"],
					42077: ["七里河区"],
					42078: ["西固区"],
					42079: ["安宁区"]
				}],
				1506: ["定西市", 0,
				{
					1529: ["陇西县"],
					1530: ["漳县"],
					1531: ["通渭县"],
					1532: ["岷县"],
					1533: ["临洮县"],
					1534: ["渭源县"],
					42091: ["安定区"]
				}],
				1507: ["平凉市", 0,
				{
					1536: ["静宁县"],
					1537: ["泾川县"],
					1538: ["灵台县"],
					1539: ["崇信县"],
					1540: ["华亭县"],
					1541: ["庄浪县"],
					42087: ["崆峒区"]
				}],
				1509: ["武威市", 0,
				{
					1549: ["民勤县"],
					1550: ["天祝藏族自治县"],
					1551: ["古浪县"],
					42085: ["凉州区"]
				}],
				1510: ["张掖市", 0,
				{
					1554: ["山丹县"],
					1555: ["高台县"],
					1556: ["肃南裕固族自治县"],
					1557: ["民乐县"],
					1558: ["临泽县"],
					42086: ["甘州区"]
				}],
				1511: ["酒泉市", 0,
				{
					1563: ["玉门市"],
					1564: ["安西县"],
					1565: ["敦煌市"],
					1566: ["金塔县"],
					1567: ["肃北蒙古族自治县"],
					42088: ["肃州区"],
					42089: ["阿克塞哈萨克族自治县"]
				}],
				1535: ["白银市", 0,
				{
					1559: ["平川区"],
					1560: ["靖远县"],
					1561: ["景泰县"],
					1562: ["会宁县"],
					42081: ["白银区"]
				}],
				1542: ["庆阳市", 0,
				{
					1508: ["西峰区"],
					1543: ["宁县"],
					1544: ["镇原县"],
					1545: ["环县"],
					1546: ["合水县"],
					1547: ["正宁县"],
					1548: ["华池县"],
					42090: ["庆城县"]
				}],
				1552: ["金昌市", 0,
				{
					1553: ["永昌县"],
					42080: ["金川区"]
				}],
				1568: ["嘉峪关市"],
				1580: ["天水市", 0,
				{
					1512: ["甘谷县"],
					1569: ["武山县"],
					1570: ["张家川回族自治县"],
					1571: ["清水县"],
					42082: ["秦州区"],
					42083: ["北道区"],
					42084: ["秦安县"]
				}],
				42092: ["陇南市", 0,
				{
					1513: ["武都区"],
					1572: ["成县"],
					1573: ["康县"],
					1574: ["文县"],
					1576: ["西和县"],
					1577: ["礼县"],
					1578: ["徽县"],
					1579: ["两当县"],
					42093: ["宕昌县"]
				}],
				42094: ["临夏回族自治州", 0,
				{
					1514: ["临夏市"],
					1515: ["永靖县"],
					1516: ["和政县"],
					1517: ["东乡族自治县"],
					1518: ["康乐县"],
					1519: ["广河县"],
					1520: ["积石山保安族东乡族撒拉族自治县"],
					42095: ["临夏县"]
				}],
				42096: ["甘南藏族自治州", 0,
				{
					1522: ["夏河县"],
					1523: ["临潭县"],
					1524: ["舟曲县"],
					1525: ["碌曲县"],
					1526: ["玛曲县"],
					1527: ["卓尼县"],
					1528: ["迭部县"],
					42097: ["合作市"]
				}]
			}],
			16: ["浙江", 0,
			{
				1600: ["杭州市", 0,
				{
					1620: ["余杭区"],
					1621: ["萧山区"],
					1622: ["富阳市"],
					1623: ["桐庐县"],
					1624: ["建德市"],
					1625: ["淳安县"],
					1626: ["临安市"],
					41357: ["上城区"],
					41358: ["下城区"],
					41359: ["江干区"],
					41360: ["拱墅区"],
					41361: ["西湖区"],
					41362: ["滨江区"]
				}],
				1601: ["湖州市", 0,
				{
					1627: ["德清县"],
					1628: ["安吉县"],
					1629: ["长兴县"],
					41373: ["吴兴区"],
					41374: ["南浔区"]
				}],
				1602: ["嘉兴市", 0,
				{
					1630: ["嘉善县"],
					1631: ["平湖市"],
					1632: ["海盐县"],
					1633: ["海宁市"],
					1634: ["桐乡市"],
					41371: ["南湖区"],
					41372: ["秀洲区"]
				}],
				1603: ["宁波市", 0,
				{
					1605: ["镇海区"],
					1635: ["象山县"],
					1636: ["宁海县"],
					1637: ["奉化市"],
					1638: ["余姚市"],
					1639: ["慈溪市"],
					41363: ["海曙区"],
					41364: ["江东区"],
					41365: ["江北区"],
					41366: ["北仑区"],
					41367: ["鄞州区"]
				}],
				1606: ["绍兴市", 0,
				{
					1607: ["绍兴县"],
					1640: ["上虞市"],
					1642: ["新昌县"],
					1643: ["诸暨市"],
					1680: ["嵊州市"],
					41375: ["越城区"]
				}],
				1609: ["温州市", 0,
				{
					1655: ["永嘉县"],
					1656: ["乐清市"],
					1657: ["洞头县"],
					1658: ["瑞安市"],
					1659: ["平阳县"],
					1660: ["苍南县"],
					1661: ["泰顺县"],
					1662: ["文成县"],
					41368: ["鹿城区"],
					41369: ["龙湾区"],
					41370: ["瓯海区"]
				}],
				1611: ["丽水市", 0,
				{
					1663: ["缙云县"],
					1664: ["青田县"],
					1665: ["云和县"],
					1666: ["庆元县"],
					1667: ["龙泉市"],
					1668: ["遂昌县"],
					1669: ["松阳县"],
					1670: ["景宁畲族自治县"],
					41382: ["莲都区"]
				}],
				1612: ["金华市", 0,
				{
					1671: ["浦江县"],
					1672: ["义乌市"],
					1673: ["东阳市"],
					1674: ["永康市"],
					1675: ["武义县"],
					1676: ["兰溪市"],
					1677: ["磐安县"],
					41376: ["婺城区"],
					41377: ["金东区"]
				}],
				1614: ["衢州市", 0,
				{
					1616: ["江山市"],
					1617: ["常山县"],
					1618: ["开化县"],
					1619: ["龙游县"],
					41378: ["柯城区"],
					41379: ["衢江区"]
				}],
				1644: ["舟山市", 0,
				{
					1645: ["岱山县"],
					1646: ["嵊泗县"],
					1678: ["定海区"],
					41380: ["普陀区"]
				}],
				1681: ["台州市", 0,
				{
					1608: ["临海市"],
					1648: ["三门县"],
					1649: ["黄岩区"],
					1650: ["温岭市"],
					1651: ["玉环县"],
					1652: ["仙居县"],
					1653: ["天台县"],
					1654: ["椒江区"],
					41381: ["路桥区"]
				}]
			}],
			17: ["江西", 0,
			{
				1700: ["南昌市", 0,
				{
					1701: ["南昌县"],
					1704: ["新建县"],
					1705: ["进贤县"],
					1706: ["安义县"],
					41458: ["东湖区"],
					41459: ["西湖区"],
					41460: ["青云谱区"],
					41461: ["湾里区"],
					41462: ["青山湖区"]
				}],
				1703: ["新余市", 0,
				{
					1702: ["分宜县"],
					41472: ["渝水区"]
				}],
				1707: ["九江市", 0,
				{
					1708: ["湖口县"],
					1709: ["星子县"],
					1710: ["修水县"],
					1711: ["瑞昌市"],
					1712: ["德安县"],
					1713: ["彭泽县"],
					1714: ["永修县"],
					1715: ["庐山区"],
					1716: ["都昌县"],
					1717: ["武宁县"],
					41470: ["浔阳区"],
					41471: ["九江县"],
					42291: ["共青城市"]
				}],
				1719: ["上饶市", 0,
				{
					1718: ["上饶县"],
					1720: ["广丰县"],
					1735: ["婺源县"],
					1736: ["德兴市"],
					1737: ["鄱阳县"],
					1738: ["弋阳县"],
					1739: ["玉山县"],
					1785: ["万年县"],
					1786: ["余干县"],
					1787: ["横峰县"],
					41478: ["信州区"],
					41479: ["铅山县"]
				}],
				1722: ["宜春市", 0,
				{
					1750: ["宜丰县"],
					1751: ["上高县"],
					1752: ["樟树市"],
					1753: ["奉新县"],
					1754: ["靖安县"],
					1755: ["高安市"],
					1756: ["万载县"],
					1757: ["丰城市"],
					1758: ["铜鼓县"],
					41477: ["袁州区"]
				}],
				1723: ["吉安市", 0,
				{
					1724: ["吉安县"],
					1729: ["新干县"],
					1759: ["井冈山市"],
					1760: ["吉水县"],
					1761: ["泰和县"],
					1762: ["安福县"],
					1763: ["永新县"],
					1765: ["万安县"],
					1766: ["永丰县"],
					1767: ["峡江县"],
					1768: ["遂川县"],
					41475: ["吉州区"],
					41476: ["青原区"]
				}],
				1726: ["赣州市", 0,
				{
					1725: ["赣县"],
					1769: ["于都县"],
					1770: ["兴国县"],
					1771: ["宁都县"],
					1772: ["石城县"],
					1773: ["瑞金市"],
					1774: ["会昌县"],
					1775: ["大余县"],
					1776: ["上犹县"],
					1777: ["崇义县"],
					1778: ["信丰县"],
					1779: ["龙南县"],
					1780: ["定南县"],
					1781: ["全南县"],
					1782: ["安远县"],
					1783: ["寻乌县"],
					1784: ["南康市"],
					41474: ["章贡区"]
				}],
				1727: ["景德镇市", 0,
				{
					1734: ["乐平市"],
					41463: ["昌江区"],
					41464: ["珠山区"],
					41465: ["浮梁县"]
				}],
				1728: ["萍乡市", 0,
				{
					1764: ["莲花县"],
					41466: ["安源区"],
					41467: ["湘东区"],
					41468: ["上栗县"],
					41469: ["芦溪县"]
				}],
				1731: ["鹰潭市", 0,
				{
					1732: ["贵溪市"],
					1733: ["余江县"],
					41473: ["月湖区"]
				}],
				1788: ["抚州市", 0,
				{
					1721: ["临川区"],
					1740: ["资溪县"],
					1741: ["广昌县"],
					1742: ["东乡县"],
					1743: ["金溪县"],
					1744: ["崇仁县"],
					1745: ["宜黄县"],
					1746: ["乐安县"],
					1747: ["南城县"],
					1748: ["南丰县"],
					1749: ["黎川县"]
				}]
			}],
			18: ["湖北", 0,
			{
				1800: ["武汉市", 0,
				{
					1802: ["汉阳区"],
					1803: ["黄陂区"],
					1804: ["新洲区"],
					41586: ["江岸区"],
					41587: ["江汉区"],
					41588: ["硚口区"],
					41589: ["武昌区"],
					41590: ["青山区"],
					41591: ["洪山区"],
					41592: ["东西湖区"],
					41593: ["汉南区"],
					41594: ["蔡甸区"],
					41595: ["江夏区"]
				}],
				1805: ["襄阳市", 0,
				{
					1806: ["襄州区"],
					1820: ["枣阳市"],
					1822: ["宜城市"],
					1824: ["保康县"],
					1825: ["谷城县"],
					1826: ["老河口市"],
					41608: ["襄城区"],
					41609: ["樊城区"],
					41610: ["南漳县"]
				}],
				1807: ["鄂州市", 0,
				{
					41611: ["梁子湖区"],
					41612: ["华容区"],
					41613: ["鄂城区"]
				}],
				1808: ["孝感市", 0,
				{
					1829: ["大悟县"],
					1830: ["汉川市"],
					1831: ["应城市"],
					1832: ["云梦县"],
					1833: ["安陆市"],
					41617: ["孝南区"],
					41618: ["孝昌县"]
				}],
				1809: ["黄冈市", 0,
				{
					1835: ["麻城市"],
					1836: ["红安县"],
					1837: ["浠水县"],
					1838: ["罗田县"],
					1839: ["英山县"],
					1841: ["黄梅县"],
					1842: ["武穴市"],
					41620: ["黄州区"],
					41621: ["团风县"],
					41622: ["蕲春县"]
				}],
				1811: ["黄石市", 0,
				{
					1810: ["大冶市"],
					1843: ["阳新县"],
					41596: ["黄石港区"],
					41597: ["西塞山区"],
					41598: ["下陆区"],
					41599: ["铁山区"]
				}],
				1812: ["咸宁市", 0,
				{
					1844: ["通山县"],
					1845: ["崇阳县"],
					1846: ["通城县"],
					1848: ["嘉鱼县"],
					41623: ["咸安区"],
					41624: ["赤壁市"]
				}],
				1815: ["宜昌市", 0,
				{
					1857: ["远安县"],
					1858: ["当阳市"],
					1859: ["枝江市"],
					1860: ["宜都市"],
					1861: ["长阳土家族自治县"],
					1862: ["五峰土家族自治县"],
					1864: ["兴山县"],
					41602: ["西陵区"],
					41603: ["伍家岗区"],
					41604: ["点军区"],
					41605: ["猇亭区"],
					41606: ["夷陵区"],
					41607: ["秭归县"]
				}],
				1818: ["十堰市", 0,
				{
					1872: ["郧县"],
					1873: ["丹江口市"],
					1874: ["房县"],
					1876: ["竹山县"],
					1877: ["竹溪县"],
					1878: ["郧西县"],
					41600: ["茅箭区"],
					41601: ["张湾区"]
				}],
				1819: ["荆门市", 0,
				{
					1855: ["钟祥市"],
					1856: ["京山县"],
					41614: ["东宝区"],
					41615: ["掇刀区"],
					41616: ["沙洋县"]
				}],
				1821: ["随州市", 0,
				{
					1834: ["广水市"],
					41625: ["曾都区"],
					42292: ["随县"]
				}],
				1828: ["仙桃市"],
				1849: ["天门市"],
				1850: ["潜江市"],
				1875: ["神农架林区"],
				1879: ["荆州市", 0,
				{
					1813: ["江陵县"],
					1814: ["沙市区"],
					1827: ["洪湖市"],
					1851: ["监利县"],
					1852: ["石首市"],
					1853: ["公安县"],
					1854: ["松滋市"],
					41619: ["荆州区"]
				}],
				41626: ["恩施土家族苗族自治州", 0,
				{
					1817: ["恩施市"],
					1865: ["建始县"],
					1866: ["巴东县"],
					1867: ["鹤峰县"],
					1868: ["宣恩县"],
					1869: ["来凤县"],
					1870: ["咸丰县"],
					1871: ["利川市"]
				}]
			}],
			19: ["湖南", 0,
			{
				1900: ["长沙市", 0,
				{
					1901: ["长沙县"],
					1905: ["望城县"],
					1906: ["宁乡县"],
					1907: ["浏阳市"],
					41627: ["芙蓉区"],
					41628: ["天心区"],
					41629: ["岳麓区"],
					41630: ["开福区"],
					41631: ["雨花区"]
				}],
				1902: ["岳阳市", 0,
				{
					1903: ["岳阳县"],
					1904: ["临湘市"],
					1930: ["湘阴县"],
					1931: ["华容县"],
					1932: ["平江县"],
					1933: ["汨罗市"],
					41650: ["岳阳楼区"],
					41651: ["云溪区"],
					41652: ["君山区"]
				}],
				1908: ["湘潭市", 0,
				{
					1909: ["韶山市"],
					1910: ["湘乡市"],
					41638: ["雨湖区"],
					41639: ["岳塘区"],
					41640: ["湘潭县"]
				}],
				1911: ["株洲市", 0,
				{
					1912: ["株洲县"],
					1955: ["茶陵县"],
					1957: ["醴陵市"],
					41632: ["荷塘区"],
					41633: ["芦淞区"],
					41634: ["石峰区"],
					41635: ["天元区"],
					41636: ["攸县"],
					41637: ["炎陵县"]
				}],
				1913: ["衡阳市", 0,
				{
					1914: ["衡阳县"],
					1915: ["衡南县"],
					1958: ["耒阳市"],
					1959: ["常宁市"],
					1960: ["衡东县"],
					1961: ["衡山县"],
					1962: ["祁东县"],
					41641: ["珠晖区"],
					41642: ["雁峰区"],
					41643: ["石鼓区"],
					41644: ["蒸湘区"],
					41645: ["南岳区"]
				}],
				1916: ["郴州市", 0,
				{
					1963: ["资兴市"],
					1964: ["桂东县"],
					1965: ["汝城县"],
					1966: ["临武县"],
					1967: ["嘉禾县"],
					1968: ["安仁县"],
					1969: ["桂阳县"],
					1970: ["永兴县"],
					1971: ["宜章县"],
					41660: ["北湖区"],
					41661: ["苏仙区"]
				}],
				1918: ["常德市", 0,
				{
					1917: ["桃源县"],
					1919: ["汉寿县"],
					1972: ["石门县"],
					1973: ["澧县"],
					1974: ["津市市"],
					1975: ["安乡县"],
					1976: ["临澧县"],
					41653: ["武陵区"],
					41654: ["鼎城区"]
				}],
				1920: ["益阳市", 0,
				{
					1921: ["桃江县"],
					1977: ["安化县"],
					1978: ["南县"],
					41657: ["资阳区"],
					41658: ["赫山区"],
					41659: ["沅江市"]
				}],
				1922: ["娄底市", 0,
				{
					1979: ["双峰县"],
					1980: ["冷水江市"],
					1981: ["新化县"],
					1982: ["涟源市"],
					41665: ["娄星区"]
				}],
				1925: ["邵阳市", 0,
				{
					1923: ["邵东县"],
					1924: ["新邵县"],
					1926: ["邵阳县"],
					1994: ["新宁县"],
					1995: ["城步苗族自治县"],
					1996: ["绥宁县"],
					1998: ["洞口县"],
					1999: ["隆回县"],
					41646: ["双清区"],
					41647: ["大祥区"],
					41648: ["北塔区"],
					41649: ["武冈市"]
				}],
				1927: ["永州市", 0,
				{
					1934: ["冷水滩区"],
					1935: ["东安县"],
					1936: ["祁阳县"],
					1937: ["新田县"],
					1938: ["宁远县"],
					1939: ["蓝山县"],
					1940: ["江华瑶族自治县"],
					1941: ["江永县"],
					1942: ["道县"],
					1943: ["双牌县"],
					41662: ["零陵区"]
				}],
				1928: ["怀化市", 0,
				{
					1929: ["麻阳苗族自治县"],
					1944: ["芷江侗族自治县"],
					1946: ["溆浦县"],
					1947: ["通道侗族自治县"],
					1948: ["靖州苗族侗族自治县"],
					1949: ["会同县"],
					1950: ["新晃侗族自治县"],
					1951: ["辰溪县"],
					1952: ["沅陵县"],
					1953: ["洪江市"],
					41663: ["鹤城区"],
					41664: ["中方县"]
				}],
				19100: ["张家界市", 0,
				{
					1985: ["桑植县"],
					1993: ["慈利县"],
					41655: ["永定区"],
					41656: ["武陵源区"]
				}],
				41666: ["湘西土家族苗族自治州", 0,
				{
					1983: ["凤凰县"],
					1984: ["吉首市"],
					1987: ["龙山县"],
					1988: ["永顺县"],
					1989: ["保靖县"],
					1990: ["花垣县"],
					1991: ["古丈县"],
					1992: ["泸溪县"]
				}]
			}],
			20: ["贵州", 0,
			{
				2e3: ["贵阳市", 0,
				{
					2022: ["清镇市"],
					2023: ["修文县"],
					2025: ["开阳县"],
					41918: ["南明区"],
					41919: ["云岩区"],
					41920: ["花溪区"],
					41921: ["乌当区"],
					41922: ["白云区"],
					41923: ["小河区"],
					41924: ["息烽县"]
				}],
				2001: ["遵义市", 0,
				{
					2010: ["赤水市"],
					2011: ["习水县"],
					2012: ["仁怀市"],
					2013: ["遵义县"],
					2014: ["绥阳县"],
					2015: ["湄潭县"],
					2016: ["凤冈县"],
					2017: ["务川仡佬族苗族自治县"],
					2056: ["余庆县"],
					41927: ["红花岗区"],
					41928: ["汇川区"],
					41929: ["桐梓县"],
					41930: ["正安县"],
					41931: ["道真仡佬族苗族自治县"]
				}],
				2002: ["安顺市", 0,
				{
					2018: ["平坝县"],
					2019: ["紫云苗族布依族自治县"],
					2020: ["镇宁布依族苗族自治县"],
					2021: ["普定县"],
					41932: ["西秀区"],
					41933: ["关岭布依族苗族自治县"]
				}],
				2007: ["六盘水市", 0,
				{
					2051: ["六枝特区"],
					2052: ["盘县"],
					41925: ["钟山区"],
					41926: ["水城县"]
				}],
				41934: ["铜仁市", 0,
				{
					2041: ["玉屏侗族自治县"],
					2042: ["石阡县"],
					41935: ["江口县"],
					41936: ["思南县"],
					41937: ["印江土家族苗族自治县"],
					41938: ["德江县"],
					41939: ["沿河土家族自治县"],
					41940: ["松桃苗族自治县"],
					41941: ["万山特区"],
					42294: ["碧江区"]
				}],
				41942: ["黔西南布依族苗族自治州", 0,
				{
					2008: ["兴义市"],
					41943: ["兴仁县"],
					41944: ["普安县"],
					41945: ["晴隆县"],
					41946: ["贞丰县"],
					41947: ["望谟县"],
					41948: ["册亨县"],
					41949: ["安龙县"]
				}],
				41950: ["毕节市", 0,
				{
					2043: ["威宁彝族回族苗族自治县"],
					2044: ["赫章县"],
					2045: ["纳雍县"],
					2046: ["黔西县"],
					2047: ["大方县"],
					2048: ["金沙县"],
					2049: ["织金县"],
					42293: ["七星关区"]
				}],
				41951: ["黔东南苗族侗族自治州", 0,
				{
					2004: ["凯里市"],
					2034: ["黄平县"],
					2035: ["施秉县"],
					2036: ["镇远县"],
					2037: ["天柱县"],
					2038: ["锦屏县"],
					2039: ["黎平县"],
					2040: ["从江县"],
					2050: ["剑河县"],
					2053: ["雷山县"],
					2054: ["台江县"],
					41952: ["三穗县"],
					41953: ["岑巩县"],
					41954: ["榕江县"],
					41955: ["麻江县"],
					41956: ["丹寨县"]
				}],
				41957: ["黔南布依族苗族自治州", 0,
				{
					2003: ["都匀市"],
					2026: ["贵定县"],
					2027: ["福泉市"],
					2028: ["瓮安县"],
					2029: ["三都水族自治县"],
					2030: ["独山县"],
					2031: ["平塘县"],
					2032: ["惠水县"],
					2033: ["龙里县"],
					41958: ["荔波县"],
					41959: ["罗甸县"],
					41960: ["长顺县"]
				}]
			}],
			21: ["四川", 0,
			{
				2100: ["成都市", 0,
				{
					2108: ["温江区"],
					2128: ["金堂县"],
					2129: ["双流县"],
					2135: ["新津县"],
					2145: ["蒲江县"],
					2146: ["郫县"],
					2147: ["新都区"],
					2149: ["都江堰市"],
					2151: ["大邑县"],
					2152: ["邛崃市"],
					41815: ["锦江区"],
					41816: ["青羊区"],
					41817: ["金牛区"],
					41818: ["武侯区"],
					41819: ["成华区"],
					41820: ["龙泉驿区"],
					41821: ["青白江区"],
					41822: ["彭州市"],
					41823: ["崇州市"]
				}],
				2105: ["攀枝花市", 0,
				{
					2143: ["米易县"],
					2144: ["盐边县"],
					41829: ["东区"],
					41830: ["西区"],
					41831: ["仁和区"]
				}],
				2106: ["自贡市", 0,
				{
					2130: ["荣县"],
					41824: ["自流井区"],
					41825: ["贡井区"],
					41826: ["大安区"],
					41827: ["沿滩区"],
					41828: ["富顺县"]
				}],
				2109: ["绵阳市", 0,
				{
					2153: ["平武县"],
					2155: ["安县"],
					2156: ["江油市"],
					2157: ["梓潼县"],
					2165: ["三台县"],
					2168: ["盐亭县"],
					41841: ["涪城区"],
					41842: ["游仙区"],
					41843: ["北川羌族自治县"]
				}],
				2110: ["南充市", 0,
				{
					2162: ["西充县"],
					2170: ["南部县"],
					2171: ["阆中市"],
					2173: ["营山县"],
					2174: ["蓬安县"],
					2175: ["仪陇县"],
					41859: ["顺庆区"],
					41860: ["高坪区"],
					41861: ["嘉陵区"]
				}],
				2111: ["达州市", 0,
				{
					2180: ["宣汉县"],
					2181: ["开江县"],
					2182: ["万源市"],
					2183: ["大竹县"],
					2184: ["渠县"],
					21116: ["达县"],
					41873: ["通川区"]
				}],
				2114: ["泸州市", 0,
				{
					41832: ["江阳区"],
					41833: ["纳溪区"],
					41834: ["龙马潭区"],
					41835: ["泸县"],
					41836: ["合江县"],
					41837: ["叙永县"],
					41838: ["古蔺县"]
				}],
				2115: ["宜宾市", 0,
				{
					2116: ["宜宾县"],
					41863: ["翠屏区"],
					41864: ["南溪县"],
					41865: ["江安县"],
					41866: ["长宁县"],
					41867: ["高县"],
					41868: ["珙县"],
					41869: ["筠连县"],
					41870: ["兴文县"],
					41871: ["屏山县"]
				}],
				2117: ["内江市", 0,
				{
					41850: ["市中区"],
					41851: ["东兴区"],
					41852: ["威远县"],
					41853: ["资中县"],
					41854: ["隆昌县"]
				}],
				2118: ["乐山市", 0,
				{
					2188: ["峨眉山市"],
					2190: ["井研县"],
					2193: ["沐川县"],
					2197: ["马边彝族自治县"],
					2198: ["犍为县"],
					21100: ["夹江县"],
					21101: ["金口河区"],
					41855: ["市中区"],
					41856: ["沙湾区"],
					41857: ["五通桥区"],
					41858: ["峨边彝族自治县"]
				}],
				2120: ["雅安市", 0,
				{
					2192: ["宝兴县"],
					2199: ["石棉县"],
					21108: ["名山县"],
					21109: ["荥经县"],
					21110: ["汉源县"],
					21111: ["天全县"],
					21112: ["芦山县"],
					41874: ["雨城区"]
				}],
				2122: ["德阳市", 0,
				{
					2123: ["中江县"],
					2124: ["绵竹市"],
					2125: ["广汉市"],
					2126: ["什邡市"],
					41839: ["旌阳区"],
					41840: ["罗江县"]
				}],
				2127: ["广元市", 0,
				{
					2158: ["剑阁县"],
					2160: ["旺苍县"],
					2161: ["青川县"],
					2172: ["苍溪县"],
					41844: ["利州区"],
					41845: ["元坝区"],
					41846: ["朝天区"]
				}],
				2163: ["遂宁市", 0,
				{
					2166: ["蓬溪县"],
					2167: ["射洪县"],
					41847: ["船山区"],
					41848: ["安居区"],
					41849: ["大英县"]
				}],
				2178: ["广安市", 0,
				{
					2169: ["华蓥市"],
					2176: ["岳池县"],
					2177: ["武胜县"],
					2185: ["邻水县"],
					41872: ["广安区"]
				}],
				2187: ["眉山市", 0,
				{
					2189: ["仁寿县"],
					2191: ["洪雅县"],
					2194: ["彭山县"],
					2195: ["青神县"],
					2196: ["丹棱县"],
					41862: ["东坡区"]
				}],
				21115: ["巴中市", 0,
				{
					2179: ["平昌县"],
					21114: ["通江县"],
					41875: ["巴州区"],
					41876: ["南江县"]
				}],
				21119: ["资阳市", 0,
				{
					2186: ["乐至县"],
					41877: ["雁江区"],
					41878: ["安岳县"],
					41879: ["简阳市"]
				}],
				41880: ["阿坝藏族羌族自治州", 0,
				{
					2121: ["马尔康县"],
					21113: ["汶川县"],
					21117: ["九寨沟县"],
					41881: ["理县"],
					41882: ["茂县"],
					41883: ["松潘县"],
					41884: ["金川县"],
					41885: ["小金县"],
					41886: ["黑水县"],
					41887: ["壤塘县"],
					41888: ["阿坝县"],
					41889: ["若尔盖县"],
					41890: ["红原县"]
				}],
				41891: ["甘孜藏族自治州", 0,
				{
					21118: ["康定县"],
					41892: ["泸定县"],
					41893: ["丹巴县"],
					41894: ["九龙县"],
					41895: ["雅江县"],
					41896: ["道孚县"],
					41897: ["炉霍县"],
					41898: ["甘孜县"],
					41899: ["新龙县"],
					41900: ["德格县"],
					41901: ["白玉县"],
					41902: ["石渠县"],
					41903: ["色达县"],
					41904: ["理塘县"],
					41905: ["巴塘县"],
					41906: ["乡城县"],
					41907: ["稻城县"],
					41908: ["得荣县"]
				}],
				41909: ["凉山彝族自治州", 0,
				{
					2119: ["西昌市"],
					2154: ["宁南县"],
					2159: ["盐源县"],
					21102: ["会理县"],
					21103: ["会东县"],
					21104: ["冕宁县"],
					21105: ["德昌县"],
					21106: ["雷波县"],
					21107: ["普格县"],
					41910: ["木里藏族自治县"],
					41911: ["布拖县"],
					41912: ["金阳县"],
					41913: ["昭觉县"],
					41914: ["喜德县"],
					41915: ["越西县"],
					41916: ["甘洛县"],
					41917: ["美姑县"]
				}]
			}],
			22: ["云南", 0,
			{
				2200: ["昆明市", 0,
				{
					2202: ["禄劝彝族苗族自治县"],
					2204: ["晋宁县"],
					2205: ["呈贡县"],
					2206: ["富民县"],
					2207: ["嵩明县"],
					2208: ["安宁市"],
					2209: ["宜良县"],
					2248: ["寻甸回族彝族自治县"],
					2249: ["东川区"],
					41961: ["五华区"],
					41962: ["盘龙区"],
					41963: ["官渡区"],
					41964: ["西山区"],
					41965: ["石林彝族自治县"]
				}],
				2201: ["昭通市", 0,
				{
					2250: ["盐津县"],
					2251: ["绥江县"],
					2252: ["水富县"],
					2253: ["镇雄县"],
					2254: ["鲁甸县"],
					2255: ["大关县"],
					2256: ["巧家县"],
					2257: ["彝良县"],
					22112: ["永善县"],
					22113: ["威信县"],
					41970: ["昭阳区"]
				}],
				2217: ["曲靖市", 0,
				{
					2214: ["马龙县"],
					2215: ["师宗县"],
					2216: ["富源县"],
					2258: ["陆良县"],
					2259: ["罗平县"],
					2260: ["宣威市"],
					2261: ["会泽县"],
					41966: ["麒麟区"],
					41967: ["沾益县"]
				}],
				2218: ["保山市", 0,
				{
					2219: ["昌宁县"],
					22103: ["腾冲县"],
					22104: ["龙陵县"],
					22105: ["施甸县"],
					41969: ["隆阳区"]
				}],
				2228: ["玉溪市", 0,
				{
					2221: ["江川县"],
					2222: ["元江哈尼族彝族傣族自治县"],
					2223: ["通海县"],
					2224: ["易门县"],
					2225: ["澄江县"],
					2226: ["峨山彝族自治县"],
					2227: ["华宁县"],
					2229: ["新平彝族傣族自治县"],
					41968: ["红塔区"]
				}],
				2234: ["普洱市", 0,
				{
					2235: ["镇沅彝族哈尼族拉祜族自治县"],
					2241: ["墨江哈尼族自治县"],
					2264: ["澜沧拉祜族自治县"],
					2265: ["景谷傣族彝族自治县"],
					2266: ["江城哈尼族彝族自治县"],
					2267: ["景东彝族自治县"],
					2268: ["西盟佤族自治县"],
					2269: ["孟连傣族拉祜族佤族自治县"],
					2270: ["普洱哈尼族彝族自治县"],
					41973: ["思茅区"]
				}],
				2243: ["临沧市", 0,
				{
					2236: ["镇康县"],
					2237: ["永德县"],
					2240: ["耿马傣族佤族自治县"],
					2244: ["沧源佤族自治县"],
					2245: ["凤庆县"],
					2246: ["云县"],
					2247: ["双江拉祜族佤族布朗族傣族自治县"],
					41974: ["临翔区"]
				}],
				22115: ["丽江市", 0,
				{
					22116: ["宁蒗彝族自治县"],
					22117: ["华坪县"],
					22118: ["永胜县"],
					41971: ["古城区"],
					41972: ["玉龙纳西族自治县"]
				}],
				22124: ["西双版纳傣族自治州", 0,
				{
					2263: ["勐海县"],
					2271: ["景洪市"],
					2272: ["勐腊县"]
				}],
				41975: ["楚雄彝族自治州", 0,
				{
					2231: ["楚雄市"],
					2232: ["姚安县"],
					2233: ["双柏县"],
					2288: ["永仁县"],
					2289: ["禄丰县"],
					2290: ["大姚县"],
					2291: ["南华县"],
					2292: ["牟定县"],
					2293: ["武定县"],
					2294: ["元谋县"]
				}],
				41976: ["红河哈尼族彝族自治州", 0,
				{
					2213: ["个旧市"],
					2273: ["元阳县"],
					2274: ["石屏县"],
					2275: ["弥勒县"],
					2276: ["红河县"],
					2277: ["开远市"],
					2278: ["蒙自县"],
					2279: ["建水县"],
					2280: ["河口瑶族自治县"],
					2281: ["泸西县"],
					2282: ["屏边苗族自治县"],
					22120: ["金平苗族瑶族傣族自治县"],
					22123: ["绿春县"]
				}],
				41977: ["文山壮族苗族自治州", 0,
				{
					2220: ["文山县"],
					2242: ["麻栗坡县"],
					2262: ["砚山县"],
					2284: ["广南县"],
					2285: ["富宁县"],
					2286: ["马关县"],
					2287: ["西畴县"],
					41978: ["丘北县"]
				}],
				41979: ["大理白族自治州", 0,
				{
					2210: ["宾川县"],
					2211: ["弥渡县"],
					2212: ["大理市"],
					2295: ["南涧彝族自治县"],
					2296: ["剑川县"],
					2297: ["鹤庆县"],
					2298: ["祥云县"],
					2299: ["漾濞彝族自治县"],
					22100: ["洱源县"],
					22101: ["永平县"],
					22102: ["巍山彝族回族自治县"],
					22114: ["云龙县"]
				}],
				41980: ["德宏傣族景颇族自治州", 0,
				{
					22106: ["梁河县"],
					22107: ["盈江县"],
					22109: ["瑞丽市"],
					22110: ["陇川县"],
					22111: ["潞西市"]
				}],
				41981: ["怒江傈僳族自治州", 0,
				{
					2238: ["福贡县"],
					2239: ["兰坪白族普米族自治县"],
					22121: ["泸水县"],
					41982: ["贡山独龙族怒族自治县"]
				}],
				41983: ["迪庆藏族自治州", 0,
				{
					41984: ["香格里拉县"],
					41985: ["德钦县"],
					41986: ["维西傈僳族自治县"]
				}]
			}],
			23: ["新疆", 1,
			{
				2300: ["乌鲁木齐市", 0,
				{
					42137: ["天山区"],
					42138: ["沙依巴克区"],
					42139: ["新市区"],
					42140: ["水磨沟区"],
					42141: ["头屯河区"],
					42142: ["达坂城区"],
					42144: ["乌鲁木齐县"],
					42250: ["米东区"]
				}],
				2301: ["克拉玛依市", 0,
				{
					42145: ["独山子区"],
					42146: ["克拉玛依区"],
					42147: ["白碱滩区"],
					42148: ["乌尔禾区"]
				}],
				2302: ["石河子市"],
				42149: ["吐鲁番地区", 0,
				{
					2305: ["吐鲁番市"],
					42150: ["鄯善县"],
					42151: ["托克逊县"]
				}],
				42152: ["哈密地区", 0,
				{
					2304: ["哈密市"],
					42153: ["巴里坤哈萨克自治县"],
					42154: ["伊吾县"]
				}],
				42155: ["昌吉回族自治州", 0,
				{
					42156: ["昌吉市"],
					42157: ["阜康市"],
					42159: ["呼图壁县"],
					42160: ["玛纳斯县"],
					42161: ["奇台县"],
					42162: ["吉木萨尔县"],
					42163: ["木垒哈萨克自治县"]
				}],
				42164: ["博尔塔拉蒙古自治州", 0,
				{
					42165: ["博乐市"],
					42166: ["精河县"],
					42167: ["温泉县"]
				}],
				42168: ["巴音郭楞蒙古自治州", 0,
				{
					42169: ["库尔勒市"],
					42170: ["轮台县"],
					42171: ["尉犁县"],
					42172: ["若羌县"],
					42173: ["且末县"],
					42174: ["焉耆回族自治县"],
					42175: ["和静县"],
					42176: ["和硕县"],
					42177: ["博湖县"]
				}],
				42178: ["阿克苏地区", 0,
				{
					42179: ["阿克苏市"],
					42180: ["温宿县"],
					42181: ["库车县"],
					42182: ["沙雅县"],
					42183: ["新和县"],
					42184: ["拜城县"],
					42185: ["乌什县"],
					42186: ["阿瓦提县"],
					42187: ["柯坪县"]
				}],
				42188: ["克孜勒苏柯尔克孜自治州", 0,
				{
					42189: ["阿图什市"],
					42190: ["阿克陶县"],
					42191: ["阿合奇县"],
					42192: ["乌恰县"]
				}],
				42193: ["喀什地区", 0,
				{
					2303: ["喀什市"],
					42194: ["疏附县"],
					42195: ["疏勒县"],
					42196: ["英吉沙县"],
					42197: ["泽普县"],
					42198: ["莎车县"],
					42199: ["叶城县"],
					42200: ["麦盖提县"],
					42201: ["岳普湖县"],
					42202: ["伽师县"],
					42203: ["巴楚县"],
					42204: ["塔什库尔干塔吉克自治县"]
				}],
				42205: ["和田地区", 0,
				{
					42206: ["和田市"],
					42207: ["和田县"],
					42208: ["墨玉县"],
					42209: ["皮山县"],
					42210: ["洛浦县"],
					42211: ["策勒县"],
					42212: ["于田县"],
					42213: ["民丰县"]
				}],
				42214: ["伊犁哈萨克自治州", 0,
				{
					2306: ["伊宁市"],
					42215: ["奎屯市"],
					42216: ["伊宁县"],
					42217: ["察布查尔锡伯自治县"],
					42218: ["霍城县"],
					42219: ["巩留县"],
					42220: ["新源县"],
					42221: ["昭苏县"],
					42222: ["特克斯县"],
					42223: ["尼勒克县"]
				}],
				42224: ["塔城地区", 0,
				{
					42225: ["塔城市"],
					42226: ["乌苏市"],
					42227: ["额敏县"],
					42228: ["沙湾县"],
					42229: ["托里县"],
					42230: ["裕民县"],
					42231: ["和布克赛尔蒙古自治县"]
				}],
				42232: ["阿勒泰地区", 0,
				{
					42233: ["阿勒泰市"],
					42234: ["布尔津县"],
					42235: ["富蕴县"],
					42236: ["福海县"],
					42237: ["哈巴河县"],
					42238: ["青河县"],
					42239: ["吉木乃县"]
				}],
				42240: ["阿拉尔市"],
				42241: ["图木舒克市"],
				42242: ["五家渠市"]
			}],
			24: ["宁夏", 1,
			{
				2400: ["银川市", 0,
				{
					2401: ["贺兰县"],
					2402: ["永宁县"],
					2412: ["灵武市"],
					42123: ["兴庆区"],
					42124: ["西夏区"],
					42125: ["金凤区"]
				}],
				2404: ["石嘴山市", 0,
				{
					2403: ["平罗县"],
					42126: ["大武口区"],
					42127: ["惠农区"]
				}],
				2406: ["吴忠市", 0,
				{
					2407: ["青铜峡市"],
					2409: ["盐池县"],
					42128: ["利通区"],
					42129: ["同心县"],
					42295: ["红寺堡区"]
				}],
				2408: ["固原市", 0,
				{
					42130: ["原州区"],
					42131: ["西吉县"],
					42132: ["隆德县"],
					42133: ["泾源县"],
					42134: ["彭阳县"]
				}],
				2411: ["中卫市", 0,
				{
					2410: ["中宁县"],
					42135: ["沙坡头区"],
					42136: ["海原县"]
				}]
			}],
			25: ["青海", 0,
			{
				2500: ["西宁市", 0,
				{
					2501: ["大通回族土族自治县"],
					2512: ["湟中县"],
					2514: ["湟源县"],
					42098: ["城东区"],
					42099: ["城中区"],
					42100: ["城西区"],
					42101: ["城北区"]
				}],
				2528: ["海东地区", 0,
				{
					2502: ["平安县"],
					2511: ["乐都县"],
					2513: ["互助土族自治县"],
					2515: ["民和回族土族自治县"],
					2516: ["循化撒拉族自治县"],
					2517: ["化隆回族自治县"]
				}],
				42102: ["海北藏族自治州", 0,
				{
					2508: ["门源回族自治县"],
					2529: ["海晏县"],
					42103: ["祁连县"],
					42104: ["刚察县"]
				}],
				42105: ["黄南藏族自治州", 0,
				{
					2503: ["同仁县"],
					2510: ["河南蒙古族自治县"],
					2518: ["尖扎县"],
					2519: ["泽库县"]
				}],
				42106: ["海南藏族自治州", 0,
				{
					2504: ["共和县"],
					2526: ["贵德县"],
					42107: ["同德县"],
					42108: ["兴海县"],
					42109: ["贵南县"]
				}],
				42110: ["果洛藏族自治州", 0,
				{
					2505: ["玛沁县"],
					42111: ["班玛县"],
					42112: ["甘德县"],
					42113: ["达日县"],
					42114: ["久治县"],
					42115: ["玛多县"]
				}],
				42116: ["玉树藏族自治州", 0,
				{
					2506: ["玉树县"],
					42117: ["杂多县"],
					42118: ["称多县"],
					42119: ["治多县"],
					42120: ["囊谦县"],
					42121: ["曲麻莱县"]
				}],
				42122: ["海西蒙古族藏族自治州", 0,
				{
					2507: ["德令哈市"],
					2509: ["格尔木市"],
					2521: ["乌兰县"],
					2522: ["都兰县"],
					2523: ["天峻县"]
				}]
			}],
			26: ["西藏", 1,
			{
				2600: ["拉萨市", 0,
				{
					41987: ["城关区"],
					41988: ["林周县"],
					41989: ["当雄县"],
					41990: ["尼木县"],
					41991: ["曲水县"],
					41992: ["堆龙德庆县"],
					41993: ["达孜县"],
					41994: ["墨竹工卡县"]
				}],
				2602: ["山南", 0,
				{
					42001: ["乃东县"],
					42002: ["扎囊县"],
					42003: ["贡嘎县"],
					42004: ["桑日县"],
					42005: ["琼结县"],
					42006: ["曲松县"],
					42007: ["措美县"],
					42008: ["洛扎县"],
					42009: ["加查县"],
					42010: ["隆子县"],
					42011: ["错那县"],
					42012: ["浪卡子县"]
				}],
				2615: ["阿里地区", 0,
				{
					2614: ["措勤县"],
					42037: ["普兰县"],
					42038: ["札达县"],
					42039: ["噶尔县"],
					42040: ["日土县"],
					42041: ["革吉县"],
					42042: ["改则县"]
				}],
				41995: ["昌都地区", 0,
				{
					2604: ["昌都县"],
					2605: ["江达县"],
					2606: ["芒康县"],
					2607: ["八宿县"],
					2608: ["洛隆县"],
					2609: ["丁青县"],
					41996: ["贡觉县"],
					41997: ["类乌齐县"],
					41998: ["察雅县"],
					41999: ["左贡县"],
					42e3: ["边坝县"]
				}],
				42013: ["日喀则地区", 0,
				{
					2601: ["日喀则市"],
					42014: ["南木林县"],
					42015: ["江孜县"],
					42016: ["定日县"],
					42017: ["萨迦县"],
					42018: ["拉孜县"],
					42019: ["昂仁县"],
					42020: ["谢通门县"],
					42021: ["白朗县"],
					42022: ["仁布县"],
					42023: ["康马县"],
					42024: ["定结县"],
					42025: ["仲巴县"],
					42026: ["亚东县"],
					42027: ["吉隆县"],
					42028: ["聂拉木县"],
					42029: ["萨嘎县"],
					42030: ["岗巴县"]
				}],
				42031: ["那曲地区", 0,
				{
					2610: ["巴青县"],
					2611: ["比如县"],
					2612: ["那曲县"],
					2613: ["班戈县"],
					2616: ["索县"],
					42032: ["嘉黎县"],
					42033: ["聂荣县"],
					42034: ["安多县"],
					42035: ["申扎县"],
					42036: ["尼玛县"]
				}],
				42043: ["林芝地区", 0,
				{
					2603: ["林芝县"],
					42044: ["工布江达县"],
					42045: ["米林县"],
					42046: ["墨脱县"],
					42047: ["波密县"],
					42048: ["察隅县"],
					42049: ["朗县"]
				}]
			}],
			27: ["广西", 1,
			{
				2700: ["南宁市", 0,
				{
					2702: ["武鸣县"],
					2703: ["宾阳县"],
					2704: ["横县"],
					2706: ["邕宁区"],
					2748: ["上林县"],
					2752: ["马山县"],
					2756: ["隆安县"],
					41736: ["兴宁区"],
					41737: ["青秀区"],
					41738: ["江南区"],
					41739: ["西乡塘区"],
					41740: ["良庆区"]
				}],
				2701: ["防城港市", 0,
				{
					2787: ["上思县"],
					2788: ["防城区"],
					41757: ["港口区"],
					41758: ["东兴市"]
				}],
				2712: ["柳州市", 0,
				{
					2707: ["融安县"],
					2708: ["三江侗族自治县"],
					2709: ["柳城县"],
					2710: ["融水苗族自治县"],
					2713: ["鹿寨县"],
					2714: ["柳江县"],
					41741: ["城中区"],
					41742: ["鱼峰区"],
					41743: ["柳南区"],
					41744: ["柳北区"]
				}],
				2722: ["桂林市", 0,
				{
					2716: ["平乐县"],
					2717: ["永福县"],
					2718: ["恭城瑶族自治县"],
					2719: ["阳朔县"],
					2720: ["临桂县"],
					2721: ["灵川县"],
					2763: ["灌阳县"],
					2764: ["兴安县"],
					2765: ["全州县"],
					2766: ["龙胜各族自治县"],
					2767: ["资源县"],
					41745: ["秀峰区"],
					41746: ["叠彩区"],
					41747: ["象山区"],
					41748: ["七星区"],
					41749: ["雁山区"],
					41750: ["荔浦县"]
				}],
				2723: ["梧州市", 0,
				{
					2724: ["苍梧县"],
					2725: ["藤县"],
					2726: ["蒙山县"],
					2727: ["岑溪市"],
					41751: ["万秀区"],
					41752: ["蝶山区"],
					41753: ["长洲区"]
				}],
				2733: ["玉林市", 0,
				{
					2729: ["北流市"],
					2730: ["陆川县"],
					2731: ["博白县"],
					2732: ["容县"],
					41764: ["玉州区"],
					41765: ["兴业县"]
				}],
				2734: ["百色市", 0,
				{
					2768: ["田阳县"],
					2769: ["乐业县"],
					2770: ["靖西县"],
					2771: ["田东县"],
					2772: ["平果县"],
					2773: ["德保县"],
					2774: ["那坡县"],
					2775: ["田林县"],
					2776: ["隆林各族自治县"],
					2777: ["西林县"],
					2778: ["凌云县"],
					41766: ["右江区"]
				}],
				2735: ["钦州市", 0,
				{
					2785: ["灵山县"],
					2786: ["浦北县"],
					41759: ["钦南区"],
					41760: ["钦北区"]
				}],
				2736: ["河池市", 0,
				{
					2738: ["罗城仫佬族自治县"],
					2739: ["南丹县"],
					2740: ["环江毛南族自治县"],
					2743: ["都安瑶族自治县"],
					2744: ["东兰县"],
					2746: ["天峨县"],
					2747: ["巴马瑶族自治县"],
					41768: ["金城江区"],
					41769: ["凤山县"],
					41770: ["大化瑶族自治县"],
					41771: ["宜州市"]
				}],
				2741: ["北海市", 0,
				{
					2742: ["合浦县"],
					41754: ["海城区"],
					41755: ["银海区"],
					41756: ["铁山港区"]
				}],
				2750: ["崇左市", 0,
				{
					2749: ["凭祥市"],
					2751: ["宁明县"],
					2753: ["龙州县"],
					2754: ["大新县"],
					2755: ["天等县"],
					2757: ["扶绥县"],
					41773: ["江洲区"]
				}],
				2758: ["来宾市", 0,
				{
					2711: ["金秀瑶族自治县"],
					2759: ["忻城县"],
					2760: ["合山市"],
					2761: ["武宣县"],
					2762: ["象州县"],
					41772: ["兴宾区"]
				}],
				2779: ["贺州市", 0,
				{
					2728: ["昭平县"],
					2780: ["钟山县"],
					2781: ["富川瑶族自治县"],
					41767: ["八步区"]
				}],
				2784: ["贵港市", 0,
				{
					2782: ["桂平市"],
					2783: ["平南县"],
					41761: ["港北区"],
					41762: ["港南区"],
					41763: ["覃塘区"]
				}]
			}],
			28: ["广东", 0,
			{
				2800: ["深圳市", 0,
				{
					41678: ["罗湖区"],
					41679: ["福田区"],
					41680: ["南山区"],
					41681: ["宝安区"],
					41682: ["龙岗区"],
					41683: ["盐田区"]
				}],
				2801: ["广州市", 0,
				{
					2813: ["番禺区"],
					2815: ["从化市"],
					2816: ["增城市"],
					41667: ["荔湾区"],
					41668: ["越秀区"],
					41669: ["海珠区"],
					41670: ["天河区"],
					41671: ["白云区"],
					41672: ["黄埔区"],
					41673: ["花都区"],
					41674: ["南沙区"],
					41675: ["萝岗区"]
				}],
				2802: ["珠海市", 0,
				{
					2847: ["斗门区"],
					41684: ["香洲区"],
					41685: ["金湾区"]
				}],
				2803: ["中山市"],
				2804: ["汕头市", 0,
				{
					2845: ["澄海区"],
					2846: ["南澳县"],
					2873: ["潮阳区"],
					41686: ["龙湖区"],
					41687: ["金平区"],
					41688: ["濠江区"],
					41689: ["潮南区"]
				}],
				2805: ["汕尾市", 0,
				{
					41708: ["城区"],
					41709: ["海丰县"],
					41710: ["陆河县"],
					41711: ["陆丰市"]
				}],
				2809: ["茂名市", 0,
				{
					41698: ["茂南区"],
					41699: ["茂港区"],
					41700: ["电白县"],
					41701: ["高州市"],
					41702: ["化州市"],
					41703: ["信宜市"]
				}],
				2810: ["东莞市"],
				2817: ["江门市", 0,
				{
					2818: ["鹤山市"],
					2819: ["新会区"],
					2820: ["台山市"],
					2821: ["开平市"],
					2822: ["恩平市"],
					41691: ["蓬江区"],
					41692: ["江海区"]
				}],
				2823: ["韶关市", 0,
				{
					2824: ["乐昌市"],
					2825: ["仁化县"],
					2826: ["始兴县"],
					2827: ["翁源县"],
					2828: ["南雄市"],
					2829: ["新丰县"],
					2830: ["乳源瑶族自治县"],
					2831: ["曲江区"],
					41676: ["武江区"],
					41677: ["浈江区"]
				}],
				2833: ["惠州市", 0,
				{
					2832: ["博罗县"],
					2834: ["惠阳区"],
					2835: ["惠东县"],
					2836: ["龙门县"],
					41706: ["惠城区"]
				}],
				2837: ["梅州市", 0,
				{
					2838: ["梅县"],
					2839: ["蕉岭县"],
					2840: ["大埔县"],
					2841: ["丰顺县"],
					2842: ["五华县"],
					2843: ["兴宁市"],
					2844: ["平远县"],
					41707: ["梅江区"]
				}],
				2848: ["佛山市", 0,
				{
					2811: ["顺德区"],
					2849: ["南海区"],
					2850: ["三水区"],
					2851: ["高明区"],
					41690: ["禅城区"]
				}],
				2853: ["肇庆市", 0,
				{
					2852: ["高要市"],
					2854: ["封开县"],
					2855: ["德庆县"],
					2856: ["怀集县"],
					2857: ["广宁县"],
					2858: ["四会市"],
					41704: ["端州区"],
					41705: ["鼎湖区"]
				}],
				2859: ["湛江市", 0,
				{
					2861: ["遂溪县"],
					2862: ["廉江市"],
					2863: ["吴川市"],
					2864: ["徐闻县"],
					41693: ["赤坎区"],
					41694: ["霞山区"],
					41695: ["坡头区"],
					41696: ["麻章区"],
					41697: ["雷州市"]
				}],
				2865: ["河源市", 0,
				{
					2806: ["紫金县"],
					2812: ["龙川县"],
					2866: ["东源县"],
					2867: ["连平县"],
					2868: ["和平县"],
					41712: ["源城区"]
				}],
				2869: ["潮州市", 0,
				{
					41723: ["湘桥区"],
					41724: ["潮安县"],
					41725: ["饶平县"]
				}],
				2870: ["阳江市", 0,
				{
					41713: ["江城区"],
					41714: ["阳西县"],
					41715: ["阳东县"],
					41716: ["阳春市"]
				}],
				2871: ["揭阳市", 0,
				{
					41726: ["榕城区"],
					41727: ["揭东县"],
					41728: ["揭西县"],
					41729: ["惠来县"],
					41730: ["普宁市"]
				}],
				2872: ["清远市", 0,
				{
					2807: ["佛冈县"],
					2808: ["英德市"],
					41717: ["清城区"],
					41718: ["阳山县"],
					41719: ["连山壮族瑶族自治县"],
					41720: ["连南瑶族自治县"],
					41721: ["清新县"],
					41722: ["连州市"]
				}],
				2874: ["云浮市", 0,
				{
					41731: ["云城区"],
					41732: ["新兴县"],
					41733: ["郁南县"],
					41734: ["云安县"],
					41735: ["罗定市"]
				}]
			}],
			29: ["福建", 0,
			{
				2900: ["福州市", 0,
				{
					2903: ["罗源县"],
					2904: ["连江县"],
					2905: ["长乐市"],
					2906: ["福清市"],
					2907: ["平潭县"],
					2908: ["永泰县"],
					2909: ["闽清县"],
					41430: ["鼓楼区"],
					41431: ["台江区"],
					41432: ["仓山区"],
					41433: ["马尾区"],
					41434: ["晋安区"],
					41435: ["闽侯县"]
				}],
				2901: ["厦门市", 0,
				{
					2911: ["同安区"],
					41436: ["思明区"],
					41437: ["海沧区"],
					41438: ["湖里区"],
					41439: ["集美区"],
					41440: ["翔安区"]
				}],
				2920: ["宁德市", 0,
				{
					2912: ["福安市"],
					2913: ["柘荣县"],
					2914: ["福鼎市"],
					2915: ["霞浦县"],
					2916: ["古田县"],
					2917: ["屏南县"],
					2918: ["周宁县"],
					2919: ["寿宁县"],
					41457: ["蕉城区"]
				}],
				2921: ["莆田市", 0,
				{
					2923: ["仙游县"],
					41441: ["城厢区"],
					41442: ["涵江区"],
					41443: ["荔城区"],
					41444: ["秀屿区"]
				}],
				2924: ["泉州市", 0,
				{
					2925: ["石狮市"],
					2926: ["晋江市"],
					2927: ["惠安县"],
					2928: ["南安市"],
					2929: ["安溪县"],
					2930: ["永春县"],
					2931: ["德化县"],
					41447: ["鲤城区"],
					41448: ["丰泽区"],
					41449: ["洛江区"],
					41450: ["泉港区"],
					41451: ["金门县"]
				}],
				2932: ["漳州市", 0,
				{
					2933: ["长泰县"],
					2934: ["龙海市"],
					2935: ["漳浦县"],
					2936: ["东山县"],
					2938: ["诏安县"],
					2939: ["平和县"],
					2940: ["南靖县"],
					2941: ["华安县"],
					41452: ["芗城区"],
					41453: ["龙文区"],
					41454: ["云霄县"]
				}],
				2942: ["龙岩市", 0,
				{
					2943: ["漳平市"],
					2944: ["永定县"],
					2945: ["上杭县"],
					2946: ["武平县"],
					2947: ["长汀县"],
					2948: ["连城县"],
					41456: ["新罗区"]
				}],
				2949: ["三明市", 0,
				{
					2950: ["沙县"],
					2951: ["尤溪县"],
					2952: ["大田县"],
					2953: ["永安市"],
					2954: ["清流县"],
					2955: ["宁化县"],
					2956: ["明溪县"],
					2957: ["建宁县"],
					2958: ["泰宁县"],
					2959: ["将乐县"],
					41445: ["梅列区"],
					41446: ["三元区"]
				}],
				2960: ["南平市", 0,
				{
					2902: ["建阳市"],
					2961: ["浦城县"],
					2962: ["松溪县"],
					2963: ["政和县"],
					2964: ["建瓯市"],
					2965: ["顺昌县"],
					2966: ["邵武市"],
					2967: ["光泽县"],
					2968: ["武夷山市"],
					41455: ["延平区"]
				}]
			}],
			30: ["海南", 0,
			{
				3e3: ["海口市", 0,
				{
					41774: ["秀英区"],
					41775: ["龙华区"],
					41776: ["琼山区"],
					41777: ["美兰区"]
				}],
				3001: ["三亚市"],
				3003: ["琼海市"],
				3004: ["儋州市"],
				3005: ["文昌市"],
				3006: ["东方市"],
				3008: ["万宁市"],
				3009: ["定安县"],
				3010: ["屯昌县"],
				3011: ["澄迈县"],
				3012: ["临高县"],
				41778: ["五指山市"],
				41779: ["白沙黎族自治县"],
				41780: ["昌江黎族自治县"],
				41781: ["乐东黎族自治县"],
				41782: ["陵水黎族自治县"],
				41783: ["保亭黎族苗族自治县"],
				41784: ["琼中黎族苗族自治县"],
				41785: ["西沙群岛"],
				41786: ["南沙群岛"],
				41787: ["中沙群岛的岛礁及其海域"]
			}],
			31: ["台湾", 1,
			{
				3100: ["台北市"],
				3101: ["高雄市"],
				3102: ["台中市"],
				3107: ["台南市"],
				3115: ["南投县"],
				42243: ["金门县"]
			}],
			32: ["香港", 1,
			{
				3200: ["香港", 1]
			}],
			33: ["澳门", 1,
			{
				3300: ["澳门", 1]
			}],
			42245: ["海外", 1,
			{
				42246: ["海外", 1]
			}]
		}), window._regionMap
	}
	return e
}), define("components/paipai_region/com", ["require", "components/paipai_region/region_data"], function(e) {
	function t(e) {
		return "string" == typeof e ? document.getElementById(e) : e
	}
	function n(e, t, n) {
		var i = new Option(t, n);
		return e.options[e.options.length] = i, i
	}
	function i(e) {
		function i() {
			o(), r(), a(), l(), c()
		}
		function o() {
			if (d.initValue) for (var e in u) {
				if (e.toString() === d.initValue.toString()) return void(d.provId = d.initValue);
				if ("object" == typeof u[e][2]) {
					var t = e;
					for (var n in u[e][2]) {
						if (n.toString() === d.initValue.toString()) return d.provId = t, void(d.cityId = n);
						var i = u[e][2][n][2];
						if ("object" == typeof i) {
							var s = n;
							for (var o in i) if (o.toString() === d.initValue.toString()) return d.provId = t, d.cityId = s, void(d.areaId = o)
						}
					}
				}
			}
		}
		function a() {
			var e = d.provinceHander;
			if (e) {
				if (e.options.length > 0) return;
				n(e, "请选择省", "");
				for (var t in u) n(e, u[t][0], t);
				d.provId && (e.value = d.provId)
			}
		}
		function l() {
			var e = d.cityHander;
			if (e) {
				if (!d.provId) return;
				var t = u[d.provId][2];
				e.options.length = 0, n(e, "请选择市", "");
				for (var i in t) n(e, t[i][0], i);
				d.cityId && (e.value = d.cityId)
			}
		}
		function c() {
			var e = d.areaHander;
			if (e && d.area) {
				var t;
				if (!d.cityId) return void(e[0].options.length = 0);
				t = u[d.provId][2][d.cityId][2], e.options.length = 0, n(e, "请选择地区", "");
				for (var i in t) n(e, t[i][0], i);
				d.areaId && e.val(d.areaId)
			}
		}
		function r() {
			function e() {
				var e = this.getAttribute("vprovince"),
					n = this.getAttribute("vcity"),
					s = this.getAttribute("varea"),
					o = this.getAttribute("stype"),
					a = this.value,
					l = a;
				d.onSelect(this, o), "province" === o && "" === a && (d.onSelectBlankProv(this), t(n) ? t(n).options.length = 0 : "", s && t(s) ? t(s).options.length = 0 : ""), "city" === o && "" === a && (d.onSelectBlankCity(this), l = t(e).value), d.provId = "", d.cityId = "", d.areaId = "", d.initValue = l, i()
			}
			d.cityHander && (d.provinceHander.onchange = "", d.provinceHander.onchange = e), d.areaHander && (d.cityHander.onchange = "", d.cityHander.onchange = e)
		}
		var d = {
			province: "",
			city: "",
			area: "",
			provId: "",
			cityId: "",
			areaId: "",
			initValue: "",
			onSelect: function() {
				return !0
			},
			onSelectBlankProv: function() {
				return !0
			},
			onSelectBlankCity: function() {
				return !0
			}
		};
		for (var p in e) d[p] = e[p];
		d.provinceHander = "" === d.province ? null : t(d.province), d.cityHander = "" === d.city ? null : t(d.city), d.areaHander = "" === d.area ? null : t(d.area), d.provinceHander && (d.provinceHander.setAttribute("stype", "province"), d.provinceHander.setAttribute("vprovince", d.province), d.provinceHander.setAttribute("vcity", d.city), d.provinceHander.setAttribute("varea", d.area)), d.cityHander && (d.cityHander.setAttribute("stype", "city"), d.cityHander.setAttribute("vprovince", d.province), d.cityHander.setAttribute("vcity", d.city), d.cityHander.setAttribute("varea", d.area)), d.areaHander && (d.cityHander.setAttribute("stype", "area"), d.cityHander.setAttribute("vprovince", d.province), d.cityHander.setAttribute("vcity", d.city), d.cityHander.setAttribute("varea", d.area)), d.initaddress = i;
		var u = s();
		return i(), d
	}
	var s = e("components/paipai_region/region_data");
	return i
}), define("text!templates/other_info.html", [], function() {
	return '<div class="info-group-title vbox">\n    <div class="group-inner">物流/其它</div>\n</div>\n<div class="info-group-cont vbox">\n    <div class="group-inner">\n        <div class="control-group">\n            <label class="control-label"><em class="required">*</em>运费设置：</label>\n            <div class="controls">\n                <% if(goods_type == \'10\' && fx_shipper_type == \'supplier\') { %>\n                    <div class="static-value">\n                        该商品为分销商品，暂不支持修改运费、配送信息\n                    </div>\n                <% } else { %>\n                    <label class="radio">\n                        <input id="js-unified-postage" type="radio" name="delivery" value="0" <% if (delivery_template_id == \'\') { %>checked<% } %>>统一邮费\n                        <div class="input-prepend">\n                            <span class="add-on">￥</span>\n                            <input type="text" name="postage" value="<%= postage %>" class="input-small js-postage">\n                        </div>\n                    </label>\n                    <label class="radio mat10">\n                        <input id="js-use-delivery" disabled type="radio" name="delivery" value="1" <% if (delivery_template_id != \'\') { %>checked<% } %>>运费模版\n                        <div class="delivery-template" style="display: inline-block;">\n                            <input type="hidden" name="delivery_template_id" value="<%=delivery_template_id %>" class="js-delivery-template">\n                            <a class="js-refresh-delivery" href="javascript:;">刷新</a>\n                            <a href="<%=window._global.url.www %>/trade/delivery#add" target="_blank" class="new-window">+新建</a>\n                        </div>\n                    </label>\n                <% } %>\n            </div>\n        </div>\n\n        <% if(class_type != \'0\') { %>\n        <div class="control-group">\n            <label class="control-label">商品所在地：</label>\n            <div class="controls">\n                <select class="js-location input-medium" name="province_id" id="js-province"></select>\n                <select class="js-location input-medium" name="city_id" id="js-city"></select>\n            </div>\n        </div>\n        <% } %>\n\n        <div class="control-group">\n            <label class="control-label">每人限购：</label>\n            <div class="controls">\n                <% if(selling_way == \'0\') { %>\n                <input type="text" name="quota" value="<%=quota %>" class="input-small js-quota">\n                <span class="gray">0 代表不限购</span>\n                <% } else { %>\n                <div class="static-value">1 件（每场）</div>\n                <% } %>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">要求留言：</label>\n            <div class="controls">\n                <input type="hidden" name="messages" />\n                <div id="messages-region"></div>\n            </div>\n        </div>\n        <% if(selling_way == \'0\') { %>\n        <div class="control-group">\n            <label class="control-label">开售时间：</label>\n            <div class="controls">\n                <label class="radio">\n                    <input type="radio" name="sold_time" value="0" <% if (sold_time == \'0\') { %>checked<% } %>>立即开售\n                </label>\n                <label class="radio mat5" for="sold_time">\n                    <input type="radio" id="sold_time" name="sold_time" value="1" <% if (sold_time == \'1\') { %>checked<% } %>>定时开售\n                    <input id="start_sold_time" name="start_sold_time" readonly class="input-medium js-sold-time <% if (sold_time == \'0\') { %>v-hide<% } %>" type="text" value="<% if (sold_time == \'1\') { %><%= start_sold_time %><% } %>">\n                </label>\n            </div>\n        </div>\n        <% } %>\n        <!-- <div class="control-group">\n            <label class="control-label">停售时间：</label>\n            <div class="controls">\n                <input name="take_down_time" readonly class="input-medium" type="text" value="">\n            </div>\n        </div> -->\n        <% if(selling_way == \'0\') { %>\n        <div class="js-level-discount control-group control-group-notes-wrap">\n            <label class="control-label">会员折扣：</label>\n            <div class="controls">\n                <label class="checkbox inline">\n                    <input type="checkbox" name="join_level_discount" value="1" <% if (join_level_discount == \'1\') { %>checked<% } %>>参加会员折扣\n                </label>\n                <a style="display: none;" href="javascript:;" class="js-help-notes circle-help">?</a>\n            </div>\n            <div class="block-help ">\n                <a href="javascript:void(0);" class="js-help-notes" data-class="right"></a>\n                <div class="js-notes-cont hide">\n                    <p>1、设置会员等级折扣（仅限认证服务号）</p>\n                    <p>2、设置商品时开启会员折扣</p>\n                    <p>3、相应等级会员在购买该商品时就能享受该折扣</p>\n                </div>\n            </div>\n        </div>\n        <% } %>\n        <div class="control-group">\n            <label class="control-label">发票：</label>\n            <div class="controls">\n                <label class="radio inline">\n                    <input type="radio" name="invoice" value="0" <% if (invoice == \'0\') { %>checked<% } %> >无\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="invoice" value="1" <% if (invoice == \'1\') { %>checked<% } %> >有\n                </label>\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">保修：</label>\n            <div class="controls">\n                <label class="radio inline">\n                    <input type="radio" name="warranty" value="0" <% if (warranty == \'0\') { %>checked<% } %>>无\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="warranty" value="1" <% if (warranty == \'1\') { %>checked<% } %>>有\n                </label>\n            </div>\n        </div>\n    </div>\n</div>\n'
}), define("text!templates/messages.html", [], function() {
	return '<div class="js-message-container message-container"></div>\n<div class="message-add">\n    <a href="javascript:;" class="js-add-message control-action">+ 添加字段</a>\n    <a style="display: none;" href="javascript:;" class="js-help-notes circle-help">?</a>\n</div>\n'
}), define("models/message_item", ["require", "underscore", "backbone"], function(e) {
	var t = (e("underscore"), e("backbone")),
		n = t.Model.extend({
			defaults: {
				name: "留言",
				type: "text",
				multiple: "0",
				required: "1"
			}
		});
	return n
}), define("text!templates/message_item.html", [], function() {
	return '<input type="text" name="name" value="<%= name %>" class="input-mini message-input" maxlength="5">\n<select class="input-small message-input" name="type">\n    <option value="text" <% if (type == \'text\') { %>selected<% } %>>文本格式</option>\n    <option value="tel" <% if (type == \'tel\') { %>selected<% } %>>数字格式</option>\n    <option value="email" <% if (type == \'email\') { %>selected<% } %>>邮件格式</option>\n    <option value="id_no" <% if (type == \'id_no\') { %>selected<% } %>>身份证号码</option>\n    <option value="image" <% if (type == \'image\') { %>selected<% } %>>图片</option>\n</select>\n<label class="checkbox inline message-input">\n    <input type="checkbox" name="multiple" value="<%= multiple %>" <% if (multiple == 1) { %> checked<% } %> <% if (type != \'text\') { %>disabled<% } %>>多行\n</label>\n<label class="checkbox inline message-input">\n    <input type="checkbox" name="required" value="<%= required %>" <% if (required == 1) { %> checked<% } %>>必填\n</label>\n<a href="javascript:;" class="js-remove-message remove-message">删除</a>\n'
}), define("views/message_item", ["require", "underscore", "backbone", "marionette", "core/event", "commons/utils", "text!templates/message_item.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("core/event"),
		o = e("commons/utils"),
		a = e("text!templates/message_item.html"),
		l = i.ItemView.extend({
			tagName: "div",
			className: "message-item",
			template: t.template(a),
			ui: {
				typeSelect: "select",
				multipleChk: '[name="multiple"]'
			},
			events: {
				"click .js-remove-message": "removeMessage",
				"change @ui.typeSelect": "onTypeChange"
			},
			_modelBinder: void 0,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t._modelBinder = new n.ModelBinder({
					modelSetOptions: {
						validate: !0
					}
				}), t.listenTo(t.model, "change", t.modelChanged)
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			onRender: function() {},
			onShow: function() {
				var e = this;
				e.initDataBindings()
			},
			modelChanged: function() {
				s.trigger("message_item:change")
			},
			initDataBindings: function() {
				var e = this,
					t = {
						name: '[name="name"]',
						type: '[name="type"]',
						multiple: {
							selector: '[name="multiple"]',
							converter: o.booleanConverter
						},
						required: {
							selector: '[name="required"]',
							converter: o.booleanConverter
						}
					};
				e._modelBinder.bind(e.model, e.el, t)
			},
			removeMessage: function(e) {
				var t = this;
				e.preventDefault(), e.stopPropagation();
				var n = t.model.collection;
				n.remove(t.model)
			},
			onTypeChange: function() {
				var e = this,
					t = e.ui.multipleChk,
					n = e.ui.typeSelect.val(),
					i = "text" !== n,
					s = {
						disabled: i
					};
				i && (s.checked = !1), t.prop(s).trigger("change")
			}
		});
	return l
}), define("views/messages", ["require", "underscore", "backbone", "marionette", "core/event", "core/utils", "text!templates/messages.html", "models/message_item", "views/message_item"], function(e) {
	var t = e("underscore"),
		n = (e("backbone"), e("marionette")),
		i = e("core/event"),
		s = e("core/utils"),
		o = e("text!templates/messages.html"),
		a = e("models/message_item"),
		l = e("views/message_item"),
		c = n.CompositeView.extend({
			template: t.template(o),
			itemView: l,
			itemViewContainer: ".js-message-container",
			events: {
				"click .js-add-message": "addMessage"
			},
			collectionEvents: {
				"add remove reset": "reverseUpdate"
			},
			maxSize: 20,
			initialize: function() {
				var e = this;
				e.listenTo(i, "message_item:change", e.reverseUpdate)
			},
			reverseUpdate: function() {
				var e = this,
					t = e.collection.toJSON();
				i.trigger("messages:update", t)
			},
			addMessage: function(e) {
				var t = this;
				if (e.preventDefault(), !t.checkMaxSize()) return s.errorNotify("留言最多支持 20 组。"), !1;
				var n = new a;
				t.collection.add(n)
			},
			checkMaxSize: function() {
				var e = this,
					t = e.collection.size(),
					n = t < e.maxSize;
				return n
			}
		});
	return c
}), define("views/other_info", ["require", "underscore", "backbone", "marionette", "core/event", "components/validation/validate", "commons/utils", "core/utils", "components/paipai_region/com", "backbone.modelbinder", "jqueryui", "select2", "datetimepicker", "text!templates/other_info.html", "views/messages"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("core/event"),
		o = (e("components/validation/validate"), e("commons/utils")),
		a = e("core/utils"),
		l = e("components/paipai_region/com");
	e("backbone.modelbinder"), e("jqueryui"), e("select2"), e("datetimepicker");
	var c = e("text!templates/other_info.html"),
		r = e("views/messages"),
		d = i.Layout.extend({
			tagName: "div",
			className: "goods-info-group-inner",
			template: t.template(c),
			ui: {
				quotaTxt: ".js-quota",
				citySelect: "#js-city",
				postageTxt: ".js-postage",
				unifiedPostage: "#js-unified-postage",
				useDelivery: "#js-use-delivery",
				deliveryTemplate: ".js-delivery-template",
				refreshDelivery: ".js-refresh-delivery",
				soldTimeRadio: 'input[name="sold_time"]',
				startSoldTxt: 'input[name="start_sold_time"]',
				levelDiscount: ".js-level-discount"
			},
			events: {
				"change @ui.soldTimeRadio": "showTimepicker",
				"focus @ui.postageTxt": "onPostageTxtFocus",
				"click @ui.refreshDelivery": "onRefreshDeliveryClick",
				"change @ui.unifiedPostage": "onUnifiedPostageChange"
			},
			regions: {
				messagesRegion: "#messages-region"
			},
			_modelBinder: void 0,
			initialize: function(e) {
				var t = this;
				t.setConfig(e), t._modelBinder = new n.ModelBinder, t.listenTo(t.model, "change", o.showLog), t.listenTo(t.model, "change:shop_method", t.onShopMethodChange)
			},
			onClose: function() {
				var e = this;
				e._modelBinder.unbind()
			},
			onRender: function() {
				var e = this,
					t = e.model.get("shop_method");
				"0" == t && e.hideSelf()
			},
			serializeData: function() {
				var e = this,
					t = {};
				return this.model && (t = this.model.toJSON(), t = e.processData(t)), t
			},
			processData: function(e) {
				var t = "0" == e.delivery_template_id ? "" : e.delivery_template_id;
				return e.delivery_template_id = t, e
			},
			onShow: function() {
				var e = this;
				e.initMessages(), e.initTimepicker(), e.initDataBindings(), e.initDeliveryTemplate(), e.initLocation()
			},
			setConfig: function(e) {
				var n = this;
				n.settings = {}, t(n.settings).extend(e)
			},
			initLocation: function() {
				var e = this,
					t = e.model.get("class_type");
				if ("0" == t) return !1;
				var n = e.model.get("city_id");
				l({
					province: "js-province",
					city: "js-city",
					initValue: n
				})
			},
			initMessages: function() {
				var e = this,
					t = e.model.get("messages");
				e.messageList = new n.Collection(t);
				var i = new r({
					collection: e.messageList,
					parentModel: e.model
				});
				e.messagesRegion.show(i), e.listenTo(s, "messages:update", e.updateMessages)
			},
			updateMessages: function(e) {
				var t = this;
				t.model.set({
					messages: e
				})
			},
			initDataBindings: function() {
				var e = this,
					n = {
						invoice: '[name="invoice"]',
						warranty: '[name="warranty"]'
					};
				"10" != e.model.get("goods_type") && t(n).extend({
					postage: {
						selector: '[name="postage"]',
						converter: e.postageConverter
					}
				}), "0" != e.model.get("class_type") && t(n).extend({
					province_id: {
						selector: '[name="province_id"]',
						converter: e.provinceConverter.bind(e)
					},
					city_id: {
						selector: '[name="city_id"]',
						converter: e.cityConverter.bind(e)
					}
				}), "0" == e.model.get("selling_way") && t(n).extend({
					quota: '[name="quota"]',
					join_level_discount: {
						selector: '[name="join_level_discount"]',
						converter: o.booleanConverter
					}
				}), e._modelBinder.bind(e.model, e.el, n)
			},
			postageConverter: function(e, t) {
				return t = o.numberValueFix(t)
			},
			provinceConverter: function(e, t, n, i, s) {
				var o = this;
				if (t) {
					var a = $(s[0]),
						l = a.find("option:selected"),
						c = l.text();
					i.set("province", c, {
						silent: !0
					}), o.ui.citySelect.trigger("change")
				}
				return t
			},
			cityConverter: function(e, t, n, i, s) {
				if (t) {
					var o = $(s[0]),
						a = o.find("option:selected"),
						l = a.text();
					i.set("city", l, {
						silent: !0
					})
				}
				return t
			},
			onUnifiedPostageChange: function() {
				var e = this,
					t = e.ui.unifiedPostage.prop("checked");
				t && e.setToUsePostage()
			},
			setToUsePostage: function() {
				var e = this;
				e.setDeliveryTemplate("0");
				var t = e.getPostageValue();
				e.model.set("postage", t)
			},
			getPostageValue: function() {
				var e = this,
					t = e.ui.postageTxt.val();
				return t = o.numberValueFix(t)
			},
			onPostageTxtFocus: function() {
				var e = this;
				e.ui.unifiedPostage.prop("checked", !0).trigger("change")
			},
			onRefreshDeliveryClick: function(e) {
				var t = this;
				e.preventDefault(), t.setDeliveryTemplate("0"), t.fetchDeliveryData()
			},
			setDeliveryTemplate: function(e) {
				var t = this;
				t.ui.deliveryTemplate.select2("val", e), t.model.set("delivery_template_id", e)
			},
			fetchDeliveryData: function() {
				var e = this;
				if (e.isFetching) return !1;
				try {
					e.xhr.abort()
				} catch (t) {}
				e.isFetching = !0;
				var n = window._global.url.www + "/trade/delivery/idToNameMap.json";
				e.xhr = a.ajax({
					url: n,
					method: "GET"
				}).done(function(t) {
					e.processDeliveryData(t)
				}).fail(function(e) {
					a.errorNotify(e)
				}).always(function() {
					e.isFetching = !1
				})
			},
			processDeliveryData: function(e) {
				var n = this,
					i = [];
				t(e).each(function(e, t) {
					i.push({
						id: t,
						text: e
					})
				});
				var s = n.getSelect2Config(i);
				n.initDeliverySelect2(s)
			},
			initDeliverySelect2: function(e) {
				var t = this;
				try {
					t.ui.deliveryTemplate.select2("destroy"), t.ui.deliveryTemplate.select2(e).on("select2-opening", function() {}).on("select2-selecting", function(e) {
						var n = e.object;
						t.selectDeliveryTemplate(n, e)
					})
				} catch (n) {}
			},
			getSelect2Config: function(e) {
				var n = {
					multiple: !1,
					maximumInputLength: 12,
					width: 200,
					data: e
				};
				return n.placeholder = t.isEmpty(e) ? "没有可用运费模板" : "请选择运费模版...", n
			},
			initDeliveryTemplate: function() {
				var e = this;
				e.deliveryData = [], e.fetchDeliveryData()
			},
			selectDeliveryTemplate: function(e) {
				var t = this;
				t.ui.useDelivery.prop("checked", !0);
				var n = e.id;
				t.model.set("delivery_template_id", n)
			},
			initTimepicker: function() {
				var e = this,
					t = e.ui.startSoldTxt,
					n = +new Date,
					i = new Date(n + 6e4);
				t.datetimepicker({
					dateFormat: "yy-mm-dd",
					timeFormat: "HH:mm:ss",
					minDate: i,
					showSecond: !0,
					onSelect: function(n) {
						e.model.set({
							start_sold_time: n
						}), t.siblings("input").trigger("click")
					}.bind(e)
				})
			},
			showTimepicker: function(e) {
				var t = this,
					n = t.ui.startSoldTxt,
					i = $(e.target),
					s = i.val();
				t.model.set({
					sold_time: s
				}, {
					silent: !0
				}), "1" == s && (n.removeClass("v-hide"), n.datetimepicker("show"))
			},
			initTakeDownTime: function() {
				{
					var e = this,
						t = e.ui.takeDownTxt,
						n = +new Date;
					new Date(n + 6e4)
				}
				t.datetimepicker({
					dateFormat: "yy-mm-dd",
					timeFormat: "HH:mm:ss",
					minDate: new Date,
					showSecond: !0,
					onSelect: function(t) {
						e.model.set({
							take_down_time: t
						})
					}.bind(e)
				})
			},
			onShopMethodChange: function(e, t) {
				var n = this;
				"0" == t ? n.hideSelf() : n.showSelf()
			},
			onSellingWayChange: function(e, t) {
				var n = this;
				"0" == t ? n.ui.levelDiscount.show() : n.ui.levelDiscount.hide()
			},
			getData: function() {
				var e = this,
					t = e.model.toJSON();
				return t
			},
			showSelf: function() {
				var e = this;
				e.$el.show()
			},
			hideSelf: function() {
				var e = this;
				e.$el.hide()
			}
		});
	return d
}), define("text!templates/step2.html", [], function() {
	return '<div id="base-info-region" class="goods-info-group"></div>\n<div id="auction-info-region" class="goods-info-group"></div>\n<div id="sku-info-region" class="goods-info-group"></div>\n<div id="goods-info-region" class="goods-info-group"></div>\n<div id="other-info-region" class="goods-info-group"></div>\n<div class="app-actions">\n    <div class="form-actions text-center">\n        <button data-next-step="3" class="btn btn-primary js-switch-step">下一步</button>\n    </div>\n</div>\n'
}), define("views/step2", ["require", "underscore", "backbone", "marionette", "vendor/nprogress", "core/cache", "core/reqres", "core/event", "core/utils", "commons/utils", "views/base_info", "views/auction_info", "views/goods_info", "views/sku_stock_info", "views/other_info", "text!templates/step2.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = (e("vendor/nprogress"), e("core/cache")),
		o = e("core/reqres"),
		a = e("core/event"),
		l = (e("core/utils"), e("commons/utils")),
		c = e("views/base_info"),
		r = e("views/auction_info"),
		d = e("views/goods_info"),
		p = e("views/sku_stock_info"),
		u = e("views/other_info"),
		m = e("text!templates/step2.html"),
		h = i.Layout.extend({
			tagName: "form",
			className: "form-horizontal fm-goods-info",
			template: t.template(m),
			regions: {
				baseInfoRegion: "#base-info-region",
				auctionInfoRegion: "#auction-info-region",
				skuStockInfoRegion: "#sku-info-region",
				goodsInfoRegion: "#goods-info-region",
				otherInfoRegion: "#other-info-region"
			},
			initialize: function() {
				var e = this;
				e.isFx = "10" == e.model.get("goods_type"), e.setupPropertyResp()
			},
			onRender: function() {
				var e = this;
				e.$el.attr("novalidate", !0)
			},
			onShow: function() {
				var e = this;
				e.isFx ? e.model.priceXhr.done(function() {
					e.initStep2()
				}) : e.initStep2()
			},
			init: function() {
				var e = this;
				e.initModules(), e.setupAtomBaseDataResp(), e.setupValidation(), "goods" === window._global.goods_type && e.model.isNew() && a.trigger("sku_stock:update")
			},
			initModules: function() {
				var e = this;
				e.initBaseInfo(), e.initAuctionInfo(), e.initGoodsInfo(), e.initSkuStockInfo(), e.initOtherInfo()
			},
			setupPropertyResp: function() {
				var e = this;
				e.propertyData = {}, o.setHandler("goods_property:get", function() {
					return e.propertyData
				})
			},
			setupValidation: function() {
				var e = this;
				n.Validation.bind(e), e.listenTo(e.model, "change", e.validateModel)
			},
			validateModel: function(e) {
				e.validate(e.changed)
			},
			initStep2: function() {
				var e = this,
					t = e.model.get("class_type");
				"0" == t ? e.init() : "1" == t && e.loadDataAndInit()
			},
			fixCid: function() {
				var e = this,
					t = e.model.get("cid"),
					n = e.model.get("goods_class");
				t || (t = e.getCid(n) || ""), e.model.set("cid", t, {
					silent: !0
				})
			},
			loadDataAndInit: function() {
				var e = this,
					t = e.model.get("cid");
				if (!t) return e.init(), !1;
				var n = {
					cid: t
				},
					i = "goods_property_" + t,
					o = s.get(i);
				o ? e.loadDataSuccess(o) : e.fetchData(n)
			},
			getCid: function(e) {
				if (!e || t.isEmpty(e)) return !1;
				var n = t(e).last(),
					i = n.cid;
				return i
			},
			cachePropertyData: function(e, t) {
				var n = "goods_property_" + e;
				s.set(n, t)
			},
			loadDataSuccess: function(e) {
				var t = this;
				t.updateSkuAtomBaseData(e), t.mergeData(e), t.init()
			},
			setupAtomBaseDataResp: function() {
				var e = this;
				e.atomBaseData = e.atomBaseData || {}, o.setHandler("atom_data:get", function(t) {
					var n = e.atomBaseData[t] || {};
					return n
				})
			},
			updateSkuAtomBaseData: function(e) {
				var n = this,
					i = t(e).where({
						is_sale: "1"
					}),
					s = {};
				t(i).each(function(e) {
					if (-1 !== e.name.indexOf("自定义")) return !1;
					var n = [];
					t(e.option).each(function(e) {
						var t = e.option_value || ""; - 1 === t.indexOf("自定义") && n.push({
							id: -1,
							text: t
						})
					}), s[e.name] = n
				}), n.atomBaseData = s
			},
			getDefaultSkuNames: function(e) {
				var n = t(e).where({
					is_sale: "1"
				}),
					i = {},
					s = 1;
				return t(n).each(function(e) {
					if (!e.class_id) return !1;
					var t = "sku_name_" + s,
						n = t + "_value";
					i[t] = {
						id: e.class_id,
						text: e.name,
						editable: "0"
					}, i[n] = null, s += 1
				}), i
			},
			getGoodsAttrs: function(e) {
				var n = t(e).where({
					is_sale: "0"
				});
				return n
			},
			mergeData: function(e) {
				var t = this;
				t.attrsOptions = t.getGoodsAttrs(e);
				var n = t.model.previous("goods_class"),
					i = t.getCid(n),
					s = t.model.hasChanged("goods_class");
				if (t.model.isNew()) t.mergeSkuData(e);
				else if (s && i) return t.clearModelAttrsValue(), t.clearModelSkuValue(), t.mergeSkuData(e), !1;
				t.mergeAttrsData(e)
			},
			mergeSkuData: function(e) {
				var n = this,
					i = {},
					s = n.getDefaultSkuNames(e);
				t(i).extend(s), n.model.set(i)
			},
			mergeAttrsData: function() {
				var e = this;
				e.setAttrsDataValue()
			},
			clearModelSkuValue: function() {
				var e = this;
				l.removeSkuKeyValue(e.model, 0)
			},
			clearModelAttrsValue: function() {
				var e = this;
				e.model.set({
					attrs: null
				})
			},
			setAttrsDataValue: function() {
				var e = this,
					n = e.model.get("attrs");
				return !n || t.isEmpty(n) ? !1 : void t(e.attrsOptions).each(function(e) {
					var i = e.pid,
						s = t(n).findWhere({
							pid: i
						});
					s && (e.value = s.value)
				})
			},
			fetchData: function(e) {
				var t = this;
				l.fetchSaleProperty(e, function(n) {
					var i = n.data;
					t.propertyData = i, t.cachePropertyData(e.cid, i), t.loadDataSuccess(i)
				})
			},
			initBaseInfo: function() {
				var e = this,
					t = e.baseInfoView = new c({
						model: e.model,
						attrsOptions: e.attrsOptions
					});
				e.baseInfoRegion.show(t)
			},
			initAuctionInfo: function() {
				var e = this,
					t = e.model.get("selling_way");
				if ("1" !== t) return !1;
				var n = e.auctionInfoView = new r({
					model: e.model
				});
				e.auctionInfoRegion.show(n)
			},
			initGoodsInfo: function() {
				var e = this,
					t = e.goodsInfoView = new d({
						model: e.model
					});
				e.goodsInfoRegion.show(t)
			},
			initSkuStockInfo: function() {
				var e = this,
					t = e.skuStockInfoView = new p({
						model: e.model
					});
				e.skuStockInfoRegion.show(t)
			},
			initOtherInfo: function() {
				var e = this,
					t = e.model.get("selling_way");
				"1" == t && e.model.set("quota", 0, {
					silent: !0
				});
				var n = e.otherInfoView = new u({
					model: e.model
				});
				e.otherInfoRegion.show(n)
			}
		});
	return h
}), define("text!templates/design.html", [], function() {
	return '<div class="app-preview">\n    <div class="app-header"></div>\n    <div class="app-entry">\n        <div class="app-config ">\n            <div class="app-field" style="cursor: default;">\n                <h1><span></span></h1>\n                <div class="goods-details-block">\n                    <h4>基本信息区</h4>\n                    <p>固定样式，显示商品主图、价格等信息</p>\n                </div>\n            </div>\n            <div class="js-config-region"></div>\n        </div>\n        <div class="app-fields js-fields-region"></div>\n    </div>\n    <div class="js-add-region"></div>\n</div>\n<div class="app-sidebar">\n    <div class="arrow"></div>\n    <div class="app-sidebar-inner js-sidebar-region">\n\n    </div>\n</div>\n<div class="app-actions">\n    <div class="form-actions text-center">\n        <button class="btn js-switch-step" data-next-step="2">上一步</button>\n        <input class="btn btn-primary js-btn-load" type="submit" value="上架" data-loading-text="上架...">\n        <input class="btn js-btn-unload" type="submit" value="下架" data-loading-text="下架...">\n        <input class="btn js-btn-preview" type="submit" value="预览" data-loading-text="预览效果...">\n    </div>\n</div>\n'
}), define("text!templates/add_content.html", [], function() {
	return '<div class="app-add-field">\n    <h4>添加内容</h4>\n    <ul>\n        <li><a class="js-new-field" data-field-type="rich_text">富文本</a></li>\n        <li><a class="js-new-field" data-field-type="goods">商品</a></li>\n        <li><a class="js-new-field" data-field-type="goods_list">商品<br/>列表</a></li>\n        <li><a class="js-new-field" data-field-type="image_ad">图片<br/>广告</a> </li>\n        <li><a class="js-new-field" data-field-type="cube2">魔方</a></li>\n        <li><a class="js-new-field" data-field-type="title">标题</a></li>\n        <li><a class="js-new-field" data-field-type="text_nav">文本<br/>导航</a></li>\n        <li><a class="js-new-field" data-field-type="nav">图片<br/>导航</a></li>\n        <li><a class="js-new-field" data-field-type="link">关联<br/>链接</a></li>\n        <li><a class="js-new-field" data-field-type="search">商品<br/>搜索</a></li>\n        <li><a class="js-new-field" data-field-type="showcase">橱窗</a></li>\n        <li><a class="js-new-field" data-field-type="line">辅助线</a></li>\n        <li><a class="js-new-field" data-field-type="white">辅助<br/>空白</a></li>\n        <li><a class="js-new-field" data-field-type="component">自定义<br/>模块</a></li>\n    </ul>\n</div>\n'
}), define("components/showcase/2.0.0/base/views/show_collection", ["require", "marionette"], function(e) {
	var t = e("marionette");
	return t.CollectionView.extend({
		className: "app-fields",
		initialize: function(e) {
			this.options = e || {}, this.layout = this.options.layout
		},
		onShow: function() {
			this.sortable()
		},
		itemViewOptions: function() {
			return {
				layout: this.layout
			}
		},
		addItemView: function(e) {
			return "config" !== e.get("type") ? t.CollectionView.prototype.addItemView.apply(this, arguments) : void 0
		},
		getItemView: function(e) {
			var t = e.get("type");
			return window.SHOWCASE_CONFIG.showViews[t]
		},
		sortable: function() {
			var e = this;
			this.$el.sortable({
				axis: "y",
				items: "> div:not(.js-not-sortable)",
				cursor: "move",
				start: function(e, t) {
					t.item.data("startPos", t.item.index())
				},
				stop: function(t, n) {
					var i = n.item.data("startPos"),
						s = n.item.index();
					i !== s && (e.includeConfigModel() && (i += 1, s += 1), e.sort(i, s, e.collection.models), e.layout.displayEditView(), e.collection.trigger("sort"))
				}
			})
		},
		sort: function(e, t, n) {
			var i = n.splice(e, 1)[0];
			return n.splice(t, 0, i), n
		},
		includeConfigModel: function() {
			return this.collection.includeConfigModel()
		},
		isEmpty: function() {
			return !this.collection || this.includeConfigModel() && 1 === this.collection.length || 0 === this.collection.length
		}
	})
}), define("text!components/showcase/2.0.0/base/templates/stroagealert.html", [], function() {
	return '<div class="alert fade in">\n    <button type="button" class="close" data-dismiss="alert">×</button>\n    <strong>提示：</strong>在浏览器中发现未提交的内容，是否使用该内容替换当前内容？<a class="js-use-storage" href="javascript:;"> 使用 </a>\n</div>\n'
}), define("components/showcase/2.0.0/rich_text/models/rich_text", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: {
				type: "rich_text",
				content: "",
				color: "#ffffff",
				fullscreen: 0
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		}
	}
}), define("components/showcase/2.0.0/goods/models/goods", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "goods",
				goods: null,
				size: "2",
				size_type: "0",
				buy_btn: "1",
				buy_btn_type: "1",
				title: "0",
				price: "1",
				cart: "1"
			},
			initialize: function() {
				this.listenTo(this, "change", this.onChange), this.listenTo(this, "change:size", this.onSizeChange)
			},
			onChange: function() {
				var e = this.get("size"),
					t = this.get("size_type"),
					n = this.get("buy_btn_type");
				"3" === e && "2" === t && "3" === n && this.set("buy_btn_type", "1")
			},
			onSizeChange: function(e, t) {
				var n = this.get("size_type");
				1 !== +t && 1 === +n && this.set("size_type", "0"), 1 !== +t && 3 === +n && this.set("size_type", "0")
			},
			deleteGoods: function(e) {
				var t = this.get("goods");
				t.splice(e, 1), this.set("goods", t), this.trigger("change"), this.trigger("change:goods")
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i({
				goods: []
			}) : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/goods_list/models/goods", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "goods_list",
				goods: null,
				goods_number: 6,
				goods_number_type: 0,
				size: "2",
				size_type: "0",
				buy_btn: "1",
				buy_btn_type: "1",
				title: "0",
				price: "1",
				cart: "1"
			},
			initialize: function() {
				this.listenTo(this, "change", this.onChange), this.listenTo(this, "change:size", this.onSizeChange)
			},
			onChange: function() {
				var e = this.get("size"),
					t = this.get("size_type"),
					n = this.get("buy_btn_type");
				"3" === e && "2" === t && "3" === n && this.set("buy_btn_type", "1")
			},
			onSizeChange: function(e, t) {
				var n = this.get("size_type");
				1 !== +t && 1 === +n && this.set("size_type", "0"), 1 !== +t && 3 === +n && this.set("size_type", "0")
			},
			deleteGoods: function(e) {
				var t = this.get("goods");
				t.splice(e, 1), this.set("goods", t), this.trigger("change:goods")
			},
			validation: {}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/image_ad/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: {
				type: "image_ad_selection",
				title: "",
				image_id: "",
				image_url: "",
				image_thumb_url: "",
				image_width: 0,
				image_height: 0,
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			},
			validation: {
				image_url: {
					required: !0,
					msg: "请选择一张图片。"
				},
				title: function(e) {
					return e.length > 20 ? "图片标题最长20个字。" : void 0
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/image_ad/collections/collection", ["require", "backbone", "components/showcase/2.0.0/image_ad/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/image_ad/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/image_ad/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/image_ad/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/image_ad/collections/collection"),
		s = n.extend({
			defaults: {
				type: "image_ad",
				size: "0",
				show_method: "0",
				height: 0,
				sub_entry: new i
			},
			calculateImage: function() {
				var e = 0;
				this.get("sub_entry").each(function(t) {
					var n = Number(t.get("image_width")) / 320;
					n = 1 > n ? 1 : n;
					var i = 0 === Number(t.get("image_height")) ? 320 : Number(t.get("image_height")) / n;
					e = i > e ? i : e
				}), 0 === e && (e = 260), this.set("height", e)
			},
			validation: {
				sub_entry: function(e) {
					return e.length > 10 ? "图片广告不能多于10个" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			initialize: function() {
				this.listenTo(this, "change:show_method", function() {
					"0" == this.get("show_method") && this.set("size", "0")
				})
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/nav/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					type: "nav_selection",
					title: "",
					image_id: "",
					image_url: "",
					image_thumb_url: "",
					image_width: 0,
					image_height: 0,
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: ""
				}
			},
			validation: {
				image_url: {
					required: !0,
					msg: "请选择一张图片。"
				},
				title: function(e) {
					return e.length > 5 ? "图片标题最长5个字。" : void 0
				},
				link_url: function(e) {
					return e ? void 0 : "链接不能为空。"
				}
			},
			initialize: function() {
				this.listenTo(this, "editing", function(e) {
					"error" === e && this.collection.trigger("editing:error", this)
				})
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/nav/collections/collection", ["require", "backbone", "components/showcase/2.0.0/nav/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/nav/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/nav/models/model", ["require", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/nav/collections/collection"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = e("components/showcase/2.0.0/nav/collections/collection"),
		i = t.extend({
			defaults: function() {
				return {
					type: "nav",
					sub_entry: new n
				}
			},
			validation: {
				sub_entry: function(e) {
					return e.length > 20 ? "图片广告不能多余20个" : void 0
				}
			},
			parse: function(e) {
				if (_.isArray(e.sub_entry)) {
					var t = new n;
					_.each(e.sub_entry, function(e) {
						t.add(e)
					}), e.sub_entry = t
				}
				return e
			},
			initialize: function() {
				this.get("sub_entry").length < 4 && this.get("sub_entry").add(_(4).times(n.prototype.model.prototype.defaults))
			}
		});
	return {
		initialize: function(e, t) {
			return _.isUndefined(e) ? new i({
				sub_entry: new n
			}) : new i(e, t)
		}
	}
}), define("components/showcase/2.0.0/showcase/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					type: "showcase_selection",
					title: "",
					image_id: "",
					image_url: "",
					image_thumb_url: "",
					image_width: 0,
					image_height: 0,
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: ""
				}
			},
			validation: {
				image_url: {
					required: !0,
					msg: "请选择一张图片。"
				},
				title: function(e) {
					return e.length > 5 ? "图片标题最长5个字。" : void 0
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/showcase/collections/collection", ["require", "backbone", "components/showcase/2.0.0/showcase/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/showcase/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/showcase/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/showcase/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/showcase/collections/collection"),
		s = n.extend({
			defaults: function() {
				return {
					type: "showcase",
					mode: "0",
					title: "",
					body_title: "",
					body_desc: "",
					sub_entry: new i
				}
			},
			validation: {
				sub_entry: function(e) {
					return e.length > 20 ? "图片广告不能多余20个" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			initialize: function() {
				this.get("sub_entry").length < 3 && this.get("sub_entry").add(t(3).times(i.prototype.model.prototype.defaults))
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/level/models/level", ["components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e.extend({
		defaults: {
			type: "level",
			image: {
				id: "",
				url: window._global.url.v1_static + "/assets/img/avatar/" + window._global.mp_id + ".jpg"
			},
			show_level: "1",
			level_msg: "尊贵的",
			show_point: "1",
			point_msg: "您拥有本店积分：",
			is_default: !0
		},
		validation: {
			level_msg: {
				required: !0,
				msg: "等级提示不能为空"
			},
			point_msg: {
				required: !0,
				msg: "积分提示不能为空"
			}
		},
		initialize: function() {
			this.listenTo(this, "editing", function(e) {
				"error" === e && this.trigger("editing:error", this)
			})
		}
	});
	return {
		initialize: function(e, n) {
			return new t(e, n)
		}
	}
}), define("components/showcase/2.0.0/link/models/item", ["require", "core/utils", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("core/utils"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "link_selection",
				source_type: "",
				source_url: "",
				source_id: "",
				source_title: "",
				source_image: "",
				number: "3"
			},
			validation: {
				source_url: function(e) {
					return t.REG.url.test(e) || t.REG.tel.test(e) ? void 0 : "内容来源不能为空且必须是一个合法的网站地址。"
				},
				source_title: {
					required: !0,
					msg: "链接名称不能为空。"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/link/collections/collection", ["require", "backbone", "components/showcase/2.0.0/link/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/link/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/link/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/link/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/link/collections/collection"),
		s = n.extend({
			defaults: {
				type: "link",
				show_method: "0",
				sub_entry: new i
			},
			validation: {
				sub_entry: function(e) {
					return e.length > 20 ? "关联链接不能多余20个" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/text_nav/models/item", ["require", "core/utils", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("core/utils"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "text_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "导航名称不能为空。"
				},
				link_url: function(e) {
					return t.REG.url.test(e) || t.REG.tel.test(e) ? void 0 : "链接地址必须是一个合法的网站地址。"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/text_nav/collections/collection", ["require", "backbone", "components/showcase/2.0.0/text_nav/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/text_nav/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/text_nav/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/text_nav/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/text_nav/collections/collection"),
		s = n.extend({
			defaults: {
				type: "text_nav",
				show_method: "0",
				sub_entry: new i
			},
			validation: {
				sub_entry: function(e) {
					return e.length > 20 ? "关联链接不能多余20个" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/tag_list/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			idAttribute: "_id",
			defaults: function() {
				return {
					type: "tag",
					id: "",
					title: "",
					url: "",
					goods_number: 10,
					timestamp: +new Date + this.cid
				}
			},
			validation: {
				title: {
					required: !0,
					msg: "请选择商品分组"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/tag_list/collections/collection", ["require", "backbone", "components/showcase/2.0.0/tag_list/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/tag_list/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/tag_list/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/tag_list/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/tag_list/collections/collection"),
		s = n.extend({
			defaults: function() {
				return {
					type: "tag_list",
					timestamp: +new Date,
					sub_entry: new i
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/title/models/item", ["require", "jquery", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("jquery"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "title_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "导航名称不能为空。"
				},
				link_url: function(e) {
					return "" === t.trim(e) ? "导航链接不能为空。" : void 0
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/title/collections/collection", ["require", "backbone", "components/showcase/2.0.0/title/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/title/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/title/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/title/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/title/collections/collection"),
		s = n.extend({
			defaults: {
				type: "title",
				title: "",
				sub_title: "",
				show_method: "0",
				color: "#ffffff",
				sub_entry: new i,
				title_template: "0",
				wx_title_date: "",
				wx_title_author: "",
				wx_title_link: "",
				wx_title_link_type: 0,
				wx_link: {},
				wx_link_url: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "标题不能为空。"
				},
				wx_link_url: function(e, t, n) {
					return "1" == n.title_template && "1" == n.wx_title_link_type && "" === e ? "链接不能为空" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/component/models/component", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "component",
				_id: "",
				title: "",
				link: ""
			},
			validation: {
				_id: function(e) {
					return "" === e ? "请选择一个自定义页面模块。" : void 0
				}
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/search/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "search"
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/line/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "line"
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/cube/models/selection", ["components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e.extend({
		defaults: function() {
			return {
				type: "cube_selection",
				title: "",
				image_id: "",
				image_url: "",
				image_thumb_url: "",
				image_width: 0,
				image_height: 0,
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: "",
				show_method: "1"
			}
		},
		validation: {
			image_url: [{
				required: !0,
				msg: "图片不能为空。"
			}]
		},
		initialize: function() {
			this.listenTo(this, "editing", function(e) {
				"error" === e && this.collection.trigger("editing:error", this)
			})
		}
	});
	return {
		initialize: function(e, n) {
			return new t(e, n)
		},
		Model: t
	}
}), define("components/showcase/2.0.0/cube/collections/selections", ["components/showcase/2.0.0/cube/models/selection"], function(e) {
	return Backbone.Collection.extend({
		model: e.Model
	})
}), define("components/showcase/2.0.0/cube/models/model", ["components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/cube/collections/selections", "core/utils"], function(e, t, n) {
	var i = e.extend({
		defaults: function() {
			return {
				type: "cube",
				sub_entry: new t
			}
		},
		changeSubEntry: function() {
			var e = Number(this.get("show_method")),
				n = this.get("sub_entry").length,
				i = this;
			e != n && e > n && _(e - n).times(function() {
				i.get("sub_entry").add(t.prototype.model.prototype.defaults())
			})
		},
		checkCubeColspan: function(e) {
			var t;
			return t = _.isUndefined(e) ? 0 : e.show_method || 0, t = +t, this.get("sub_entry").each(function(e) {
				t += Number(e.get("show_method"))
			}), _.isUndefined(e) ? 4 - t : t > 4 ? (n.errorNotify("最多支持4列。"), !1) : !0
		},
		calculateImage: function() {
			var e = 0;
			this.get("sub_entry").each(function(t) {
				var n = Number(t.get("image_width")) / 320;
				n = 1 > n ? 1 : n;
				var i = 0 == Number(t.get("image_height")) ? 320 : Number(t.get("image_height")) / n;
				e = i > e ? i : e
			}), 0 === e && (e = 260), this.set("height", e)
		},
		validation: {
			sub_entry: function(e) {
				var t = 0;
				return e.each(function(e) {
					t += Number(e.get("show_method"))
				}), 4 > t ? "必须添加满4列。" : void 0
			}
		},
		parse: function(e) {
			if (_.isArray(e.sub_entry)) {
				var n = new t;
				_.each(e.sub_entry, function(e) {
					n.add(e)
				}), e.sub_entry = n
			}
			return e
		},
		initialize: function() {
			this.listenTo(this, "editing", function(e) {
				"error" === e && this.trigger("editing:error", this)
			})
		}
	});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		}
	}
}), define("components/showcase/2.0.0/cube2/models/item", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: function() {
				return {
					type: "cube_selection",
					x: 0,
					y: 0,
					width: 1,
					height: 1,
					title: "",
					image_id: "",
					image_url: "",
					image_thumb_url: "",
					image_width: 0,
					image_height: 0,
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: "",
					show_method: "1"
				}
			},
			validation: {
				image_url: [{
					required: !0,
					msg: "图片不能为空。"
				}]
			},
			layout: function(e) {
				for (var n = t.clone(this.attributes), i = [], s = [], o = n.y; o < e.length; o++) {
					for (var a = n.x; a < e[o].length; a++) {
						var l = e[o][a];
						if (l && (n.x !== l.x || n.y !== l.y)) break;
						if (o - n.y > 0) {
							var c = t.find(i, function(e) {
								return e.rows === o - n.y && e.cols === a - n.x + 1
							});
							if (!c) break
						}
						s.push({
							cols: a - n.x + 1,
							rows: o - n.y + 1
						})
					}
					if (!s.length) break;
					i = i.concat(s), s = []
				}
				return i
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/cube2/collections/collection", ["require", "backbone", "components/showcase/2.0.0/cube2/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/cube2/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("text!components/showcase/2.0.0/cube2/templates/td.html", [], function() {
	return '<td class="not-empty cols-<%- width %> rows-<%- height %> <%- image_url ? \'\' : \'index-\' + index %>" colspan="<%- width %>" rowspan="<%- height %>" data-index="<%- index %>">\n    <% if(link_url) { %>\n        <a href="<%- link_url %>">\n            <img src="<%- image_url %>">\n        </a>\n    <% } else { %>\n        <img src="<%- image_url %>">\n    <% } %>\n</td>\n'
}), define("components/showcase/2.0.0/cube2/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/cube2/collections/collection", "text!components/showcase/2.0.0/cube2/templates/td.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/cube2/collections/collection"),
		s = e("text!components/showcase/2.0.0/cube2/templates/td.html"),
		o = e("core/utils"),
		a = n.extend({
			tdTemplate: t.template(s),
			defaults: function() {
				return {
					type: "cube2",
					layout_width: 4,
					layout_height: 4,
					layout_map: "",
					tableContent: "",
					sub_entry: new i
				}
			},
			validation: {
				layout_map: function() {
					for (var e = !1, t = !1, n = this.layoutMap, i = n.length - 1; i >= 0; i--) {
						t = !1;
						for (var s = 0; s < n[i].length; s++) n[i][s] ? e = !0 : t = !0;
						if (t && e) return "必须添加满4列。"
					}
					return !1
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			denerateTableContent: function() {
				for (var e = t.result(this, "defaults"), n = this.denerateLayoutMap(), i = [], s = 0; s < e.layout_height; s++) {
					i.push("<tr>");
					for (var a = 0; a < e.layout_width; a++) {
						var l = n[s][a];
						if (l) {
							if (s === l.y && a === l.x) {
								var c = l.image_url;
								c && (c = o.fullfillImage(c, "!730x0.jpg")), l.image_url = c, l.image_thumb_url = c, i.push(this.tdTemplate(l))
							}
						} else i.push('<td class="empty" data-x="' + a + '" data-y="' + s + '"></td>')
					}
					i.push("</tr>")
				}
				this.set("tableContent", i.join(""))
			},
			denerateLayoutMap: function() {
				var e = t.result(this, "defaults"),
					n = this.get("sub_entry").toJSON(),
					i = new Array(e.layout_width),
					s = this.layoutMap = [];
				return t.times(e.layout_height, function() {
					s.push(t.clone(i))
				}), t.each(t.clone(n), function(e, t) {
					e.index = t;
					for (var n = e.y; n < e.height + e.y; n++) for (var i = e.x; i < e.width + e.x; i++) s[n][i] = e
				}), s
			}
		});
	return {
		initialize: function(e, t) {
			return new a(e, t)
		}
	}
}), define("components/showcase/2.0.0/tpl_shop/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_shop",
				backgroundImage: "",
				backgroundColor: "#EF483F",
				avatar: window._global.mp_data ? window._global.mp_data.logo || "" : ""
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/tpl_weixin/models/item", ["require", "jquery", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("jquery"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_weixin_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "导航名称不能为空。"
				},
				link_url: function(e) {
					return "" === t.trim(e) ? "导航链接不能为空。" : void 0
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/tpl_weixin/collections/collection", ["require", "backbone", "components/showcase/2.0.0/tpl_weixin/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/tpl_weixin/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/tpl_weixin/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/tpl_weixin/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/tpl_weixin/collections/collection"),
		s = n.extend({
			defaults: {
				type: "tpl_weixin",
				background: window._global.url.static + "/image/tpl_weixin.jpg",
				width: 600,
				height: 900,
				top: "80",
				bg_link_id: "",
				bg_link_type: "",
				bg_link_title: "",
				bg_link_url: "",
				sub_entry: new i
			},
			validation: {
				background: {
					required: !0,
					msg: "必须选择一张背景图片"
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/tpl_fbb/models/item", ["require", "jquery", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("jquery"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_fbb_nav_selection",
				title: "",
				text: "",
				date: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: "",
				bg_image_id: "",
				bg_image_url: "",
				bg_image_width: "",
				bg_image_height: "",
				icon_image_id: "",
				icon_image_url: "",
				icon_image_width: "",
				icon_image_height: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "导航名称不能为空。"
				},
				link_url: function(e) {
					return "" === t.trim(e) ? "导航链接不能为空。" : void 0
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/tpl_fbb/collections/collection", ["require", "backbone", "components/showcase/2.0.0/tpl_fbb/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/tpl_fbb/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/tpl_fbb/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/tpl_fbb/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/tpl_fbb/collections/collection"),
		s = n.extend({
			defaults: {
				type: "tpl_fbb",
				background: window._global.url.static + "/image/tpl_fbb.jpg",
				width: 600,
				height: 900,
				bg_link_id: "",
				bg_link_type: "",
				bg_link_title: "",
				bg_link_url: "",
				sub_entry: new i,
				is_fullscreen_component: "1"
			},
			validation: {
				background: {
					required: !0,
					msg: "必须选择一张背景图片"
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i([{
					type: "title_nav_selection",
					title: "行程",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "范冰冰微站全新上线",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_1.png",
					icon_image_width: "",
					icon_image_height: "",
					date: "4月10号"
				}, {
					type: "title_nav_selection",
					title: "抽奖",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "神秘大奖等你来拿",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_2.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "投票",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "冰邦们的家！DIY范小胖专属表情",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_3.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "新闻资讯",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "《X战警》范冰冰海报曝光 搭档佩姬联合出击",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_4.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "写真",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "",
					bg_image_id: "",
					bg_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_bg_1.jpg",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "影视",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "",
					bg_image_id: "",
					bg_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_bg_2.jpg",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "微视",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "三三不尽，关注微站！",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_5.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "爱里的心",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "“爱里的心”公益项目",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_4.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "音乐",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "聆听范冰冰的电台",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_6.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}, {
					type: "title_nav_selection",
					title: "荣耀时刻",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					text: "一同见证范冰冰星路历程",
					bg_image_id: "",
					bg_image_url: "",
					bg_image_width: "",
					bg_image_height: "",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_1.png",
					icon_image_width: "",
					icon_image_height: "",
					date: ""
				}])
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/tpl_course/models/item", ["require", "jquery", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("jquery"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_fbb_nav_selection",
				title: "",
				text: "",
				date: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: "",
				icon_image_id: "",
				icon_image_url: "",
				icon_image_width: "",
				icon_image_height: ""
			},
			validation: {
				title: {
					required: !0,
					msg: "导航名称不能为空。"
				},
				link_url: function(e) {
					return "" === t.trim(e) ? "导航链接不能为空。" : void 0
				}
			},
			initialize: function() {
				this.listenTo(this, "editing", function(e) {
					"error" === e && this.collection.trigger("editing:error", this)
				})
			}
		});
	return {
		initialize: function(e, t) {
			return new i(e, t)
		},
		Model: i
	}
}), define("components/showcase/2.0.0/tpl_course/collections/collection", ["require", "backbone", "components/showcase/2.0.0/tpl_course/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/tpl_course/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/tpl_course/models/model", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/tpl_course/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/models/base"),
		s = e("components/showcase/2.0.0/tpl_course/collections/collection"),
		o = i.extend({
			defaults: {
				type: "tpl_course",
				background: window._global.url.static + "/image/tpl_course.jpg",
				width: 600,
				height: 900,
				title: "新品上架，限时优惠",
				title_color: "#ffffff",
				sub_title: "微信购买8折起",
				sub_title_color: "#cfcfcf",
				button_text: "立即购买",
				button_link_id: "",
				button_link_type: "link",
				button_link_title: "有赞",
				button_link_url: "http://koudaitong.com",
				top: "50",
				sub_entry: new s,
				is_fullscreen_component: "1"
			},
			validation: {
				button_text: {
					required: !0,
					msg: "请输入按钮文字"
				},
				background: {
					required: !0,
					msg: "必须选择一张背景图片"
				},
				button_link_url: function(e) {
					return "" === n.trim(e) ? "按钮链接不能为空。" : void 0
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new s;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new o({
				sub_entry: new s([{
					type: "title_nav_selection",
					title: "上新",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_1.png",
					icon_image_width: "",
					icon_image_height: ""
				}, {
					type: "title_nav_selection",
					title: "抽奖",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_2.png",
					icon_image_width: "",
					icon_image_height: ""
				}, {
					type: "title_nav_selection",
					title: "投票",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_3.png",
					icon_image_width: "",
					icon_image_height: ""
				}, {
					type: "title_nav_selection",
					title: "杂志",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_4.png",
					icon_image_width: "",
					icon_image_height: ""
				}, {
					type: "title_nav_selection",
					title: "小游戏",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_5.png",
					icon_image_width: "",
					icon_image_height: ""
				}, {
					type: "title_nav_selection",
					title: "关注",
					link_id: "",
					link_type: "link",
					link_title: "有赞",
					link_url: "http://koudaitong.com",
					icon_image_id: "",
					icon_image_url: "http://static.koudaitong.com/v2/image/tpl_fbb_icon_4.png",
					icon_image_width: "",
					icon_image_height: ""
				}])
			}) : new o(e, n)
		}
	}
}), define("components/showcase/2.0.0/tpl_wxd/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_wxd",
				backgroundImage: window._global.url.static + "/image/tpl_wxd_bg.png",
				avatar: window._global.mp_data ? window._global.mp_data.logo || "" : ""
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/tpl_11_11/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "tpl_11_11",
				banner: "",
				notice: "",
				tradeincard: []
			},
			validation: {
				banner: {
					required: !0,
					msg: "请选择背景图片"
				},
				tradeincard: function(e) {
					return e.length ? void 0 : "请添加优惠券"
				},
				notice: {
					required: !0,
					msg: "请填写店铺公告"
				}
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/category/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					type: "category_selection",
					title: "导航名称",
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: ""
				}
			},
			validation: {
				title: function(e) {
					return e.length > 6 ? "分类名称最长6个字。" : void 0
				},
				link_url: function(e) {
					return e ? void 0 : "链接不能为空。"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/category/collections/collection", ["require", "components/showcase/2.0.0/category/models/item", "backbone"], function(e) {
	var t = e("components/showcase/2.0.0/category/models/item"),
		n = e("backbone");
	return n.Collection.extend({
		model: t.Model
	})
}), define("components/showcase/2.0.0/category/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/category/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/category/collections/collection"),
		s = n.extend({
			defaults: function() {
				return {
					type: "category",
					sub_entry: new i
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			initialize: function() {
				this.get("sub_entry").length < 4 && this.get("sub_entry").add(t(4).times(i.prototype.model.prototype.defaults))
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/white/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "white",
				height: "30"
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/store/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "store"
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/recommend_goods/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "recommend_goods"
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/scroll/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					type: "scroll_item",
					image_id: "",
					image_url: "",
					image_thumb_url: "",
					image_width: 0,
					image_height: 0,
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: ""
				}
			},
			validation: {
				image_url: {
					required: !0,
					msg: "请选择一张图片。"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/scroll/collections/collection", ["require", "backbone", "components/showcase/2.0.0/scroll/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/scroll/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/scroll/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/scroll/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/scroll/collections/collection"),
		s = n.extend({
			defaults: function() {
				return {
					type: "scroll",
					homepage_icon: "1",
					music_icon: "1",
					music_url: "",
					music_title: "",
					loop: "1",
					first_page_image_id: "",
					first_page_image_url: "",
					first_page_image_thumb_url: "",
					first_page_image_width: 0,
					first_page_image_height: 0,
					first_page_wipe: "0",
					first_page_wipe_image_id: "",
					first_page_wipe_image_url: "",
					first_page_wipe_image_thumb_url: "",
					first_page_wipe_image_width: 0,
					first_page_wipe_image_height: 0,
					last_page_image_id: "",
					last_page_image_url: "",
					last_page_image_thumb_url: "",
					last_page_image_width: 0,
					last_page_image_height: 0,
					last_page_link_id: "",
					last_page_link_type: "",
					last_page_link_title: "",
					last_page_link_url: "",
					sub_entry: new i,
					is_fullscreen_component: "1"
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			validation: {
				first_page_image_url: {
					required: !0,
					msg: "请选择一张图片。"
				},
				last_page_image_url: {
					required: !0,
					msg: "请选择一张图片。"
				}
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/scroll_nav/models/item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					type: "scroll_nav_item",
					title: "",
					sub_title: "",
					image_id: "",
					image_url: "",
					image_thumb_url: "",
					image_width: 0,
					image_height: 0,
					link_id: "",
					link_type: "",
					link_title: "",
					link_url: ""
				}
			},
			validation: {
				image_url: {
					required: !0,
					msg: "请选择一张图片。"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		},
		Model: n
	}
}), define("components/showcase/2.0.0/scroll_nav/collections/collection", ["require", "backbone", "components/showcase/2.0.0/scroll_nav/models/item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/scroll_nav/models/item");
	return t.Collection.extend({
		model: n.Model
	})
}), define("components/showcase/2.0.0/scroll_nav/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base", "components/showcase/2.0.0/scroll_nav/collections/collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = e("components/showcase/2.0.0/scroll_nav/collections/collection"),
		s = n.extend({
			defaults: function() {
				return {
					type: "scroll_nav",
					homepage_icon: "1",
					background_images: [],
					nav_style: "right",
					animate: "zoom",
					zoom_type: "zoom_out",
					slide_type: "slide_left",
					sub_entry: new i,
					is_fullscreen_component: "1"
				}
			},
			parse: function(e) {
				if (t.isArray(e.sub_entry)) {
					var n = new i;
					t.each(e.sub_entry, function(e) {
						n.add(e)
					}), e.sub_entry = n
				}
				return e
			},
			validation: {
				background_images: function(e) {
					return e && 0 !== e.length ? void 0 : "请选择背景图片"
				}
			}
		});
	return {
		initialize: function(e, n) {
			return t.isUndefined(e) ? new s({
				sub_entry: new i([{
					title: "标题",
					sub_title: "副标题"
				}, {
					title: "标题",
					sub_title: "副标题"
				}])
			}) : new s(e, n)
		}
	}
}), define("components/showcase/2.0.0/image_text/models/model", ["require", "underscore", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/models/base"),
		i = n.extend({
			defaults: {
				type: "image_text",
				title: "",
				digest: "",
				author: "",
				image: "",
				image_id: "",
				show_image: 0,
				content: "",
				link_id: "",
				link_url: "",
				link_type: "",
				link_title: ""
			},
			validation: {
				title: [{
					required: !0,
					msg: "标题不能为空"
				}, {
					maxLength: 64,
					msg: "标题长度不能超过64个字"
				}],
				author: function(e) {
					return e.length > 8 ? "作者长度不超过8个字" : void 0
				},
				content: [{
					required: !0,
					msg: "正文不能为空"
				}],
				image: {
					required: !0,
					msg: "必须选择一张图片"
				},
				digest: function(e) {
					return e.length > 120 ? "摘要不能超过120个字" : void 0
				}
			}
		});
	return {
		initialize: function(e, n) {
			var s;
			return s = t.isUndefined(e) ? new i : new i(e, n)
		}
	}
}), define("components/showcase/2.0.0/audio/models/model", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: {
				type: "audio",
				reload: "1",
				style: "0",
				audio: "",
				title: "",
				loop: "0",
				avatar: "",
				bubble: "left"
			},
			validation: {
				title: function(e) {
					return 1 === +this.get("style") && e.length <= 0 ? "标题不能为空" : void 0
				},
				audio: {
					required: !0,
					msg: "必须选择一个音频文件"
				}
			}
		});
	return {
		initialize: function(e, t) {
			return new n(e, t)
		}
	}
}), define("components/showcase/2.0.0/base/views/edit_base", ["require", "underscore", "jquery", "backbone", "marionette", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("backbone"),
		s = e("marionette"),
		o = e("core/utils");
	return s.Layout.extend({
		initialize: function(e) {
			this._setOptions(e), this._bind(), this.triggerMethod("init", e)
		},
		_setOptions: function(e) {
			this.options = e || {}, this.layout = this.options.layout
		},
		_bind: function() {
			this.listenTo(this, "before:close", this._handleViewBeforeClose), this.listenTo(this, "close", this._handleViewClose), this.listenTo(this.model, "destroy", this.close), this.listenTo(this.model, "change", this._handleModelChange), this.bindValidation()
		},
		bindValidation: function() {
			i.Validation.bind(this)
		},
		_handleViewBeforeClose: function() {
			this.$(":focus").blur(), this.save()
		},
		_handleViewClose: function() {
			this.layout = null, i.Validation.unbind(this)
		},
		_handleModelChange: function() {
			t.isFunction(this.model.validate) && this.model.validate(this.model.changed)
		},
		save: function() {},
		updateModel: o.updateModel,
		fullfillUrl: function(e, t) {
			var i = n(e.target),
				s = n.trim(i.val());
			s = o.urlCheck(s), this.model.set(t, s), i.val(s), e.stopPropagation(), e.stopImmediatePropagation()
		},
		sort: function(e, t, n) {
			var i = n.splice(e, 1)[0];
			return n.splice(t, 0, i), n
		}
	})
}), define("text!components/showcase/2.0.0/rich_text/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n\n    <div class="control-group">\n        <div class="pull-left">\n            <label class="control-label">背景颜色：</label>\n            <div class="input-append">\n                <input type="color" value="<%= color %>" name="color" class="span1">\n                <button class="btn js-reset-bg" type="button">重置</button>\n            </div>\n        </div>\n        <div class="pull-left">\n            <label class="control-label">是否全屏：</label>\n            <label class="checkbox inline">\n                <input type="checkbox" name="fullscreen" <% if (fullscreen == 1) { %>checked<% } %>> 全屏显示\n            </label>\n        </div>\n    </div>\n\n    <div class="control-group">\n        <script class="js-editor" type="text/plain"></script>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/rich_text/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/rich_text/templates/edit.html", "components/image/2.0.0/app"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/rich_text/templates/edit.html"),
		s = window.UE;
	return window.imageModal = e("components/image/2.0.0/app"), n.extend({
		className: "edit-rich-text",
		template: t.template(i),
		events: {
			"blur textarea": "updateModel",
			'change input[type="color"]': "updateModel",
			'change input[type="checkbox"]': "updateModel",
			"click .js-reset-bg": "handleResetBackground"
		},
		handleResetBackground: function() {
			this.model.set("color", "#F9F9F9"), this.$('input[type="color"]').val("#F9F9F9")
		},
		onClose: function() {
			this._editor && this._editor.destroy()
		},
		onShow: function() {
			var e = this,
				t = this._editor = new s.ui.Editor({
					toolbars: [
						["bold", "italic", "underline", "strikethrough", "forecolor", "backcolor", "justifyleft", "justifycenter", "justifyright", "|", "insertunorderedlist", "insertorderedlist", "blockquote"],
						["emotion", "uploadimage", "insertvideo", "link", "removeformat", "|", "rowspacingtop", "rowspacingbottom", "lineheight", "paragraph", "fontsize"],
						["inserttable", "deletetable", "insertparagraphbeforetable", "insertrow", "deleterow", "insertcol", "deletecol", "mergecells", "mergeright", "mergedown", "splittocells", "splittorows", "splittocols"]
					],
					autoClearinitialContent: !1,
					autoFloatEnabled: !0,
					wordCount: !0,
					elementPathEnabled: !1,
					maximumWords: 1e4,
					initialFrameWidth: 458,
					initialFrameHeight: 600,
					focus: !1
				});
			t.addListener("blur", function() {
				e.model.set("content", e._editor.getContent())
			}), t.addListener("contentChange", function() {
				e.model.set("content", e._editor.getContent())
			}), t.render(this.$(".js-editor")[0]), t.ready(function() {
				t.setContent(e.model.get("content"))
			})
		},
		save: function() {
			this._editor && this.model.set("content", this._editor.getContent())
		}
	})
}), define("text!components/showcase/2.0.0/goods/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">选择商品：</label>\n        <div class="controls">\n            <ul class="module-goods-list clearfix" name="goods">\n                <% _.each(goods, function(item, index) { %>\n                    <li class="sort">\n                        <a href="<%= item.url %>" target="_blank"><img src="<%= fullfillImage(item.image_url) %>" alt="商品图" width="50" height="50"></a>\n                        <a class="close-modal js-delete-goods small hide" data-id="<% item.id %>" title="删除">×</a>\n                    </li>\n                <% }); %>\n                <li>\n                    <a href="javascript:void(0);" class="js-add-goods add-goods"><i class="icon-add"></i></a>\n                </li>\n            </ul>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">列表样式：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="size" value="0" <% if (size == \'0\') { %> checked <% } %>>大图\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="1" <% if (size == \'1\') { %> checked <% } %>>小图\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="2" <% if (size == \'2\') { %> checked <% } %>>一大两小\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="3" <% if (size == \'3\') { %> checked <% } %>>详细列表\n            </label>\n        </div>\n    </div>\n    <div class="control-group">\n        <div class="controls">\n            <div class="controls-card">\n                <div class="controls-card-tab">\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="0" <% if (size_type == \'0\') { %> checked <% } %>>\n                        卡片样式\n                    </label>\n                    <% if(size == \'1\') { %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="1" <% if (size_type == \'1\') { %> checked <% } %>>\n                        瀑布流\n                    </label>\n                    <% } %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="2" <% if (size_type == \'2\') { %> checked <% } %>>\n                        极简样式\n                    </label>\n                    <% if(size == \'1\') { %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="3" <% if (size_type == \'3\') { %> checked <% } %>>\n                        促销\n                    </label>\n                    <% } %>\n                </div>\n                <% if(size_type != \'3\' && (size_type != \'2\' || size == \'3\')) { %>\n                <div class="controls-card-item">\n                    <div>\n                        <label class="checkbox inline">\n                            <% if (buy_btn == \'0\') { %>\n                                <input type="checkbox" name="buy_btn" value="0">显示购买按钮\n                            <% } else { %>\n                                <input type="checkbox" name="buy_btn" value="1" checked>显示购买按钮\n                            <% } %>\n                        </label>\n                    </div>\n                    <% if (buy_btn == \'1\') { %>\n                    <div style="margin: 10px 0 0 20px;">\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="1" <% if (buy_btn_type == \'1\') { %> checked <% } %>>\n                            样式1\n                        </label>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="2" <% if (buy_btn_type == \'2\') { %> checked <% } %>>\n                            样式2\n                        </label>\n                        <% if(!(size == \'3\' && size_type == \'2\')) { %>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="3" <% if (buy_btn_type == \'3\') { %> checked <% } %>>\n                            样式3\n                        </label>\n                        <% } %>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="4" <% if (buy_btn_type == \'4\') { %> checked <% } %>>\n                            样式4\n                        </label>\n                    </div>\n                    <% } %>\n                </div>\n                <% } %>\n                <% if(size_type != \'3\' && size != \'3\') { %>\n                    <% if(!(size == \'1\' && size_type == \'2\')) { %>\n                    <div class="controls-card-item">\n                        <label class="checkbox inline">\n                            <% if (title == \'0\') { %>\n                                <input type="checkbox" name="title" value="0">显示商品名 <%= size == \'2\' ? \'(小图不显示名称)\' : \'\'%>\n                            <% } else { %>\n                                <input type="checkbox" name="title" value="1" checked>显示商品名 <%= size == \'2\' ? \'(小图不显示名称)\' : \'\'%>\n                            <% } %>\n                        </label>\n                    </div>\n                    <% } %>\n                    <div class="controls-card-item">\n                        <label class="checkbox inline">\n                            <% if (price == \'0\') { %>\n                                <input type="checkbox" name="price" value="0">显示价格\n                            <% } else { %>\n                                <input type="checkbox" name="price" value="1" checked>显示价格\n                            <% } %>\n                        </label>\n                    </div>\n                    <% if(size_type == \'2\') { %>\n                        <div class="controls-card-item">\n                            <label class="checkbox inline">\n                                <% if (cart == \'0\') { %>\n                                    <input type="checkbox" name="cart" value="0">显示购物车图标\n                                <% } else { %>\n                                    <input type="checkbox" name="cart" value="1" checked>显示购物车图标\n                                <% } %>\n                            </label>\n                        </div>\n                    <% } %>\n                <% } %>\n            </div>\n        </div>\n    </div>\n\n</form>\n'
}), define("components/showcase/2.0.0/goods/views/edit", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/goods/templates/edit.html", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/goods/templates/edit.html"),
		o = e("components/modal/1.0.0/modal"),
		a = e("core/utils");
	return i.extend({
		template: t.template(s),
		templateHelpers: {
			fullfillImage: a.fullfillImage
		},
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel",
			"click .js-delete-goods": "handleDeleteGoods",
			"click .js-add-goods": "handleAddGoods"
		},
		modelEvents: {
			change: "render"
		},
		onInit: function() {
			this.listenTo(this.model, "change:size", this.render), this.listenTo(this.model, "change:goods", this.render)
		},
		onRender: function() {
			var e = this;
			return this.$(".module-goods-list").sortable({
				items: "> .sort",
				cursor: "move",
				start: function(e, t) {
					t.item.data("startPos", t.item.index())
				},
				stop: function(t, n) {
					var i = n.item.data("startPos"),
						s = n.item.index();
					i !== s && (e.sort(i, s, e.model.get("goods")), e.model.trigger("change"), e.model.trigger("change:goods"))
				}
			}), this
		},
		handleDeleteGoods: function(e) {
			var t = n(e.target),
				i = this.$(".module-goods-list .js-delete-goods").index(t);
			this.model.deleteGoods(i)
		},
		handleAddGoods: function() {
			var e = this;
			this.goodsModal = o.initialize({
				type: "goods",
				hide: ["tag"],
				multiChoose: !0
			}).setChooseItemCallback(function(n) {
				t.each(n, function(t) {
					e.model.get("goods").push({
						id: t.data_id,
						url: t.data_url,
						image_url: t.image_url,
						image_id: t.data_id || t.id || "",
						price: "0" != t.data_price ? (t.data_price / 100).toFixed(2) : 0,
						title: t.title
					})
				}), e.model.trigger("change"), e.model.trigger("change:goods")
			}), this.goodsModal.modal("show")
		}
	})
}), define("text!components/showcase/2.0.0/goods_list/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">商品来源：</label>\n        <div class="controls">\n            <% if (goods) { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left link-to">\n                        <a href="<%= goods.url %>" class="link-to-title" target="_blank">\n                            <span class="label label-success">\n                                <% if (goods.type === \'feature\') { %>微页面<%} else { %>商品标签<% } %>\n                                <em class="link-to-title-text"><%- goods.title %></em>\n                            </span>\n                        </a>\n                    </div>\n                    <a href="javascript:void(0);" class="pull-right js-add-goods add-goods">修改</a>\n                </div>\n            <% } else { %>\n                <a href="javascript:void(0);" class="js-add-goods add-goods control-action">从商品分组中选择</a>\n            <% } %>\n            <p class="help-desc">选择商品来源后，左侧实时预览暂不支持显示其包含的商品数据</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">显示个数：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="goods_number_type" value="0" <% if (goods_number_type == 0) { %> checked <% } %>>6\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="goods_number_type" value="1" <% if (goods_number_type == 1) { %> checked <% } %>>12\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="goods_number_type" value="2" <% if (goods_number_type == 2) { %> checked <% } %>>18\n            </label>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">列表样式：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="size" value="0" <% if (size == \'0\') { %> checked <% } %>>大图\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="1" <% if (size == \'1\') { %> checked <% } %>>小图\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="2" <% if (size == \'2\') { %> checked <% } %>>一大两小\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="size" value="3" <% if (size == \'3\') { %> checked <% } %>>详细列表\n            </label>\n        </div>\n    </div>\n    <div class="control-group">\n        <div class="controls">\n            <div class="controls-card">\n                <div class="controls-card-tab">\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="0" <% if (size_type == \'0\') { %> checked <% } %>>\n                        卡片样式\n                    </label>\n                    <% if(size == \'1\') { %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="1" <% if (size_type == \'1\') { %> checked <% } %>>\n                        瀑布流\n                    </label>\n                    <% } %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="2" <% if (size_type == \'2\') { %> checked <% } %>>\n                        极简样式\n                    </label>\n                    <% if(size == \'1\') { %>\n                    <label class="radio inline">\n                        <input type="radio" name="size_type" value="3" <% if (size_type == \'3\') { %> checked <% } %>>\n                        促销\n                    </label>\n                    <% } %>\n                </div>\n                <% if(size_type != \'3\' && (size_type != \'2\' || size == \'3\')) { %>\n                <div class="controls-card-item">\n                    <div>\n                        <label class="checkbox inline">\n                            <% if (buy_btn == \'0\') { %>\n                                <input type="checkbox" name="buy_btn" value="0">显示购买按钮\n                            <% } else { %>\n                                <input type="checkbox" name="buy_btn" value="1" checked>显示购买按钮\n                            <% } %>\n                        </label>\n                    </div>\n                    <% if (buy_btn == \'1\') { %>\n                    <div style="margin: 10px 0 0 20px;">\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="1" <% if (buy_btn_type == \'1\') { %> checked <% } %>>\n                            样式1\n                        </label>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="2" <% if (buy_btn_type == \'2\') { %> checked <% } %>>\n                            样式2\n                        </label>\n                        <% if(!(size == \'3\' && size_type == \'2\')) { %>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="3" <% if (buy_btn_type == \'3\') { %> checked <% } %>>\n                            样式3\n                        </label>\n                        <% } %>\n                        <label class="radio inline">\n                            <input type="radio" name="buy_btn_type" value="4" <% if (buy_btn_type == \'4\') { %> checked <% } %>>\n                            样式4\n                        </label>\n                    </div>\n                    <% } %>\n                </div>\n                <% } %>\n                <% if(size_type != \'3\' && size != \'3\') { %>\n                    <% if(!(size == \'1\' && size_type == \'2\')) { %>\n                    <div class="controls-card-item">\n                        <label class="checkbox inline">\n                            <% if (title == \'0\') { %>\n                                <input type="checkbox" name="title" value="0">显示商品名 <%= size == \'2\' ? \'(小图不显示名称)\' : \'\'%>\n                            <% } else { %>\n                                <input type="checkbox" name="title" value="1" checked>显示商品名 <%= size == \'2\' ? \'(小图不显示名称)\' : \'\'%>\n                            <% } %>\n                        </label>\n                    </div>\n                    <% } %>\n                    <div class="controls-card-item">\n                        <label class="checkbox inline">\n                            <% if (price == \'0\') { %>\n                                <input type="checkbox" name="price" value="0">显示价格\n                            <% } else { %>\n                                <input type="checkbox" name="price" value="1" checked>显示价格\n                            <% } %>\n                        </label>\n                    </div>\n                    <% if(size_type == \'2\') { %>\n                        <div class="controls-card-item">\n                            <label class="checkbox inline">\n                                <% if (cart == \'0\') { %>\n                                    <input type="checkbox" name="cart" value="0">显示购物车图标\n                                <% } else { %>\n                                    <input type="checkbox" name="cart" value="1" checked>显示购物车图标\n                                <% } %>\n                            </label>\n                        </div>\n                    <% } %>\n                <% } %>\n            </div>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/goods_list/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/goods_list/templates/edit.html", "components/modal/1.0.0/modal"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/goods_list/templates/edit.html"),
		s = e("components/modal/1.0.0/modal");
	return n.extend({
		template: t.template(i),
		events: {
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel",
			"click .js-add-goods": "handleAddGoods"
		},
		modelEvents: {
			change: "render"
		},
		onInit: function() {
			this.listenTo(this.model, "change:size", this.render), this.listenTo(this.model, "change:goods", this.render)
		},
		handleAddGoods: function() {
			var e = this;
			this.goodsModal = s.initialize({
				type: "tag"
			}).setChooseItemCallback(function(t) {
				e.model.set("goods", {
					id: t.data_id,
					url: t.data_url,
					image_url: t.data_cover_attachment_url,
					price: "0" != t.data_price ? (t.data_price / 100).toFixed(2) : 0,
					title: t.title,
					type: t.data_type
				})
			}), this.goodsModal.modal("show")
		}
	})
}), define("components/showcase/2.0.0/base/views/edit_collection_base", ["require", "jquery", "marionette"], function(e) {
	var t = (e("jquery"), e("marionette"));
	return t.CollectionView.extend({
		tagName: "ul",
		className: "choices",
		events: {
			"click .choice": function(e) {
				var t = e.target.nodeName.toLowerCase(); - 1 === ["input", "textarea", "select"].indexOf(t) && this.$(":focus").blur()
			}
		},
		itemViewOptions: function() {
			return {
				layout: this.options.layout
			}
		},
		sortable: function() {
			var e = this;
			this.$el.sortable({
				axis: "y",
				cursor: "move",
				start: function(e, t) {
					t.item.data("start", t.item.index())
				},
				stop: function(t, n) {
					var i = n.item.data("start"),
						s = n.item.index();
					i !== s && (e.sort(i, s, e.collection.models), e.collection.trigger("reset"))
				}
			})
		},
		sort: function(e, t, n) {
			var i = n.splice(e, 1)[0];
			return n.splice(t, 0, i), n
		}
	})
}), define("text!components/showcase/2.0.0/image_ad/templates/edit_item.html", [], function() {
	return '<div class="choice-image">\n    <% if (image_id === \'\') { %>\n        <a class="add-image js-trigger-image" href="javascript: void(0);"><i class="icon-add"></i>  添加图片</a>\n    <% } else { %>\n        <img src="<%= image_url %>" data-full-size="<%= image_url %>" width="118" height="118" class="thumb-image">\n        <a class="modify-image js-trigger-image" href="javascript: void(0);">重新上传</a>\n    <% } %>\n\n    <!-- for error msg -->\n    <div class="control-group">\n        <div class="controls">\n            <input type="hidden" name="image_url">\n        </div>\n    </div>\n</div>\n<div class="choice-content">\n    <div class="control-group">\n        <label class="control-label">标题：</label>\n        <div class="controls">\n            <input class="" type="text" name="title[<%= cid %>]" value="<%- title %>">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">链接：</label>\n        <div class="controls">\n            <% if (link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n</div>\n\n<div class="actions">\n    <span class="action add close-modal" title="添加">+</span><span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("text!components/public_template/dropdown_menu.html", [], function() {
	return '<ul class="dropdown-menu">\n    <li>\n        <a class="js-modal-magazine" data-type="feature" href="javascript:void(0);">微页面及分类</a>\n    </li>\n    <li>\n        <a class="js-modal-goods" data-type="goods" href="javascript:void(0);">商品及分类</a>\n    </li>\n    <% if (+_global.team_status.weixin_oldsub === 1 || +_global.team_status.weixin_server === 1) { %>\n    <li>\n        <a class="js-modal-activity" data-type="activity" href="javascript:void(0);">营销活动</a>\n    </li>\n    <% } %>\n    <li>\n        <a class="js-modal-survey" data-type="survey" href="javascript:void(0);">投票调查</a>\n    </li>\n    <% if (+_global.team_status.weixin_oldsub === 1 || +_global.team_status.weixin_server === 1) { %>\n    <li>\n        <a class="js-modal-history" data-type="history" href="javascript:void(0);">历史消息</a>\n    </li>\n    <% } %>\n    <li>\n        <a class="js-modal-homepage" data-type="homepage" href="javascript:void(0);">店铺主页</a>\n    </li>\n    <li>\n        <a class="js-modal-usercenter" data-type="usercenter" href="javascript:void(0);">会员主页</a>\n    </li>\n    <li>\n        <a class="js-modal-links" data-type="links" href="javascript:void(0);">自定义外链</a>\n    </li>\n</ul>\n'
}), define("components/showcase/2.0.0/image_ad/views/edit_item", ["require", "underscore", "jquery", "backbone", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/image_ad/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = (e("backbone"), e("components/showcase/2.0.0/base/views/edit_base")),
		s = e("text!components/showcase/2.0.0/image_ad/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-trigger-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function(e) {
			this.parent = e.parent || {}, this.listenTo(this.model, "change", this.render)
		},
		serializeData: function() {
			var e = this.model.cid,
				n = t.clone(this.model.attributes);
			t.extend(n, {
				cid: e,
				dropdown_menu: this.dropdownTpl
			});
			var i = this.model.get("image_url");
			return i = i && r.fullfillImage(i, "!100x100+2x.jpg"), n.image_url = i, n.image_thumb_url = i, n
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					}), e.options.layout.model.calculateImage()
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		"delete": function() {
			this.model.destroy()
		},
		add: function() {
			if (this.model.collection.length >= 20) return void r.errorNotify("选项最多20个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.collection.indexOf(this.model);
			this.model.collection.add(e, {
				at: n + 1,
				element: this.$el
			}), this.model.collection.trigger("reset")
		}
	})
}), define("components/showcase/2.0.0/image_ad/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/image_ad/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/image_ad/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/image_ad/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">显示方式：</label>\n        <div class="controls">\n            <% if (show_method == \'0\') { %>\n                <label class="radio inline">\n                        <input type="radio" name="show_method" value="0" checked>折叠轮播\n                </label>\n                <label class="radio inline">\n                        <input type="radio" name="show_method" value="1">分开显示\n                </label>\n            <% } else { %>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="0">折叠轮播\n                </label>\n                <label class="radio inline">\n                        <input type="radio" name="show_method" value="1" checked>分开显示\n                </label>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">显示大小：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="size" value="0" <% if (size == \'0\') { %> checked <% } %>>大图\n            </label>\n            <% if (show_method == \'1\') { %>\n            <label class="radio inline">\n                <input type="radio" name="size" value="1" <% if (size == \'1\') { %> checked <% } %>>小图\n            </label>\n            <% } %>\n        </div>\n    </div>\n\n    <div class="control-group js-choices-region">\n    </div>\n\n    <div class="control-group options">\n        <a href="javascript:void(0);" class="add-option js-add-option"><i class="icon-add"></i> 添加一个广告</a>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/image_ad/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/image_ad/views/edit_collection", "text!components/showcase/2.0.0/image_ad/templates/edit.html", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/image_ad/views/edit_collection"),
		s = e("text!components/showcase/2.0.0/image_ad/templates/edit.html"),
		o = e("components/image/2.0.0/app"),
		a = e("core/utils");
	return n.extend({
		template: t.template(s),
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel",
			"click .js-add-option": "addOption"
		},
		regions: {
			choicesRegion: ".js-choices-region"
		},
		onInit: function(e) {
			this.parent = e.parent;
			var t = this;
			this.listenTo(this.model, "change:show_method", this.render), this.listenTo(this.model.get("sub_entry"), "remove", function(e, n) {
				n.models.length < 10 && t.$(".options").show(), t.model.calculateImage()
			})
		},
		onRender: function() {
			this.model.get("sub_entry").length >= 10 && this.$(".options").hide(), this.choicesRegion.show(new i({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		},
		addOption: function() {
			var e = this,
				n = e.model.get("sub_entry");
			o.initialize({
				callback: function(e) {
					var i = !1;
					if (t.each(e, function(e) {
						n.length < 10 ? n.add({
							type: "image_ad_selection",
							image_id: e.attachment_id,
							image_url: e.attachment_url,
							image_thumb_url: e.thumb_url,
							image_width: Number(e.width),
							image_height: Number(e.height)
						}) : i = !0
					}), n.trigger("update"), i) {
						var s = setTimeout(a.clearNotify, 3e3);
						a.errorNotify("图片广告不能多于10个，已经自动删除多余的图片。", function() {
							clearTimeout(s)
						})
					}
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/nav/templates/edit_item.html", [], function() {
	return '<div class="choice-image">\n    <% if (image_id === \'\') { %>\n        <a class="add-image js-trigger-image" href="javascript: void(0);"><i class="icon-add"></i>  添加图片</a>\n    <% } else { %>\n        <img src="<%= image_url %>" data-full-size="<%= image_url %>" width="118" height="118" class="thumb-image">\n        <a class="modify-image js-trigger-image" href="javascript: void(0);">重新上传</a>\n    <% } %>\n\n    <!-- for error msg -->\n    <div class="control-group">\n        <div class="controls">\n            <input type="hidden" name="image_url">\n        </div>\n    </div>\n</div>\n<div class="choice-content">\n    <div class="control-group">\n        <label class="control-label">文字：</label>\n        <div class="controls">\n            <input class="" type="text" name="title" value="<%- title %>" maxLength="5">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">链接：</label>\n        <div class="controls">\n            <input type="hidden" name="link_url">\n            <% if (link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n</div>\n'
}), define("components/showcase/2.0.0/nav/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/nav/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/nav/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-trigger-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change:image_url", this.render), this.listenTo(this.model, "change:link_url", this.render)
		},
		serializeData: function() {
			var e = t.clone(this.model.attributes);
			t.extend(e, {
				dropdown_menu: this.dropdownTpl
			});
			var n = this.model.get("image_url");
			return n = n && r.fullfillImage(n, "!100x100+2x.jpg"), e.image_url = n, e.image_thumb_url = n, e
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					})
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		}
	})
}), define("components/showcase/2.0.0/nav/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/nav/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/nav/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/nav/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="js-collection-region">\n\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/nav/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/nav/views/edit_collection", "text!components/showcase/2.0.0/nav/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/nav/views/edit_collection"),
		s = e("text!components/showcase/2.0.0/nav/templates/edit.html");
	return n.extend({
		template: t.template(s),
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset remove add", this.toggleOptions)
		},
		onRender: function() {
			this.collectionRegion.show(new i({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 4 ? this.$(".options").hide() : this.$(".options").show()
		}
	})
}), define("text!components/showcase/2.0.0/showcase/templates/edit_item.html", [], function() {
	return '<div class="choice-image">\n    <% if (image_id === \'\') { %>\n        <a class="add-image js-trigger-image" href="javascript: void(0);"><i class="icon-add"></i>  添加图片</a>\n    <% } else { %>\n        <img src="<%= fullfillImage(image_url, \'!100x100+2x.jpg\') %>" width="118" height="118" class="thumb-image">\n        <a class="modify-image js-trigger-image" href="javascript: void(0);">重新上传</a>\n    <% } %>\n\n    <!-- for error msg -->\n    <div class="control-group">\n        <div class="controls">\n            <input type="hidden" name="image_url">\n        </div>\n    </div>\n</div>\n<div class="choice-content">\n\n    <div class="control-group hide">\n        <label class="control-label">文字：</label>\n        <div class="controls">\n            <input class="input-xxlarge" type="text" name="title" value="<%- title %>" maxLength="5">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">链接：</label>\n        <div class="controls">\n            <input type="hidden" name="link_url">\n            <% if (link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n</div>\n\n'
}), define("components/showcase/2.0.0/showcase/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/showcase/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/showcase/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				dropdown_menu: this.dropdownTpl,
				fullfillImage: r.fullfillImage
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-trigger-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change:image_url", this.render), this.listenTo(this.model, "change:link_url", this.render)
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					})
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		"delete": function() {
			this.model.destroy()
		},
		add: function() {
			if (this.model.collection.length >= 20) return void r.errorNotify("选项最多20个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.index();
			this.model.collection.add(e, {
				at: n + 1
			})
		}
	})
}), define("components/showcase/2.0.0/showcase/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/showcase/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/showcase/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/showcase/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">橱窗标题名：</label>\n        <div class="controls">\n            <input type="text" name="title" value="<%= title %>" maxLength="15">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">显示方式：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="mode" value="0" <% if (mode == \'0\') { %> checked <% } %>>默认\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="mode" value="1" <% if (mode == \'1\') { %> checked <% } %>>3 列\n            </label>\n            <p class="help-desc">PC版一直显示 3 列</p>\n        </div>\n    </div>\n\n    <div class="control-group">\n        <label class="control-label">内容区标题：</label>\n        <div class="controls">\n            <input type="text" name="body_title" value="<%= body_title %>" maxLength="15">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">内容区说明：</label>\n        <div class="controls">\n            <textarea name="body_desc" cols="15" rows="3" maxLength="50"><%= body_desc %></textarea>\n        </div>\n    </div>\n\n    <div class="control-group js-collection-region">\n\n    </div>\n\n</form>\n'
}), define("components/showcase/2.0.0/showcase/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/showcase/views/edit_collection", "text!components/showcase/2.0.0/showcase/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/showcase/views/edit_collection"),
		s = e("text!components/showcase/2.0.0/showcase/templates/edit.html");
	return n.extend({
		template: t.template(s),
		events: {
			'blur input[type="text"]': "updateModel",
			"blur textarea": "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onRender: function() {
			this.collectionRegion.show(new i({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		}
	})
}), define("text!components/showcase/2.0.0/level/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">背景图：</label>\n        <div class="controls">\n            <% if (image.url === \'\') { %>\n                <a class="js-choose-bg control-action" href="javascript: void(0);">选择背景图</a>\n            <% } else { %>\n                <img src="<%= fullfillImage(image.url) %>" width="100" height="100">\n                <a class="js-choose-bg control-action" href="javascript: void(0);">修改背景图</a>\n            <% } %>\n            <p class="help-desc">背景图推荐宽度 640 像素、高度 320 像素</p>\n        </div>\n    </div>\n    <div class="separate-line-wrap">\n        <hr>\n        <div class="separate-line">\n            <p class="text-center">显示等级的设置</p>\n            <p class="text-center">v</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">等级：</label>\n        <div class="controls">\n            <label class="checkbox inline">\n                <% if (show_level == \'0\') { %>\n                    <input type="checkbox" name="show_level" value="0">显示等级\n                <% } else { %>\n                    <input type="checkbox" name="show_level" value="1" checked>显示等级\n                <% } %>\n            </label>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">等级提示：</label>\n        <div class="controls">\n            <input type="text" name="level_msg" value="<%- level_msg %>">\n        </div>\n    </div>\n    <div class="separate-line-wrap">\n        <hr>\n        <div class="separate-line">\n            <p class="text-center">显示积分的设置</p>\n            <p class="text-center">v</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">积分：</label>\n        <div class="controls">\n            <label class="checkbox inline">\n                <% if (show_point == \'0\') { %>\n                    <input type="checkbox" name="show_point" value="0">显示积分\n                <% } else { %>\n                    <input type="checkbox" name="show_point" value="1" checked>显示积分\n                <% } %>\n            </label>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">积分提示：</label>\n        <div class="controls">\n            <input type="text" name="point_msg" value="<%- point_msg %>">\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/level/views/edit", ["components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/level/templates/edit.html", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e, t, n, i, s) {
	return e.extend({
		template: _.template(t),
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel",
			"click .js-choose-bg": function() {
				var e = this;
				i.initialize({
					multiChoose: !1,
					callback: function(t) {
						t = t[0], e.model.set("image", {
							id: t.attachment_id,
							url: t.attachment_url
						}), e.model.set("is_default", !1)
					}
				})
			}
		},
		onInit: function(e) {
			this.parent = e.parent, this.listenTo(this.model, "change:image", this.render)
		},
		render: function() {
			return this.$el.html(this.template(_.extend({}, this.model.attributes, {
				fullfillImage: s.fullfillImage
			}))), this
		}
	})
}), define("text!components/showcase/2.0.0/link/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>内容来源：</label>\n    <div class="controls">\n        <% if (source_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (source_title !== \'\' && source_type !== \'link\') { %>\n                        <input type="hidden" name="source_url" value="<%= source_url %>">\n                        <a href="<%= source_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n                    <span class="label label-success">\n                    <% if (source_type === \'feature\') { %>\n                        微页面\n                    <% } else if (source_type === \'category\') { %>\n                        微页面分类\n                    <% } else if (source_type === \'topic\') { %>\n                        专题\n                    <% } else if (source_type === \'article\') { %>\n                        资讯\n                    <% } else if (source_type === \'goods\') { %>\n                        商品\n                    <% } else if (source_type === \'tag\') { %>\n                        商品标签\n                    <% } else if (source_type === \'activity\') { %>\n                        营销活动\n                    <% } else if (source_type === \'survey\') { %>\n                        调查\n                    <% } else if (source_type === \'homepage\') { %>\n                        店铺主页\n                    <% } else if (source_type === \'usercenter\') { %>\n                        会员主页\n                    <% } else if (source_type === \'link\') { %>\n                        自定义外链\n                    <% } else if (source_type === \'history\') { %>\n                        历史信息\n                    <% } %>\n                <% if (source_title !== \'\' && source_type !== \'link\') { %>\n                        <em class="link-to-title-text"><%- source_title %></em>\n                    </span></a>\n                <% } else { %>\n                    </span>\n                <% } %>\n                </div>\n                <% if (source_type !== \'link\') { %>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <ul class="dropdown-menu">\n                        <li>\n                            <a class="js-modal-category" data-type="category" href="javascript:void(0);">微页面分类</a>\n                        </li>\n                        <li>\n                            <a class="js-modal-tag" data-type="tag" href="javascript:void(0);">商品标签</a>\n                        </li>\n                    </ul>\n                </div>\n                <% } %>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <ul class="dropdown-menu">\n                    <li>\n                        <a class="js-modal-category" data-type="category" href="javascript:void(0);">微页面分类</a>\n                    </li>\n                    <li>\n                        <a class="js-modal-tag" data-type="tag" href="javascript:void(0);">商品标签</a>\n                    </li>\n                    <li>\n                        <a class="js-modal-links" data-type="links" href="javascript:void(0);">自定义外链</a>\n                    </li>\n                </ul>\n            </div>\n        <% } %>\n        <input type="hidden" name="source_url">\n    </div>\n</div>\n\n<% if (source_type === \'link\') { %>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接名称：</label>\n    <div class="controls">\n        <input type="text" name="source_title" value="<%- source_title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接地址：</label>\n    <div class="controls">\n        <input type="text" name="source_url" value="<%- source_url %>" class="js-fullfill-url">\n    </div>\n</div>\n<% } else if (source_type !== \'\') { %>\n<div class="control-group">\n    <label class="control-label">显示条数：</label>\n    <div class="controls">\n        <select name="number">\n            <option value="1" <% if (number == 1) {%>selected<% } %>>1条</option>\n            <option value="2" <% if (number == 2) {%>selected<% } %>>2条</option>\n            <option value="3" <% if (number == 3) {%>selected<% } %>>3条</option>\n            <option value="4" <% if (number == 4) {%>selected<% } %>>4条</option>\n            <option value="5" <% if (number == 5) {%>selected<% } %>>5条</option>\n        </select>\n    </div>\n</div>\n<% } %>\n\n<div class="actions">\n    <span class="action add close-modal" title="添加">+</span><span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/link/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/link/templates/edit_item.html", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/link/templates/edit_item.html"),
		o = e("components/pop/pop"),
		a = e("components/modal/1.0.0/modal"),
		l = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		events: {
			'blur input[type="text"]:not(.js-fullfill-url)': "updateModel",
			"blur .js-fullfill-url": "urlCheck",
			"change select": "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-modal-category, .js-modal-tag": "chooseLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change", this.render)
		},
		urlCheck: function(e) {
			this.fullfillUrl(e, "source_url")
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			a.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					source_id: e.data_id || e.id,
					source_type: i,
					source_url: e.data_url,
					source_image: e.cover_attachment_url,
					source_title: e.data_title
				})
			}).modal("show")
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			o.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						source_id: "",
						source_type: "link",
						source_url: e,
						source_image: "",
						source_title: e
					})
				}
			})
		},
		"delete": function() {
			this.model.destroy()
		},
		add: function() {
			if (this.model.collection.length >= 20) return void l.errorNotify("选项最多20个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.index();
			this.model.collection.add(e, {
				at: n + 1
			}), this.model.collection.trigger("reset")
		}
	})
}), define("components/showcase/2.0.0/link/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/link/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/link/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/link/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <% if (show_method == \'1\') { %>\n    <div class="control-group">\n        <label class="control-label">显示方式：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="show_method" value="0">通栏\n            </label>\n        </div>\n    </div>\n    <% } %>\n    <div class="control-group js-collection-region">\n\n    </div>\n    <div class="control-group options">\n        <a class="js-add-option add-option" href="javascript:void(0);"><i class="icon-add"></i> 添加一个关联链接</a>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/link/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/link/views/edit_collection", "text!components/showcase/2.0.0/link/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/link/views/edit_collection"),
		s = e("text!components/showcase/2.0.0/link/templates/edit.html");
	return n.extend({
		template: t.template(s),
		events: {
			'change input[type="radio"]': "updateModel",
			"click .js-add-option": "addOption"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset remove add", this.toggleOptions)
		},
		onRender: function() {
			this.collectionRegion.show(new i({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		addOption: function() {
			var e = {
				type: "source_selection",
				number: "3"
			};
			this.model.get("sub_entry").add(e)
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 20 ? this.$(".options").hide() : this.$(".options").show()
		}
	})
}), define("text!components/showcase/2.0.0/text_nav/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <% if (show_method == \'1\') { %>\n    <div class="control-group">\n        <label class="control-label">显示方式：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="show_method" value="0">通栏\n            </label>\n        </div>\n    </div>\n    <% } %>\n    <div class="control-group js-collection-region">\n\n    </div>\n    <div class="control-group options">\n        <a class="add-option js-add-option" href="javascript:void(0);"><i class="icon-add"></i> 添加一个文本导航</a>\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/text_nav/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>导航名称：</label>\n    <div class="controls">\n        <input type="text" name="title" value="<%= title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接到：</label>\n    <div class="controls">\n        <% if (link_type != \'\') { %>\n\n                <input type="hidden" name="link_url">\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                            <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%= link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="actions">\n    <span class="action add close-modal" title="添加">+</span><span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/text_nav/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/text_nav/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/text_nav/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]:not(.js-fullfill-url)': "updateModel",
			"blur .js-fullfill-url": "urlCheck",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change", this.render)
		},
		urlCheck: function(e) {
			this.fullfillUrl(e, "link_url")
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url,
					title: t.getOldTitle() || e.data_title
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			c.getStaticUrl(t, function(e, n) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: n,
					link_url: e,
					title: i.getOldTitle() || n
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			}), this.parent.render()
		},
		"delete": function() {
			this.model.destroy()
		},
		getOldTitle: function() {
			var e = this.model.toJSON();
			return e.title && e.title !== e.link_title ? e.title : ""
		},
		add: function() {
			if (this.model.collection.length >= 20) return void c.errorNotify("选项最多20个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.index();
			this.model.collection.add(e, {
				at: n + 1
			}), this.model.collection.trigger("reset")
		}
	})
}), define("components/showcase/2.0.0/text_nav/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/text_nav/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/text_nav/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/text_nav/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/text_nav/templates/edit.html", "text!components/public_template/dropdown_menu.html", "components/showcase/2.0.0/text_nav/views/edit_collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/text_nav/templates/edit.html"),
		s = e("text!components/public_template/dropdown_menu.html"),
		o = e("components/showcase/2.0.0/text_nav/views/edit_collection");
	return n.extend({
		template: t.template(i),
		dropdownTpl: t.template(s),
		events: {
			'change input[type="radio"]': "updateModel",
			"click .js-add-option": "addOption"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		serializeData: function() {
			return t.extend({}, this.model.attributes, {
				dropdown_menu: this.dropdownTpl
			})
		},
		onRender: function() {
			this.collectionRegion.show(new o({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		addOption: function() {
			var e = {
				type: "text_nav_selection",
				title: ""
			};
			this.model.get("sub_entry").add(e)
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 20 ? this.$(".options").hide() : this.$(".options").show()
		}
	})
}), define("text!components/showcase/2.0.0/tag_list/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n\n    <p class="app-component-desc">该列表支持用户在当前页直接把商品加入购物车或购买，查看样板页面</p>\n\n    <div class="control-group js-collection-region">\n\n    </div>\n    <div class="control-group options js-add-subentry">\n        <a class="add-option js-add-option" href="javascript:void(0);"><i class="icon-add"></i> 添加商品分组</a>\n    </div>\n\n    <div class="control-group">\n        <p class="app-component-desc help-desc">选择商品来源后，左侧实时预览暂不支持显示其包含的商品数据</p>\n    </div>\n\n</form>\n'
}), define("text!components/showcase/2.0.0/tag_list/templates/edit_item.html", [], function() {
	return '<div class="edit-tag-list">\n    <div class="tag-source">\n        <div class="control-group">\n            <label class="control-label pull-left">商品来源：</label>\n            <div class="controls pull-left">\n                <% if(title) { %>\n                        <a href="<%- url %>" target="_blank" class="tag-title new-window"><%- title %></a>\n                        <a href="javascript:;" class="tag-modify js-select-tag">修改</a>\n                <% } else { %>\n                    <a href="javascript:;" class="js-select-tag pull-left">选择商品分组</a>\n                <% } %>\n                <input type="hidden" name="title">\n            </div>\n        </div>\n    </div>\n    <div class="split-line"></div>\n    <div class="goods-number">\n        <span>显示商品数量</span>\n\n        <div class="dropdown hover pull-right">\n            <a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><%- goods_number %> <i class="caret"></i></a>\n            <ul class="dropdown-menu" role="menu">\n                <li>\n                    <a class="js-goods-number" data-value="5" href="javascript:void(0);">5</a>\n                </li>\n                <li>\n                    <a class="js-goods-number" data-value="10" href="javascript:void(0);">10</a>\n                </li>\n                <li>\n                    <a class="js-goods-number" data-value="15" href="javascript:void(0);">15</a>\n                </li>\n            </ul>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/tag_list/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tag_list/templates/edit_item.html", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tag_list/templates/edit_item.html"),
		o = e("components/modal/1.0.0/modal"),
		a = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		events: {
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-select-tag": "handleSelectTag",
			"click .js-goods-number": "handleGoodsNumber"
		},
		onInit: function() {
			this.listenTo(this.model, "change", this.render)
		},
		urlCheck: function(e) {
			this.fullfillUrl(e, "link_url")
		},
		"delete": function() {
			var e = this.model.collection;
			this.model.destroy(), e.trigger("reset")
		},
		add: function() {
			if (this.model.collection.length >= 8) return void a.errorNotify("选项最多8个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.index();
			this.model.collection.add(e, {
				at: n + 1
			}), this.model.collection.trigger("reset")
		},
		handleSelectTag: function() {
			var e = this;
			this.tagModel = o.initialize({
				type: "tag"
			}).setChooseItemCallback(function(t) {
				e.model.set({
					type: t.data_type,
					id: t.data_id,
					title: t.title,
					url: t.data_url
				})
			}), this.tagModel.modal("show")
		},
		handleGoodsNumber: function(e) {
			var t = n(e.target).data("value");
			this.model.set("goods_number", t, {
				silent: !0
			}), this.render()
		}
	})
}), define("components/showcase/2.0.0/tag_list/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/tag_list/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/tag_list/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/tag_list/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tag_list/templates/edit.html", "text!components/public_template/dropdown_menu.html", "components/showcase/2.0.0/tag_list/views/edit_collection", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/tag_list/templates/edit.html"),
		s = e("text!components/public_template/dropdown_menu.html"),
		o = e("components/showcase/2.0.0/tag_list/views/edit_collection"),
		a = e("components/modal/1.0.0/modal"),
		l = e("core/utils");
	return n.extend({
		template: t.template(i),
		dropdownTpl: t.template(s),
		events: {
			'change input[type="radio"]': "updateModel",
			"click .js-add-option": "addOption"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		serializeData: function() {
			return t.extend({}, this.model.attributes, {
				dropdown_menu: this.dropdownTpl
			})
		},
		onRender: function() {
			this.collectionRegion.show(new o({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		addOption: function() {
			var e = this,
				n = e.model.get("sub_entry");
			a.initialize({
				multiChoose: !0,
				type: "tag"
			}).setChooseItemCallback(function(e) {
				var i = !1;
				if (t.each(e, function(e) {
					n.length < 8 ? n.add({
						type: e.data_type,
						id: e.data_id,
						title: e.title,
						url: e.data_url
					}) : i = !0
				}), i) {
					var s = setTimeout(l.clearNotify, 3e3);
					l.errorNotify("商品分组不能多于8个，已经自动删除多余的分组。", function() {
						clearTimeout(s)
					})
				}
			}).modal("show")
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 8 ? this.$(".options").hide() : this.$(".options").show()
		}
	})
}), define("text!components/showcase/2.0.0/title/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label"><em class="required">*</em>标题名：</label>\n        <div class="controls">\n            <input type="text" name="title" value="<%- title %>" maxlength="100">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">标题模板：</label>\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="title_template" value="0" <%= title_template == 0 ? "checked": "" %> >传统样式\n            </label>\n            <label class="radio inline">\n                <input type="radio" name="title_template" value="1" <%= title_template == 1 ? "checked": "" %>>模仿微信图文页样式\n            </label>\n        </div>\n    </div>\n    <% if(title_template == \'0\'){%>\n\n    <div class="control-group">\n        <label class="control-label">副标题：</label>\n        <div class="controls">\n            <input type="hidden" class="js-time-holder">\n            <input type="text" name="sub_title" value="<%- sub_title %>" maxlength="100">\n            <a href="javascript: void(0);" class="js-time">日期</a>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">显示：</label>\n        <div class="controls">\n            <% if (show_method == \'0\') { %>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="0" checked>居左显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="1">居中显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="2">居右显示\n                </label>\n            <% } else if (show_method == \'1\') { %>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="0">居左显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="1" checked>居中显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="2">居右显示\n                </label>\n            <% } else if (show_method == \'2\') { %>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="0">居左显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="1">居中显示\n                </label>\n                <label class="radio inline">\n                    <input type="radio" name="show_method" value="2" checked>居右显示\n                </label>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">背景颜色：</label>\n        <div class="controls">\n            <input type="color" value="<%= color %>" name="color">\n            <button class="btn js-reset-bg" type="button">重置</button>\n        </div>\n    </div>\n    <div class="control-group js-collection-region">\n        <ul class="choices">\n\n        </ul>\n    </div>\n    <div class="control-group options">\n        <a href="javascript:void(0);" class="add-option js-add-option"><i class="icon-add"></i> 添加一个文本导航</a>\n    </div>\n\n    <% } else { %>\n        <div class="control-group">\n            <label class="control-label">日期：</label>\n            <div class="controls">\n                <input type="text" name="wx_title_date" value="<%- wx_title_date %>" maxlength="100" class="js-wx-time-holder span2">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">作者：</label>\n            <div class="controls">\n                <input type="text" name="wx_title_author" value="<%- wx_title_author %>" maxlength="100" class="span2">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">链接标题：</label>\n            <div class="controls">\n                <input type="text" name="wx_title_link" value="<%- wx_title_link %>" maxlength="100" class="span2">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">链接地址：</label>\n            <div class="controls">\n                <label class="radio">\n                    <input type="radio" name="wx_title_link_type" value="0" <%= wx_title_link_type == 0 ? "checked": "" %> >引导关注\n                    <a href="/v2/setting/weixin" target="_blank" style="margin-left:20px">设置快速关注链接</a>\n                </label>\n            </div>\n        </div>\n        <div class="control-group">\n            <div class="controls">\n                <label class="radio wx-template-radio">\n                    <input type="radio" name="wx_title_link_type" value="1" <%= wx_title_link_type == 1 ? "checked": "" %>>其它链接\n                    <input type="hidden" name="wx_link_url">\n                        <% if (wx_link.link_type != undefined) { %>\n                            <div class="control-action clearfix">\n                                <div class="pull-left js-link-to link-to">\n                                    <% if (wx_link.link_title !== \'\') { %>\n                                    <a href="<%= wx_link.link_url %>" target="_blank" class="new-window link-to-title">\n                                    <% } %>\n\n                                    <span class="label label-success">\n                                        <% if (wx_link.link_type === \'feature\') { %>\n                                            微页面\n                                        <% } else if (wx_link.link_type === \'category\') { %>\n                                            微页面分类\n                                        <% } else if (wx_link.link_type === \'topic\') { %>\n                                            专题\n                                        <% } else if (wx_link.link_type === \'article\') { %>\n                                            资讯\n                                        <% } else if (wx_link.link_type === \'goods\') { %>\n                                            商品\n                                        <% } else if (wx_link.link_type === \'tag\') { %>\n                                            商品标签\n                                        <% } else if (wx_link.link_type === \'activity\') { %>\n                                            营销活动\n                                        <% } else if (wx_link.link_type === \'survey\') { %>\n                                            调查\n                                        <% } else if (wx_link.link_type === \'homepage\') { %>\n                                            店铺主页\n                                        <% } else if (wx_link.link_type === \'usercenter\') { %>\n                                            会员主页\n                                        <% } else if (wx_link.link_type === \'link\') { %>\n                                            外链\n                                        <% } else if (wx_link.link_type === \'history\') { %>\n                                            历史信息\n                                        <% } %>\n                                    <% if (wx_link.link_title !== \'\') { %>\n                                            <em class="link-to-title-text"><%- wx_link.link_title %></em>\n                                        </span>\n                                    </a>\n                                    <% } else { %>\n                                        </span>\n                                    <% } %>\n                                    <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                                </div>\n                                <div class="dropdown hover pull-left">\n                                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                                    <%= dropdown_menu() %>\n                                </div>\n                            </div>\n\n                        <% } else { %>\n                            <div class="dropdown hover">\n                                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                                <%= dropdown_menu() %>\n                            </div>\n                        <% } %>\n                </label>\n            </div>\n        </div>\n\n    <% } %>\n</form>\n'
}), define("text!components/showcase/2.0.0/title/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>名称：</label>\n    <div class="controls">\n        <input type="text" name="title[<%= cid %>]" value="<%- title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接：</label>\n    <div class="controls" name="link_url">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/title/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/title/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/title/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change", this.render)
		},
		serializeData: function() {
			var e = this.model.cid,
				n = t.clone(this.model.attributes);
			return t.extend(n, {
				cid: e,
				dropdown_menu: this.dropdownTpl
			}), n
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			c.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		"delete": function() {
			this.model.destroy()
		}
	})
}), define("components/showcase/2.0.0/title/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/title/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/title/views/edit_item");
	return t.extend({
		itemView: n
	})
}), define("components/showcase/2.0.0/title/views/edit", ["require", "core/utils", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/pop/pop", "components/modal/1.0.0/modal", "text!components/public_template/dropdown_menu.html", "text!components/showcase/2.0.0/title/templates/edit.html", "components/showcase/2.0.0/title/views/edit_collection", "datetimepicker"], function(e) {
	var t = e("core/utils"),
		n = e("underscore"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("components/pop/pop"),
		o = e("components/modal/1.0.0/modal"),
		a = e("text!components/public_template/dropdown_menu.html"),
		l = e("text!components/showcase/2.0.0/title/templates/edit.html"),
		c = e("components/showcase/2.0.0/title/views/edit_collection");
	return e("datetimepicker"), i.extend({
		template: n.template(l),
		templateHelpers: function() {
			return {
				dropdown_menu: n.template(a)
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			'click input[type="radio"]': "updateModel",
			'change input[type="color"]': "updateModel",
			"click .js-add-option": "addOption",
			"click .js-time": function() {
				this.timepicker.datepicker("show")
			},
			"click .js-reset-bg": "resetBg",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset remove add", this.toggleOptions), this.listenTo(this.model, "change:title_template", this.render), this.listenTo(this.model, "change:wx_link", this.render)
		},
		onRender: function() {
			var e = new Date,
				t = this;
			this.timepicker = this.$(".js-time-holder"), this.timepicker.datetimepicker({
				dateFormat: "yy-mm-dd",
				minDate: e,
				changeMonth: !0,
				changeYear: !0,
				yearRange: "1900:+20",
				onClose: function(e) {
					"" !== e && (t.model.set("sub_title", e), t.$('input[name="sub_title"]').val(e))
				}
			}), this.wxTimepicker = this.$(".js-wx-time-holder"), this.wxTimepicker.datepicker({
				dateFormat: "yy-mm-dd",
				changeMonth: !0,
				changeYear: !0,
				yearRange: "1900:+20",
				dateonly: !0,
				onClose: function(e) {
					"" !== e && t.model.set("wx_title_date", e)
				}
			}), this.collectionRegion.show(new c({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		resetBg: function() {
			this.model.set("color", "#F9F9F9"), this.$('input[type="color"]').val("#F9F9F9")
		},
		addOption: function() {
			this.model.get("sub_entry").add({
				type: "title_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length > 0 ? this.$(".options").hide() : this.$(".options").show()
		},
		chooseLink: function(e) {
			if (!($(e.target).parents(".js-collection-region").length > 0)) {
				var t = this,
					n = $(e.target).data("type");
				o.initialize({
					type: n
				}).setChooseItemCallback(function(e) {
					t.setLink({
						link_id: e.data_id,
						link_type: e.type,
						link_title: e.data_title,
						link_url: e.data_url
					})
				}).modal("show")
			}
		},
		chooseStaticLink: function(e) {
			if (!($(e.target).parents(".js-collection-region").length > 0)) {
				var n = $(e.target).data("type"),
					i = this;
				t.getStaticUrl(n, function(e) {
					i.setLink({
						link_id: "",
						link_type: n,
						link_title: "",
						link_url: e
					})
				})
			}
		},
		chooseOtherLink: function(e) {
			if (!($(e.target).parents(".js-collection-region").length > 0)) {
				var t, n = this;
				t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
				var i = e.target;
				s.initialize({
					target: t,
					trigger: $(i),
					type: "link",
					callback: function(e) {
						n.setLink({
							link_id: "",
							link_type: "link",
							link_title: e,
							link_url: e
						})
					}
				})
			}
		},
		deleteLink: function() {
			this.setLink({})
		},
		setLink: function(e) {
			this.model.set({
				wx_link: e
			}), this.model.set("wx_link_url", e.link_url || "")
		}
	})
}), define("text!components/showcase/2.0.0/component/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group control-group-large">\n        <label class="control-label">自定义页面模块：</label>\n        <div class="controls" name="_id">\n            <div class="control-action">\n                <% if (_id !== \'\') { %>\n                    <div class="pull-left link-to">\n                        <a href="<%= link %>" target="_blank" class="new-window link-to-title">\n                            <span class="label label-success">\n                                自定义页面模块\n                                <em class="link-to-title-text"><%- title %></em>\n                            </span>\n                        </a>\n                    </div>\n                    <a href="javascript:void(0);" class="js-add-component add-component">修改</a>\n                <% } else { %>\n                    <a href="javascript:void(0);" class="js-add-component add-component">+添加</a>\n                <% } %>\n            </div>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/component/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/component/templates/edit.html", "components/modal/1.0.0/modal"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/component/templates/edit.html"),
		s = e("components/modal/1.0.0/modal");
	return n.extend({
		template: t.template(i),
		events: {
			"click .js-add-component": "handleAddComponent"
		},
		handleAddComponent: function() {
			var e = this;
			this.componentModal = s.initialize({
				type: "component"
			}).setChooseItemCallback(function(t) {
				e.model.set({
					type: "component",
					_id: t.data_id,
					title: t.title,
					link: t.data_url
				}), e.render()
			}), this.componentModal.modal("show")
		}
	})
}), define("text!components/showcase/2.0.0/search/templates/edit.html", [], function() {
	return '<div class="app-component-desc">\n   <p>可随意插入任何页面和位置，方便粉丝快速搜索商品.</p>\n   <p>注意：记得给商品添加合适的商品标签吧。</p>\n</div>\n'
}), define("components/showcase/2.0.0/search/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/search/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/search/templates/edit.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/line/templates/edit.html", [], function() {
	return '<div class="app-component-desc">\n    <p>辅助线</p>\n</div>\n'
}), define("components/showcase/2.0.0/line/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/line/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/line/templates/edit.html");
	return n.extend({
		template: t.template(i)
	})
}), define("components/showcase/1.0.0/base/views/base", ["text!templates/add_content.html", "backbone", "core/utils"], function(e, t, n) {
	var i = t.View.extend({
		addTemplate: e,
		initialize: function(e) {
			this.options = e, _.isFunction(this.onBeforeInit) && this.onBeforeInit.apply(this, arguments), _.isFunction(this.onInit) && this.onInit.apply(this, arguments)
		},
		fullfillUrl: function(e, t) {
			var i = $(e.target),
				s = $.trim(i.val());
			s = n.urlCheck(s), this.model.set(t, s), i.val(s);
			var o = {};
			o[t] = s, this.model.validate(o), e.stopPropagation(), e.stopImmediatePropagation()
		},
		render: function() {
			return this.$el.html(this.template(this.model.attributes)), this
		},
		editing: function(e, t, n) {
			this.options.showBoth ? ("config" !== this.model.get("type") && $(".app-design-footer .app-preview .app-field").removeClass("editing"), this.$el.hasClass("app-field") && this.$el.addClass("editing")) : ($(".app-preview .app-field").removeClass("editing"), this.$el.hasClass("app-field") ? this.$el.addClass("editing") : this.$(".app-field").addClass("editing")), this.position(n), _.isFunction(this.showError) && this.showError(n)
		},
		position: function(e) {
			var t;
			t = "add" === e ? this.$el.position().top + this.$el.height() - 32 : this.$el.position().top, this.options.showBoth ? "config" !== this.model.get("type") && $(".app-design-footer .app-sidebar").css({
				marginTop: t
			}) : $(".app-sidebar").css({
				marginTop: t
			})
		},
		toggle: function(e) {
			return this.options.showBoth ? (window.App.fieldCollection.length > 1 ? $(".app-design-footer .app-sidebar").show() : $(".app-design-footer .app-sidebar").hide(), _.isFunction(this.showError) && this.showError(e), this) : ($(".app-sidebar-inner .app-sidebar-group").hide(), this.parent ? this.parent.parent(".app-sidebar-group").show() : this.$el.parents(".app-sidebar-group").show(), _.isFunction(this.showError) && this.showError(e), this)
		},
		_updateModel: function(e, t) {
			e = $.trim(e), t = $.trim(t);
			var n = {};
			n[e] = t, this.model.set(n, {
				validate: !1
			})
		},
		validateAttr: function(e, t) {
			if (this.model.validation && e in this.model.validation) {
				var n = {};
				n[e] = t, this.model.validate(n)
			}
		},
		updateModel: function(e) {
			var t = $(e.target),
				n = t.val(),
				i = t.attr("name");
			if (t.data("value-type") && (n = window[t.data("value-type")](n)), !_.isUndefined(i)) {
				"checkbox" === t[0].type.toLowerCase() && (n = t[0].checked ? 1 : 0), i = i.split("[")[0];
				var s = {};
				s[i] = _.isArray(n) ? n : t.data("value-type") && "String" !== t.data("value-type") ? n : $.trim(n), this.model.set(s, {
					validate: !1
				}), this.validateAttr(i, n), e.stopPropagation()
			}
		},
		updateModel2: function(e) {
			var t = $(e.target),
				n = t.data("type") || "String",
				i = t.attr("name"),
				s = this.model.get(i),
				o = t.val();
			"number" === n.toLowerCase() && (o = +o);
			var a = t.attr("type").toLowerCase();
			switch (a) {
			case "checkbox":
				var l = t.prop("checked");
				_.isArray(s) ? l ? (s.push(o), s = _.uniq(s)) : s = _.without(s, o) : s = o
			}
			var c = {};
			c[i] = s, this.model.set(c, {
				validate: !1
			}), this.validateAttr(i, s), e.stopPropagation()
		}
	});
	return i
}), define("text!components/showcase/2.0.0/cube/templates/selection_edit.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label">图片占：</label>\n    <div class="controls">\n        <span class="control-action">\n            <%= show_method %> 列\n        </span>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>选择图片：</label>\n    <div class="controls" name="image_url">\n        <% if (image_id === \'\') { %>\n            <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n        <% } else { %>\n            <img src="<%= image_url %>" data-full-size="<%= image_url %>" width="100" height="100" class="thumb-image">\n            <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n        <% } %>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">链接到：</label>\n    <div class="controls">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                    <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                    <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/cube/views/selection_edit", ["components/showcase/1.0.0/base/views/base", "text!components/showcase/2.0.0/cube/templates/selection_edit.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e, t, n, i, s, o, a) {
	return e.extend({
		tagName: "li",
		className: "choice",
		template: _.template(t),
		dropdownTpl: _.template(n),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-trigger-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		initialize: function(e) {
			this.parent = e.parent || {}, this.listenTo(this.model, "change:image_url", this.render), this.listenTo(this.model, "change:link_url", this.render), this.listenTo(this.model, "destroy", function() {
				this.remove()
			}), Backbone.Validation.bind(this)
		},
		render: function() {
			var e = this.model.cid,
				t = _.clone(this.model.attributes);
			_.extend(t, {
				cid: e,
				dropdown_menu: this.dropdownTpl
			});
			var n = this.model.get("image_url");
			return n = n && a.fullfillImage(n), t.image_url = n, t.image_thumb_url = n, this.$el.html(this.template(t)), this
		},
		chooseImage: function() {
			var e = this;
			o.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					}), e.parent.model.calculateImage()
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				n = $(e.target).data("type");
			s.initialize({
				type: n
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = $(e.target).data("type"),
				n = this;
			a.getStaticUrl(t, function(e) {
				n.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, n = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			i.initialize({
				target: t,
				trigger: $(s),
				type: "link",
				callback: function(e) {
					n.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		"delete": function() {
			this.model.destroy()
		},
		add: function() {
			if (this.model.collection.length >= 20) return void a.errorNotify("选项最多20个。");
			var e = _.clone(this.model.constructor.prototype.defaults),
				t = this.model.index();
			this.model.collection.add(e, {
				at: t + 1,
				element: this.$el
			})
		}
	})
}), define("text!components/showcase/2.0.0/cube/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <ul class="choices">\n\n        </ul>\n    </div>\n    <div class="control-group options">\n        <div class="controls">\n            <input type="hidden" name="sub_entry">\n            <a href="javascript:void(0);" class="js-add-option">+添加一列</a>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/cube/views/edit", ["components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/cube/views/selection_edit", "text!components/showcase/2.0.0/cube/templates/edit.html", "components/showcase/2.0.0/cube/models/selection", "components/pop/pop"], function(e, t, n, i, s) {
	return e.extend({
		template: _.template(n),
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'click input[type="checkbox"]': "updateModel",
			"click .js-add-option": "addOption"
		},
		onInit: function(e) {
			this.parent = e.parent;
			var n = this;
			this.listenTo(this.model.get("sub_entry"), "add", function(e, i, s) {
				var o = new t({
					model: e,
					parent: n
				});
				s.element ? o.render().$el.insertAfter(s.element) : n.$(".choices").append(o.render().el)
			}), this.listenTo(this.model.get("sub_entry"), "remove", function(e, t) {
				t.models.length < 20 && n.$(".options").show(), n.model.calculateImage()
			}), this.listenTo(this.model.get("sub_entry"), "editing", function(e) {
				this.model.trigger("editing", e)
			}), this._selectionEditView = []
		},
		addOption: function(e) {
			var t = $(e.target),
				n = this;
			s.initialize({
				type: "cube",
				trigger: t,
				target: t,
				data: {
					cols: n.model.checkCubeColspan()
				},
				callback: function(e) {
					if (n.model.checkCubeColspan(e)) {
						var t = i.Model.prototype.defaults();
						_.extend(t, e), n.model.get("sub_entry").add(t)
					}
				}
			})
		},
		render: function() {
			return this.$el.html(this.template(this.model.attributes)), this.renderSelection(), this
		},
		renderSelection: function() {
			var e = this;
			if (!(this._selectionEditView.length > 0)) {
				var n = this.model.get("sub_entry");
				n.each(function(n) {
					var i = new t({
						model: n,
						parent: e
					});
					e._selectionEditView.push(i), e.$(".choices").append(i.render().el)
				})
			}
		}
	})
}), define("text!components/showcase/2.0.0/cube2/templates/edit_item.html", [], function() {
	return '\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>选择图片：</label>\n    <div class="controls" name="image_url">\n        <% if (image_url === \'\') { %>\n            <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n        <% } else { %>\n            <img src="<%= image_url %>" data-full-size="<%= image_url %>" width="100" height="100" class="thumb-image">\n            <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n        <% } %>\n        <p class="help-desc">建议尺寸：<%- 160 * width %> x <%- 160 * height %> 像素</p>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">链接到：</label>\n    <div class="controls">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                    <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                    <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">图片占：</label>\n    <div class="controls">\n        <div class="btn-group">\n            <a class="btn dropdown-toggle" data-toggle="dropdown" href="javascript:;">\n                <%- height %>行 <%- width %>列\n                <span class="caret"></span>\n            </a>\n            <ul class="dropdown-menu">\n                <% for(var i = 0; i < layout.length; i++) { %>\n                    <% var cols = layout[i].cols, rows = layout[i].rows; %>\n                    <li><a class="js-image-layout" href="javascript:;" data-width="<%- cols %>" data-height="<%- rows %>"><%- rows %>行 <%- cols %>列</a></li>\n                <% } %>\n            </ul>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/cube2/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/cube2/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/cube2/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .actions .add": "add",
			"click .js-trigger-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink",
			"click .js-image-layout": "updateLayout"
		},
		onInit: function(e) {
			this.parent = e.parent || {}, this.listenTo(this.model, "change:image_url", this.render), this.listenTo(this.model, "change:link_url", this.render)
		},
		render: function() {
			var e = this.model.cid,
				n = t.clone(this.model.attributes);
			t.extend(n, {
				cid: e,
				dropdown_menu: this.dropdownTpl,
				layout: this.model.layout(this.parent.model.layoutMap)
			});
			var i = this.model.get("image_url");
			return i = i && r.fullfillImage(i), n.image_url = i, n.image_thumb_url = i, this.$el.html(this.template(n)), this
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					}), e.parent.render()
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				}), t.parent.render()
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				}), i.parent.render()
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					}), i.parent.render()
				}
			})
		},
		updateLayout: function(e) {
			var t = n(e.target);
			this.model.set({
				width: +t.data("width"),
				height: +t.data("height")
			}), this.parent.render()
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			}), this.parent.render()
		},
		"delete": function() {
			this.model.destroy()
		},
		add: function() {
			if (this.model.collection.length >= 20) return void r.errorNotify("选项最多20个。");
			var e = t.clone(this.model.constructor.prototype.defaults),
				n = this.model.index();
			this.model.collection.add(e, {
				at: n + 1,
				element: this.$el
			})
		}
	})
}), define("text!components/showcase/2.0.0/cube2/templates/layout_modal.html", [], function() {
	return '<div class="modal-header">\n    <a class="close" data-dismiss="modal">×</a>\n    <ul class="module-nav modal-tab">\n        <li class="active hide">\n            <h4>选择布局</h4>\n        </li>\n    </ul>\n</div>\n<div class="modal-body clearfix layout-table">\n    <%\n        var result = [];\n        for(var i = 0; i < layout.length; i++){\n            result[layout[i].cols] = layout[i].rows;\n        }\n    %>\n    <% for(var i = 1; i < result.length; i++){ %>\n    <ul class="layout-cols layout-cols-<%- i %>">\n        <% for(var j = 1; j <= result[i]; j++){ %>\n            <% var cols = i, rows = j %>\n            <li data-cols="<%- cols %>" data-rows="<%- rows %>"></li>\n        <% } %>\n        </ul>\n    <% } %>\n</div>\n\n'
}), define("components/showcase/2.0.0/cube2/views/layout_modal", ["require", "underscore", "jquery", "backbone", "text!components/showcase/2.0.0/cube2/templates/layout_modal.html"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("backbone"),
		s = e("text!components/showcase/2.0.0/cube2/templates/layout_modal.html"),
		o = i.View.extend({
			className: "modal hide fade",
			template: t.template(s),
			events: {
				"click .layout-cols li": "chooseLayout",
				"mouseenter .layout-cols li": function(e) {
					var t = n(e.target),
						i = +t.data("cols"),
						s = +t.data("rows"),
						o = this.$(".layout-table li").removeClass("selected");
					o.filter(function(e, t) {
						return t = n(t), +t.data("cols") <= i && +t.data("rows") <= s
					}).addClass("selected")
				},
				hidden: "delete"
			},
			initialize: function(e) {
				this.options = e || {}, this.render()
			},
			render: function() {
				return this.$el.html(this.template(this.model.attributes)).modal("show"), this
			},
			chooseLayout: function(e) {
				var t = n(e.target),
					i = +t.data("cols"),
					s = +t.data("rows");
				this.options.callback && this.options.callback({
					width: i,
					height: s
				}), this.$el.modal("hide")
			},
			"delete": function() {
				this.$el.data("modal", null), this.remove()
			}
		});
	return o
}), define("text!components/showcase/2.0.0/cube2/templates/edit.html", [], function() {
	return '<form class="form-horizontal custom-cube2-table cube2-edit" novalidate>\n    <div class="control-group layout-map">\n        <label class="control-label">布局：</label>\n        <div class="controls" name="layout_map">\n            <table>\n                <tbody>\n                    <%= tableContent %>\n                </tbody>\n            </table>\n            <p class="help-desc">点击 + 号添加内容</p>\n        </div>\n    </div>\n    <div class="control-group js-item-region">\n        <ul class="choices"></ul>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/cube2/views/edit", ["require", "underscore", "jquery", "backbone", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/cube2/models/item", "components/showcase/2.0.0/cube2/views/edit_item", "components/showcase/2.0.0/cube2/views/layout_modal", "text!components/showcase/2.0.0/cube2/templates/td.html", "text!components/showcase/2.0.0/cube2/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("backbone"),
		s = e("components/showcase/2.0.0/base/views/edit_base"),
		o = e("components/showcase/2.0.0/cube2/models/item"),
		a = e("components/showcase/2.0.0/cube2/views/edit_item"),
		l = e("components/showcase/2.0.0/cube2/views/layout_modal"),
		c = e("text!components/showcase/2.0.0/cube2/templates/td.html"),
		r = e("text!components/showcase/2.0.0/cube2/templates/edit.html");
	return s.extend({
		template: t.template(r),
		tdTemplate: t.template(c),
		events: {
			"click .empty": "add",
			"click .not-empty": "edit",
			"click td a": function(e) {
				e.preventDefault()
			}
		},
		regions: {
			itemRegion: ".js-item-region"
		},
		onInit: function() {
			this.currentSelection = -1, this.previousSelection = -1, this.listenTo(this.model.get("sub_entry"), "add", this.render), this.listenTo(this.model.get("sub_entry"), "remove", this.delete), this.listenTo(this.model.get("sub_entry"), "valid:error", function(e) {
				var t = this;
				setTimeout(function() {
					t.$(".not-empty[data-index=" + e.index() + "]").trigger("click")
				}, 20)
			})
		},
		onBeforeRender: function() {
			this.model.denerateTableContent()
		},
		onRender: function() {
			0 === this.$(".layout-map .empty").size() && this.$(".layout-map .help-desc").hide(), this.suggestion(), this.renderSelection()
		},
		"delete": function() {
			this.currentSelection = -1, this.previousSelection = -1, this.render()
		},
		add: function(e) {
			var t = this,
				s = this.model.get("sub_entry"),
				a = n(e.target),
				c = +a.data("x"),
				r = +a.data("y"),
				d = function(e) {
					p.set(e), s.add(p, {
						silent: !0
					}), t.currentSelection = s.length - 1, t.render()
				},
				p = o.initialize({
					x: c,
					y: r
				}),
				u = p.layout(this.model.layoutMap);
			return 1 === u.length ? void d({
				width: 1,
				height: 1
			}) : void new l({
				model: new i.Model({
					layout: u
				}),
				callback: d
			})
		},
		edit: function(e) {
			var t = n(e.currentTarget),
				i = +t.data("index");
			i !== this.currentSelection && (this.currentSelection = i, this._slideSelection())
		},
		renderSelection: function() {
			var e = this,
				t = this.model.get("sub_entry");
			e.$(".choices").html(""), t.each(function(t, n) {
				var i = new a({
					model: t,
					parent: e
				});
				i.render(), n !== e.previousSelection && i.$el.hide(), e.$(".choices").append(i.el)
			}), this._slideSelection()
		},
		_slideSelection: function() {
			if (this.$("td").removeClass("current"), this.$("td[data-index=" + this.currentSelection + "]").addClass("current"), this.previousSelection !== this.currentSelection) {
				var e = this.$(".choice");
				e.eq(this.previousSelection).slideUp(), e.eq(this.currentSelection).slideDown(), this.previousSelection = this.currentSelection
			}
		},
		suggestion: function() {
			this.$el.find(".not-empty").filter(function() {
				return !n(this).find("img").attr("src")
			}).each(function() {
				var e = n(this),
					t = 160 * +e.attr("colspan"),
					i = 160 * +e.attr("rowspan");
				e.append("<span>" + t + "x" + i + "</span>")
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_shop/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">背景图片：</label>\n        <div class="controls">\n            <% if (backgroundImage === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <div class="tpl-shop-header" style="width: 320px; background-image: url(<%- fullfillImage(backgroundImage) %>);">\n                    <a class="close-modal small hide js-delete-image" data-index="0">×</a>\n                </div>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">最佳尺寸：640 x 200 像素。</p>\n            <p class="help-desc">尺寸不匹配时，图片将被压缩或拉伸以铺满画面。</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">背景颜色：</label>\n        <div class="controls">\n            <input type="color" value="<%- backgroundColor %>" name="backgroundColor">\n            <button class="btn js-reset-bg" type="button">重置</button>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">头像：</label>\n        <div class="controls">\n            <% if (avatar === \'\') { %>\n                <a class="control-action js-trigger-avatar" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <img src="<%- fullfillImage(avatar) %>" width="80" height="80" class="thumb-image" style="width: 80px; height: 80px;">\n                <a class="control-action js-trigger-avatar" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">建议尺寸：160 x 160 像素</p>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/tpl_shop/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_shop/templates/edit.html", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/tpl_shop/templates/edit.html"),
		s = e("components/image/2.0.0/app"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		events: {
			'blur input[type="text"]': "updateModel",
			'change input[type="color"]': "changeColor",
			"click .js-reset-bg": "resetBg",
			"click .js-trigger-image": "chooseImage",
			"click .js-trigger-avatar": "chooseAvatar",
			"click .js-delete-image": "deleteImage"
		},
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		resetBg: function() {
			this.$('input[type="color"]').val("#EF483F"), this._changeColor("#EF483F")
		},
		changeColor: function(e) {
			this._changeColor(e.target.value)
		},
		_changeColor: function(e) {
			this.model.set({
				backgroundColor: e
			})
		},
		chooseImage: function() {
			this._openImageModal(function(e) {
				this.model.set("backgroundImage", e)
			})
		},
		chooseAvatar: function() {
			this._openImageModal(function(e) {
				this.model.set("avatar", e)
			})
		},
		_openImageModal: function(e) {
			var n = t.bind(function(t) {
				t = t[0], e.call(this, t.attachment_url), this.render()
			}, this);
			s.initialize({
				multiChoose: !1,
				callback: n
			})
		},
		deleteImage: function() {
			this.model.set({
				backgroundImage: ""
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_weixin/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label"><em class="required">*</em>背景图片：</label>\n        <div class="controls">\n            <% if (background === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <img src="<%= fullfillImage(background) %>" width="100" height="100" class="thumb-image">\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-block">建议尺寸：640 x 1080 像素</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">背景链接：</label>\n        <div class="controls" name="link_url">\n            <% if (bg_link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (bg_link_title !== \'\') { %>\n                            <a href="<%= bg_link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n                        <span class="label label-success">\n                            <% if (bg_link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (bg_link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (bg_link_type === \'topic\') { %>\n                                专题\n                            <% } else if (bg_link_type === \'article\') { %>\n                                资讯\n                            <% } else if (bg_link_type === \'goods\') { %>\n                                商品\n                            <% } else if (bg_link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (bg_link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (bg_link_type === \'survey\') { %>\n                                调查\n                            <% } else if (bg_link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (bg_link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (bg_link_type === \'link\') { %>\n                                外链\n                            <% } else if (bg_link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (bg_link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- bg_link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group white-space-group">\n        <label class="control-label">导航位置：</label>\n        <div class="controls controls-slider">\n            <div class="js-slider white-space-slider"></div>\n            <div class="slider-height hide"><span class="js-top"><%= top %></span> %</div>\n        </div>\n    </div>\n    <div class="control-group js-collection-region">\n\n    </div>\n    <div class="control-group options js-add-subentry">\n        <a class="add-option js-add-option" href="javascript:void(0);"><i class="icon-add"></i> 添加一个导航链接</a>\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/tpl_weixin/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>名称：</label>\n    <div class="controls">\n        <input type="text" name="title" value="<%- title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接到：</label>\n    <div class="controls" name="link_url">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_weixin/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_weixin/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_weixin/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change", this.render)
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			e.stopPropagation(), l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			e.stopPropagation(), c.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			e.stopPropagation(), t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		"delete": function() {
			this.model.destroy()
		}
	})
}), define("components/showcase/2.0.0/tpl_weixin/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/tpl_weixin/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/tpl_weixin/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/tpl_weixin/views/edit", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_weixin/templates/edit.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/showcase/2.0.0/tpl_weixin/views/edit_collection", "components/image/2.0.0/app", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_weixin/templates/edit.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/showcase/2.0.0/tpl_weixin/views/edit_collection"),
		c = e("components/image/2.0.0/app"),
		r = e("components/modal/1.0.0/modal"),
		d = e("core/utils");
	return i.extend({
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				fullfillImage: d.fullfillImage,
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			'click input[type="radio"]': "updateModel",
			'change input[type="color"]': "updateModel",
			"click .js-trigger-image": "chooseImage",
			"click .js-trigger-delete": "deleteImage",
			"click .js-add-option": "addOption",
			"click .js-reset-bg": "resetBg",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		modelEvents: {
			"change:bg_link_url": "render"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		onRender: function() {
			this.collectionRegion.show(new l({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.renderSilder(), this.toggleOptions()
		},
		renderSilder: function() {
			var e = this,
				n = e.$(".js-top");
			this.$(".js-slider").slider({
				min: 0,
				max: 100,
				value: e.model.get("top"),
				slide: function(i, s) {
					var o = s.value;
					t.isNumber(o) && e.model.set("top", o), n.text(o)
				}
			})
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						background: t.attachment_url,
						width: Number(t.width),
						height: Number(t.height)
					})
				}
			})
		},
		deleteImage: function() {
			this.model.set({
				background: "",
				width: "",
				height: ""
			})
		},
		resetBg: function() {
			this.model.set("color", "#ffffff"), this.$('input[type="color"]').val("#ffffff")
		},
		addOption: function() {
			this.model.get("sub_entry").add({
				type: "title_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 4 ? this.$(".options").hide() : this.$(".options").show()
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			r.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					bg_link_id: e.data_id,
					bg_link_type: e.type,
					bg_link_title: e.data_title,
					bg_link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			d.getStaticUrl(t, function(e) {
				i.model.set({
					bg_link_id: "",
					bg_link_type: t,
					bg_link_title: "",
					bg_link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						bg_link_id: "",
						bg_link_type: "link",
						bg_link_title: e,
						bg_link_url: e
					})
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_fbb/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label"><em class="required">*</em>背景图片：</label>\n        <div class="controls">\n            <% if (background === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <img src="<%= fullfillImage(background) %>" width="100" height="100" class="thumb-image">\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">建议尺寸：640 x 1080 像素</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">背景链接：</label>\n        <div class="controls" name="link_url">\n            <% if (bg_link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (bg_link_title !== \'\') { %>\n                            <a href="<%= bg_link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n                        <span class="label label-success">\n                            <% if (bg_link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (bg_link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (bg_link_type === \'topic\') { %>\n                                专题\n                            <% } else if (bg_link_type === \'article\') { %>\n                                资讯\n                            <% } else if (bg_link_type === \'goods\') { %>\n                                商品\n                            <% } else if (bg_link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (bg_link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (bg_link_type === \'survey\') { %>\n                                调查\n                            <% } else if (bg_link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (bg_link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (bg_link_type === \'link\') { %>\n                                外链\n                            <% } else if (bg_link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (bg_link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- bg_link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n    <div class="separate-line-wrap">\n        <hr>\n        <div class="separate-line">\n            <p class="text-center">导航链接</p>\n            <p class="text-center">v</p>\n        </div>\n    </div>\n    <div class="control-group js-collection-region">\n\n    </div>\n    <div class="control-group options">\n        <a class="add-option js-add-option" href="javascript:;"><i class="icon-add"></i> 添加一个导航链接</a>\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/tpl_fbb/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>小标题：</label>\n    <div class="controls">\n        <input type="text" name="title" value="<%- title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接到：</label>\n    <div class="controls" name="link_url">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">小图标：</label>\n    <div class="controls">\n        <% if (icon_image_url === \'\') { %>\n            <a class="control-action js-icon-image" href="javascript: void(0);">选择图片</a>\n        <% } else { %>\n            <img src="<%= fullfillImage(icon_image_url) %>" width="30" height="30" class="thumb-image">\n            <a class="control-action js-icon-image" href="javascript: void(0);">修改</a>\n            <span>|</span>\n            <a href="javascript:;" class="control-action js-trigger-delete-icon">删除</a>\n        <% } %>\n        <p class="help-desc">建议尺寸：60 x 60 像素</p>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">简介：</label>\n    <div class="controls">\n        <input type="text" name="text" value="<%- text %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">背景图：</label>\n    <div class="controls">\n        <% if (bg_image_url === \'\') { %>\n            <a class="control-action js-bg-image" href="javascript: void(0);">选择图片</a>\n        <% } else { %>\n            <img src="<%= fullfillImage(bg_image_url) %>" width="100" height="100" class="thumb-image">\n            <a class="control-action js-bg-image" href="javascript: void(0);">修改</a>\n            <span>|</span>\n            <a href="javascript:;" class="control-action js-trigger-delete-bg">删除</a>\n        <% } %>\n        <p class="help-desc">建议尺寸：85 x 188 像素</p>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">日期：</label>\n    <div class="controls">\n        <input type="text" name="date" value="<%- date %>">\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_fbb/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_fbb/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_fbb/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				dropdown_menu: this.dropdownTpl,
				fullfillImage: r.fullfillImage
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-bg-image": "chooseImage",
			"click .js-icon-image": "chooseIconImage",
			"click .js-trigger-delete-bg": "deleteImage",
			"click .js-trigger-delete-icon": "deleteIconImage"
		},
		onInit: function() {
			this.listenTo(this.model, "change:link_url change:bg_image_url change:icon_image_url", this.render)
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						bg_image_id: t.attachment_id,
						bg_image_url: t.attachment_url,
						bg_image_width: Number(t.width),
						bg_image_height: Number(t.height)
					})
				}
			})
		},
		deleteImage: function() {
			this.model.set({
				bg_image_id: "",
				bg_image_url: "",
				bg_image_width: "",
				bg_image_height: ""
			})
		},
		chooseIconImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						icon_image_id: t.attachment_id,
						icon_image_url: t.attachment_url,
						icon_image_width: Number(t.width),
						icon_image_height: Number(t.height)
					})
				}
			})
		},
		deleteIconImage: function() {
			this.model.set({
				icon_image_id: "",
				icon_image_url: "",
				icon_image_width: "",
				icon_image_height: ""
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			e.stopPropagation(), l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			e.stopPropagation(), r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			e.stopPropagation(), t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		"delete": function() {
			this.model.destroy()
		}
	})
}), define("components/showcase/2.0.0/tpl_fbb/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/tpl_fbb/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/tpl_fbb/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/tpl_fbb/views/edit", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_fbb/templates/edit.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/showcase/2.0.0/tpl_fbb/views/edit_collection", "components/image/2.0.0/app", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_fbb/templates/edit.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/showcase/2.0.0/tpl_fbb/views/edit_collection"),
		c = e("components/image/2.0.0/app"),
		r = e("components/modal/1.0.0/modal"),
		d = e("core/utils");
	return i.extend({
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				fullfillImage: d.fullfillImage,
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			'click input[type="radio"]': "updateModel",
			'change input[type="color"]': "updateModel",
			"click .js-trigger-image": "chooseImage",
			"click .js-trigger-delete": "deleteImage",
			"click .js-add-option": "addOption",
			"click .js-reset-bg": "resetBg",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model, "change:bg_link_url", this.render), this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		onRender: function() {
			this.collectionRegion.show(new l({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						background: t.attachment_url,
						width: Number(t.width),
						height: Number(t.height)
					})
				}
			})
		},
		deleteImage: function() {
			this.model.set({
				background: "",
				width: "",
				height: ""
			})
		},
		resetBg: function() {
			this.model.set("color", "#ffffff"), this.$('input[type="color"]').val("#ffffff")
		},
		addOption: function() {
			this.model.get("sub_entry").add({
				type: "title_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 20 ? this.$(".options").hide() : this.$(".options").show()
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			r.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					bg_link_id: e.data_id,
					bg_link_type: e.type,
					bg_link_title: e.data_title,
					bg_link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			d.getStaticUrl(t, function(e) {
				i.model.set({
					bg_link_id: "",
					bg_link_type: t,
					bg_link_title: "",
					bg_link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						bg_link_id: "",
						bg_link_type: "link",
						bg_link_title: e,
						bg_link_url: e
					})
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_course/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label"><em class="required">*</em>背景图片：</label>\n        <div class="controls">\n            <% if (background === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <img src="<%= background %>" data-full-size="<%= background %>" width="100" height="100" class="thumb-image">\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-block">建议尺寸：640 x 1080 像素</p>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">标题名：</label>\n        <div class="controls">\n            <input type="text" name="title" value="<%- title %>" maxlength="10">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">标题颜色：</label>\n        <div class="controls">\n            <input type="color" value="<%= title_color %>" name="title_color">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">副标题：</label>\n        <div class="controls">\n            <input type="text" name="sub_title" value="<%- sub_title %>" maxlength="20">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">副标题颜色：</label>\n        <div class="controls">\n            <input type="color" value="<%= sub_title_color %>" name="sub_title_color">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">按钮文字：</label>\n        <div class="controls">\n            <input type="text" name="button_text" value="<%- button_text %>" maxlength="10">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label"><em class="required">*</em>按钮链接：</label>\n        <div class="controls js-parent-link">\n            <input type="hidden" name="button_link_url" value="<%= button_link_url %>">\n            <% if (button_link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (button_link_title !== \'\') { %>\n                            <a href="<%= button_link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n                        <span class="label label-success">\n                            <% if (button_link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (button_link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (button_link_type === \'topic\') { %>\n                                专题\n                            <% } else if (button_link_type === \'article\') { %>\n                                资讯\n                            <% } else if (button_link_type === \'goods\') { %>\n                                商品\n                            <% } else if (button_link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (button_link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (button_link_type === \'survey\') { %>\n                                调查\n                            <% } else if (button_link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (button_link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (button_link_type === \'link\') { %>\n                                外链\n                            <% } else if (button_link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (button_link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- button_link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group white-space-group tpl-course-white-space-group">\n        <label class="control-label">按钮离顶部：</label>\n        <div class="controls controls-slider">\n            <div class="js-slider white-space-slider"></div>\n            <div class="slider-height"><span class="js-height"><%= top %></span> %</div>\n        </div>\n    </div>\n    <div class="separate-line-wrap">\n        <hr>\n        <div class="separate-line">\n            <p class="text-center">导航链接</p>\n            <p class="text-center">v</p>\n        </div>\n    </div>\n    <div class="control-group js-collection-region">\n    </div>\n\n    <div class="control-group options">\n        <a class="add-option js-add-option" href="javascript:;"><i class="icon-add"></i> 添加一个导航链接</a>\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/tpl_course/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label"><em class="required">*</em>小标题：</label>\n    <div class="controls">\n        <input type="text" name="title" value="<%- title %>">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接到：</label>\n    <div class="controls" name="link_url">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">小图标：</label>\n    <div class="controls">\n        <% if (icon_image_url === \'\') { %>\n            <a class="control-action js-icon-image" href="javascript: void(0);">选择图片</a>\n        <% } else { %>\n            <img src="<%= icon_image_url %>" data-full-size="<%= icon_image_url %>" width="30" height="30" class="thumb-image">\n            <a class="control-action js-icon-image" href="javascript: void(0);">修改</a>\n            <span>|</span>\n            <a href="javascript:;" class="control-action js-trigger-delete-icon">删除</a>\n        <% } %>\n        <p class="help-block">建议尺寸：60 x 60 像素</p>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_course/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_course/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_course/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-bg-image": "chooseImage",
			"click .js-icon-image": "chooseIconImage",
			"click .js-trigger-delete-bg": "deleteImage",
			"click .js-trigger-delete-icon": "deleteIconImage"
		},
		modelEvents: {
			change: "render"
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return e.icon_image_url = r.fullfillImage(e.icon_image_url), e.bg_image_url = r.fullfillImage(e.bg_image_url), e.dropdown_menu = this.dropdownTpl, e
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						bg_image_id: t.attachment_id,
						bg_image_url: t.attachment_url,
						bg_image_width: Number(t.width),
						bg_image_height: Number(t.height)
					})
				}
			})
		},
		deleteImage: function() {
			this.model.set({
				bg_image_id: "",
				bg_image_url: "",
				bg_image_width: "",
				bg_image_height: ""
			})
		},
		chooseIconImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						icon_image_id: t.attachment_id,
						icon_image_url: t.attachment_url,
						icon_image_width: Number(t.width),
						icon_image_height: Number(t.height)
					})
				}
			})
		},
		deleteIconImage: function() {
			this.model.set({
				icon_image_id: "",
				icon_image_url: "",
				icon_image_width: "",
				icon_image_height: ""
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		"delete": function() {
			this.model.destroy()
		}
	})
}), define("components/showcase/2.0.0/tpl_course/views/edit_colleciton", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/tpl_course/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/tpl_course/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/tpl_course/views/edit", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_course/templates/edit.html", "text!components/public_template/dropdown_menu.html", "components/showcase/2.0.0/tpl_course/views/edit_colleciton", "components/image/2.0.0/app", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/tpl_course/templates/edit.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/showcase/2.0.0/tpl_course/views/edit_colleciton"),
		l = e("components/image/2.0.0/app"),
		c = e("components/pop/pop"),
		r = e("components/modal/1.0.0/modal"),
		d = e("core/utils");
	return i.extend({
		template: t.template(s),
		dropdownTpl: t.template(o),
		events: {
			'blur input[type="text"]': "updateModel",
			'click input[type="radio"]': "updateModel",
			'change input[type="color"]': "updateModel",
			"click .js-trigger-image": "chooseImage",
			"click .js-trigger-delete": "deleteImage",
			"click .js-add-option": "addOption",
			"click .js-reset-bg": "resetBg",
			"click .js-parent-link .js-modal-magazine, .js-parent-link .js-modal-goods, .js-parent-link .js-modal-activity, .js-parent-link .js-modal-survey": "chooseLink",
			"click .js-parent-link .js-modal-history, .js-parent-link .js-modal-homepage, .js-parent-link .js-modal-usercenter": "chooseStaticLink",
			"click .js-parent-link .js-modal-links": "chooseOtherLink"
		},
		modelEvents: {
			"change:background": "render"
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model, "change:button_link_url", this.render), this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return e.background = d.fullfillImage(e.background), e.dropdown_menu = this.dropdownTpl, e
		},
		onRender: function() {
			this.collectionRegion.show(new a({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.renderSlider(), this.toggleOptions()
		},
		renderSlider: function() {
			var e = this,
				n = e.$(".js-height");
			this.$(".js-slider").slider({
				min: 0,
				max: 100,
				value: e.model.get("top"),
				slide: function(i, s) {
					var o = s.value;
					t.isNumber(o) && e.model.set("top", o), n.text(o)
				}
			})
		},
		addOption: function() {
			this.model.get("sub_entry").add({
				type: "title_nav_selection",
				title: "",
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 20 ? this.$(".options").hide() : this.$(".options").show()
		},
		chooseImage: function() {
			var e = this;
			l.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						background: t.attachment_url,
						width: Number(t.width),
						height: Number(t.height)
					})
				}
			})
		},
		deleteImage: function() {
			this.model.set({
				background: "",
				width: "",
				height: ""
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			r.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					button_link_id: e.data_id,
					button_link_type: e.type,
					button_link_title: e.data_title,
					button_link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			d.getStaticUrl(t, function(e) {
				i.model.set({
					button_link_id: "",
					button_link_type: t,
					button_link_title: "",
					button_link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			c.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						button_link_id: "",
						button_link_type: "link",
						button_link_title: e,
						button_link_url: e
					})
				}
			})
		},
		resetBg: function() {
			this.model.set("color", "#ffffff"), this.$('input[type="color"]').val("#ffffff")
		}
	})
}), define("text!components/showcase/2.0.0/tpl_wxd/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <label class="control-label">背景图片：</label>\n        <div class="controls">\n            <% if (backgroundImage === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <div class="tpl-wxd">\n                    <div class="tpl-wxd-bg">\n                        <img src="<%- backgroundImage %>" alt="">\n                    </div>\n                </div>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">建议尺寸：640 x 200 像素。</p>\n            <p class="help-desc">尺寸不匹配时，图片将被压缩或拉伸以铺满画面。</p>\n        </div>\n    </div>\n\n    <div class="control-group">\n        <label class="control-label">头像：</label>\n        <div class="controls">\n            <% if (avatar === \'\') { %>\n                <a class="control-action js-trigger-avatar" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <img src="<%- avatar %>" width="80" height="80" class="thumb-image" style="width: 80px; height: 80px;">\n                <a class="control-action js-trigger-avatar" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">建议尺寸：160 x 160 像素</p>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/tpl_wxd/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_wxd/templates/edit.html", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/tpl_wxd/templates/edit.html"),
		s = e("components/image/2.0.0/app"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		events: {
			"click .js-trigger-image": "chooseImage",
			"click .js-trigger-avatar": "chooseAvatar"
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return e.avatar = o.fullfillImage(e.avatar) || "", e.backgroundImage = o.fullfillImage(e.backgroundImage) || "", e
		},
		chooseImage: function() {
			this._openImageModal(function(e) {
				this.model.set("backgroundImage", e)
			})
		},
		chooseAvatar: function() {
			this._openImageModal(function(e) {
				this.model.set("avatar", e)
			})
		},
		_openImageModal: function(e) {
			var n = t.bind(function(t) {
				t = t[0], e.call(this, t.attachment_url), this.render()
			}, this);
			s.initialize({
				multiChoose: !1,
				callback: n
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_11_11/templates/edit.html", [], function() {
	return '<form class="form-horizontal edit-tpl-11-11" novalidate onsubmit="return false">\n    <div class="control-group">\n        <label class="control-label">背景图片：</label>\n        <div class="controls">\n            <% if (banner === \'\') { %>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">选择图片</a>\n            <% } else { %>\n                <div class="tpl-shop-header" style="width: 320px; background-image: url(<%- fullfillImage(banner) %>);">\n                    <a class="close-modal small hide js-delete-image" data-index="0">×</a>\n                </div>\n                <a class="control-action js-trigger-image" href="javascript: void(0);">修改</a>\n            <% } %>\n            <p class="help-desc">最佳尺寸：640 x 200 像素。</p>\n            <p class="help-desc">尺寸不匹配时，图片将被压缩或拉伸以铺满画面。</p>\n            <input type="hidden" name="banner">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">优惠券：</label>\n        <div class="controls">\n            <ul class="tradeincard-list">\n            <% _.each(tradeincard, function(item) { %>\n                <li>\n                    <div class="tradeincard-list-content">\n                        <div class="tradeincard-list-summary">\n                            <span class="label label-success">优惠券</span>\n                            <span><%- item.name %></span>\n                            <span class="c-gray">\n                                （满<%= item.at_least %>元可用）\n                            </span>\n                        </div>\n                    </div>\n                    <div class="tradeincard-list-opts">\n                        <a href="javascript:;" class="js-remove-tradeincard">删除</a>\n                    </div>\n                </li>\n\n            <% }); %>\n            </ul>\n            <% if(tradeincard.length < 3) { %>\n                <a href="javascript:;" class="control-action js-add-tradeincard">添加优惠券</a>\n            <% } %>\n            <input type="hidden" name="tradeincard">\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">公告：</label>\n        <div class="controls">\n            <input type="text" name="notice" value="<%= notice %>" class="input-xxlarge" placeholder="请填写内容，如果过长，将会在手机上滚动显示">\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/tpl_11_11/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/tpl_11_11/templates/edit.html", "components/image/2.0.0/app", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/tpl_11_11/templates/edit.html"),
		s = e("components/image/2.0.0/app"),
		o = e("components/modal/1.0.0/modal"),
		a = e("core/utils");
	return n.extend({
		template: t.template(i),
		events: {
			'blur input[type="text"]': "updateModel",
			"click .js-trigger-image": "chooseImage",
			"click .js-delete-image": "deleteImage",
			"click .js-add-tradeincard": "addTradeincard",
			"click .js-remove-tradeincard": "removeTradeincard"
		},
		templateHelpers: {
			fullfillImage: a.fullfillImage
		},
		modelEvents: {
			"change:banner": "render",
			"change:tradeincard": "render"
		},
		chooseImage: function() {
			this._openImageModal(function(e) {
				this.model.set("banner", e)
			})
		},
		onRender: function() {},
		_openImageModal: function(e) {
			var n = t.bind(function(t) {
				t = t[0], e.call(this, t.attachment_url)
			}, this);
			s.initialize({
				multiChoose: !1,
				callback: n
			})
		},
		deleteImage: function() {
			this.model.set("banner", "")
		},
		addTradeincard: function() {
			var e = this;
			this.tradeincardModal = o.initialize({
				type: "tradeincard",
				multiChoose: !0
			}).setChooseItemCallback(function(n) {
				var i = e.model.get("tradeincard");
				t.each(n, function(e) {
					i.length < 3 && i.push({
						id: e.id,
						name: e.name,
						value: e.value,
						is_at_least: e.is_at_least,
						at_least: e.at_least
					})
				}), e.model.trigger("change:tradeincard"), e.model.trigger("change")
			}), this.tradeincardModal.modal("show")
		},
		removeTradeincard: function(e) {
			var t = $(e.target).parents("li").index(),
				n = this.model.get("tradeincard");
			n.splice(t, 1), this.model.trigger("change:tradeincard"), this.model.trigger("change")
		}
	})
}), define("text!components/showcase/2.0.0/category/templates/edit_item.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label">名称：</label>\n    <div class="controls">\n        <input class="" type="text" name="title" value="<%- title %>" maxLength="6">\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label"><em class="required">*</em>链接到：</label>\n    <div class="controls">\n        <input type="hidden" name="link_url">\n        <% if (link_type != \'\') { %>\n            <div class="control-action clearfix">\n                <div class="pull-left js-link-to link-to">\n                    <% if (link_title !== \'\') { %>\n                    <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                    <% } %>\n\n                    <span class="label label-success">\n                        <% if (link_type === \'feature\') { %>\n                            微页面\n                        <% } else if (link_type === \'category\') { %>\n                            微页面分类\n                        <% } else if (link_type === \'topic\') { %>\n                            专题\n                        <% } else if (link_type === \'article\') { %>\n                            资讯\n                        <% } else if (link_type === \'goods\') { %>\n                            商品\n                        <% } else if (link_type === \'tag\') { %>\n                            商品标签\n                        <% } else if (link_type === \'activity\') { %>\n                            营销活动\n                        <% } else if (link_type === \'survey\') { %>\n                            调查\n                        <% } else if (link_type === \'homepage\') { %>\n                            店铺主页\n                        <% } else if (link_type === \'usercenter\') { %>\n                            会员主页\n                        <% } else if (link_type === \'link\') { %>\n                            外链\n                        <% } else if (link_type === \'history\') { %>\n                            历史信息\n                        <% } %>\n                    <% if (link_title !== \'\') { %>\n                            <em class="link-to-title-text"><%- link_title %></em>\n                        </span>\n                    </a>\n                    <% } else { %>\n                        </span>\n                    <% } %>\n                    <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                </div>\n                <div class="dropdown hover pull-right">\n                    <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            </div>\n\n        <% } else { %>\n            <div class="dropdown hover">\n                <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                <%= dropdown_menu() %>\n            </div>\n        <% } %>\n    </div>\n</div>\n'
}), define("components/showcase/2.0.0/category/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/category/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/category/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function() {
			this.listenTo(this.model, "change:link_url", this.render)
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			c.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		}
	})
}), define("components/showcase/2.0.0/category/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/category/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/category/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/category/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group js-collection-region">\n\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/category/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/category/views/edit_collection", "text!components/showcase/2.0.0/category/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/category/views/edit_collection"),
		s = e("text!components/showcase/2.0.0/category/templates/edit.html");
	return n.extend({
		template: t.template(s),
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onRender: function() {
			this.collectionRegion.show(new i({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		}
	})
}), define("text!components/showcase/2.0.0/white/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group white-space-group">\n        <label class="control-label">空白高度：</label>\n        <div class="controls controls-slider">\n            <div class="js-slider white-space-slider"></div>\n            <div class="slider-height"><span class="js-height"><%= height %></span> 像素</div>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/white/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/white/templates/edit.html", "jqueryui"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/white/templates/edit.html");
	return e("jqueryui"), n.extend({
		template: t.template(i),
		ui: {
			slider: ".js-slider",
			height: ".js-height"
		},
		onShow: function() {
			var e = this;
			this.ui.slider.slider({
				min: 30,
				max: 100,
				value: e.model.get("height"),
				slide: function(n, i) {
					var s = i.value;
					t.isNumber(s) && e.model.set("height", s), e.ui.height.text(s)
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/store/templates/edit.html", [], function() {
	return '<div class="app-component-desc">\n    <p>进入店铺</p>\n</div>\n'
}), define("components/showcase/2.0.0/store/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/store/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/store/templates/edit.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/recommend_goods/templates/edit.html", [], function() {
	return "<p>如果店铺中上架的商品数量少于10个，这个组件将不会在页面中显示。</p>\n"
}), define("components/showcase/2.0.0/recommend_goods/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/recommend_goods/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/recommend_goods/templates/edit.html");
	return n.extend({
		className: "app-component-desc",
		template: t.template(i),
		onInit: function(e) {
			this.parent = e.parent, this.listenTo(this.model, "change", this.render)
		}
	})
}), define("text!components/music/2.0.0/templates/app.html", [], function() {
	return '<div class="modal-header">\n    <a class="close" data-dismiss="modal">×</a>\n    <!-- 顶部tab -->\n    <ul class="module-nav modal-tab">\n        <li class="active"><a href="javascript:;" data-pane="public" class="js-modal-tab">配乐库</a> | </li>\n        <li><a href="javascript:;" data-pane="my" class="js-modal-tab">我的音乐</a></li>\n    </ul>\n</div>\n<div class="js-content-region">\n\n</div>\n<audio id="custom_scroll_audio_player" src=""></audio>\n'
}), define("text!components/music/2.0.0/templates/public_music.html", [], function() {
	return '<div class="tab-pane">\n    <div class="modal-body">\n        <table class="ui-table ui-table-list">\n            <thead>\n                <tr>\n                    <th>音乐</th>\n                    <th class="text-center">时长</th>\n                    <th class="text-right">大小</th>\n                    <th class="text-center">风格</th>\n                    <th class="text-right">操作</th>\n                </tr>\n            </thead>\n            <tbody>\n                <% _.each(musics, function(music, index) { %>\n                <tr data-title="<%- music.title %>" data-url="<%- music.url %>">\n                    <td>\n                        <span class="music-preview js-paly-music"></span>\n                        <div class="music-content">\n                            <%= music.title %>\n                            <% if(music.description) { %>\n                                <p class="music-description"><%= music.description %></p>\n                            <% } %>\n                        </div>\n                    </td>\n                    <td class="text-center"><%- music.time %></td>\n                    <td class="text-right"><%- music.size %></td>\n                    <td class="text-center"><%- music.type %></td>\n                    <td class="text-right">\n                        <% if(music.url != currentUrl) { %>\n                        <button class="ui-btn js-btn-choose">选取</button>\n                        <% } else { %>\n                        <button class="ui-btn ui-btn-disabled">已选</button>\n                        <% } %>\n                    </td>\n                </tr>\n                <% }) %>\n            </tbody>\n        </table>\n\n    </div>\n    <div class="modal-footer">\n        <div class="pagenavi js-pagenavi">\n            <% for(var i = 1; i < totalPage + 1; i++ ) { %>\n            <a data-page-num="<%= i %>" href="javascript:;" class="num <% if(i == p) { %>active<% } %>"><%= i %></a>\n            <% } %>\n        </div>\n    </div>\n</div>\n'
}), define("components/music/2.0.0/data", [], function() {
	return {
		musics: [{
			title: "Lucky Day",
			url: "public_files/music/Lucky Day.mp3",
			type: "节奏",
			time: "01:08",
			size: "543 KB"
		}, {
			title: "Parasail",
			url: "public_files/music/Parasail.mp3",
			type: "节奏",
			time: "03:04",
			size: "1.5 MB"
		}, {
			title: "Phase Three",
			url: "public_files/music/Phase Three.mp3",
			type: "节奏",
			time: "03:08",
			size: "1.5 MB"
		}, {
			title: "Say Yeah",
			url: "public_files/music/Say Yeah.mp3",
			type: "节奏",
			time: "03:11",
			size: "1.5 MB"
		}, {
			title: "Soft",
			url: "public_files/music/Soft.mp3",
			type: "节奏",
			time: "01:23",
			size: "666 KB"
		}, {
			title: "The Wrong Way",
			url: "public_files/music/The Wrong Way.mp3",
			type: "节奏",
			time: "02:45",
			size: "1.3 MB"
		}, {
			title: "Road to Moscow",
			url: "public_files/music/Road to Moscow.mp3",
			type: "轻快",
			time: "01:14",
			size: "594 KB"
		}, {
			title: "No Pressha",
			url: "public_files/music/No Pressha.mp3",
			type: "轻快",
			time: "01:27",
			size: "700 KB"
		}, {
			title: "Rotten Gardenias",
			url: "public_files/music/Rotten Gardenias.mp3",
			type: "轻快",
			time: "02:17",
			size: "1.1 MB"
		}, {
			title: "Sound Off",
			url: "public_files/music/Sound Off.mp3",
			type: "轻快",
			time: "01:36",
			size: "769 KB"
		}, {
			title: "Swamp Stomp",
			url: "public_files/music/Swamp Stomp.mp3",
			type: "轻快",
			time: "02:05",
			size: "1 MB"
		}, {
			title: "Jazz In Paris",
			url: "public_files/music/Jazz In Paris.mp3",
			type: "轻快",
			time: "01:42",
			size: "821 KB"
		}, {
			title: "Let's Do It",
			url: "public_files/music/Let's Do It.mp3",
			type: "放松",
			time: "03:14",
			size: "1.6 MB"
		}, {
			title: "Monks",
			url: "public_files/music/Monks.mp3",
			type: "放松",
			time: "03:10",
			size: "1.5 MB"
		}, {
			title: "Pluto",
			url: "public_files/music/Pluto.mp3",
			type: "放松",
			time: "02:13",
			size: "1.1 MB"
		}, {
			title: "抱着你",
			url: "public_files/music/baozheni.mp3",
			type: "放松",
			time: "04:28",
			size: "1.9 MB",
			description: "由有赞商户 <em>VINOTECA</em> 提供正版授权"
		}]
	}
}), define("components/music/2.0.0/views/public_music", ["require", "underscore", "jquery", "marionette", "text!components/music/2.0.0/templates/public_music.html", "components/music/2.0.0/data"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("marionette"),
		s = e("text!components/music/2.0.0/templates/public_music.html"),
		o = e("components/music/2.0.0/data"),
		a = 10;
	return i.Layout.extend({
		template: t.template(s),
		events: {
			"click .js-pagenavi .num": "handlePageClick"
		},
		p: 1,
		initialize: function(e) {
			this.options = e || {}, this.layout = this.options.layout
		},
		serializeData: function() {
			var e = {};
			return e.musics = o.musics.slice((this.p - 1) * a, this.p * a), t.extend(e, {
				currentUrl: this.options.currentUrl,
				p: this.p,
				totalPage: Math.ceil(o.musics.length / a)
			})
		},
		handlePageClick: function(e) {
			var t = +n(e.target).data("page-num");
			t !== this.p && (this.p = t, this.render(), this.layout.stopMusic())
		}
	})
}), define("components/music/2.0.0/models/music", ["require", "underscore", "jquery", "backbone", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("backbone"),
		s = e("core/utils"),
		o = window._global;
	return i.Model.extend({
		defaults: {
			items: null,
			page: "",
			p: 1
		},
		sync: function(e) {
			return s.ajax(e)
		},
		ajax: function(e, i) {
			var s = n.Deferred();
			return "object" == typeof e && (i = e, e = void 0), i = t.defaults(i || {}, {
				dataType: "json"
			}), s.xhr = n.ajax(e, i).done(function(e) {
				0 === +e.errcode ? s.resolve(e.data, e) : s.reject(e.errmsg, e)
			}).fail(function() {
				s.reject("网络错误。", {
					code: -1,
					msg: "网络错误。"
				})
			}), s
		},
		fetch: function(e) {
			var n = this;
			return e = e || {}, this.ajax({
				url: o.url.www + "/showcase/attachment/alert.json",
				method: "GET",
				data: t.extend({
					media_type: 5,
					s: 10,
					v: 2,
					p: this.get("p")
				}, e)
			}).done(function(e) {
				n.set({
					items: e.data_list,
					page: e.page_view
				}, {
					silent: !0
				}), n.trigger("sync")
			}).fail(function(e) {
				s.errorNotify(e)
			})
		},
		uploadMusic: function() {
			var e = this,
				t = n.Deferred();
			return this.getToken().done(function(n) {
				e.upload(n.uptoken).done(function(e, n) {
					t.resolve(e, n)
				}).fail(function(e) {
					t.reject(e)
				})
			}).fail(function() {
				t.reject("获取token失败，请重试。")
			}), t
		},
		getToken: function() {
			return this.sync({
				url: o.url.www + "/common/qiniu/upToken.json",
				method: "POST",
				data: {
					scope: o.js.qn_public,
					kdt_id: n.cookie("kdt_id")
				}
			})
		},
		upload: function(e) {
			var t = new FormData;
			return t.append("token", e), t.append("file", this.get("file")), t.append("x:kdt_type", "music"), this.sync({
				url: "http://up.qiniu.com",
				method: "POST",
				data: t,
				processData: !1,
				contentType: !1
			})
		}
	})
}), define("text!components/music/2.0.0/templates/my_music.html", [], function() {
	return '<div class="tab-pane">\n    <div class="modal-body">\n        <div class="ui-box music-upload">\n            <p>根据中国相关法律、法规和规范性文件要求，有赞制定了旨在保护知识产权权利人合法权益的措施和步骤。如背景音乐上传者上传的内容侵犯音乐著作权权利人相关权益，责任由上传者全部承担，有赞不承担任何连带责任。</p>\n\n\n            <div class="music-upload-btn">\n                <a class="ui-btn ui-btn-primary music-upload-label js-music-upload-label" href="javascript:;" data-loading-text="正在上传...">同意协议，上传音乐</a>\n                <input class="music-upload-input fileupload js-upload-music-input" type="file" name="upload_music">\n                <span class="c-gray" style="margin-left: 10px;">支持MP3格式音乐，大小不超过6M</span>\n            </div>\n\n        </div>\n\n        <% if(items && items.length > 0) { %>\n            <table class="ui-table ui-table-list">\n                <thead>\n                    <tr>\n                        <th>音乐</th>\n                        <th class="text-right">操作</th>\n                    </tr>\n                </thead>\n                <tbody>\n                    <% _.each(items, function(music, index) { %>\n                    <tr data-title="<%- music.attachment_title.replace(/\\.mp3$/i, \'\') %>" data-url="<%- music.attachment_url %>">\n                        <td>\n                            <span class="music-preview js-paly-music"></span>\n                            <div class="music-content">\n                                <%= music.attachment_title.replace(/\\.mp3$/i, \'\') %>\n                                <% if(music.description) { %>\n                                    <p class="music-description"><%= music.description %></p>\n                                <% } %>\n                            </div>\n                        </td>\n                        <td class="text-right">\n                            <button class="ui-btn js-btn-choose">选取</button>\n                        </td>\n                    </tr>\n                    <% }) %>\n                </tbody>\n            </table>\n        <% } else { %>\n        <div class="no-result">还没有上传的音乐。</div>\n        <% } %>\n    </div>\n    <div class="modal-footer">\n        <div class="pagenavi js-pagenavi">\n            <%= page %>\n        </div>\n    </div>\n</div>\n'
}), define("components/music/2.0.0/views/my_music", ["require", "underscore", "jquery", "marionette", "components/music/2.0.0/models/music", "core/utils", "text!components/music/2.0.0/templates/my_music.html"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("marionette"),
		s = e("components/music/2.0.0/models/music"),
		o = e("core/utils"),
		a = e("text!components/music/2.0.0/templates/my_music.html");
	return i.Layout.extend({
		template: t.template(a),
		events: {
			"click .js-pagenavi .num": "handlePageClick",
			"change .js-upload-music-input": "handleFileChange",
			"click .pagenavi a:not(.active)": "handlePageNumClick",
			"keypress .pagenavi a.active": "handlePageNumKeypress"
		},
		modelEvents: {
			sync: "render"
		},
		initialize: function(e) {
			this.options = e || {}, this.layout = this.options.layout, this.model = new s, this.model.fetch()
		},
		onRender: function() {
			this.layout.stopMusic()
		},
		handlePageClick: function(e) {
			var t = +n(e.target).data("page-num");
			t !== this.p && this.layout.stopMusic()
		},
		handleFileChange: function(e) {
			var t = this,
				n = e.target.files[0];
			return n.name.match(/(\.|\/)(mp3)$/i) ? n.size > 6291456 ? void o.errorNotify("音乐文件大小不能超过6MB。") : (this.$(".js-music-upload-label").btn("loading"), this.$(".js-upload-music-input").hide(), this.model.set("file", n, {
				silent: !0
			}), void this.model.uploadMusic().done(function(e) {
				t.options.callback && t.options.callback({
					url: e.attachment_full_url,
					title: e.attachment_title.replace(/\.mp3$/i, "")
				}), t.layout.$el.modal("hide")
			}).fail(function(e) {
				o.errorNotify(e), t.$(".js-music-upload-label").btn("reset"), t.$(".js-upload-music-input").show()
			})) : void o.errorNotify("请选择MP3格式的音乐文件。")
		},
		handlePageNumClick: function(e) {
			var t = n(e.currentTarget),
				i = t.data("page-num");
			this.model.set("p", i, {
				silent: !0
			}), this.model.fetch()
		},
		handlePageNumKeypress: function(e) {
			var t = +n(e.currentTarget).text();
			o.isNumber(e) || e.preventDefault(), e.keyCode === o.keyCode.ENTER && (t !== +this.model.get("p") && t && (this.model.set("p", t, {
				silent: !0
			}), this.model.fetch({
				scroll: !0
			})), e.preventDefault())
		}
	})
}), define("components/spider/ui/btn", ["require", "jquery"], function(e) {
	var t = e("jquery"),
		n = function(e, i) {
			this.$element = t(e), this.options = t.extend({}, n.DEFAULTS, i)
		};
	n.DEFAULTS = {
		loadingText: "保存中..."
	}, n.prototype.setState = function(e) {
		var t = "disabled",
			n = this.$element,
			i = n.is("input") ? "val" : "html",
			s = n.data();
		e += "Text", s.resetText || n.data("resetText", n[i]()), n[i](s[e] || this.options[e]), setTimeout(function() {
			"loadingText" == e ? n.addClass("ui-btn-" + t).attr(t, t) : n.removeClass("ui-btn-" + t).removeAttr(t)
		}, 0)
	}, n.prototype.toggle = function() {
		var e = this.$element.closest('[data-toggle="buttons"]'),
			t = !0;
		if (e.length) {
			var n = this.$element.find("input");
			"radio" === n.prop("type") && (n.prop("checked") && this.$element.hasClass("active") ? t = !1 : e.find(".active").removeClass("active")), t && n.prop("checked", !this.$element.hasClass("active")).trigger("change")
		}
		t && this.$element.toggleClass("active")
	};
	var i = t.fn.btn;
	t.fn.btn = function(e) {
		return this.each(function() {
			var i = t(this),
				s = i.data("kdt.btn"),
				o = "object" == typeof e && e;
			s || i.data("kdt.btn", s = new n(this, o)), "toggle" == e ? s.toggle() : e && s.setState(e)
		})
	}, t.fn.btn.Constructor = n, t.fn.btn.noConflict = function() {
		return t.fn.btn = i, this
	}, t(document).on("click.kdt.btn.data-api", "[data-toggle^=button]", function(e) {
		var n = t(e.target);
		n.hasClass("ui-btn") || (n = n.closest(".ui-btn")), n.button("toggle"), e.preventDefault()
	})
}), define("components/spider/ui/switch", ["require", "jquery"], function(e) {
	var t = e("jquery"),
		n = "ui-switch-on",
		i = "ui-switch-off",
		s = function(e, n) {
			this.$element = t(e), this.options = t.extend({}, s.DEFAULTS, n)
		};
	s.DEFAULTS = {}, s.prototype.setState = function(e) {
		var t = this.$element,
			s = "ui-switch-" + e;
		t.removeClass(n).removeClass(i).addClass(s)
	}, s.prototype.toggle = function() {
		this.setState(this.$element.hasClass(n) ? "off" : "on")
	}, t.fn.
	switch = function(e) {
		return "val" === e ? this.hasClass(n) : this.each(function() {
			var n = t(this),
				i = n.data("kdt.switch"),
				o = "object" == typeof e && e;
			return i || n.data("kdt.switch", i = new s(this, o)), "toggle" === e ? i.toggle() : void(e && i.setState(e))
		})
	}
}), define("components/spider/spider", ["require", "jquery", "components/spider/ui/btn", "components/spider/ui/switch"], function(e) {
	var t = e("jquery");
	return e("components/spider/ui/btn"), e("components/spider/ui/switch"), t
}), define("components/music/2.0.0/music", ["require", "underscore", "jquery", "marionette", "text!components/music/2.0.0/templates/app.html", "components/music/2.0.0/views/public_music", "components/music/2.0.0/views/my_music", "core/utils", "components/spider/spider"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("marionette"),
		s = e("text!components/music/2.0.0/templates/app.html"),
		o = e("components/music/2.0.0/views/public_music"),
		a = e("components/music/2.0.0/views/my_music"),
		l = e("core/utils");
	e("components/spider/spider");
	var c = i.Layout.extend({
		className: "modal fade hide music-v2-modal",
		template: t.template(s),
		events: {
			hidden: "hidden",
			"click .js-modal-tab": "handleTabClick",
			"click .js-btn-choose": "chooseMusic",
			"click .js-paly-music": "playMusic"
		},
		regions: {
			content: ".js-content-region"
		},
		initialize: function(e) {
			this.options = e || {}, this.cache = {}, this.render()
		},
		onRender: function() {
			this.renderPublicMusicView(), this.$el.modal("show"), this.initPlayer()
		},
		renderPublicMusicView: function() {
			this.content.show(new o(t.extend({
				layout: this
			}, this.options)))
		},
		renderMyMusicView: function() {
			this.content.show(new a(t.extend({
				layout: this
			}, this.options)))
		},
		handleTabClick: function(e) {
			var t = n(e.target),
				i = t.parent(),
				s = t.data("pane");
			i.hasClass("active") || (this.$(".modal-tab > li").removeClass("active"), i.addClass("active"), "public" === s ? this.renderPublicMusicView() : this.renderMyMusicView(), this.stopMusic())
		},
		initPlayer: function() {
			var e = this;
			this.player = this.$("#custom_scroll_audio_player")[0], this.player.addEventListener("ended", function() {
				e.$(".playing").removeClass("playing")
			})
		},
		chooseMusic: function(e) {
			var t = n(e.target),
				i = t.parents("tr").data();
			this.options.callback && this.options.callback(i), this.hideModal()
		},
		playMusic: function(e) {
			var t = n(e.target),
				i = t.parents("tr").data();
			t.hasClass("playing") ? (t.removeClass("playing"), this.player.pause(), this.player.currentTime = 0) : (this.$(".playing").removeClass("playing"), t.addClass("playing"), this.player.src = l.fullfillImage(i.url), this.player.play())
		},
		stopMusic: function() {
			this.$(".playing").removeClass("playing"), 0 !== this.player.readyState && (this.player.pause(), this.player.currentTime = 0)
		},
		hideModal: function() {
			this.$el.modal("hide")
		},
		hidden: function() {
			this.$el.data("modal", null), this.close()
		},
		onClose: function() {
			this.player = null
		}
	});
	return {
		initialize: function(e) {
			new c(e)
		}
	}
}), define("text!components/showcase/2.0.0/scroll/templates/edit_meta.html", [], function() {
	return '<div class="control-group">\n    <label class="control-label">主页图标：</label>\n    <div class="controls">\n        <label class="checkbox inline">\n            <input type="checkbox" name="homepage_icon" <% if(homepage_icon == \'1\') {%>checked<%}%>>\n            显示店铺主页图标，用户点击后进入店铺主页\n        </label>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">背景音乐：</label>\n    <div class="controls">\n        <label class="checkbox inline">\n            <input type="checkbox" name="music_icon" <% if(music_icon == \'1\') {%>checked<%}%>>\n            启用背景音乐：\n        </label>\n\n        <% if(music_url) { %>\n            <div class="music-box">\n                <span class="label label-success js-music"><%= music_title %></span>\n                <a href="javascript:;" class="js-delete-music close-modal" title="删除">×</a>\n            </div>\n            <a href="javascript:;" class="choose-music js-music">修改</a>\n        <% } else { %>\n            <a href="javascript:;" class="choose-music js-music">选择音乐</a>\n        <% } %>\n    </div>\n</div>\n<div class="control-group">\n    <label class="control-label">循环滚动：</label>\n    <div class="controls">\n        <label class="checkbox inline">\n            <input type="checkbox" name="loop" <% if(loop == \'1\') {%>checked<%}%>>\n            封底页可继续滑动切换到封面\n        </label>\n    </div>\n</div>\n'
}), define("components/showcase/2.0.0/scroll/views/edit_meta", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/music/2.0.0/music", "text!components/showcase/2.0.0/scroll/templates/edit_meta.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/music/2.0.0/music"),
		s = e("text!components/showcase/2.0.0/scroll/templates/edit_meta.html");
	return n.extend({
		className: "ui-box",
		template: t.template(s),
		events: {
			'change input[type="checkbox"]': "updateModel",
			"click .js-music": "handleMusicClick",
			"click .js-delete-music": "handleDeleteMusicClick"
		},
		modelEvents: {
			"change:music_url": "render"
		},
		bindValidation: function() {},
		handleMusicClick: function() {
			i.initialize({
				callback: t.bind(this.choseMusice, this),
				currentUrl: this.model.get("music_url")
			})
		},
		choseMusice: function(e) {
			this.model.set({
				music_url: e.url,
				music_title: e.title
			})
		},
		handleDeleteMusicClick: function() {
			this.model.set({
				music_url: "",
				music_title: ""
			})
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/edit_first_page.html", [], function() {
	return '<h4>封面页</h4>\n<div class="ui-box clearfix">\n    <% if(first_page_wipe == \'0\') { %>\n        <% if(first_page_image_url) { %>\n            <div class="image-box">\n                <img src="<%= fullfillImage(first_page_image_url, \'!140x140+2x.jpg\') %>" class="image">\n                <a href="javascript:;" class="modify-image js-first-page-image">重新上传</a>\n            </div>\n        <% } else { %>\n            <a href="javascript:;" class="add-image js-first-page-image"><i class="icon-add"></i> 添加图片</a>\n            <div class="control-group">\n                <div class="controls" style="margin: 2px;">\n                    <input type="hidden" name="first_page_image_url">\n                </div>\n            </div>\n        <% } %>\n    <% } else { %>\n        <div class="pull-left before-wipe">\n            <div class="pull-left">擦拭前：</div>\n            <div class="pull-left">\n                <% if(first_page_wipe_image_id) { %>\n                    <div class="image-box">\n                        <img src="<%= fullfillImage(first_page_wipe_image_url, \'!140x140+2x.jpg\') %>" class="image">\n                        <a href="javascript:;" class="modify-image js-first-page-wipe-image">重新上传</a>\n                    </div>\n                <% } else { %>\n                    <a href="javascript:;" class="add-image js-first-page-wipe-image"><i class="icon-add"></i> 添加图片</a>\n                <% } %>\n            </div>\n        </div>\n        <div class="pull-left after-wipe">\n            <div class="pull-left">擦拭后：</div>\n            <div class="pull-left">\n                <% if(first_page_image_id) { %>\n                    <div class="image-box">\n                        <img src="<%= fullfillImage(first_page_image_url, \'!140x140+2x.jpg\') %>" class="image">\n                        <a href="javascript:;" class="modify-image js-first-page-image">重新上传</a>\n                    </div>\n                <% } else { %>\n                    <a href="javascript:;" class="add-image js-first-page-image"><i class="icon-add"></i> 添加图片</a>\n                    <div class="control-group">\n                        <div class="controls" style="margin: 2px;">\n                            <input type="hidden" name="first_page_image_url">\n                        </div>\n                    </div>\n                <% } %>\n            </div>\n        </div>\n    <% } %>\n</div>\n<label class="checkbox inline">\n    <input type="checkbox" name="first_page_wipe" <% if(first_page_wipe == \'1\') {%>checked<%}%>>\n    启用擦拭屏幕后显示的交互效果\n</label>\n'
}), define("components/showcase/2.0.0/scroll/views/edit_first_page", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/image/2.0.0/app", "text!components/showcase/2.0.0/scroll/templates/edit_first_page.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/image/2.0.0/app"),
		s = e("text!components/showcase/2.0.0/scroll/templates/edit_first_page.html"),
		o = e("core/utils");
	return n.extend({
		className: "custom-scroll-page",
		template: t.template(s),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		events: {
			'change input[type="checkbox"]': "updateModel",
			"click .js-first-page-image": "handleImageClick",
			"click .js-first-page-wipe-image": "handleWipeImageClick"
		},
		modelEvents: {
			"change:first_page_wipe": "render",
			"change:first_page_image_id": "render",
			"change:first_page_wipe_image_id": "render"
		},
		bindValidation: function() {},
		handleImageClick: function() {
			var e = t.bind(function(e) {
				this.model.set({
					first_page_image_id: e.attachment_id,
					first_page_image_url: e.attachment_url,
					first_page_image_thumb_url: e.thumb_url,
					first_page_image_width: Number(e.width),
					first_page_image_height: Number(e.height)
				})
			}, this);
			this.chooseImage(e)
		},
		handleWipeImageClick: function() {
			var e = t.bind(function(e) {
				this.model.set({
					first_page_wipe_image_id: e.attachment_id,
					first_page_wipe_image_url: e.attachment_url,
					first_page_wipe_image_thumb_url: e.thumb_url,
					first_page_wipe_image_width: Number(e.width),
					first_page_wipe_image_height: Number(e.height)
				})
			}, this);
			this.chooseImage(e)
		},
		chooseImage: function(e) {
			i.initialize({
				multiChoose: !1,
				callback: function(n) {
					n = n[0], t.isFunction(e) && e(n)
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/edit_last_page.html", [], function() {
	return '<h4>封底页</h4>\n<div class="clearfix">\n    <div class="pull-left">\n        <% if(last_page_image_url) { %>\n            <div class="image-box">\n                <img src="<%= fullfillImage(last_page_image_url, \'!140x140+2x.jpg\') %>" class="image">\n                <a href="javascript:;" class="modify-image js-last-page-image">重新上传</a>\n            </div>\n        <% } else { %>\n            <a href="javascript:;" class="add-image js-last-page-image"><i class="icon-add"></i> 添加图片</a>\n            <div class="control-group">\n                <div class="controls" style="margin: 2px;">\n                    <input type="hidden" name="last_page_image_url">\n                </div>\n            </div>\n        <% } %>\n    </div>\n    <div class="pull-left">\n        <div class="control-group">\n            <label class="control-label">链接：</label>\n            <div class="controls">\n                <% if (last_page_link_type != \'\') { %>\n                    <div class="control-action clearfix">\n                        <div class="pull-left js-link-to link-to">\n                            <% if (last_page_link_title !== \'\') { %>\n                            <a href="<%= last_page_link_url %>" target="_blank" class="new-window link-to-title">\n                            <% } %>\n\n                            <span class="label label-success">\n                                <% if (last_page_link_type === \'feature\') { %>\n                                    微页面\n                                <% } else if (last_page_link_type === \'category\') { %>\n                                    微页面分类\n                                <% } else if (last_page_link_type === \'topic\') { %>\n                                    专题\n                                <% } else if (last_page_link_type === \'article\') { %>\n                                    资讯\n                                <% } else if (last_page_link_type === \'goods\') { %>\n                                    商品\n                                <% } else if (last_page_link_type === \'tag\') { %>\n                                    商品标签\n                                <% } else if (last_page_link_type === \'activity\') { %>\n                                    营销活动\n                                <% } else if (last_page_link_type === \'survey\') { %>\n                                    调查\n                                <% } else if (last_page_link_type === \'homepage\') { %>\n                                    店铺主页\n                                <% } else if (last_page_link_type === \'usercenter\') { %>\n                                    会员主页\n                                <% } else if (last_page_link_type === \'link\') { %>\n                                    外链\n                                <% } else if (last_page_link_type === \'history\') { %>\n                                    历史信息\n                                <% } %>\n                            <% if (last_page_link_title !== \'\') { %>\n                                    <em class="link-to-title-text"><%- last_page_link_title %></em>\n                                </span>\n                            </a>\n                            <% } else { %>\n                                </span>\n                            <% } %>\n                            <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                        </div>\n                        <div class="dropdown hover pull-right">\n                            <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                            <%= dropdown_menu() %>\n                        </div>\n                    </div>\n\n                <% } else { %>\n                    <div class="dropdown hover">\n                        <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                <% } %>\n            </div>\n        </div>\n    </div>\n</div>\n\n'
}), define("components/showcase/2.0.0/scroll/views/edit_last_page", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "components/image/2.0.0/app", "components/pop/pop", "components/modal/1.0.0/modal", "text!components/public_template/dropdown_menu.html", "text!components/showcase/2.0.0/scroll/templates/edit_last_page.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("components/image/2.0.0/app"),
		o = e("components/pop/pop"),
		a = e("components/modal/1.0.0/modal"),
		l = e("text!components/public_template/dropdown_menu.html"),
		c = e("text!components/showcase/2.0.0/scroll/templates/edit_last_page.html"),
		r = e("core/utils");
	return i.extend({
		className: "custom-scroll-page",
		template: t.template(c),
		dropdownTpl: t.template(l),
		templateHelpers: function() {
			return {
				fullfillImage: r.fullfillImage,
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			"click .js-last-page-image": "handleImageClick",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		modelEvents: {
			"change:last_page_image_url": "render",
			"change:last_page_link_url": "render"
		},
		bindValidation: function() {},
		handleImageClick: function() {
			var e = this;
			s.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						last_page_image_id: t.attachment_id,
						last_page_image_url: t.attachment_url,
						last_page_image_thumb_url: t.thumb_url,
						last_page_image_width: Number(t.width),
						last_page_image_height: Number(t.height)
					})
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			a.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					last_page_link_id: e.data_id,
					last_page_link_type: e.type,
					last_page_link_title: e.data_title,
					last_page_link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					last_page_link_id: "",
					last_page_link_type: t,
					last_page_link_title: "",
					last_page_link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			o.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						last_page_link_id: "",
						last_page_link_type: "link",
						last_page_link_title: e,
						last_page_link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				last_page_link_id: "",
				last_page_link_type: "",
				last_page_link_title: "",
				last_page_link_url: ""
			})
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/edit_item.html", [], function() {
	return '<div class="choice-image-box">\n    <% if(image_url) { %>\n        <div class="image-box">\n            <img src="<%= fullfillImage(image_url, \'!140x140+2x.jpg\') %>" class="image">\n            <a href="javascript:;" class="modify-image js-page-image">重新上传</a>\n        </div>\n    <% } else { %>\n        <a href="javascript:;" class="add-image js-page-image"><i class="icon-add"></i> 添加图片</a>\n        <div class="control-group">\n            <div class="controls">\n                <input type="hidden" name="image_url">\n            </div>\n        </div>\n    <% } %>\n</div>\n<div class="choice-content">\n    <div class="control-group">\n        <label class="control-label">链接：</label>\n        <div class="controls">\n            <% if (link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group">\n        <div class="controls">\n            <div class="control-action">\n                <a href="javascript:;" class="js-pop-anm-editor">设置动画</a>\n            </div>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n'
}), define("text!components/showcase/2.0.0/scroll/templates/anm_workstation.html", [], function() {
	return '<ul class="choices js-elem-list"></ul>\n<div class="ui-box">\n    <a href="javascript:;" class="add-option js-add-elem"><i class="icon-add"></i> 添加元素</a>\n</div>\n'
}), define("components/showcase/2.0.0/scroll/models/anm_item", ["require", "components/showcase/2.0.0/base/models/base"], function(e) {
	var t = e("components/showcase/2.0.0/base/models/base"),
		n = t.extend({
			defaults: function() {
				return {
					width: "",
					height: "",
					x: 0,
					y: 0,
					duration: 1,
					delay: 0,
					anm_style: "fadeIn",
					image_id: "",
					image_url: "",
					image_thumb_url: ""
				}
			},
			validation: {},
			initialize: function() {
				this.listenTo(this, "change:width", function(e, t) {
					var n = this._previousAttributes.width;
					return isNaN(Number(t)) ? (this.set({
						width: n
					}, {
						silent: !0
					}), void this.trigger("render")) : (this.set({
						height: ~~ (this.get("height") * t / n)
					}, {
						silent: !0
					}), void this.trigger("render"))
				}), this.listenTo(this, "change:height", function(e, t) {
					var n = this._previousAttributes.height;
					return isNaN(Number(t)) ? (this.set({
						height: n
					}, {
						silent: !0
					}), void this.trigger("render")) : (this.set({
						width: ~~ (this.get("width") * t / n)
					}, {
						silent: !0
					}), void this.trigger("render"))
				}), this.validNumber(["x", "y", "duration", "delay"])
			},
			validNumber: function(e) {
				var t = this;
				return e instanceof Array ? e.forEach(function(e) {
					t.validNumber(e)
				}) : void this.listenTo(this, "change:" + e, function(t, n) {
					var i = this._previousAttributes[e],
						s = {};
					n = Number(n), isNaN(n) && (s[e] = i, this.set(s, {
						silent: !0
					}), this.trigger("render"))
				})
			}
		});
	return n
}), define("components/showcase/2.0.0/scroll/collections/anms", ["require", "backbone", "components/showcase/2.0.0/scroll/models/anm_item"], function(e) {
	var t = e("backbone"),
		n = e("components/showcase/2.0.0/scroll/models/anm_item");
	return t.Collection.extend({
		model: n,
		toJSON: function() {
			var e = t.Collection.prototype.toJSON.apply(this, arguments);
			return e.filter(function(e) {
				return !!e.image_url
			})
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/anm_item.html", [], function() {
	return '<div class="pull-left">\n    <%if(image_url){%>\n        <div class="image-box">\n            <img src="<%= fullfillImage(image_url) %>">\n            <a href="javascript:;" class="modify-image js-upload-image">重新上传</a>\n        </div>\n    <%} else {%>\n        <a href="javascript:;" class="add-image js-upload-image"><i class="icon-add"></i>添加图片</a>\n    <%}%>\n</div>\n\n\n<div class="anm-elem-form">\n    <div class="form-inline ui-box">\n        <span class="form-inline-label">宽</span>\n        <input type="text" class="input-mini" name="width" value="<%= width %>" maxlength="3" >\n        <span class="form-inline-label">高</span>\n        <input type="text" class="input-mini" name="height" value="<%= height %>" maxlength="3" >\n    </div>\n    \n    <div class="form-horizontal">\n        <div class="control-group">\n            <label class="control-label">横向位置：</label>\n            <div class="controls">\n                <input type="text" class="input-mini" name="x" value="<%= x %>" maxlength="3">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">纵向位置：</label>\n            <div class="controls">\n                <input type="text" class="input-mini" name="y" value="<%= y %>" maxlength="3">\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">动画效果：</label>\n            <div class="controls">\n                <select name="anm_style" class="input-small">\n                    <option value="-1">无</option>\n                    <option value="fadeIn">淡入</option>\n                    <option value="drop">下坠</option>\n                    <option value="float">上浮</option>\n                    <option value="leftin">左入</option>\n                    <option value="rightin">右入</option>\n                </select>\n            </div>\n        </div>\n\n        <div class="control-group">\n            <label class="control-label">开始时间：</label>\n            <div class="controls">\n                <input type="text" class="input-mini" name="delay" value="<%= delay %>" maxlength="3"> 秒\n            </div>\n        </div>\n        <div class="control-group">\n            <label class="control-label">动画持续：</label>\n            <div class="controls">\n                <input type="text" class="input-mini" name="duration" value="<%= duration %>" maxlength="3"> 秒\n            </div>\n        </div>\n    </div>\n\n</div>\n\n\n<div class="actions">\n    <span class="action delete close-modal js-delete" title="删除">×</span>\n</div>'
}), define("components/showcase/2.0.0/scroll/views/anm_item", ["require", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/scroll/templates/anm_item.html", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_base"),
		n = e("text!components/showcase/2.0.0/scroll/templates/anm_item.html"),
		i = e("components/image/2.0.0/app"),
		s = e("core/utils");
	return t.extend({
		events: {
			"change :input": "updateModel",
			"click .js-delete": "deleteSelf",
			"click .js-upload-image": "addImage",
			mouseover: "onMouseover",
			mouseout: "onMouseout"
		},
		tagName: "li",
		className: "anm-elem",
		template: _.template(n),
		onInit: function() {
			this.listenTo(this.model, "render", this.render), this.listenTo(this.model, "hover", this.toggleHover)
		},
		onRender: function() {
			var e = this.model;
			this.$("select").each(function() {
				var t = this.name;
				$(this).val(e.get(t))
			})
		},
		templateHelpers: {
			fullfillImage: s.fullfillImage
		},
		deleteSelf: function() {
			this.model.destroy()
		},
		addImage: function() {
			var e = this;
			i.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0];
					var n = e.handleWH(t.width, t.height);
					e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						width: n.width,
						height: n.height
					}, {
						silent: !0
					}), e.model.trigger("render")
				}
			})
		},
		handleWH: function(e, t) {
			return t = ~~ (60 * t / e), e = 60, {
				width: e,
				height: t
			}
		},
		onMouseover: function() {
			this.model.trigger("hover", !0)
		},
		onMouseout: function() {
			this.model.trigger("hover", !1)
		},
		toggleHover: function(e) {
			this.$el.toggleClass("anm-hover", e)
		}
	})
}), define("components/showcase/2.0.0/scroll/views/anm_workstation", ["require", "marionette", "text!components/showcase/2.0.0/scroll/templates/anm_workstation.html", "components/showcase/2.0.0/scroll/collections/anms", "components/showcase/2.0.0/scroll/views/anm_item"], function(e) {
	var t = e("marionette"),
		n = e("text!components/showcase/2.0.0/scroll/templates/anm_workstation.html"),
		i = e("components/showcase/2.0.0/scroll/collections/anms"),
		s = e("components/showcase/2.0.0/scroll/views/anm_item");
	return t.CompositeView.extend({
		className: "anm-editor-workstation app-design",
		template: _.template(n),
		events: {
			"click .js-add-elem": "addElem",
			mousewheel: "handleScroll"
		},
		itemViewContainer: ".js-elem-list",
		itemView: s,
		initialize: function() {
			var e = this.model.get("anms");
			this.collection = new i, void 0 != e && this.collection.reset(e instanceof i ? e.models : e), this.model.set("anms", this.collection)
		},
		addElem: function() {
			this.collection.push({})
		},
		handleScroll: function(e) {
			var t, n, i, s = $(e.currentTarget);
			return t = -(null != (n = e.originalEvent) ? n.wheelDelta : void 0) || (null != (i = e.originialEvent) ? i.detail : void 0), null != t ? (e.preventDefault(), "DOMMouseScroll" === e.type && (t = 40 * t), s.scrollTop(t + s.scrollTop())) : void 0
		}
	})
}), define("components/showcase/2.0.0/scroll/views/anm_preview_item", ["require", "marionette", "core/utils"], function(e) {
	var t = e("marionette"),
		n = e("core/utils");
	return t.ItemView.extend({
		className: "anm-item-preview",
		template: _.template(""),
		events: {
			mouseover: "onMouseover",
			mouseout: "onMouseout"
		},
		initialize: function() {
			var e = this;
			this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "render", this.render), this.listenTo(this.model, "hover", function(t) {
				e.$el.toggleClass("anm-hover", t)
			}), this.$el.draggable({
				containment: "parent"
			}).on("dragstop", function() {
				var t = $(this).position();
				e.model.set("x", t.left).set("y", t.top).trigger("render")
			}).css("position", "absolute")
		},
		onRender: function() {
			var e = this.model.toJSON();
			e.image_url && this.$el.css({
				top: ~~e.y,
				left: ~~e.x,
				backgroundImage: "url(" + n.fullfillImage(e.image_url) + ")",
				width: ~~e.width,
				height: ~~e.height
			})
		},
		onMouseover: function() {
			this.model.trigger("hover", !0)
		},
		onMouseout: function() {
			this.model.trigger("hover", !1)
		}
	})
}), define("components/showcase/2.0.0/scroll/views/anm_preview", ["require", "marionette", "components/showcase/2.0.0/scroll/collections/anms", "components/showcase/2.0.0/scroll/views/anm_preview_item"], function(e) {
	var t = e("marionette"),
		n = (e("components/showcase/2.0.0/scroll/collections/anms"), e("components/showcase/2.0.0/scroll/views/anm_preview_item"));
	return t.CollectionView.extend({
		className: "anm-editor-preview",
		itemView: n,
		initialize: function() {
			this.collection = this.model.get("anms")
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/anm_editor.html", [], function() {
	return '<div class="modal-header">\n    <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->\n    <h3>动画编辑</h3>\n</div>\n<div class="modal-body">\n    <div class="anm-editor-preview-wrap" style="background-image: url(<%= fullfillImage(image_url) %>!640x320.jpg)">\n        <div class="js-anm-preview"></div>\n    </div>\n    <div class="anm-editor-workstation-wrap js-workstation">\n    </div>\n</div>\n<div class="modal-footer">\n    <a href="javascript:;" class="btn btn-primary" data-dismiss="modal">确定</a>\n</div>'
}), define("components/showcase/2.0.0/scroll/views/anm_editor", ["require", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/scroll/views/anm_workstation", "components/showcase/2.0.0/scroll/views/anm_preview", "text!components/showcase/2.0.0/scroll/templates/anm_editor.html", "core/utils"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_base"),
		n = e("components/showcase/2.0.0/scroll/views/anm_workstation"),
		i = e("components/showcase/2.0.0/scroll/views/anm_preview"),
		s = e("text!components/showcase/2.0.0/scroll/templates/anm_editor.html"),
		o = e("core/utils");
	return t.extend({
		className: "modal fade hide anm-editor",
		template: _.template(s),
		regions: {
			workRegion: ".js-workstation",
			previewRegion: ".js-anm-preview"
		},
		events: {
			hidden: "close"
		},
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		onRender: function() {
			this.$el.modal("show"), this.workRegion.show(new n({
				model: this.model
			})), this.previewRegion.show(new i({
				model: this.model
			}))
		},
		close: function() {
			this.remove()
		}
	})
}), define("components/showcase/2.0.0/scroll/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/scroll/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "components/showcase/2.0.0/scroll/views/anm_editor", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/scroll/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("components/showcase/2.0.0/scroll/views/anm_editor"),
		d = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			return {
				fullfillImage: d.fullfillImage,
				dropdown_menu: this.dropdownTpl
			}
		},
		events: {
			'blur input[type="text"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-page-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink",
			"click .js-pop-anm-editor": "popAnmEditor"
		},
		onInit: function(e) {
			this.parent = e.parent || {}, this.listenTo(this.model, "change", this.render)
		},
		bindValidation: function() {},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					})
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			d.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		"delete": function() {
			this.model.destroy()
		},
		popAnmEditor: function() {
			var e = new r({
				model: this.model
			});
			e.render()
		}
	})
}), define("components/showcase/2.0.0/scroll/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/scroll/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/scroll/views/edit_item");
	return t.extend({
		itemView: n,
		onShow: function() {
			this.sortable()
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/edit.html", [], function() {
	return '\n<form class="form-horizontal custom-scroll" novalidate>\n    <div class="js-meta-region"></div>\n\n    <div class="custom-scroll-pages">\n        <p class="">图片尺寸要求：640*1010 像素；建议每张图不超过200KB</p>\n\n        <div class="js-first-page-region"></div>\n\n        <div class="custom-scroll-page">\n            <h4>过场页面</h4>\n            <div class="js-pages-region">\n            </div>\n            <div class="js-options options">\n                <a href="javascript:;" class="add-option js-add-page"><i class="icon-add"></i> 添加一页</a>\n            </div>\n        </div>\n\n        <div class="js-last-page-region"></div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/scroll/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "components/showcase/2.0.0/scroll/views/edit_meta", "components/showcase/2.0.0/scroll/views/edit_first_page", "components/showcase/2.0.0/scroll/views/edit_last_page", "components/showcase/2.0.0/scroll/views/edit_collection", "text!components/showcase/2.0.0/scroll/templates/edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("components/showcase/2.0.0/scroll/views/edit_meta"),
		s = e("components/showcase/2.0.0/scroll/views/edit_first_page"),
		o = e("components/showcase/2.0.0/scroll/views/edit_last_page"),
		a = e("components/showcase/2.0.0/scroll/views/edit_collection"),
		l = e("text!components/showcase/2.0.0/scroll/templates/edit.html");
	return n.extend({
		template: t.template(l),
		regions: {
			metaRegion: ".js-meta-region",
			firstPageRegion: ".js-first-page-region",
			pagesRegion: ".js-pages-region",
			lastPageRegion: ".js-last-page-region"
		},
		events: {
			"click .js-add-page": "addPage"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		onRender: function() {
			this.metaRegion.show(new i({
				model: this.model
			})), this.firstPageRegion.show(new s({
				model: this.model
			})), this.lastPageRegion.show(new o({
				model: this.model
			})), this.pagesRegion.show(new a({
				collection: this.model.get("sub_entry")
			})), this.toggleOptions()
		},
		addPage: function() {
			this.model.get("sub_entry").add({})
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 40 ? this.$(".js-options").hide() : this.$(".js-options").show()
		}
	})
}), define("text!components/showcase/2.0.0/scroll_nav/templates/edit.html", [], function() {
	return '<form class="form-horizontal custom-scroll edit-scroll-nav" novalidate style="padding: 0 10px; width: auto;">\n    <div class="control-group clearfix">\n        <label class="control-label" style="text-align: left; width: auto;">主页图标：</label>\n        <div class="controls pull-left" style="margin-left: 0;">\n            <label class="checkbox inline">\n                <input type="checkbox" name="homepage_icon" <%= homepage_icon==\'1\' ? \'checked\' : \'\' %>>\n                显示店铺主页图标，用户点击后进入店铺主页\n            </label>\n        </div>\n    </div>\n\n    <div class="split-line"></div>\n    <div class="control-group control-group-block">\n        <label class="control-label">背景图片</label>\n        <div class="controls">\n            <p class="help-desc" style="margin-bottom: 20px;">尺寸要求：640*1010 像素；可以添加多张，每次打开页面时，系统随机选择一张</p>\n\n            <div class="background-images">\n                <% _.each(background_images, function(image, index) { %>\n                    <div class="image-box" data-index="<%= index %>">\n                        <img src="<%= fullfillImage(image.url, \'!140x140+2x.jpg\') %>" alt="">\n                        <span class="close-modal js-delete-backgorund-image" title="删除">×</span>\n                    </div>\n                <% }); %>\n            </div>\n\n            <a href="javascript:;" class="add-image js-add-background-image"><i class="icon-add"></i> 添加图片</a>\n            <input type="hidden" name="background_images">\n        </div>\n    </div>\n\n    <div class="split-line"></div>\n    <div class="control-group control-group-block">\n        <label class="control-label">前景导航</label>\n\n        <div class="controls">\n            <p class="help-desc" style="margin-bottom: 20px;">建议图片尺寸：800*230像素</p>\n\n            <div class="js-collection-region custom-scroll-page ">\n\n            </div>\n\n            <div class="js-options options" style="margin: 0;">\n                <a href="javascript:;" class="add-option js-add-module"><i class="icon-add"></i> 添加一个模块</a>\n            </div>\n        </div>\n    </div>\n\n    <div class="split-line"></div>\n    <div class="control-group control-group-block">\n        <label class="control-label">前景导航样式</label>\n\n        <div class="controls nav-styles">\n            <label class="radio inline">\n                <input name="nav_style" value="left" type="radio" <%= nav_style == \'left\'? \'checked\' : \'\' %>>向左倾斜\n            </label>\n            <label class="radio inline">\n                <input name="nav_style" value="normal" type="radio" <%= nav_style == \'normal\'? \'checked\' : \'\' %>>正常\n            </label>\n            <label class="radio inline">\n                <input name="nav_style" value="right" type="radio" <%= nav_style == \'right\'? \'checked\' : \'\' %>>向右倾斜\n            </label>\n        </div>\n    </div>\n\n    <div class="split-line"></div>\n    <div class="control-group control-group-block">\n        <label class="control-label">前景显现动画</label>\n\n        <div class="controls">\n            <label class="radio inline">\n                <input type="radio" name="animate" value="zoom" <%= animate == \'zoom\' ? \'checked\' : \'\' %>>正常\n            </label>\n            <select class="span2" name="zoom_type" style="margin-right: 40px;">\n                <option value="zoom_out" <%= zoom_type == \'zoom_out\' ? \'selected\' : \'\' %>>缩小渐现</option>\n                <option value="zoom_in" <%= zoom_type == \'zoom_in\' ? \'selected\' : \'\' %>>放大渐现</option>\n            </select>\n            <label class="radio inline">\n                <input type="radio" name="animate" value="slide" <% if(animate == \'slide\') { %>checked<% }%>>滑入\n            </label>\n            <select class="span2" name="slide_type">\n                <option value="slide_left" <%= slide_type == \'slide_left\' ? \'selected\' : \'\' %>>从左侧滑入</option>\n                <option value="slide_right" <%= slide_type == \'slide_right\' ? \'selected\' : \'\' %>>从右侧滑入</option>\n            </select>\n        </div>\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/scroll_nav/templates/edit_item.html", [], function() {
	return '<div class="choice-image-box">\n    <% if(image_url) { %>\n        <div class="image-box">\n            <img src="<%= fullfillImage(image_url, \'!140x140+2x.jpg\') %>" class="image">\n            <a href="javascript:;" class="modify-image js-page-image">重新上传</a>\n        </div>\n    <% } else { %>\n        <a href="javascript:;" class="add-image js-page-image"><i class="icon-add"></i> 添加图片</a>\n        <div class="control-group">\n            <div class="controls">\n                <input type="hidden" name="image_url">\n            </div>\n        </div>\n    <% } %>\n</div>\n<div class="choice-content">\n    <div class="control-group">\n        <label class="control-label">标题：</label>\n        <div class="controls">\n            <input class="" type="text" name="title" value="<%= title %>">\n        </div>\n    </div>\n    <div class="control-group">\n            <label class="control-label">副标题：</label>\n            <div class="controls">\n                <input class="" type="text" name="sub_title" value="<%= sub_title %>">\n            </div>\n        </div>\n    <div class="control-group">\n        <label class="control-label">链接：</label>\n        <div class="controls">\n            <% if (link_type != \'\') { %>\n                <div class="control-action clearfix">\n                    <div class="pull-left js-link-to link-to">\n                        <% if (link_title !== \'\') { %>\n                        <a href="<%= link_url %>" target="_blank" class="new-window link-to-title">\n                        <% } %>\n\n                        <span class="label label-success">\n                            <% if (link_type === \'feature\') { %>\n                                微页面\n                            <% } else if (link_type === \'category\') { %>\n                                微页面分类\n                            <% } else if (link_type === \'topic\') { %>\n                                专题\n                            <% } else if (link_type === \'article\') { %>\n                                资讯\n                            <% } else if (link_type === \'goods\') { %>\n                                商品\n                            <% } else if (link_type === \'tag\') { %>\n                                商品标签\n                            <% } else if (link_type === \'activity\') { %>\n                                营销活动\n                            <% } else if (link_type === \'survey\') { %>\n                                调查\n                            <% } else if (link_type === \'homepage\') { %>\n                                店铺主页\n                            <% } else if (link_type === \'usercenter\') { %>\n                                会员主页\n                            <% } else if (link_type === \'link\') { %>\n                                外链\n                            <% } else if (link_type === \'history\') { %>\n                                历史信息\n                            <% } %>\n                        <% if (link_title !== \'\') { %>\n                                <em class="link-to-title-text"><%- link_title %></em>\n                            </span>\n                        </a>\n                        <% } else { %>\n                            </span>\n                        <% } %>\n                        <a href="javascript:;" class="js-delete-link link-to-title close-modal" title="删除">×</a>\n                    </div>\n                    <div class="dropdown hover pull-right">\n                        <a class="dropdown-toggle" href="javascript:void(0);">修改 <i class="caret"></i></a>\n                        <%= dropdown_menu() %>\n                    </div>\n                </div>\n\n            <% } else { %>\n                <div class="dropdown hover">\n                    <a class="js-dropdown-toggle dropdown-toggle control-action" href="javascript:void(0);">设置链接到的页面地址 <i class="caret"></i></a>\n                    <%= dropdown_menu() %>\n                </div>\n            <% } %>\n        </div>\n    </div>\n</div>\n<% if(index != 0 && index != 1) { %>\n<div class="actions">\n    <span class="action delete close-modal" title="删除">×</span>\n</div>\n<% } %>\n'
}), define("components/showcase/2.0.0/scroll_nav/views/edit_item", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/scroll_nav/templates/edit_item.html", "text!components/public_template/dropdown_menu.html", "components/pop/pop", "components/modal/1.0.0/modal", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/scroll_nav/templates/edit_item.html"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("components/pop/pop"),
		l = e("components/modal/1.0.0/modal"),
		c = e("components/image/2.0.0/app"),
		r = e("core/utils");
	return i.extend({
		tagName: "li",
		className: "choice",
		template: t.template(s),
		dropdownTpl: t.template(o),
		templateHelpers: function() {
			var e = this.layout.model.get("sub_entry").indexOf(this.model);
			return {
				fullfillImage: r.fullfillImage,
				dropdown_menu: this.dropdownTpl,
				index: e
			}
		},
		events: {
			'blur input[name="title"]': "updateModel",
			'blur input[name="sub_title"]': "updateModel",
			"click .actions .delete": "delete",
			"click .js-page-image": "chooseImage",
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink",
			"click .js-delete-link": "deleteLink"
		},
		onInit: function(e) {
			this.parent = e.parent || {}, this.listenTo(this.model, "change", this.render)
		},
		chooseImage: function() {
			var e = this;
			c.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set({
						image_id: t.attachment_id,
						image_url: t.attachment_url,
						image_thumb_url: t.thumb_url,
						image_width: Number(t.width),
						image_height: Number(t.height)
					})
				}
			})
		},
		chooseLink: function(e) {
			var t = this,
				i = n(e.target).data("type");
			l.initialize({
				type: i
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = n(e.target).data("type"),
				i = this;
			r.getStaticUrl(t, function(e) {
				i.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, i = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var s = e.target;
			a.initialize({
				target: t,
				trigger: n(s),
				type: "link",
				callback: function(e) {
					i.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		},
		deleteLink: function() {
			this.model.set({
				link_id: "",
				link_type: "",
				link_title: "",
				link_url: ""
			})
		},
		"delete": function() {
			this.model.destroy()
		}
	})
}), define("components/showcase/2.0.0/scroll_nav/views/edit_collection", ["require", "components/showcase/2.0.0/base/views/edit_collection_base", "components/showcase/2.0.0/scroll_nav/views/edit_item"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_collection_base"),
		n = e("components/showcase/2.0.0/scroll_nav/views/edit_item");
	return t.extend({
		itemView: n,
		initialize: function(e) {
			this.options = e || {}
		},
		onShow: function() {
			this.sortable()
		}
	})
}), define("components/showcase/2.0.0/scroll_nav/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/scroll_nav/templates/edit.html", "components/showcase/2.0.0/scroll_nav/views/edit_collection", "components/image/2.0.0/app", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/scroll_nav/templates/edit.html"),
		s = e("components/showcase/2.0.0/scroll_nav/views/edit_collection"),
		o = e("components/image/2.0.0/app"),
		a = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: a.fullfillImage
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		events: {
			'change input[name="homepage_icon"]': "updateModel",
			'change input[name="nav_style"]': "updateModel",
			'change input[name="animate"]': "updateModel",
			'change input[name="zoom"]': "updateModel",
			'change select[name="zoom_type"]': "updateModel",
			'change select[name="slide_type"]': "updateModel",
			"click .js-add-background-image": "addBackgroundImage",
			"click .js-delete-backgorund-image": "deleteBackgroundImage",
			"click .js-add-module": "addModule"
		},
		modelEvents: {
			"change:background_images": "render"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset add remove", this.toggleOptions)
		},
		onRender: function() {
			this.collectionRegion.show(new s({
				collection: this.model.get("sub_entry"),
				layout: this
			})), this.toggleOptions()
		},
		addModule: function() {
			this.model.get("sub_entry").add({})
		},
		addBackgroundImage: function() {
			var e = this,
				n = e.model.get("background_images") || [];
			o.initialize({
				multiChoose: !0,
				callback: function(i) {
					t.each(i, function(e) {
						n.push({
							id: e.attachment_id,
							url: e.attachment_url,
							thumb_url: e.thumb_url,
							width: +e.width,
							height: +e.height
						})
					}), e.model.set("background_images", n), e.model.trigger("change:background_images"), e.model.trigger("change")
				}
			})
		},
		deleteBackgroundImage: function(e) {
			var t = +$(e.target).parents(".image-box").data("index"),
				n = this.model.get("background_images") || [];
			n.splice(t, 1), this.model.set("background_images", n), this.model.trigger("change:background_images"), this.model.trigger("change")
		},
		toggleOptions: function() {
			this.model.get("sub_entry").length >= 40 ? this.$(".js-options").hide() : this.$(".js-options").show()
		}
	})
}), define("text!components/showcase/2.0.0/image_text/templates/edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n\n    <div class="control-group">\n        <label>标题</label>\n        <input type="text" name="title" value="<%- title %>" data-error-style="block">\n    </div>\n\n    <div class="control-group">\n        <label>作者<span class="label-desc">（选填）</span></label>\n        <input type="text" name="author" value="<%- author %>" data-error-style="block">\n    </div>\n\n    <div class="control-group image-region js-image-region">\n\n    </div>\n\n    <div class="control-group">\n        <label class="checkbox">\n            <input type="checkbox" name="show_image" <% if (show_image == 1) { %>checked<% } %>>封面图片显示在正文中\n        </label>\n    </div>\n\n    <div class="control-group digest">\n        <label>摘要</label>\n        <textarea name="digest" cols="30" rows="3" data-error-style="block"><%- digest %></textarea>\n    </div>\n\n    <div class="control-group">\n        <label>正文</label>\n        <script class="js-editor" type="text/plain"></script>\n        <input type="hidden" name="content" data-error-style="block">\n    </div>\n\n    <div class="control-group js-link-region">\n\n    </div>\n</form>\n'
}), define("text!components/showcase/2.0.0/image_text/templates/edit_link.html", [], function() {
	return "<label>阅读原文</label>\n<% if (link_type != '') { %>\n<div class=\"control-action clearfix\">\n    <div class=\"pull-left js-link-to link-to\">\n        <% if (link_title !== '') { %>\n        <a href=\"<%= link_url %>\" target=\"_blank\" class=\"new-window link-to-title\">\n            <% } %>\n                <span class=\"label label-success\">\n                    <% if (link_type === 'feature') { %>\n                        微页面\n                    <% } else if (link_type === 'category') { %>\n                        微页面分类\n                    <% } else if (link_type === 'topic') { %>\n                        专题\n                    <% } else if (link_type === 'article') { %>\n                        资讯\n                    <% } else if (link_type === 'goods') { %>\n                        商品\n                    <% } else if (link_type === 'tag') { %>\n                        商品标签\n                    <% } else if (link_type === 'activity') { %>\n                        营销活动\n                    <% } else if (link_type === 'survey') { %>\n                        调查\n                    <% } else if (link_type === 'homepage') { %>\n                        店铺主页\n                    <% } else if (link_type === 'usercenter') { %>\n                        会员主页\n                    <% } else if (link_type === 'link') { %>\n                        外链\n                    <% } else if (link_type === 'history') { %>\n                        历史信息\n                    <% } %>\n                <% if (link_title !== '') { %>\n                        <em class=\"link-to-title-text\"><%- link_title %></em>\n                    </span>\n        </a>\n        <% } else { %>\n        </span>\n        <% } %>\n    </div>\n    <div class=\"dropup hover pull-right\">\n        <a class=\"dropdown-toggle\" href=\"javascript:void(0);\">修改 <i class=\"caret\"></i></a>\n        <%= dropdown_menu() %>\n    </div>\n</div>\n\n<% } else { %>\n<div class=\"dropup hover\">\n    <a class=\"js-dropdown-toggle dropdown-toggle control-action\" href=\"javascript:void(0);\">设置链接到的页面地址 <i class=\"caret\"></i></a>\n    <%= dropdown_menu() %>\n</div>\n<% } %>\n"
}), define("components/showcase/2.0.0/image_text/views/edit_link", ["require", "components/showcase/2.0.0/base/views/edit_base", "underscore", "components/modal/1.0.0/modal", "components/pop/pop", "text!components/public_template/dropdown_menu.html", "core/utils", "text!components/showcase/2.0.0/image_text/templates/edit_link.html"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_base"),
		n = e("underscore"),
		i = e("components/modal/1.0.0/modal"),
		s = e("components/pop/pop"),
		o = e("text!components/public_template/dropdown_menu.html"),
		a = e("core/utils"),
		l = e("text!components/showcase/2.0.0/image_text/templates/edit_link.html");
	return t.extend({
		template: n.template(l),
		dropdownTpl: n.template(o),
		events: {
			"click .js-modal-magazine, .js-modal-goods, .js-modal-activity, .js-modal-survey": "chooseLink",
			"click .js-modal-history, .js-modal-homepage, .js-modal-usercenter": "chooseStaticLink",
			"click .js-modal-links": "chooseOtherLink"
		},
		modelEvents: {
			"change:link_url": "render"
		},
		serializeData: function() {
			var e = this.model.cid,
				t = n.clone(this.model.attributes);
			return n.extend(t, {
				cid: e,
				dropdown_menu: this.dropdownTpl
			}), t
		},
		bindValidation: function() {},
		chooseLink: function(e) {
			var t = this,
				n = $(e.target).data("type");
			i.initialize({
				type: n
			}).setChooseItemCallback(function(e) {
				t.model.set({
					link_id: e.data_id,
					link_type: e.type,
					link_title: e.data_title,
					link_url: e.data_url
				})
			}).modal("show")
		},
		chooseStaticLink: function(e) {
			var t = $(e.target).data("type"),
				n = this;
			a.getStaticUrl(t, function(e) {
				n.model.set({
					link_id: "",
					link_type: t,
					link_title: "",
					link_url: e
				})
			})
		},
		chooseOtherLink: function(e) {
			var t, n = this;
			t = this.$(this.$(".js-link-to").length > 0 ? ".js-link-to" : ".js-dropdown-toggle");
			var i = e.target;
			s.initialize({
				target: t,
				trigger: $(i),
				type: "link",
				callback: function(e) {
					n.model.set({
						link_id: "",
						link_type: "link",
						link_title: e,
						link_url: e
					})
				}
			})
		}
	})
}), define("text!components/showcase/2.0.0/image_text/templates/edit_image.html", [], function() {
	return '<label>封面<span class="label-desc">（大图片建议尺寸：900 x 500像素）</span></label>\n<% if (image) { %>\n    <img src="<%- image %>" width="100" height="100"/>\n    <a class="js-add-image control-action" href="javascript:;">重新选择</a>\n<% } else { %>\n    <a class="js-add-image control-action" href="javascript:;">添加图片...</a>\n<% } %>\n<input type="hidden" name="image" data-error-style="block">\n'
}), define("components/showcase/2.0.0/image_text/views/edit_image", ["require", "components/showcase/2.0.0/base/views/edit_base", "components/image/2.0.0/app", "underscore", "core/utils", "text!components/showcase/2.0.0/image_text/templates/edit_image.html"], function(e) {
	var t = e("components/showcase/2.0.0/base/views/edit_base"),
		n = (e("components/image/2.0.0/app"), e("underscore")),
		i = e("core/utils"),
		s = e("text!components/showcase/2.0.0/image_text/templates/edit_image.html");
	return t.extend({
		template: n.template(s),
		events: {
			"click .js-add-image": "addImage"
		},
		modelEvents: {
			"change:image": "render"
		},
		bindValidation: function() {},
		addImage: function() {
			var e = this;
			window.imageModal.initialize({
				multiChoose: !1,
				callback: function(t) {
					e.model.set("image", t[0].attachment_url), e.model.set("image_id", t[0].attachment_id)
				}
			})
		},
		serializeData: function() {
			var e = this.model.get("image");
			return e = e && i.fullfillImage(e), {
				image: e
			}
		}
	})
}), define("components/showcase/2.0.0/image_text/views/edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/image_text/templates/edit.html", "core/utils", "components/showcase/2.0.0/image_text/views/edit_link", "components/showcase/2.0.0/image_text/views/edit_image", "components/image/2.0.0/app"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!components/showcase/2.0.0/image_text/templates/edit.html"),
		s = (e("core/utils"), e("components/showcase/2.0.0/image_text/views/edit_link")),
		o = e("components/showcase/2.0.0/image_text/views/edit_image"),
		a = window.UE;
	return window.imageModal = e("components/image/2.0.0/app"), n.extend({
		className: "edit-rich-text",
		template: t.template(i),
		events: {
			"blur textarea": "updateModel",
			'blur input[type="text"]': "updateModel",
			'change input[type="checkbox"]': "updateModel"
		},
		regions: {
			image: ".js-image-region",
			link: ".js-link-region"
		},
		onRender: function() {
			var e = new o({
				model: this.model
			});
			this.image.show(e);
			var t = new s({
				model: this.model
			});
			this.link.show(t)
		},
		onClose: function() {
			this._editor && (this._editor.removeListener("blur contentChange"), this._editor.destroy(), delete this._editor)
		},
		onShow: function() {
			var e = this;
			this._editor = new a.ui.Editor({
				toolbars: [
					["bold", "italic", "underline", "strikethrough", "forecolor", "backcolor", "justifyleft", "justifycenter", "justifyright", "|", "insertunorderedlist", "insertorderedlist", "blockquote"],
					["emotion", "uploadimage", "link", "removeformat", "|", "rowspacingtop", "rowspacingbottom", "lineheight", "paragraph", "fontsize"],
					["inserttable", "deletetable", "insertparagraphbeforetable", "insertrow", "deleterow", "insertcol", "deletecol", "mergecells", "mergeright", "mergedown", "splittocells", "splittorows", "splittocols"]
				],
				autoClearinitialContent: !1,
				autoFloatEnabled: !0,
				wordCount: !0,
				elementPathEnabled: !1,
				maximumWords: 1e4,
				initialFrameWidth: 458,
				initialFrameHeight: 300,
				focus: !1,
				pasteplain: !1
			});
			var t = this._editor;
			t.addListener("blur", function() {
				e.model.set("content", e._editor.getContent())
			}), t.addListener("contentChange", function() {
				e.model.set("content", e._editor.getContent())
			}), t.render(this.$(".js-editor")[0]), t.ready(function() {
				t.setContent(e.model.get("content"))
			})
		},
		save: function() {
			this._editor && this.model.set("content", this._editor.getContent())
		}
	})
}), define("text!components/showcase/2.0.0/audio/templates/edit.html", [], function() {
	return '<form class="form-horizontal edit-audio" novalidate>\n    <div class="control-group">\n        <label class="control-label">音频：</label>\n        <div class="controls">\n            <input type="hidden" name="audio">\n            <% if (audio) { %>\n                <div class="voice-wrapper" data-voice-src="<%- audio %>">\n                    <span class="voice-player">\n                        <span class="stop">点击播放</span>\n                        <span class="second"></span>\n                        <i class="play" style="display:none;"></i>\n                    </span>\n                    <a href="javascript:;" class="js-choose-audio control-action">重新选择音频</a>\n                </div>\n            <% } else { %>\n            <a href="javascript:;" class="js-choose-audio control-action">选择音频</a>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">样式：</label>\n        <div class="controls">\n            <label class="radio">\n                <input type="radio" name="style" value="0" <% if (style== \'0\') { %> checked <% } %>>模仿微信对话样式\n            </label>\n            <% if(style == \'0\') { %>\n                <div class="control-group control-group-inner">\n                    <label class="control-label">头像：</label>\n                    <div class="controls">\n                        <div class="clearfix">\n                            <img src="<%= avatar %>" class="edit-audio-avatar">\n                            <div class="edit-audio-avatar-action">\n                                <div>\n                                    <a href="javascript:;" class="js-upload-avatar">上传头像</a>\n                                    <span class="c-gray"> | </span>\n                                    <a href="javascript:;" class="js-use-default-avatar">使用店铺logo</a>\n                                </div>\n                                <p class="help-desc">建议尺寸80*80像素</p>\n                                <p class="help-desc">如果不设置，默认将使用店铺logo</p>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n                <div class="control-group control-group-inner">\n                    <label class="control-label">气泡：</label>\n                    <div class="controls">\n                        <label class="radio inline">\n                            <input type="radio" name="bubble" value="left" <% if(bubble == \'left\') { %>checked<% } %>>\n                            居左\n                        </label>\n                        <label class="radio inline">\n                            <input type="radio" name="bubble" value="right" <% if(bubble == \'right\') { %>checked<% } %>>\n                            居右\n                        </label>\n                    </div>\n                </div>\n            <% } %>\n            <label class="radio">\n                <input type="radio" name="style" value="1" <% if (style== \'1\') { %> checked <% } %>>简易音乐播放器\n            </label>\n            <% if (style == \'1\') { %>\n                <div class="control-group control-group-inner">\n                    <label class="control-label">标题：</label>\n                    <div class="controls">\n                        <input type="text" placeholder="标题" name="title" value="<%- title %>">\n                    </div>\n                </div>\n                <div class="control-group control-group-inner">\n                    循环：\n                    <label class="checkbox inline">\n                        <% if (+loop === 0) { %>\n                        <input type="checkbox" name="loop" value="0">开启循环播放\n                        <% } else { %>\n                        <input type="checkbox" name="loop" value="1" checked>开启循环播放\n                        <% } %>\n                    </label>\n                </div>\n            <% } %>\n        </div>\n    </div>\n    <div class="control-group">\n        <label class="control-label">播放：</label>\n        <div class="controls">\n            <label class="radio">\n                <input type="radio" name="reload" value="1" <% if (reload == \'1\') { %> checked <% } %>>暂停后再恢复播放时，从头开始\n            </label>\n            <label class="radio">\n                <input type="radio" name="reload" value="0" <% if (reload == \'0\') { %> checked <% } %>>暂停后再恢复播放时，从暂停位置开始\n            </label>\n        </div>\n    </div>\n</form>\n'
}), define("components/showcase/2.0.0/audio/views/edit", ["require", "underscore", "core/utils", "components/showcase/2.0.0/base/views/edit_base", "text!components/showcase/2.0.0/audio/templates/edit.html", "components/image/2.0.0/app", "components/audio/1.0.0/audio"], function(e) {
	var t = e("underscore"),
		n = e("core/utils"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!components/showcase/2.0.0/audio/templates/edit.html"),
		o = e("components/image/2.0.0/app"),
		a = e("components/audio/1.0.0/audio"),
		l = [1, 171949];
	return i.extend({
		template: t.template(s),
		events: {
			'change input[type="checkbox"]': "updateModel",
			'change input[type="radio"]': "updateModel",
			'blur input[type="text"]': "updateModel",
			"click .js-choose-audio": "chooseAudio",
			"click .js-upload-avatar": "chooseImage",
			"click .js-use-default-avatar": "useDefaultAvatar"
		},
		modelEvents: {
			"change:audio": "render",
			"change:style": "render",
			"change:avatar": "render"
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return t.extend(e, {
				audio: n.fullfillImage(e.audio),
				avatar: n.fullfillImage(e.avatar || _global.mp_data.logo, "!80x80.jpg")
			})
		},
		chooseAudio: function() {
			var e = this;
			a.initialize({
				multiChoose: !1,
				multiUpload: !1,
				maxSize: -1 !== l.indexOf(_global.kdt_id) ? 30720 : 6144,
				callback: function(t) {
					t = t[0];
					var n = t.attachment_file || t.attachment_url;
					e.model.set({
						audio: n
					})
				}
			})
		},
		chooseImage: function() {
			var e = this;
			o.initialize({
				multiChoose: !1,
				callback: function(t) {
					t = t[0], e.model.set("avatar", t.attachment_url)
				}
			})
		},
		useDefaultAvatar: function() {
			this.model.set("avatar", "")
		}
	})
}), define("components/showcase/2.0.0/base/views/show_base", ["require", "underscore", "jquery", "marionette", "components/pop/pop"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("marionette"),
		s = e("components/pop/pop");
	return i.Layout.extend({
		className: "app-field clearfix",
		events: {
			"click .delete": "handleDelete",
			"click .add": "handleAdd",
			"click .edit": "handleEdit",
			"click .duplicate": "handleDuplicate",
			click: "handleClick"
		},
		initialize: function(e) {
			this._setOptions(e), this._bind(), this.triggerMethod("init", e)
		},
		_setOptions: function(e) {
			this.options = e || {}, this.layout = this.options.layout
		},
		_bind: function() {
			this.listenTo(this, "close", this._handleViewClose), this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "valid:error", this.validError), this.listenTo(this.layout, "editing", this.editing)
		},
		_handleViewClose: function() {
			this.layout = null
		},
		handleEdit: function(e) {
			e.stopPropagation(), this.layout.displayEditView(this.model, {
				edit: !0
			})
		},
		handleDelete: function(e) {
			e.preventDefault(), e.stopPropagation();
			var i = t.bind(function() {
				var e, t = this.layout,
					n = this.model.index();
				n = 0 === n ? n + 1 : n - 1, e = this.model.collection.at(n), this.model.destroy(), e && t.displayEditView(e)
			}, this);
			s.initialize({
				target: n(e.target),
				type: "delete",
				callback: i
			})
		},
		handleDuplicate: function() {
			var e = t.result(this.model.constructor.prototype, "defaults"),
				n = t.pick(this.model.toJSON(), t.keys(e)),
				i = this.model.index();
			n = JSON.parse(JSON.stringify(n)), this.model.parse && (n = this.model.parse(n)), this.model.collection.add(n, {
				at: i + 1
			})
		},
		handleClick: function(e) {
			e.stopPropagation(), this.layout.displayEditView(this.model)
		},
		handleAdd: function(e) {
			e.stopPropagation(), this.layout.displayEditView(this.model, {
				add: !0
			})
		},
		editing: function(e) {
			e === this.model ? this.$el.addClass("editing") : this.$el.removeClass("editing")
		},
		validError: function() {
			this.layout.displayEditView(this.model, {
				error: !0
			})
		},
		position: function() {
			return this.$el.position()
		},
		offset: function() {
			return this.$el.offset()
		}
	})
}), define("text!components/showcase/2.0.0/rich_text/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-richtext<% if (fullscreen == 1) { %> custom-richtext-fullscreen<% } %>" style="<% if (color !== \'#ffffff\' && color !== \'#F9F9F9\') { %>background-color: <%= color %><% } %>"><%= content || \'<p>点此编辑『富文本』内容 ——&gt;</p><p>你可以对文字进行<strong>加粗</strong>、<em>斜体</em>、<span style="text-decoration: underline;">下划线</span>、<span style="text-decoration: line-through;">删除线</span>、文字<span style="color: rgb(0, 176, 240);">颜色</span>、<span style="background-color: rgb(255, 192, 0); color: rgb(255, 255, 255);">背景色</span>、以及字号<span style="font-size: 20px;">大</span><span style="font-size: 14px;">小</span>等简单排版操作。</p><p>还可以在这里加入表格了</p><table><tbody><tr><td width="93" valign="top" style="word-break: break-all;">中奖客户</td><td width="93" valign="top" style="word-break: break-all;">发放奖品</td><td width="93" valign="top" style="word-break: break-all;">备注</td></tr><tr><td width="93" valign="top" style="word-break: break-all;">猪猪</td><td width="93" valign="top" style="word-break: break-all;">内测码</td><td width="93" valign="top" style="word-break: break-all;"><em><span style="color: rgb(255, 0, 0);">已经发放</span></em></td></tr><tr><td width="93" valign="top" style="word-break: break-all;">大麦</td><td width="93" valign="top" style="word-break: break-all;">积分</td><td width="93" valign="top" style="word-break: break-all;"><a href="javascript: void(0);" target="_blank">领取地址</a></td></tr></tbody></table><p style="text-align: left;"><span style="text-align: left;">也可在这里插入图片、并对图片加上超级链接，方便用户点击。</span></p>\' %></div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/rich_text/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/rich_text/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/rich_text/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/goods/templates/show.html", [], function() {
	return '<div class="control-group">\n    <%  var showtype ;\n        if ( size_type == 0 ) {\n            showtype = \'card\';\n        } else if ( size_type == 1 ) {\n            showtype = \'waterfall\';\n        } else if (size_type == 3) {\n            showtype = \'promotion\';\n        } else {\n            showtype = \'normal\';\n        }\n    %>\n    <ul class="sc-goods-list clearfix size-<%=size %> <%-showtype %> <%-size == 3? \'list\' : \'pic\' %>">\n        <!-- 大图  -->\n        <% if (size == \'0\') { %>\n            <% _.each(goods, function(item, index) { %>\n                <li class="goods-card big-pic <%-showtype %>">\n                    <a href="javascript: void(0);" class="link js-goods clearfix">\n                        <div class="photo-block">\n                            <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>" />\n                        </div>\n                        <% if ( title == 1 || price == 1 || ( cart == 1 && showtype == \'normal\' )) { %>\n                            <div class="info clearfix <%- title == \'1\' ? \'\' : \'info-no-title\' %> <%- price == \'1\' ? \'info-price\' : \'info-no-price\' %>">\n                                <% if (price == \'1\' && cart == \'0\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>     \n                                <% if (price == \'0\' && cart == \'1\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price goods-price-icon"></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>    \n                                <% if (price == \'1\' && cart == \'1\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price goods-price-icon">\n                                        <em>\n                                            <%-showtype==\'normal\'? \'\': \'￥\' %><%= item.price %>\n                                        </em>\n                                    </p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>  \n                                <% if (price == \'0\' && cart == \'0\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price"></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %> \n                            </div>\n                        <% }%>\n                        <% if ( buy_btn && showtype != \'normal\') { %>  \n                            <div class="goods-buy btn<%-buy_btn_type %> <%-title == \'1\' && price == \'0\'? \'info-only-title\' : \'\' %>"></div>\n                        <% } %>\n                    </a>\n                </li>\n            <% }); %>\n        <!-- 小图 -->\n        <% } else if ( size == \'1\' && showtype != \'waterfall\' ) { %>\n            <% _.each(goods, function(item, index) { %>\n                <li class="goods-card small-pic <%-showtype %>">\n                    <a href="javascript: void(0);" class="link js-goods clearfix">\n                        <div class="photo-block">\n                            <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>" />\n                        </div>\n                        <% if ( !(price == 0 && ((showtype == \'normal\' && cart == 0 ) || showtype != \'normal\' && title == 0 ))) { %>\n                            <div class="info clearfix <%- title == \'1\' ? \'\' : \'info-no-title\' %>">\n                                <% if (price == \'1\' && cart == \'0\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>     \n                                <% if (price == \'0\' && cart == \'1\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price goods-price-icon"></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>    \n                                <% if (price == \'1\' && cart == \'1\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price goods-price-icon">\n                                        <em>\n                                            <%-showtype==\'normal\'? \'\': \'￥\' %><%= item.price %>\n                                        </em>\n                                    </p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %>  \n                                <% if (price == \'0\' && cart == \'0\') { %>\n                                    <p class="goods-title"><%- item.title %></p>\n                                    <p class="goods-price"></p>\n                                    <p class="goods-price-taobao"></p>  \n                                <% } %> \n                            </div>\n                        <% }%>\n                        <% if ( buy_btn && showtype != \'normal\' ) { %>  \n                            <div class="goods-buy btn<%-buy_btn_type %>">\n                                <%- showtype == \'promotion\'? \'我要抢购\': \'\'%>\n                            </div>\n                            <% if ( title && !price) { %>\n                                <div class=\'buy-tag-space\'></div>\n                            <% } %>\n                        <% } %>\n                    </a>\n                </li>\n            <% }); %>\n        <% } else if (size == \'1\' && showtype == \'waterfall\') { %>\n            \n            <li class="sc-waterfall-half clearfix">\n                <ul class="clearfix">\n                <% _.each(goods, function(item, index) { %>\n                <% if( index % 2 != 1 ) { %>\n                    <li class="goods-card goods-list small-pic waterfall">\n                        <a href="javascript: void(0);" class="link js-goods clearfix">\n                            <div class="photo-block">\n                                <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>"/>\n                            </div>\n                            <% if ( !(price == 0 && showtype != \'normal\' && title == 0 )) { %>\n                                <div class="info clearfix <%- title == \'1\'? \'\' : \'info-no-title\' %>">\n                                    <% if (price == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>     \n                                    <% if (price == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>\n                                </div>\n                            <% } %>\n                            <% if ( buy_btn && showtype != \'normal\' ) { %>  \n                                <div class="goods-buy btn<%-buy_btn_type %>"></div>\n                                <% if ( title && !price) { %>\n                                    <div class=\'buy-tag-space\'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n                <% }); %>\n                </ul>\n            </li>\n            <li class="sc-waterfall-half clearfix">\n                <ul class="clearfix">\n                <% _.each(goods, function(item, index) { %>\n                <% if( index % 2 == 1 ) { %>\n                    <li class="goods-card small-pic waterfall">\n                        <a href="javascript: void(0);" class="link js-goods clearfix">\n                            <div class="photo-block">\n                                <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>"/>\n                            </div>\n                            <% if ( !(price == 0 && showtype != \'normal\' && title == 0 )) { %>\n                                <div class="info clearfix <%- title == \'1\'? \'\' : \'info-no-title\' %>">\n                                    <% if (price == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>     \n                                    <% if (price == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>\n                                </div>\n                            <% } %>\n                            <% if ( buy_btn && showtype != \'normal\' ) { %>  \n                                <div class="goods-buy btn<%-buy_btn_type %>"></div>\n                                <% if ( title && !price) { %>\n                                    <div class=\'buy-tag-space\'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n                <% }); %>\n                </ul>\n            </li>\n        <% } else if (size == \'2\') { %>\n            <!-- 一大两小 -->\n            <% _.each(goods, function(item, index) { %>\n                <% if ((index+1) % 3 === 1) { %>\n                    <!-- 大图 -->\n                    <li class="goods-card big-pic <%-showtype %>">\n                        <a href="javascript: void(0);" class="link js-goods clearfix">\n                            <div class="photo-block">\n                                <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>" />\n                            </div>\n                            <% if ( title == 1 || price == 1 || ( cart == 1 && showtype == \'normal\' )) { %>\n                                <div class="info clearfix <%- title == \'1\' ? \'\' : \'info-no-title\' %> <%- price == \'1\' ? \'info-price\' : \'info-no-price\' %>">\n                                    <% if (price == \'1\' && cart == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>     \n                                    <% if (price == \'0\' && cart == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price goods-price-icon"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>    \n                                    <% if (price == \'1\' && cart == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price goods-price-icon">\n                                            <em>\n                                                <%-showtype==\'normal\'? \'\': \'￥\' %><%= item.price %>\n                                            </em>\n                                        </p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %> \n                                    <% if (price == \'0\' && cart == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>  \n                                </div>\n                            <% }%>\n                            <% if ( buy_btn && showtype != \'normal\') { %>  \n                                <div class="goods-buy btn<%-buy_btn_type %> <%-title == \'1\' && price == \'0\'? \'info-only-title\' : \'\' %>"></div>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } else { %>\n                <!-- 小图 -->\n                    <li class="goods-card small-pic <%-showtype %>">\n                        <a href="javascript: void(0);" class="link js-goods clearfix">\n                            <div class="photo-block">\n                                <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>" />\n                            </div>\n                            <% if ( !(price == 0 && ((showtype == \'normal\' && cart == 0 ) || showtype != \'normal\' && title == 0 ))) { %>\n                                <div class="info clearfix <%- title == \'1\'? \'\' : \'info-no-title\' %>">\n                                    <% if (price == \'1\' && cart == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"><em>￥<%= item.price %></em></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>     \n                                    <% if (price == \'0\' && cart == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price goods-price-icon"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>    \n                                    <% if (price == \'1\' && cart == \'1\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price goods-price-icon">\n                                            <em>\n                                                <%-showtype==\'normal\'? \'\': \'￥\' %><%= item.price %>\n                                            </em>\n                                        </p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %>  \n                                    <% if (price == \'0\' && cart == \'0\') { %>\n                                        <p class="goods-title"><%- item.title %></p>\n                                        <p class="goods-price"></p>\n                                        <p class="goods-price-taobao"></p>  \n                                    <% } %> \n                                </div>\n                            <% }%>\n                            <% if ( buy_btn && showtype != \'normal\' ) { %>  \n                                <div class="goods-buy btn<%-buy_btn_type %>"></div>\n                                <% if ( title && !price) { %>\n                                    <div class=\'buy-tag-space\'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n            <% }); %>\n        <% } else if (size == \'3\') { %>\n            <!-- 列表 -->\n            <% _.each(goods, function(item, index) { %>\n                <li class="goods-card <%-showtype %>">\n                    <a href="javascript: void(0);" class="link js-goods clearfix">\n                       <div class="photo-block">\n                           <img class="goods-photo js-goods-lazy" src="<%= item.image_url %>"/>\n                       </div>\n                       <div class="info">\n                            <p class="goods-title"><%- item.title %></p>\n                            <p class="goods-price"><em>￥<%= item.price %></em></p>  \n                            <p class="goods-price-taobao"></p>         \n                            <% if ( buy_btn ) { %>  \n                                <div class="goods-buy btn<%-buy_btn_type %>"></div>\n                            <% } %>\n                       </div>                  \n                    </a>\n                </li>      \n            <% }); %>\n        <% } %>\n    </ul>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/goods/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/goods/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/goods/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return t.isEmpty(e.goods) && (e.goods = 1 == this.model.get("size") ? [{
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg",
				price: "379.00",
				title: "此处显示商品名称"
			}, {
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg",
				price: "5.50",
				title: "此处显示商品名称"
			}, {
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029095601969662.jpg",
				price: "32.00",
				title: "此处显示商品名称"
			}, {
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/10/09/138130084954645499.jpg",
				price: "60.00",
				title: "此处显示商品名称"
			}] : [{
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg",
				price: "379.00",
				title: "此处显示商品名称"
			}, {
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg",
				price: "5.50",
				title: "此处显示商品名称"
			}, {
				id: null,
				url: null,
				image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029095601969662.jpg",
				price: "60.00",
				title: "此处显示商品名称"
			}]), e
		}
	})
}), define("text!components/showcase/2.0.0/goods_list/templates/show.html", [], function() {
	return "<div class=\"control-group\">\n    <%  var showtype ;\n        if ( size_type == 0 ) {\n            showtype = 'card';\n        } else if ( size_type == 1 ) {\n            showtype = 'waterfall';\n        } else if (size_type == 3) {\n            showtype = 'promotion';\n        } else {\n            showtype = 'normal';\n        }\n    %>\n    <% if (size == '1') { %>\n        <% var goodsSample = [{\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg',\n            price: '379.00',\n            price_tao: '原价：380.00',\n            title: '此处显示商品名称'\n        }, {\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg',\n            price: '5.50',\n            price_tao: '原价：8.00',\n            title: '此处显示商品名称'\n        }, {\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/09/27/138029095601969662.jpg',\n            price: '32.00',\n            price_tao: '原价：60.00',\n            title: '此处显示商品名称'\n        }, {\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/10/09/138130084954645499.jpg',\n            price: '60.00',\n            price_tao: '原价：80.00',\n            title: '此处显示商品名称'\n        }]; %>\n    <% } else { %>\n        <% var goodsSample = [{\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg',\n            price: '379.00',\n            title: '此处显示商品名称'\n        }, {\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg',\n            price: '5.50',\n            title: '此处显示商品名称'\n        }, {\n            image_url: 'http://imgqn.koudaitong.com/upload_files/2013/10/09/138130084954645499.jpg',\n            price: '60.00',\n            title: '此处显示商品名称'\n        }]; %>\n    <% } %>\n    <ul class=\"sc-goods-list clearfix size-<%=size %> <%-showtype %> <%-size == 3? 'list' : 'pic' %>\">\n        <!-- 大图  -->\n        <% if (size == '0') { %>\n            <% _.each(goodsSample, function(item, index) { %>\n                <li class=\"goods-card big-pic <%-showtype %>\">\n                    <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                        <div class=\"photo-block\">\n                            <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" />\n                        </div>\n                        <% if ( title == 1 || price == 1 || ( cart == 1 && showtype == 'normal' )) { %>\n                            <div class=\"info clearfix <%- title == '1' ? '' : 'info-no-title' %> <%- price == '1' ? 'info-price' : 'info-no-price' %>\">\n                                <% if (price == '1' && cart == '0') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                    <p class=\"goods-price-taobao\"></p>  \n                                <% } %>     \n                                <% if (price == '0' && cart == '1') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price goods-price-icon\"></p>\n                                    <p class=\"goods-price-taobao\"></p>  \n                                <% } %>    \n                                <% if (price == '1' && cart == '1') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price goods-price-icon\">\n                                        <em>\n                                            <%-showtype=='normal'? '': '￥' %><%= item.price %>\n                                        </em>\n                                    </p>\n                                    <p class=\"goods-price-taobao\"></p>  \n                                <% } %>  \n                                <% if (price == '0' && cart == '0') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price\"></p>\n                                    <p class=\"goods-price-taobao\"></p>  \n                                <% } %> \n                            </div>\n                        <% }%>\n                        <% if ( buy_btn && showtype != 'normal') { %>  \n                            <div class=\"goods-buy btn<%-buy_btn_type %> <%-title == '1' && price == '0'? 'info-only-title' : '' %>\"></div>\n                            <% if ( title && !price && showtype != 'card') { %>\n                                <div class='buy-tag-space'></div>\n                            <% } %>\n                        <% } %>\n                    </a>\n                </li>\n            <% }); %>\n        <!-- 小图 -->\n        <% } else if ( size == '1' && showtype != 'waterfall' ) { %>\n            <% _.each(goodsSample, function(item, index) { %>\n                <li class=\"goods-card small-pic <%-showtype %>\">\n                    <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                        <div class=\"photo-block\">\n                            <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" />\n                        </div>\n                        <% if ( !(price == 0 && ((showtype == 'normal' && cart == 0 ) || showtype != 'normal' && title == 0 ))) { %>\n                            <div class=\"info clearfix <%- title == '1'? '' : 'info-no-title' %>\">\n                                <% if (price == '1' && cart == '0') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                    <p class=\"goods-price-taobao\"><%- item.price_tao %></p>  \n                                <% } %>     \n                                <% if (price == '0' && cart == '1') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price goods-price-icon\"></p>\n                                    <p class=\"goods-price-taobao\"><%- item.price_tao %></p>  \n                                <% } %>    \n                                <% if (price == '1' && cart == '1') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price goods-price-icon\">\n                                        <em>\n                                            <%-showtype=='normal'? '': '￥' %><%= item.price %>\n                                        </em>\n                                    </p>\n                                    <p class=\"goods-price-taobao\"><%- item.price_tao %></p>  \n                                <% } %>  \n                                <% if (price == '0' && cart == '0') { %>\n                                    <p class=\"goods-title\"><%- item.title %></p>\n                                    <p class=\"goods-price\"></p>\n                                    <p class=\"goods-price-taobao\"><%- item.price_tao %></p>  \n                                <% } %> \n                            </div>\n                        <% }%>\n                        <% if ( buy_btn && showtype != 'normal' ) { %>  \n                            <div class=\"goods-buy btn<%-buy_btn_type %>\">\n                                <%- showtype == 'promotion'? '我要抢购': ''%>\n                            </div>\n                            <% if ( title && !price) { %>\n                                <div class='buy-tag-space'></div>\n                            <% } %>\n                        <% } %>\n                    </a>\n                </li>\n            <% }); %>\n        <% } else if (size == '1' && showtype == 'waterfall') { %>\n            \n            <li class=\"sc-waterfall-half clearfix\">\n                <ul class=\"clearfix\">\n                <% _.each(goodsSample, function(item, index) { %>\n                <% if( index % 2 != 1 ) { %>\n                    <li class=\"goods-card small-pic waterfall\">\n                        <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                            <div class=\"photo-block\">\n                                <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" style=\"height:<%= 145 + index*30 %>px;\"/>\n                            </div>\n                            <% if ( !(price == 0 && showtype != 'normal' && title == 0 )) { %>\n                                <div class=\"info clearfix <%- title == '1' ? '' : 'info-no-title' %>\">\n                                    <% if (price == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>     \n                                    <% if (price == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>\n                                </div>\n                            <% } %>\n                            <% if ( buy_btn && showtype != 'normal' ) { %>  \n                                <div class=\"goods-buy btn<%-buy_btn_type %>\"></div>\n                                <% if ( title && !price) { %>\n                                    <div class='buy-tag-space'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n                <% }); %>\n                </ul>\n            </li>\n            <li class=\"sc-waterfall-half clearfix\">\n                <ul class=\"clearfix\">\n                <% _.each(goodsSample, function(item, index) { %>\n                <% if( index % 2 == 1 ) { %>\n                    <li class=\"goods-card small-pic waterfall\">\n                        <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                            <div class=\"photo-block\">\n                                <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" style=\"height:<%= 145 + index*10 %>px;\"/>\n                            </div>\n                            <% if ( !(price == 0 && showtype != 'normal' && title == 0 )) { %>\n                                <div class=\"info clearfix <%- title == '1' ? '' : 'info-no-title' %>\">\n                                    <% if (price == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>     \n                                    <% if (price == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>\n                                </div>\n                            <% } %>\n                            <% if ( buy_btn && showtype != 'normal' ) { %>  \n                                <div class=\"goods-buy btn<%-buy_btn_type %>\"></div>\n                                <% if ( title && !price) { %>\n                                    <div class='buy-tag-space'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n                <% }); %>\n                </ul>\n            </li>\n        <% } else if (size == '2') { %>\n            <!-- 一大两小 -->\n            <% _.each(goodsSample, function(item, index) { %>\n                <% if ((index+1) % 3 === 1) { %>\n                    <!-- 大图 -->\n                    <li class=\"goods-card big-pic <%-showtype %>\">\n                        <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                            <div class=\"photo-block\">\n                                <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" />\n                            </div>\n                            <% if ( title == 1 || price == 1 || ( cart == 1 && showtype == 'normal' )) { %>\n                                <div class=\"info clearfix <%- title == '1' ? '' : 'info-no-title' %> <%- price == '1' ? 'info-price' : 'info-no-price' %>\">\n                                    <% if (price == '1' && cart == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>     \n                                    <% if (price == '0' && cart == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price goods-price-icon\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>    \n                                    <% if (price == '1' && cart == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price goods-price-icon\">\n                                            <em>\n                                                <%-showtype=='normal'? '': '￥' %><%= item.price %>\n                                            </em>\n                                        </p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %> \n                                    <% if (price == '0' && cart == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>  \n                                </div>\n                            <% }%>\n                            <% if ( buy_btn && showtype != 'normal') { %>  \n                                <div class=\"goods-buy btn<%-buy_btn_type %> <%-title == '1' && price == '0'? 'info-only-title' : '' %>\"></div>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } else { %>\n                <!-- 小图 -->\n                    <li class=\"goods-card small-pic <%-showtype %>\">\n                        <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                            <div class=\"photo-block\">\n                                <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\" />\n                            </div>\n                            <% if ( !(price == 0 && ((showtype == 'normal' && cart == 0 ) || showtype != 'normal' && title == 0 ))) { %>\n                                <div class=\"info clearfix <%- title == '1' ? '' : 'info-no-title' %>\">\n                                    <% if (price == '1' && cart == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"><em>￥<%= item.price %></em></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>     \n                                    <% if (price == '0' && cart == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price goods-price-icon\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>    \n                                    <% if (price == '1' && cart == '1') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price goods-price-icon\">\n                                            <em>\n                                                <%-showtype=='normal'? '': '￥' %><%= item.price %>\n                                            </em>\n                                        </p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %>  \n                                    <% if (price == '0' && cart == '0') { %>\n                                        <p class=\"goods-title\"><%- item.title %></p>\n                                        <p class=\"goods-price\"></p>\n                                        <p class=\"goods-price-taobao\"></p>  \n                                    <% } %> \n                                </div>\n                            <% }%>\n                            <% if ( buy_btn && showtype != 'normal' ) { %>  \n                                <div class=\"goods-buy btn<%-buy_btn_type %>\"></div>\n                                <% if ( title && !price) { %>\n                                    <div class='buy-tag-space'></div>\n                                <% } %>\n                            <% } %>\n                        </a>\n                    </li>\n                <% } %>\n            <% }); %>\n        <% } else if (size == '3') { %>\n            <!-- 列表 -->\n            <% _.each(goodsSample, function(item, index) { %>\n                <li class=\"goods-card <%-showtype %>\">\n                    <a href=\"javascript: void(0);\" class=\"link js-goods clearfix\">\n                       <div class=\"photo-block\">\n                           <img class=\"goods-photo js-goods-lazy\" src=\"<%= item.image_url %>\"/>\n                       </div>\n                       <div class=\"info\">\n                            <p class=\"goods-title\"><%- item.title %></p>\n                            <p class=\"goods-price\"><em>￥<%= item.price %></em></p>  \n                            <p class=\"goods-price-taobao\"></p>         \n                            <% if ( buy_btn ) { %>  \n                                <div class=\"goods-buy btn<%-buy_btn_type %>\"></div>\n                            <% } %>\n                       </div>                  \n                    </a>\n                </li>      \n            <% }); %>\n        <% } %>\n    </ul>\n    <div class=\"component-border\"></div>\n</div>\n<div class=\"actions\">\n    <div class=\"actions-wrap\"><span class=\"action edit\">编辑</span><span class=\"action add\">加内容</span><span class=\"action delete\">删除</span></div>\n</div>\n<div class=\"sort\">\n    <i class=\"sort-handler\"></i>\n</div>\n"
}), define("components/showcase/2.0.0/goods_list/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/goods_list/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/goods_list/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/image_ad/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length < 1) { %>\n        <% if (show_method == \'0\') {%>\n        <div class="custom-image-swiper">\n            <div class="swiper-container" style="height: 80px">\n                <div class="swiper-wrapper">\n                    <img style="max-height: 80px; display: block;" src="http://imgqn.koudaitong.com/upload_files/2013/10/09/138129843442351477.jpg">\n                </div>\n            </div>\n        </div>\n        <% } else { %>\n        <ul class="custom-image clearfix">\n            <li>\n                <img src="http://imgqn.koudaitong.com/upload_files/2013/10/09/138129928109524248.jpg" style="display: block;">\n            </li>\n        </ul>\n        <% } %>\n    <% } else { %>\n        <% if (show_method == \'0\') { %>\n            <% if (sub_entry && sub_entry.length > 0) { %>\n            <div class="custom-image-swiper">\n                <div class="swiper-container" style="height: <%- height || 160 %>px">\n                    <div class="swiper-wrapper">\n                    </div>\n                </div>\n            </div>\n            <% } %>\n            <% if (sub_entry && sub_entry.length > 1) { %>\n            <div class="swiper-pagination">\n                <span class="swiper-pagination-switch swiper-active-switch"></span>\n                <% _.times(sub_entry.length - 1, function() { %>\n                    <span class="swiper-pagination-switch"></span>\n                <% }); %>\n            </div>\n            <% } %>\n        <% } else { %>\n        <ul class="custom-image clearfix">\n\n        </ul>\n        <% } %>\n    <% } %>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/image_ad/templates/show_item.html", [], function() {
	return '<% if (show_method == \'0\') { %>\n    <a href="javascript: void(0);" style="height: <%- Math.round(height) || 160 %>px;">\n        <% if (title !== \'\') { %>\n            <h3 class="title"><%- title %></h3>\n        <% } %>\n        <img src="<%= image_url %>" style="max-height: <%- Math.round(height) || 160 %>px;">\n    </a>\n<% } else { %>\n    <% if (title !== \'\') { %>\n    <h3 class="title"><%- title %></h3>\n    <% } %>\n    <img src="<%= image_url %>">\n<% } %>\n'
}), define("components/showcase/2.0.0/image_ad/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/image_ad/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/image_ad/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: function() {
			return "0" == this.options.parent.get("show_method") ? "div" : "li"
		},
		className: function() {
			return "0" == this.options.parent.get("show_method") ? "swiper-slide" : "0" == this.options.parent.get("size") ? "" : "custom-image-small"
		},
		attributes: function() {
			var e = this;
			return {
				style: function() {
					return "0" == e.options.parent.get("show_method") ? "height: " + e.options.parent.get("height") + "px" : void 0;
				}
			};
		},
		template: t.template(i),
		initialize: function(e) {
			e = e || {}, this.parent = e.parent, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		},
		serializeData: function() {
			var e = t.clone(this.model.attributes);
			t.extend(e, {
				show_method: this.parent.get("show_method"),
				size: this.parent.get("size"),
				height: this.parent.get("height")
			});
			var n = this.model.get("image_url");
			return n = n && s.fullfillImage(n), e.image_url = n, e.image_thumb_url = n, e
		}
	})
}), define("components/showcase/2.0.0/image_ad/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/image_ad/templates/show.html", "components/showcase/2.0.0/image_ad/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/image_ad/templates/show.html"),
		s = e("components/showcase/2.0.0/image_ad/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "reset update remove", this.render)
		},
		onBeforeRender: function() {
			this.model.calculateImage()
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e, t = this;
			e = this.$("0" == this.model.get("show_method") ? ".swiper-wrapper" : ".custom-image"), this.model.get("sub_entry").length > 0 && e.empty(), this.model.get("sub_entry").each(function(n) {
				var i = new s({
					model: n,
					parent: t.model
				});
				e.append(i.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/nav/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length < 1) { %>\n\n    <% } else { %>\n        <ul class="custom-nav-4 clearfix">\n\n        </ul>\n    <% } %>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/nav/templates/show_item.html", [], function() {
	return '<img src="<%= image_url %>">\n<% if (title !== \'\') { %>\n<span class="title"><%- title %></span>\n<% } %>'
}), define("components/showcase/2.0.0/nav/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/nav/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/nav/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		initialize: function(e) {
			e = e || {}, this.parent = e.parent, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		},
		serializeData: function() {
			var e = t.clone(this.model.attributes),
				n = this.model.get("image_url");
			return n = n && s.fullfillImage(n), e.image_url = n, e.image_thumb_url = n, e
		}
	})
}), define("components/showcase/2.0.0/nav/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/nav/templates/show.html", "components/showcase/2.0.0/nav/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/nav/templates/show.html"),
		s = e("components/showcase/2.0.0/nav/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			var e = this;
			this.listenTo(this.model.get("sub_entry"), "add", function(t, n) {
				var i = new s({
					model: t,
					parent: e.model
				}),
					o = this.$(".custom-nav-4"),
					a = n.indexOf(t);
				0 === a ? i.render().$el.appendTo(o) : i.render().$el.insertAfter(o.children().eq(a - 1)), e.render()
			}), this.listenTo(this.model.get("sub_entry"), "remove", this.render), this.listenTo(this.model.get("sub_entry"), "reset", this.render)
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this,
				t = this.$(".custom-nav-4");
			this.model.get("sub_entry").length > 0 && t.empty(), this.model.get("sub_entry").each(function(n) {
				var i = new s({
					model: n,
					parent: e.model
				});
				t.append(i.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/showcase/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length < 1) { %>\n\n    <% } else { %>\n    <div class="custom-showcase-wrap custom-showcase-wrap-<%= mode %>">\n        <% if (title) { %>\n        <div class="custom-showcase-wrap-title">\n            <%= title %>\n        </div>\n        <% } %>\n        <div class="custom-showcase-body">\n            <ul class="custom-showcase clearfix">\n\n            </ul>\n            <% if (body_title) { %>\n            <div class="custom-showcase-body-title text-center">\n                <%= body_title %>\n            </div>\n            <% } %>\n            <% if (body_desc) { %>\n            <p class="custom-showcase-body-desc text-center">\n                <%= body_desc %>\n            </p>\n            <% } %>\n        </div>\n    </div>\n    <% } %>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/showcase/templates/show_item.html", [], function() {
	return '<img src="<%= fullfillImage(image_url) %>">\n<% if (title !== \'\') { %>\n<span class="title"><%- title %></span>\n<% } %>\n'
}), define("components/showcase/2.0.0/showcase/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/showcase/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/showcase/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: "li",
		className: function() {
			return 0 === this.model.index() ? "custom-showcase-big" : "custom-showcase-small"
		},
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		},
		initialize: function() {
			this.listenTo(this.model, "change", this.render)
		}
	})
}), define("components/showcase/2.0.0/showcase/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/showcase/templates/show.html", "components/showcase/2.0.0/showcase/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/showcase/templates/show.html"),
		s = e("components/showcase/2.0.0/showcase/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "add", function(e) {
				var t = new s({
					model: e
				}),
					n = this.$(".custom-showcase"),
					i = e.index();
				0 === i ? t.render().$el.appendTo(n) : t.render().$el.insertAfter(n.children().eq(i - 1))
			}), this.listenTo(this.model.get("sub_entry"), "remove", this.render), this.listenTo(this.model.get("sub_entry"), "reset", this.render)
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this.$(".custom-showcase");
			this.model.get("sub_entry").length > 0 && e.empty(), this.model.get("sub_entry").each(function(t) {
				var n = new s({
					model: t
				});
				e.append(n.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/level/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-level">\n        <img class="custom-level-img<% if (_.isUndefined(is_default) || is_default) { %> custom-level-img-blur<% } %>" src="<%= fullfillImage(image.url) %>">\n        <% if (show_level == \'1\' && show_point == \'1\') { %>\n            <div class="custom-level-title-section">\n                <h5 class="custom-level-title"><%= level_msg %>高级会员<br><%= point_msg %>100分</h5>\n            </div>\n        <% } else if (show_point == \'1\') { %>\n            <div class="custom-level-title-section">\n                <h5 class="custom-level-title"><%= point_msg %>100分</h5>\n            </div>\n        <% } else if (show_level == \'1\') { %>\n            <div class="custom-level-title-section">\n               <h5 class="custom-level-title"><%= level_msg %>高级会员</h5>\n            </div>\n        <% } %>\n    </div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/level/views/show", ["components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/level/templates/show.html", "core/utils"], function(e, t, n) {
	return e.extend({
		className: "app-field",
		template: _.template(t),
		onInit: function() {
			this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.destroying), this.listenTo(this.model, "editing:error", this.showEditAndError)
		},
		render: function() {
			return this.$el.html(this.template(_.extend({}, this.model.attributes, {
				fullfillImage: n.fullfillImage
			}))), this
		}
	})
}), define("text!components/showcase/2.0.0/link/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length < 1) { %>\n    <ul class="custom-nav clearfix">\n            <li>\n        <a class="clearfix" href="javascript: void(0);" target="_blank">\n            <span class="custom-nav-title">点此编辑第1条『关联链接』</span>\n                            <i class="pull-right right-arrow"></i>\n                    </a>\n    </li>\n            <li>\n        <a class="clearfix" href="javascript: void(0);" target="_blank">\n            <span class="custom-nav-title">点此编辑第2条『关联链接』</span>\n                            <i class="pull-right right-arrow"></i>\n                    </a>\n    </li>\n            <li>\n        <a class="clearfix" href="javascript: void(0);" target="_blank">\n            <span class="custom-nav-title">点此编辑第n条『关联链接』</span>\n                            <i class="pull-right right-arrow"></i>\n                    </a>\n    </li>\n    </ul>\n    <% } %>\n    <ul class="custom-link clearfix"></ul>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/link/templates/show_item.html", [], function() {
	return '<a href="javascript:;" class="custom-link-link">\n    <h3 class="title">\n        <% if (source_type == \'link\') { %>\n            <%- source_title %>\n        <% } else { %>\n            第<%= index %>条 <%- source_title %> 的『关联链接』\n        <% } %>\n    </h3>\n    <i class="pull-right right-arrow"></i>\n</a>\n'
}), define("components/showcase/2.0.0/link/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/link/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/link/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		initialize: function(e) {
			e = e || {}, this.index = e.index, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		},
		serializeData: function() {
			return t.extend(this.model.toJSON(), {
				index: this.index
			})
		}
	})
}), define("components/showcase/2.0.0/link/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/link/templates/show.html", "components/showcase/2.0.0/link/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/link/templates/show.html"),
		s = e("components/showcase/2.0.0/link/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "add", this.render), this.listenTo(this.model.get("sub_entry"), "reset", this.render), this.listenTo(this.model.get("sub_entry"), "change", this.refreshOptions)
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this.$(".custom-link");
			e.empty(), this.model.get("sub_entry").each(function(n) {
				var i, o = n.get("source_type");
				o && (i = "link" == o ? 1 : +n.get("number"), t.times(i, function(t) {
					var i = new s({
						model: n,
						index: t + 1
					});
					e.append(i.render().el)
				}))
			})
		}
	})
}), define("text!components/showcase/2.0.0/text_nav/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length < 1) { %>\n    <ul class="custom-nav clearfix">\n        <li>\n            <a class="clearfix" href="javascript:void(0);">\n                <span class="custom-nav-title">点此添加一个『文本导航』</span><i class="pull-right right-arrow"></i>\n            </a>\n        </li>\n    </ul>\n    <% } %>\n    <ul class="custom-nav clearfix js-custom-nav"></ul>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/text_nav/templates/show_item.html", [], function() {
	return '<a class="clearfix" href="javascript:void(0);"><span class="custom-nav-title"><%= title %></span><i class="pull-right right-arrow"></i></a>\n'
}), define("components/showcase/2.0.0/text_nav/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/text_nav/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/text_nav/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		initialize: function(e) {
			e = e || {}, this.parent = e.parent, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		}
	})
}), define("components/showcase/2.0.0/text_nav/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/text_nav/templates/show.html", "components/showcase/2.0.0/text_nav/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/text_nav/templates/show.html"),
		s = e("components/showcase/2.0.0/text_nav/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "add", this.render), this.listenTo(this.model.get("sub_entry"), "reset", this.render)
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this,
				t = this.$(".js-custom-nav");
			t.empty(), this.model.get("sub_entry").each(function(n) {
				var i = new s({
					model: n,
					parent: e.model
				});
				t.append(i.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/tag_list/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-tag-list clearfix">\n        <div class="custom-tag-list-menu-block js-collection-region" style="min-height: 323px;">\n        </div>\n        <div class="custom-tag-list-goods">\n            <ul class="custom-tag-list-goods-list">\n                <%\n                    var images_url = [\n                        \'http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg!60x60+2x.jpg\',\n                        \'http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg!60x60+2x.jpg\',\n                        \'http://imgqn.koudaitong.com/upload_files/2013/09/27/138029095601969662.jpg!60x60+2x.jpg\',\n                        \'http://imgqn.koudaitong.com/upload_files/2013/10/09/138130084954645499.jpg!60x60+2x.jpg\'\n                    ]; %>\n                <% _.each(images_url, function(url){ %>\n                <li class="custom-tag-list-single-goods clearfix">\n                    <div class="custom-tag-list-goods-img">\n                        <img src="<%= url %>" style="display: inline;">\n                    </div>\n                    <div class="custom-tag-list-goods-detail">\n                        <p class="custom-tag-list-goods-title">此处显示商品名称</p>\n                        <span class="custom-tag-list-goods-price">￥100.00</span>\n                        <a class="custom-tag-list-goods-buy" href="javascript:void(0)"><span>购买</span></a>\n                    </div>\n                </li>\n                <% }); %>\n            </ul>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/tag_list/templates/show_item.html", [], function() {
	return '<a href="javascript:;"><span><%= title %></span></a>\n'
}), define("components/showcase/2.0.0/tag_list/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/tag_list/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/tag_list/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		className: function() {
			return 0 === this.model.index() ? "current" : ""
		},
		initialize: function(e) {
			e = e || {}, this.listenTo(this.model, "change", this.render)
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return t.extend(e, {
				index: this.model.index()
			})
		}
	})
}), define("text!components/showcase/2.0.0/tag_list/templates/show_empty.html", [], function() {
	return '<a href="javascript:;" class="current">商品组一</a>\n<a href="javascript:;">商品组二</a>\n<a href="javascript:;">商品组三</a>\n'
}), define("components/showcase/2.0.0/tag_list/views/show_empty", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/tag_list/templates/show_empty.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/tag_list/templates/show_empty.html");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i)
	})
}), define("components/showcase/2.0.0/tag_list/views/show_collection", ["require", "marionette", "components/showcase/2.0.0/tag_list/views/show_item", "components/showcase/2.0.0/tag_list/views/show_empty"], function(e) {
	var t = e("marionette"),
		n = e("components/showcase/2.0.0/tag_list/views/show_item"),
		i = e("components/showcase/2.0.0/tag_list/views/show_empty");
	return t.CollectionView.extend({
		tagName: "ul",
		className: "custom-tag-list-side-menu",
		itemView: n,
		emptyView: i
	})
}), define("components/showcase/2.0.0/tag_list/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tag_list/templates/show.html", "components/showcase/2.0.0/tag_list/views/show_collection", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tag_list/templates/show.html"),
		s = e("components/showcase/2.0.0/tag_list/views/show_collection"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "add", this.render), this.listenTo(this.model.get("sub_entry"), "reset", this.render)
		},
		onRender: function() {
			this.collectionRegion.show(new s({
				collection: this.model.get("sub_entry")
			}))
		}
	})
}), define("text!components/showcase/2.0.0/title/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (title_template == \'0\') {%>\n        <% if (show_method == \'0\') { %>\n        <div class="<% if (color !== \'#ffffff\' && color !== \'#F9F9F9\') { %>custom-title-noline<% } %>"<% if (color !== \'#ffffff\') { %>style="background-color: <%= color %>"<% } %>>\n            <div class="custom-title text-left">\n                <h2 class="title"><%= title || \'点击编辑『标题』\' %><span class="custom-title-link-container"></span></h2>\n                <p class="sub_title"><%= sub_title %></p>\n            </div>\n        </div>\n        <% } else if (show_method == \'1\') { %>\n        <div class="<% if (color !== \'#ffffff\' && color !== \'#F9F9F9\') { %>custom-title-noline<% } %>"<% if (color !== \'#ffffff\') { %>style="background-color: <%= color %>"<% } %>>\n            <div class="custom-title text-center">\n                <h2 class="title"><%= title || \'点击编辑『标题』\' %><span class="custom-title-link-container"></span></h2>\n                <p class="sub_title"><%= sub_title %></p>\n            </div>\n        </div>\n        <% } else { %>\n        <div class="<% if (color !== \'#ffffff\' && color !== \'#F9F9F9\') { %>custom-title-noline<% } %>"<% if (color !== \'#ffffff\') { %>style="background-color: <%= color %>"<% } %>>\n            <div class="custom-title text-right">\n                <h2 class="title"><%= title || \'点击编辑『标题』\' %><span class="custom-title-link-container"></span></h2>\n                <p class="sub_title"><%= sub_title %></p>\n            </div>\n        </div>\n        <% } %>\n    <% } else { %>\n        <div>\n            <div class="custom-title text-left">\n                <h2 class="title"><%= title || \'点击编辑『标题』\' %></h2>\n                <% if(wx_title_date != \'\' || wx_title_author != \'\' || wx_title_link != \'\') {%>\n                <p class="sub_title"><span class="sub_title_date"><%= wx_title_date %></span><span class="sub_title_author"><%= wx_title_author %></span><a class="sub_title_link" href="javascript:;"><%= wx_title_link %></a></p>\n                <% } %>\n            </div>\n        </div>\n    <% } %>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/title/templates/show_item.html", [], function() {
	return '<span class="gray">-</span> <a><%- title %></a>\n'
}), define("components/showcase/2.0.0/title/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/title/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/title/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "span",
		className: "custom-title-link",
		template: t.template(i),
		initialize: function() {
			this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		}
	})
}), define("components/showcase/2.0.0/title/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/title/templates/show.html", "components/showcase/2.0.0/title/views/show_item"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/title/templates/show.html"),
		s = e("components/showcase/2.0.0/title/views/show_item");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			var e = this;
			this.listenTo(this.model.get("sub_entry"), "add", function(t, n) {
				var i = new s({
					model: t,
					parent: e.model
				}),
					o = this.$(".custom-title-link-container"),
					a = n.indexOf(t);
				0 === a ? i.render().$el.appendTo(o) : i.render().$el.insertAfter(o.children().eq(a - 1))
			})
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this,
				t = this.$(".custom-title-link-container");
			t.empty(), this.model.get("sub_entry").each(function(n) {
				var i = new s({
					model: n,
					parent: e.model
				});
				t.append(i.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/component/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (_.isEmpty(title)) { %>\n        <div class="custom-richtext">\n            点击编辑『自定义页面模块』\n        </div>\n    <% } %>\n    <div class="custom-richtext">\n        <%= title %>\n    </div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/component/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/component/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/component/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/search/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-search">\n        <form action="/" method="GET">\n            <input type="text" class="custom-search-input" placeholder="商品搜索：请输入商品关键字" disabled>\n            <button type="submit" class="custom-search-button">搜索</button>\n        </form>\n    </div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/search/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/search/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/search/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/line/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-line-wrap">\n        <hr class="custom-line" />\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/line/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/line/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/line/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/cube/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (sub_entry.length <= 0) { %>\n    <div class="custom-richtext">\n        魔方可以拼出不同列的图片，分成4列。你可以通过添加多个魔方进行组合拼图。\n    </div>\n    <% } %>\n    <table class="custom-cube-table">\n        <tbody>\n            <tr class="custom-cube"></tr>\n        </tbody>\n    </table>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/cube/templates/selection_show.html", [], function() {
	return '<% if (title !== \'\') { %>\n<h3 class="title"><%- title %></h3>\n<% } %>\n<img src="<%= image_url %>">'
}), define("components/showcase/2.0.0/cube/views/selection_show", ["components/showcase/1.0.0/base/views/base", "text!components/showcase/2.0.0/cube/templates/selection_show.html", "core/utils"], function(e, t, n) {
	return e.extend({
		tagName: "td",
		attributes: function() {
			var e = this;
			return {
				style: function() {},
				colspan: function() {
					return e.model.get("show_method")
				}
			}
		},
		template: _.template(t),
		initialize: function(e) {
			e = e || {}, this.parent = e.parent, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		},
		render: function() {
			var e = _.clone(this.model.attributes);
			_.extend(e, {
				size: this.parent.get("size"),
				height: this.parent.get("height")
			});
			var t = this.model.get("image_url");
			return t = t && n.fullfillImage(t), e.image_url = t, e.image_thumb_url = t, this.$el.html(this.template(e)), this
		}
	})
}), define("components/showcase/2.0.0/cube/views/show", ["components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/cube/templates/show.html", "components/showcase/2.0.0/cube/views/selection_show"], function(e, t, n) {
	return e.extend({
		className: "app-field",
		template: _.template(t),
		onInit: function() {
			var e = this;
			this.listenTo(this.model.get("sub_entry"), "add", function(t, i) {
				var s, o = new n({
					model: t,
					parent: e.model
				});
				s = this.$(".custom-cube");
				var a = i.indexOf(t);
				0 === a ? o.render().$el.appendTo(s) : o.render().$el.insertAfter(s.children().eq(a - 1)), e.render()
			}), this.listenTo(this.model.get("sub_entry"), "remove", this.render), this.listenTo(this.model.get("sub_entry"), "editing:error", this.showEditAndError), this.listenTo(this.model, "editing:error", this.showEditAndError), this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.destroying)
		},
		render: function() {
			return this.$el.html(this.template(this.model.attributes)), this.refreshOptions(), this
		},
		refreshOptions: function() {
			var e, t = this;
			e = this.$(".custom-cube"), this.model.get("sub_entry").length > 0 && e.empty(), this.model.get("sub_entry").each(function(i) {
				var s = new n({
					model: i,
					parent: t.model
				});
				e.append(s.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/cube2/templates/show.html", [], function() {
	return '<div class="control-group custom-cube2-table">\n    <table>\n        <tbody>\n            <%= tableContent %>\n        </tbody>\n    </table>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/cube2/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/cube2/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/cube2/templates/show.html");
	return n.extend({
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model.get("sub_entry"), "add", this.render), this.listenTo(this.model.get("sub_entry"), "remove", this.render), this.$el.on("click", "td a", function(e) {
				e.preventDefault()
			})
		},
		onBeforeRender: function() {
			this.model.denerateTableContent()
		}
	})
}), define("text!components/showcase/2.0.0/tpl_shop/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="tpl-shop">\n        <div class="tpl-shop-header" style="<% if(backgroundImage) { %>background-image: url(<%- fullfillImage(backgroundImage) %>);<% } %> background-color: <%- backgroundColor %>;">\n            <div class="tpl-shop-title"><%- window._global.mp_data.team_name %></div>\n            <div class="tpl-shop-avatar">\n                <img src="<%- fullfillImage(avatar) %>" alt="">\n            </div>\n        </div>\n        <div class="tpl-shop-content">\n            <ul class="clearfix">\n                <li>\n                    <a href="javascript:;">\n                        <span class="count">0</span>\n                        <span class="text">全部商品</span>\n                    </a>\n                </li>\n                <li>\n                    <a href="javascript:;">\n                        <span class="count">0</span>\n                        <span class="text">上新商品</span>\n                    </a>\n                </li>\n                <li>\n                    <a href="javascript:;">\n                        <span class="count user"></span>\n                        <span class="text">我的订单</span>\n                    </a>\n                </li>\n            </ul>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span><span class="action add">加内容</span>\n    </div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_shop/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_shop/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_shop/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		}
	})
}), define("text!components/showcase/2.0.0/tpl_weixin/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="tpl-weixin">\n        <img src="<%= fullfillImage(background) %>">\n        <div class="js-collection-region">\n            <ul class="tpl-weixin-list clearfix" style="top: <%= top %>%;"></ul>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span><span class="action add">加内容</span>\n    </div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/tpl_weixin/templates/show_item.html", [], function() {
	return '<a href="javascript:;"><%- title %></a>'
}), define("components/showcase/2.0.0/tpl_weixin/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/tpl_weixin/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/tpl_weixin/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "li",
		className: function() {
			var e = this.model.index() + 1,
				t = "tpl-weixin-list-item tpl-weixin-list-item-" + e + " done";
			return t
		},
		template: t.template(i),
		initialize: function() {
			this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		}
	})
}), define("components/showcase/2.0.0/tpl_weixin/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_weixin/templates/show.html", "components/showcase/2.0.0/tpl_weixin/views/show_item", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_weixin/templates/show.html"),
		s = e("components/showcase/2.0.0/tpl_weixin/views/show_item"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		onInit: function() {
			var e = this;
			this.listenTo(this.model.get("sub_entry"), "add", function(t, n) {
				var i = new s({
					model: t,
					parent: e.model
				}),
					o = this.$(".tpl-weixin-list"),
					a = n.indexOf(t);
				0 === a ? i.render().$el.appendTo(o) : i.render().$el.insertAfter(o.children().eq(a - 1))
			}), this.listenTo(this.model.get("sub_entry"), "reset remove", this.render)
		},
		onRender: function() {
			this.refreshOptions()
		},
		refreshOptions: function() {
			var e = this,
				t = this.$(".tpl-weixin-list");
			t.empty(), this.model.get("sub_entry").each(function(n) {
				var i = new s({
					model: n,
					parent: e.model
				});
				t.append(i.render().el)
			})
		}
	})
}), define("text!components/showcase/2.0.0/tpl_fbb/templates/show.html", [], function() {
	return '<div class="control-group">\n    <style>\n        .tpl-fbb {\n            background-image: url(<%= fullfillImage(background) %>);\n            background-position: center top;\n            background-repeat: no-repeat;\n            background-size: 320px <%= height / (width / 320) %>px;\n            height: <%= height / (width / 320) %>px;\n        }\n        .swiper-wrapper {\n            width: 500px;\n        }\n    </style>\n    <div class="tpl-fbb">\n        <div class="swiper-container js-tpl-fbb js-collection-region">\n            <div class="swiper-wrapper clearfix js-subentry-list">\n\n            </div>\n        </div>\n    </div>\n    <div class="component-border"></div>\n</div>\n'
}), define("text!components/showcase/2.0.0/tpl_fbb/templates/show_item.html", [], function() {
	return '<a href="javascript:;"<% if (bg_image_url) { %> class="slide-bg" style="background-image: url(<%= fullfillImage(bg_image_url) %>)"<% } %>>\n    <% if (bg_image_url) { %>\n        <div class="swiper-item-bg"></div>\n    <% } %>\n    <div class="tpl-fbb-item-wrap">\n        <div class="tpl-fbb-item-name">\n            <%= title %>\n        </div>\n        <div class="tpl-fbb-item-line"></div>\n        <div class="tpl-fbb-item-icon">\n            <% if (icon_image_url) { %>\n                <img src="<%= fullfillImage(icon_image_url) %>" width="30" height="30">\n            <% } %>\n        </div>\n        <div class="tpl-fbb-item-text">\n            <%= text %>\n        </div>\n        <div class="tpl-fbb-item-date">\n            <%= date %>\n        </div>\n    </div>\n</a>\n'
}), define("components/showcase/2.0.0/tpl_fbb/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/tpl_fbb/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/tpl_fbb/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: "div",
		className: "swiper-slide tpl-fbb-item done",
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		},
		initialize: function() {
			this.listenTo(this.model, "change", this.render)
		}
	})
}), define("components/showcase/2.0.0/tpl_fbb/views/show_collection", ["require", "marionette", "components/showcase/2.0.0/tpl_fbb/views/show_item"], function(e) {
	var t = e("marionette"),
		n = e("components/showcase/2.0.0/tpl_fbb/views/show_item");
	return t.CollectionView.extend({
		tagName: "ul",
		className: "swiper-wrapper clearfix",
		itemView: n
	})
}), define("components/showcase/2.0.0/tpl_fbb/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_fbb/templates/show.html", "components/showcase/2.0.0/tpl_fbb/views/show_collection", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_fbb/templates/show.html"),
		s = e("components/showcase/2.0.0/tpl_fbb/views/show_collection"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onRender: function() {
			this.collectionRegion.show(new s({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		}
	})
}), define("text!components/showcase/2.0.0/tpl_course/templates/show.html", [], function() {
	return '<div class="control-group">\n    <style>\n        .tpl-fbb {\n            background-image: url(<%= fullfillImage(background) %>);\n            background-position: center top;\n            background-repeat: no-repeat;\n            background-size: 320px <%= height / (width / 320) %>px;\n            height: <%= height / (width / 320) %>px;\n        }\n        .swiper-wrapper {\n            width: 500px;\n        }\n        .tpl-course {\n            position: relative;\n        }\n    </style>\n    <div class="tpl-fbb tpl-course">\n        <h1 class="tpl-course-title" style="color: <%- title_color %>"><%- title %></h1>\n        <h2 class="tpl-course-sub-title" style="color: <%- sub_title_color %>"><%- sub_title %></h2>\n        <div class="text-center butn-section" style="top: <%- top %>%;">\n            <a href="javascript:;" class="butn butn-xxlarge butn-primary butn-buy"><%- button_text %></a>\n        </div>\n        <div class="swiper-container js-tpl-fbb js-collection-region">\n\n        </div>\n    </div>\n</div>\n'
}), define("text!components/showcase/2.0.0/tpl_course/templates/show_item.html", [], function() {
	return '<a href="javascript:;"<% if (bg_image_url) { %> class="slide-bg" style="background-image: url(<%= bg_image_url %>)"<% } %>>\n    <% if (bg_image_url) { %>\n        <div class="swiper-item-bg"></div>\n    <% } %>\n    <div class="tpl-fbb-item-wrap">\n        <div class="tpl-fbb-item-name">\n            <%= title %>\n        </div>\n        <div class="tpl-fbb-item-line"></div>\n        <div class="tpl-fbb-item-icon">\n            <% if (icon_image_url) { %>\n                <img src="<%= icon_image_url %>" width="30" height="30">\n            <% } %>\n        </div>\n    </div>\n</a>'
}), define("components/showcase/2.0.0/tpl_course/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/tpl_course/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/tpl_course/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: "div",
		className: "swiper-slide tpl-fbb-item done",
		template: t.template(i),
		initialize: function(e) {
			this.options = e || {}, this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.remove)
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return e.icon_image_url = s.fullfillImage(e.icon_image_url), e.bg_image_url = s.fullfillImage(e.bg_image_url), e
		}
	})
}), define("components/showcase/2.0.0/tpl_course/views/show_collection", ["require", "marionette", "components/showcase/2.0.0/tpl_course/views/show_item"], function(e) {
	var t = e("marionette"),
		n = e("components/showcase/2.0.0/tpl_course/views/show_item");
	return t.CollectionView.extend({
		tagName: "ul",
		className: "swiper-wrapper clearfix",
		itemView: n
	})
}), define("components/showcase/2.0.0/tpl_course/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_course/templates/show.html", "components/showcase/2.0.0/tpl_course/views/show_collection", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_course/templates/show.html"),
		s = e("components/showcase/2.0.0/tpl_course/views/show_collection"),
		o = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		regions: {
			collectionRegion: ".js-collection-region"
		},
		serializeData: function() {
			var e = this.model.toJSON();
			return e.background = o.fullfillImage(e.background), e
		},
		onRender: function() {
			this.collectionRegion.show(new s({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		}
	})
}), define("text!components/showcase/2.0.0/tpl_wxd/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="tpl-wxd">\n        <div class="tpl-wxd-header" style="background-image: url(<%- fullfillImage(backgroundImage) %>)">\n            <div class="tpl-wxd-title"><%- window._global.mp_data.team_name %></div>\n            <div class="tpl-wxd-avatar">\n                <img src="<%- fullfillImage(avatar) %>" alt="">\n            </div>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_wxd/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_wxd/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_wxd/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		}
	})
}), define("text!components/showcase/2.0.0/tpl_11_11/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="tpl-11-11">\n        <div class="tpl-11-11-banner" style="<% if(banner) { %>background-image: url(<%= fullfillImage(banner) %>)<% } %>"></div>\n        <div class="tpl-11-11-title clearfix">\n            <span class="tpl-11-11-team-name"><%= _global.mp_data.team_name %></span>\n            <div class="pull-right">\n                <a href="javascript:;" class="tpl-11-11-follow">关注</a>\n            </div>\n        </div>\n        <ul class="tpl-11-11-coupon clearfix">\n            <% if(tradeincard.length) { %>\n                <% _.each(tradeincard, function(item) { %>\n                    <li>\n                        <a href="javascript:;">\n                            <div class="tpl-11-11-coupon-meta">\n                                <div class="tpl-11-11-coupon-meta-price"><span>￥</span><%= item.value %></div>\n                                <div class="tpl-11-11-coupon-meta-desc">\n                                    满<%= item.at_least %>元可用\n                                </div>\n                            </div>\n                            <div class="tpl-11-11-coupon-get">马上领取</div>\n                        </a>\n                    </li>\n                <% }); %>\n            <% } else { %>\n                <% for(var i = 0; i < 3; i++) { %>\n                    <li>\n                        <a href="javascript:;">\n                            <div class="tpl-11-11-coupon-meta">\n                                <div class="tpl-11-11-coupon-meta-price"><span>￥</span>100</div>\n                                <div class="tpl-11-11-coupon-meta-desc">\n                                    满500元可用\n                                </div>\n                            </div>\n                            <div class="tpl-11-11-coupon-get">马上领取</div>\n                        </a>\n                    </li>\n                <% } %>\n            <% } %>\n        </ul>\n        <div class="tpl-11-11-notice">\n            <div class="tpl-11-11-notice-inner">\n                <div class="tpl-11-11-notice-scroll">\n                    <span>\n                        公告：<%= notice ? _.escape(notice).replace(/\\s/g, \'&nbsp;\') : \'请填写内容，如果过长，将会在手机上滚动显示\' %>\n                    </span>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span><span class="action add">加内容</span>\n    </div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/tpl_11_11/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/tpl_11_11/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/tpl_11_11/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		}
	})
}), define("text!components/showcase/2.0.0/category/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-category js-collection-region">\n\n    </div>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span><span class="action add">加内容</span>\n    </div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("text!components/showcase/2.0.0/category/templates/show_item.html", [], function() {
	return "<% if (title !== '') { %>\n<a href=\"javascript:;\"><%- title %></a>\n<% } %>\n"
}), define("components/showcase/2.0.0/category/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/category/templates/show_item.html"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/category/templates/show_item.html");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		modelEvents: {
			change: "render"
		}
	})
}), define("components/showcase/2.0.0/category/views/show_collection", ["require", "marionette", "components/showcase/2.0.0/category/views/show_item"], function(e) {
	var t = e("marionette"),
		n = e("components/showcase/2.0.0/category/views/show_item");
	return t.CollectionView.extend({
		tagName: "ul",
		className: "custom-category-list clearfix",
		itemView: n
	})
}), define("components/showcase/2.0.0/category/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/category/templates/show.html", "components/showcase/2.0.0/category/views/show_collection"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/category/templates/show.html"),
		s = e("components/showcase/2.0.0/category/views/show_collection");
	return n.extend({
		template: t.template(i),
		regions: {
			collectionRegion: ".js-collection-region"
		},
		onRender: function() {
			this.collectionRegion.show(new s({
				collection: this.model.get("sub_entry"),
				layout: this
			}))
		}
	})
}), define("text!components/showcase/2.0.0/white/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-white text-center" style="height: <%= height %>px;">\n    </div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/white/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/white/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/white/templates/show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("text!components/showcase/2.0.0/store/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-store">\n        <a class="custom-store-link clearfix" href="javascript:;">\n            <div class="custom-store-img"></div>\n            <div class="custom-store-name">\n                <%- title %>\n            </div>\n            <div class="custom-store-enter">\n                进入店铺\n            </div>\n        </a>\n    </div>\n\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/store/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/store/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/store/templates/show.html");
	return n.extend({
		template: t.template(i),
		serializeData: function() {
			return {
				title: window._global.mp_data.team_name || ""
			}
		}
	})
}), define("text!components/showcase/2.0.0/recommend_goods/templates/show.html", [], function() {
	return '<div class="control-group">\n    <div class="custom-recommend-goods clearfix">\n        <div class="custom-recommend-goods-title">\n            <a href="javascript:;">推荐商品</a>\n        </div>\n        <ul class="custom-recommend-goods-list clearfix">\n            <% for(var i = 0; i < goodsSample.length; i++){ %>\n                <li>\n                    <a href="javascript:;">\n                        <img src="<%- goodsSample[i].image_url %>" alt="">\n                    </a>\n                </li>\n            <% } %>\n        </ul>\n    </div>\n    <div class="component-border"></div>\n</div>\n<div class="actions">\n    <div class="actions-wrap"><span class="action edit">编辑</span><span class="action add">加内容</span><span class="action delete">删除</span></div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/recommend_goods/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/recommend_goods/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/recommend_goods/templates/show.html");
	return n.extend({
		className: "app-field",
		template: t.template(i),
		onInit: function() {
			this.listenTo(this.model, "change", this.render), this.listenTo(this.model, "destroy", this.destroying)
		},
		render: function() {
			var e = {
				goodsSample: [{
					image_url: "http://imgqn.koudaitong.com/upload_files/2013/11/27/138554366971566702.jpg",
					price: "379.00"
				}, {
					image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029081159828528.jpg",
					price: "5.50"
				}, {
					image_url: "http://imgqn.koudaitong.com/upload_files/2013/09/27/138029095601969662.jpg",
					price: "32.00"
				}]
			};
			return this.$el.html(this.template(e)), this
		}
	})
}), define("text!components/showcase/2.0.0/scroll/templates/show.html", [], function() {
	return '<div class="control-group">\n    <%\n        var image_url = \'\';\n        if(first_page_image_url) {\n            image_url = fullfillImage(first_page_image_url);\n        } else {\n            image_url = window._global.url.cdn_static + \'/image/scroll/default2.gif\';\n        }\n    %>\n    <div class="www-tpl-scroll">\n        <% if(homepage_icon == \'1\') { %>\n            <div class="ui-left-btns">\n                <i class="ui-homepage-btn"></i>\n            </div>\n        <% } %>\n        <% if(music_icon == \'1\') { %>\n            <div class="ui-right-btns">\n                <i class="ui-music-btn"></i>\n            </div>\n        <% } %>\n        <img src="<%= image_url %>" alt="全画幅场景">\n    </div>\n</div>\n'
}), define("components/showcase/2.0.0/scroll/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/scroll/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/scroll/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		}
	})
}), define("text!components/showcase/2.0.0/scroll_nav/templates/show_item.html", [], function() {
	return '<% if(image_url) { %>\n<div class="scroll-nav-item" style="background-image: url(\'<%= fullfillImage(image_url) %>\');">\n<% } else { %>\n<div class="scroll-nav-item">\n<% } %>\n    <div class="scroll-nav-item-bg"></div>\n    <div class="scroll-nav-item-title"><%- title %></div>\n    <div class="scroll-nav-item-sub-title"><%- sub_title %></div>\n</div>\n\n\n'
}), define("components/showcase/2.0.0/scroll_nav/views/show_item", ["require", "underscore", "marionette", "text!components/showcase/2.0.0/scroll_nav/templates/show_item.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!components/showcase/2.0.0/scroll_nav/templates/show_item.html"),
		s = e("core/utils");
	return n.ItemView.extend({
		tagName: "li",
		template: t.template(i),
		templateHelpers: {
			fullfillImage: s.fullfillImage
		},
		initialize: function(e) {
			e = e || {}, this.listenTo(this.model, "change", this.render)
		}
	})
}), define("components/showcase/2.0.0/scroll_nav/views/show_collection", ["require", "marionette", "components/showcase/2.0.0/scroll_nav/views/show_item"], function(e) {
	var t = e("marionette"),
		n = e("components/showcase/2.0.0/scroll_nav/views/show_item");
	return t.CollectionView.extend({
		tagName: "ul",
		className: "clearfix",
		itemView: n
	})
}), define("text!components/showcase/2.0.0/scroll_nav/templates/show.html", [], function() {
	return '<div class="control-group">\n    <%\n        var image_url = window._global.url.cdn_static + \'/image/scroll_nav/default.gif\';\n\n        if(background_images && background_images.length) {\n            image_url = fullfillImage(background_images[0].url, \'!640x320.jpg\');\n        }\n    %>\n    <div class="www-tpl-scroll www-scroll-nav">\n        <% if(homepage_icon == \'1\') { %>\n            <div class="ui-left-btns">\n                <i class="ui-homepage-btn"></i>\n            </div>\n        <% } %>\n        <img src="<%= image_url %>" alt="">\n\n        <div class="js-scroll-nav-show-collection-region nav-style-<%= nav_style %>"></div>\n    </div>\n</div>\n'
}), define("components/showcase/2.0.0/scroll_nav/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "components/showcase/2.0.0/scroll_nav/views/show_collection", "text!components/showcase/2.0.0/scroll_nav/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("components/showcase/2.0.0/scroll_nav/views/show_collection"),
		s = e("text!components/showcase/2.0.0/scroll_nav/templates/show.html"),
		o = e("core/utils");
	return n.extend({
		template: t.template(s),
		templateHelpers: {
			fullfillImage: o.fullfillImage
		},
		regions: {
			collectionRegion: ".js-scroll-nav-show-collection-region"
		},
		onRender: function() {
			this.collectionRegion.show(new i({
				collection: this.model.get("sub_entry")
			}))
		}
	})
}), define("text!components/showcase/2.0.0/image_text/templates/show.html", [], function() {
	return '<% if (position === 0) { %>\n<div class="appmsg appmsg-multiple-first">\n    <h4 class="appmsg-title"><%- title || \'标题\' %></h4>\n    <p class="appmsg-meta"><%- currentDay %></p>\n    <div class="appmsg-thumb-wrap">\n        <% if (image) { %>\n        <img src="<%- image %>"/>\n        <% } else { %>\n        <p>封面图片</p>\n        <% } %>\n    </div>\n    <% if (digest) { %>\n    <div class="appmsg-digest">\n        <%- digest %>\n    </div>\n    <% } %>\n    <div class="appmsg-view-full clearfix">\n        <span>阅读全文</span>\n        <span class="pull-right">&gt;</span>\n    </div>\n</div>\n<% } else { %>\n<div class="appmsg appmsg-multiple-others">\n    <h4 class="appmsg-title"><%- title || \'标题\' %></h4>\n    <div class="appmsg-thumb-wrap">\n        <% if (image) { %>\n        <img src="<%- image %>" width="50" height="50" />\n        <% } else { %>\n        <p>缩略图</p>\n        <% } %>\n    </div>\n</div>\n<% } %>\n\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span>\n        <% if (position > 1) { %>\n        <span class="action delete">删除</span>\n        <% } %>\n    </div>\n</div>'
}), define("components/showcase/2.0.0/image_text/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "core/utils", "text!components/showcase/2.0.0/image_text/templates/show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("core/utils"),
		s = e("text!components/showcase/2.0.0/image_text/templates/show.html");
	return n.extend({
		className: function() {
			var e = this.model.position();
			return e > 1 ? "app-field clearfix" : "app-field clearfix not-sortable js-not-sortable"
		},
		template: t.template(s),
		serializeData: function() {
			var e = this.model.attributes,
				n = this.model.position(),
				s = this.model.get("image");
			s = s && i.fullfillImage(s);
			var o = i.getCurrentDay();
			return t.extend({}, e, {
				image: s,
				position: n,
				currentDay: o
			})
		}
	})
}), define("text!components/showcase/2.0.0/audio/templates/show.html", [], function() {
	return '<div class="control-group">\n    <% if (+style==0 ) { %>\n        <div class="custom-audio">\n            <div class="custom-audio-weixin clearfix <% if(bubble == \'right\') { %>custom-audio-weixin-right<% } %> ">\n                <img src="<%= avatar %>" width="40" height="40" class="custom-audio-logo">\n                <span class="custom-audio-bar">\n                    <img class="js-animation hide" src="http://static.koudaitong.com/v2/image/wap/audio/player.gif" alt="播放器动画" width="13" height="17">\n                    <i class="custom-audio-animation-static js-animation-static"></i>\n                </span>\n                <span class="custom-audio-time js-duration"></span>\n            </div>\n        </div>\n    <% } else { %>\n        <div class="custom-audio">\n            <div class="custom-audio-music">\n                <i class="custom-audio-btn js-trigger"></i>\n                <span class="custom-audio-title"><%- title %></span>\n                <span class="custom-audio-status js-status"></span>\n                <span class="custom-audio-time">\n                    <span class="js-current-time"></span>\n                    <span class="js-duration"></span>\n                </span>\n                <span class="custom-audio-timeline js-percentage"></span>\n            </div>\n        </div>\n    <% } %>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span>\n        <span class="action add">加内容</span>\n        <span class="action delete">删除</span>\n    </div>\n</div>\n<div class="sort">\n    <i class="sort-handler"></i>\n</div>\n'
}), define("components/showcase/2.0.0/audio/views/show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!components/showcase/2.0.0/audio/templates/show.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!components/showcase/2.0.0/audio/templates/show.html"),
		s = e("core/utils");
	return n.extend({
		template: t.template(i),
		serializeData: function() {
			var e = this.model.toJSON();
			return t.extend(e, {
				avatar: s.fullfillImage(e.avatar || _global.mp_data.logo, "!80x80.jpg")
			})
		}
	})
}), define("components/showcase/2.0.0/config", ["require", "components/showcase/2.0.0/rich_text/models/rich_text", "components/showcase/2.0.0/goods/models/goods", "components/showcase/2.0.0/goods_list/models/goods", "components/showcase/2.0.0/image_ad/models/model", "components/showcase/2.0.0/nav/models/model", "components/showcase/2.0.0/showcase/models/model", "components/showcase/2.0.0/level/models/level", "components/showcase/2.0.0/link/models/model", "components/showcase/2.0.0/text_nav/models/model", "components/showcase/2.0.0/tag_list/models/model", "components/showcase/2.0.0/title/models/model", "components/showcase/2.0.0/component/models/component", "components/showcase/2.0.0/search/models/model", "components/showcase/2.0.0/line/models/model", "components/showcase/2.0.0/cube/models/model", "components/showcase/2.0.0/cube2/models/model", "components/showcase/2.0.0/tpl_shop/models/model", "components/showcase/2.0.0/tpl_weixin/models/model", "components/showcase/2.0.0/tpl_fbb/models/model", "components/showcase/2.0.0/tpl_course/models/model", "components/showcase/2.0.0/tpl_wxd/models/model", "components/showcase/2.0.0/tpl_11_11/models/model", "components/showcase/2.0.0/category/models/model", "components/showcase/2.0.0/white/models/model", "components/showcase/2.0.0/store/models/model", "components/showcase/2.0.0/recommend_goods/models/model", "components/showcase/2.0.0/scroll/models/model", "components/showcase/2.0.0/scroll_nav/models/model", "components/showcase/2.0.0/image_text/models/model", "components/showcase/2.0.0/audio/models/model", "components/showcase/2.0.0/rich_text/views/edit", "components/showcase/2.0.0/goods/views/edit", "components/showcase/2.0.0/goods_list/views/edit", "components/showcase/2.0.0/image_ad/views/edit", "components/showcase/2.0.0/nav/views/edit", "components/showcase/2.0.0/showcase/views/edit", "components/showcase/2.0.0/level/views/edit", "components/showcase/2.0.0/link/views/edit", "components/showcase/2.0.0/text_nav/views/edit", "components/showcase/2.0.0/tag_list/views/edit", "components/showcase/2.0.0/title/views/edit", "components/showcase/2.0.0/component/views/edit", "components/showcase/2.0.0/search/views/edit", "components/showcase/2.0.0/line/views/edit", "components/showcase/2.0.0/cube/views/edit", "components/showcase/2.0.0/cube2/views/edit", "components/showcase/2.0.0/tpl_shop/views/edit", "components/showcase/2.0.0/tpl_weixin/views/edit", "components/showcase/2.0.0/tpl_fbb/views/edit", "components/showcase/2.0.0/tpl_course/views/edit", "components/showcase/2.0.0/tpl_wxd/views/edit", "components/showcase/2.0.0/tpl_11_11/views/edit", "components/showcase/2.0.0/category/views/edit", "components/showcase/2.0.0/white/views/edit", "components/showcase/2.0.0/store/views/edit", "components/showcase/2.0.0/recommend_goods/views/edit", "components/showcase/2.0.0/scroll/views/edit", "components/showcase/2.0.0/scroll_nav/views/edit", "components/showcase/2.0.0/image_text/views/edit", "components/showcase/2.0.0/audio/views/edit", "components/showcase/2.0.0/rich_text/views/show", "components/showcase/2.0.0/goods/views/show", "components/showcase/2.0.0/goods_list/views/show", "components/showcase/2.0.0/image_ad/views/show", "components/showcase/2.0.0/nav/views/show", "components/showcase/2.0.0/showcase/views/show", "components/showcase/2.0.0/level/views/show", "components/showcase/2.0.0/link/views/show", "components/showcase/2.0.0/text_nav/views/show", "components/showcase/2.0.0/tag_list/views/show", "components/showcase/2.0.0/title/views/show", "components/showcase/2.0.0/component/views/show", "components/showcase/2.0.0/search/views/show", "components/showcase/2.0.0/line/views/show", "components/showcase/2.0.0/cube/views/show", "components/showcase/2.0.0/cube2/views/show", "components/showcase/2.0.0/tpl_shop/views/show", "components/showcase/2.0.0/tpl_weixin/views/show", "components/showcase/2.0.0/tpl_fbb/views/show", "components/showcase/2.0.0/tpl_course/views/show", "components/showcase/2.0.0/tpl_wxd/views/show", "components/showcase/2.0.0/tpl_11_11/views/show", "components/showcase/2.0.0/category/views/show", "components/showcase/2.0.0/white/views/show", "components/showcase/2.0.0/store/views/show", "components/showcase/2.0.0/recommend_goods/views/show", "components/showcase/2.0.0/scroll/views/show", "components/showcase/2.0.0/scroll_nav/views/show", "components/showcase/2.0.0/image_text/views/show", "components/showcase/2.0.0/audio/views/show"], function(e) {
	return {
		models: {
			rich_text: e("components/showcase/2.0.0/rich_text/models/rich_text"),
			goods: e("components/showcase/2.0.0/goods/models/goods"),
			goods_list: e("components/showcase/2.0.0/goods_list/models/goods"),
			image_ad: e("components/showcase/2.0.0/image_ad/models/model"),
			nav: e("components/showcase/2.0.0/nav/models/model"),
			showcase: e("components/showcase/2.0.0/showcase/models/model"),
			level: e("components/showcase/2.0.0/level/models/level"),
			link: e("components/showcase/2.0.0/link/models/model"),
			text_nav: e("components/showcase/2.0.0/text_nav/models/model"),
			tag_list: e("components/showcase/2.0.0/tag_list/models/model"),
			title: e("components/showcase/2.0.0/title/models/model"),
			component: e("components/showcase/2.0.0/component/models/component"),
			search: e("components/showcase/2.0.0/search/models/model"),
			line: e("components/showcase/2.0.0/line/models/model"),
			cube: e("components/showcase/2.0.0/cube/models/model"),
			cube2: e("components/showcase/2.0.0/cube2/models/model"),
			tpl_shop: e("components/showcase/2.0.0/tpl_shop/models/model"),
			tpl_weixin: e("components/showcase/2.0.0/tpl_weixin/models/model"),
			tpl_fbb: e("components/showcase/2.0.0/tpl_fbb/models/model"),
			tpl_course: e("components/showcase/2.0.0/tpl_course/models/model"),
			tpl_wxd: e("components/showcase/2.0.0/tpl_wxd/models/model"),
			tpl_11_11: e("components/showcase/2.0.0/tpl_11_11/models/model"),
			category: e("components/showcase/2.0.0/category/models/model"),
			white: e("components/showcase/2.0.0/white/models/model"),
			store: e("components/showcase/2.0.0/store/models/model"),
			recommend_goods: e("components/showcase/2.0.0/recommend_goods/models/model"),
			scroll: e("components/showcase/2.0.0/scroll/models/model"),
			scroll_nav: e("components/showcase/2.0.0/scroll_nav/models/model"),
			image_text: e("components/showcase/2.0.0/image_text/models/model"),
			audio: e("components/showcase/2.0.0/audio/models/model")
		},
		editViews: {
			rich_text: e("components/showcase/2.0.0/rich_text/views/edit"),
			goods: e("components/showcase/2.0.0/goods/views/edit"),
			goods_list: e("components/showcase/2.0.0/goods_list/views/edit"),
			image_ad: e("components/showcase/2.0.0/image_ad/views/edit"),
			nav: e("components/showcase/2.0.0/nav/views/edit"),
			showcase: e("components/showcase/2.0.0/showcase/views/edit"),
			level: e("components/showcase/2.0.0/level/views/edit"),
			link: e("components/showcase/2.0.0/link/views/edit"),
			text_nav: e("components/showcase/2.0.0/text_nav/views/edit"),
			tag_list: e("components/showcase/2.0.0/tag_list/views/edit"),
			title: e("components/showcase/2.0.0/title/views/edit"),
			component: e("components/showcase/2.0.0/component/views/edit"),
			search: e("components/showcase/2.0.0/search/views/edit"),
			line: e("components/showcase/2.0.0/line/views/edit"),
			cube: e("components/showcase/2.0.0/cube/views/edit"),
			cube2: e("components/showcase/2.0.0/cube2/views/edit"),
			tpl_shop: e("components/showcase/2.0.0/tpl_shop/views/edit"),
			tpl_weixin: e("components/showcase/2.0.0/tpl_weixin/views/edit"),
			tpl_fbb: e("components/showcase/2.0.0/tpl_fbb/views/edit"),
			tpl_course: e("components/showcase/2.0.0/tpl_course/views/edit"),
			tpl_wxd: e("components/showcase/2.0.0/tpl_wxd/views/edit"),
			tpl_11_11: e("components/showcase/2.0.0/tpl_11_11/views/edit"),
			category: e("components/showcase/2.0.0/category/views/edit"),
			white: e("components/showcase/2.0.0/white/views/edit"),
			store: e("components/showcase/2.0.0/store/views/edit"),
			recommend_goods: e("components/showcase/2.0.0/recommend_goods/views/edit"),
			scroll: e("components/showcase/2.0.0/scroll/views/edit"),
			scroll_nav: e("components/showcase/2.0.0/scroll_nav/views/edit"),
			image_text: e("components/showcase/2.0.0/image_text/views/edit"),
			audio: e("components/showcase/2.0.0/audio/views/edit")
		},
		showViews: {
			rich_text: e("components/showcase/2.0.0/rich_text/views/show"),
			goods: e("components/showcase/2.0.0/goods/views/show"),
			goods_list: e("components/showcase/2.0.0/goods_list/views/show"),
			image_ad: e("components/showcase/2.0.0/image_ad/views/show"),
			nav: e("components/showcase/2.0.0/nav/views/show"),
			showcase: e("components/showcase/2.0.0/showcase/views/show"),
			level: e("components/showcase/2.0.0/level/views/show"),
			link: e("components/showcase/2.0.0/link/views/show"),
			text_nav: e("components/showcase/2.0.0/text_nav/views/show"),
			tag_list: e("components/showcase/2.0.0/tag_list/views/show"),
			title: e("components/showcase/2.0.0/title/views/show"),
			component: e("components/showcase/2.0.0/component/views/show"),
			search: e("components/showcase/2.0.0/search/views/show"),
			line: e("components/showcase/2.0.0/line/views/show"),
			cube: e("components/showcase/2.0.0/cube/views/show"),
			cube2: e("components/showcase/2.0.0/cube2/views/show"),
			tpl_shop: e("components/showcase/2.0.0/tpl_shop/views/show"),
			tpl_weixin: e("components/showcase/2.0.0/tpl_weixin/views/show"),
			tpl_fbb: e("components/showcase/2.0.0/tpl_fbb/views/show"),
			tpl_course: e("components/showcase/2.0.0/tpl_course/views/show"),
			tpl_wxd: e("components/showcase/2.0.0/tpl_wxd/views/show"),
			tpl_11_11: e("components/showcase/2.0.0/tpl_11_11/views/show"),
			category: e("components/showcase/2.0.0/category/views/show"),
			white: e("components/showcase/2.0.0/white/views/show"),
			store: e("components/showcase/2.0.0/store/views/show"),
			recommend_goods: e("components/showcase/2.0.0/recommend_goods/views/show"),
			scroll: e("components/showcase/2.0.0/scroll/views/show"),
			scroll_nav: e("components/showcase/2.0.0/scroll_nav/views/show"),
			image_text: e("components/showcase/2.0.0/image_text/views/show"),
			audio: e("components/showcase/2.0.0/audio/views/show")
		}
	}
}), define("components/showcase/2.0.0/base/views/add", ["require", "underscore", "jquery", "components/showcase/2.0.0/base/views/edit_base", "text!templates/add_content.html", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("components/showcase/2.0.0/base/views/edit_base"),
		s = e("text!templates/add_content.html"),
		o = e("core/utils");
	return i.extend({
		template: t.template(s),
		events: {
			"click .js-new-field": "handleAddField"
		},
		handleAddField: function(e) {
			e.stopPropagation();
			var t = this.layout.collection.MAX_LENGTH || 50;
			if (this.layout.collection.length >= t) return void o.errorNotify("内容最多" + t + "个。");
			var i = n(e.target).data("field-type"),
				s = window.SHOWCASE_CONFIG.models[i].initialize();
			this.model.collection ? (this.layout.collection.add(s, {
				at: this.model.index() + 1,
				silent: !0
			}), this.layout.collection.trigger("reset")) : this.layout.collection.add(s), this.layout.displayEditView(s)
		}
	})
}), define("text!templates/config_edit.html", [], function() {
	return '<form class="form-horizontal" novalidate>\n    <div class="control-group">\n        <script class="js-editor" type="text/plain"></script>\n    </div>\n</form>\n'
}), define("views/config_edit", ["require", "underscore", "components/showcase/2.0.0/base/views/edit_base", "text!templates/config_edit.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/edit_base"),
		i = e("text!templates/config_edit.html"),
		s = window.UE;
	return n.extend({
		template: t.template(i),
		onShow: function() {
			this.renderEditor()
		},
		renderEditor: function() {
			var e = this,
				t = this._editor = new s.ui.Editor({
					toolbars: [
						["bold", "italic", "underline", "strikethrough", "forecolor", "backcolor", "justifyleft", "justifycenter", "justifyright", "|", "insertunorderedlist", "insertorderedlist", "blockquote"],
						["emotion", "uploadimage", "insertvideo", "link", "removeformat", "|", "rowspacingtop", "rowspacingbottom", "lineheight", "paragraph", "fontsize"],
						["inserttable", "deletetable", "insertparagraphbeforetable", "insertrow", "deleterow", "insertcol", "deletecol", "mergecells", "mergeright", "mergedown", "splittocells", "splittorows", "splittocols"]
					],
					autoClearinitialContent: !1,
					autoFloatEnabled: !0,
					wordCount: !0,
					elementPathEnabled: !1,
					maximumWords: 1e4,
					initialFrameWidth: 458,
					initialFrameHeight: 360
				});
			t.addListener("blur", function() {
				e.model.set("content", e._editor.getContent())
			}), t.addListener("contentChange", function() {
				e.model.set("content", e._editor.getContent())
			}), t.render(this.$(".js-editor")[0]), t.ready(function() {
				t.setContent(e.model.get("content"))
			})
		},
		onClose: function() {
			this._editor && this.model.set("content", this._editor.getContent())
		}
	})
}), define("text!templates/config_show.html", [], function() {
	return '<div class="control-group">\n    <% if(content) { %>\n        <div class="custom-richtext">\n            <%= content %>\n        </div>\n    <% } else { %>\n        <div class="goods-details-block" style="background: #fff;">\n            <h4>商品详情区</h4>\n            <p>点击进行编辑</p>\n        </div>\n    <% } %>\n</div>\n<div class="actions">\n    <div class="actions-wrap">\n        <span class="action edit">编辑</span>\n    </div>\n</div>\n'
}), define("views/config_show", ["require", "underscore", "components/showcase/2.0.0/base/views/show_base", "text!templates/config_show.html"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/show_base"),
		i = e("text!templates/config_show.html");
	return n.extend({
		template: t.template(i)
	})
}), define("components/showcase/2.0.0/base/views/design", ["require", "underscore", "jquery", "backbone", "marionette", "text!templates/design.html", "text!templates/add_content.html", "components/showcase/2.0.0/base/views/show_collection", "text!components/showcase/2.0.0/base/templates/stroagealert.html", "components/showcase/2.0.0/config", "components/showcase/2.0.0/base/views/add", "views/config_edit", "views/config_show"], function(e) {
	var t = e("underscore"),
		n = e("jquery"),
		i = e("backbone"),
		s = e("marionette"),
		o = e("text!templates/design.html"),
		a = e("text!templates/add_content.html"),
		l = e("components/showcase/2.0.0/base/views/show_collection"),
		c = e("text!components/showcase/2.0.0/base/templates/stroagealert.html"),
		r = e("components/showcase/2.0.0/config"),
		d = e("components/showcase/2.0.0/base/views/add"),
		p = e("views/config_edit"),
		u = e("views/config_show");
	window.SHOWCASE_CONFIG = r;
	var m = s.Layout.extend({
		SHOWCASE_CONFIG: r,
		className: "app-design clearfix",
		template: t.template(o),
		regions: {
			configRegion: ".js-config-region",
			showRegion: ".js-fields-region",
			editRegion: ".js-sidebar-region",
			addRegion: ".js-add-region"
		},
		templateHelpers: {
			showAddContent: function() {
				return a
			}
		},
		collectionEvents: {
			sync: "fetched onShow"
		},
		_fetched: !1,
		initialize: function(e) {
			this.options = e || {}, this.triggerMethod("init", e), this.options.isCreating && this.fetched(), this.options.localStorage && (this._storagedData = this.collection.localFetch(), this._initAutoLocalStroage(), this.options.isCreating && this.showStorageAlert(), this.listenTo(this.collection, "sync", this.showStorageAlert)), this.listenTo(this.collection, "add remove reset sort sync", this.toggleSidebar), this.listenTo(window.NC, "notify:show", this.onNotifyShow), this.listenTo(window.NC, "notify:close", this.onNotifyClose), this.bindKeybroad()
		},
		fetched: function() {
			this._fetched = !0
		},
		toggleAction: function() {
			this.$(".app-actions").toggle(this._fetched)
		},
		onShow: function() {
			var e = this.collection.first();
			e && "config" === e.get("type") && this.configRegion.show(new u({
				model: e,
				layout: this
			})), this.showRegion.show(new l(t.extend({}, this.options, {
				collection: this.collection,
				layout: this
			}))), this.createAllEditView(), this.displayFirstEditView(), this.addRegion.show(new d({
				model: new i.Model,
				layout: this
			})), setTimeout(t.bind(this.toggleAddView, this), 10), this.toggleAction(), this.fixActionsPosition()
		},
		toggleAddView: function() {
			this.collection.includeFullscreenModel() ? this.$el.addClass("without-add-region") : this.$el.removeClass("without-add-region")
		},
		displayEditView: function(e, t) {
			t = t || {};
			var n = this.editRegion.currentView && this.editRegion.currentView.model;
			if (e = e || n) {
				var i = t.add ? d : this.getEditViewConstructor(e),
					s = this.getShowViewInstance(e),
					o = this;
				if (this.$(".app-sidebar").css("margin-top", s.position().top), this.trigger("editing", e), t.edit && this.scrollTop(s.offset().top - 10), n === e && !t.add && !t.edit) return void this._scorllToFirstError(this.editRegion.currentView);
				var a = new i({
					model: e,
					layout: this
				});
				t.error && a.once("show", function() {
					this.model.checkValid(), o._scorllToFirstError(this)
				}), t.notShow || this.editRegion.show(a)
			}
		},
		_scorllToFirstError: function(e) {
			var t = e.$(".control-group.error").first();
			t.length > 0 && this.scrollTop(t.offset().top - 10)
		},
		createAllEditView: function() {
			for (var e = this, t = this.collection.models, n = t.length - 1; n >= 0; n--) {
				var i = t[n];
				e.displayEditView(i, {
					notShow: !0
				})
			}
		},
		displayFirstEditView: function() {
			var e = this.collection.first();
			e && this.displayEditView(e)
		},
		getEditViewConstructor: function(e) {
			var t = e.get("type");
			if ("config" === t) return p;
			if (t in this.SHOWCASE_CONFIG.editViews) return this.SHOWCASE_CONFIG.editViews[t];
			throw new Error("type not exist.")
		},
		getShowViewInstance: function(e) {
			return "config" === e.get("type") ? this.configRegion.currentView : this.showRegion.currentView.children.findByModel(e)
		},
		add: function() {
			return this.sync({
				is_display: 1
			})
		},
		save: function() {
			return this.sync({
				is_display: 0
			})
		},
		preview: function() {
			return this.sync()
		},
		sync: function(e) {
			return this.collection.sync(e)
		},
		bindKeybroad: function() {
			var e = this;
			n(window).off("keydown.design").on("keydown.design", function(t) {
				var n = t.target.nodeName.toLowerCase();
				if (-1 === ["input", "textarea", "select"].indexOf(n)) switch (t.keyCode) {
				case 74:
					e._handleKeyDown(t);
					break;
				case 75:
					e._handleKeyUp(t)
				}
			})
		},
		_handleKeyUp: function(e) {
			var t, n = this.editRegion.currentView || {},
				i = n.model;
			i && (t = i.index() - 1, t >= 0 && (this.displayEditView(this.collection.at(t), {
				edit: !0
			}), e.preventDefault()))
		},
		_handleKeyDown: function(e) {
			var t, n = this.editRegion.currentView || {},
				i = n.model;
			i && (t = i.index() + 1, t < this.collection.length && (this.displayEditView(this.collection.at(t), {
				edit: !0
			}), e.preventDefault()))
		},
		_initAutoLocalStroage: function() {
			var e = function() {
					this.collection.localSync()
				};
			clearInterval(this._autoLocalStorageTimter), this._autoLocalStorageTimter = setInterval(t.bind(e, this), 3e4)
		},
		showStorageAlert: function() {
			if (!t.isEmpty(this._storagedData) && JSON.stringify(this._storagedData) !== JSON.stringify(this.collection)) {
				var e = n(c);
				e.one("click", ".js-use-storage", t.bind(function() {
					this.collection.reset(this._storagedData, {
						parse: !0,
						silent: !0
					}), this.onShow(), e.alert("close")
				}, this)), t.defer(t.bind(function() {
					this.$el.prepend(e)
				}, this))
			}
		},
		toggleSidebar: function() {
			this.collection.length ? this.$(".app-sidebar").show() : this.$(".app-sidebar").hide()
		},
		scrollTop: function(e, t) {
			t = t || 200, n("html, body").animate({
				scrollTop: e
			}, t)
		},
		fixActionsPosition: function() {
			this.$(".app-actions").css("bottom", n(".js-notify").height())
		},
		onNotifyShow: function() {
			this.fixActionsPosition()
		},
		onNotifyClose: function() {
			this.$(".app-actions").css("bottom", 0)
		},
		onClose: function() {
			clearInterval(this._autoLocalStorageTimter)
		}
	});
	return m
}), define("text!templates/load_modal.html", [], function() {
	return '<%\n    var ts = window._global.team_status;\n    var paipai_exception = ts.pp_authenticated == \'0\' || ts.pp_guarantee_compensation == \'0\'\n%>\n<div class="modal-header">\n    <a class="close" data-dismiss="modal">×</a>\n    <h3 class="title">选择上架店铺</h3>\n</div>\n<div class="modal-body">\n    <div class="goods-detail-modal-body">\n        <p>\n            <label class="checkbox">\n                <input type="checkbox" <% if(is_display & 1) { %>checked="checked" disabled="disabled" <% } %> name="loadShopname" value="1">上架到口袋通店铺\n            </label>\n        </p>\n        <p>\n            <label class="checkbox">\n                <input type="checkbox" <% if(is_display & 2 && !paipai_exception) { %>checked="checked" <% } %> <% if(paipai_exception) { %>disabled="disabled" <% } %> name="loadShopname" value="2" class="js-paipai-shop">上架到拍拍店铺\n            </label>\n        </p>\n        <% if(out_id && !paipai_exception) { %>\n        <div style="margin-left: 20px;" class="js-paipai-type <% if(!(is_display & 2)) { %>hide<% } %>">\n            <p>\n                <label class="checkbox inline"><input type="checkbox" name="paipaiType" class="js-type-title" <% if(paipai_exception) { %>disabled="disabled" <% } else { %>checked="checked"<% }%>>商品标题和主图</label>\n                <label class="checkbox inline"><input type="checkbox" name="paipaiType" class="js-type-stock" <% if(paipai_exception) { %>disabled="disabled" <% } else { %>checked="checked"<% }%>>类目/属性、库存/价格</label>\n            </p>\n            <p>\n                <label class="checkbox inline"><input type="checkbox" name="paipaiType" class="js-type-detail" <% if(paipai_exception) { %>disabled="disabled" <% } else { %>checked="checked"<% }%>>商品详情</label>\n                <label class="checkbox inline"><input type="checkbox" name="paipaiType" class="js-type-logistics" <% if(paipai_exception) { %>disabled="disabled" <% } else { %>checked="checked"<% }%>>物流、限购等其他信息</label>\n            </p>\n            <p class="js-paipai-type-error paipai-type-error hide">至少选择一项内容</p>\n        </div>\n        <% } %>\n        <% if(paipai_exception) { %>\n        <p class="" style="color: #dd0000">拍拍店铺异常，无法上架商品到拍拍。<a href="<%= window._global.url.www + \'/showcase/paipai\' %>">（查看）</a></p>\n        <% } %>\n    </div>\n</div>\n<div class="modal-footer">\n    <div class="pull-left" style="margin-left: 40px;">\n        <a href="javascript:;" class="btn btn-primary js-load" data-loading-text="上架...">上架</a>\n        <a href="javascript:;" class="btn js-cancel">取消</a>\n    </div>\n</div>\n'
}), define("views/load_modal", ["require", "underscore", "marionette", "text!templates/load_modal.html", "core/utils", "components/validation/validate"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!templates/load_modal.html"),
		s = e("core/utils");
	e("components/validation/validate");
	var o = n.ItemView.extend({
		className: "modal fade hide goods-detail-modal",
		template: t.template(i),
		ui: {
			load: ".js-load",
			cancel: ".js-cancel"
		},
		events: {
			"change input[name=loadShopname]": "handleShopChange",
			"change input[name=paipaiType]": "handleTypeChange",
			hidden: "hidden",
			"click @ui.load": "handleLoad",
			"click @ui.cancel": "handleCancel"
		},
		initialize: function() {
			this.render()
		},
		onRender: function() {
			this.$el.modal("show"), this.$el.css({
				position: "fixed",
				"margin-top": "0"
			})
		},
		serializeData: function() {
			return {
				is_display: this.collection.is_display,
				out_id: this.collection.out_id
			}
		},
		handleShopChange: function() {
			this.$(".js-paipai-shop").prop("checked") ? this.$(".js-paipai-type").show() : this.$(".js-paipai-type").hide(), this.$("[name=loadShopname]:checked").length > 0 ? this.enabledLoadBtn() : this.disabledLoadBtn()
		},
		handleTypeChange: function() {
			this.$("[name=paipaiType]:checked").length > 0 ? this.$(".js-paipai-type-error").removeClass("disabled").hide() : this.$(".js-paipai-type-error").addClass("disabled").show()
		},
		hideModal: function() {
			this.$el.modal("hide")
		},
		hidden: function() {
			t.delay(s.clearNotify, 1e3), this.$el.data("modal", null), this.close()
		},
		handleLoad: function() {
			if (!(this.ui.load.hasClass("btn-disabled") || this.collection.out_id && this.$(".js-paipai-shop").prop("checked") && !this.$("[name=paipaiType]:checked").length)) {
				var e = 0,
					t = {
						operate: 1
					};
				this.$("[name=loadShopname]:checked").each(function(t, n) {
					var i = +n.value;
					e += i
				}), t.shop = e, 2 & e && this.collection.out_id && (t.paipai_type = {
					title: +this.$(".js-type-title").prop("checked"),
					stock: +this.$(".js-type-stock").prop("checked"),
					detail: +this.$(".js-type-detail").prop("checked"),
					logistics: +this.$(".js-type-logistics").prop("checked")
				});
				var n = this;
				this.ui.load.button("loading"), this.collection.sync(t).done(function() {
					s.successNotify("上架成功。", function() {
						window.location.href = window._global.url.www + "/showcase/goods"
					})
				}).fail(function() {
					n.ui.load.button("reset")
				})
			}
		},
		handleCancel: function() {
			this.hideModal()
		},
		disabledLoadBtn: function() {
			this.ui.load.addClass("btn-disabled").attr("disabled", "disabled")
		},
		enabledLoadBtn: function() {
			this.ui.load.removeClass("btn-disabled").removeAttr("disabled")
		}
	});
	return o
}), define("text!templates/unload_modal.html", [], function() {
	return '<%\n    var ts = window._global.team_status;\n    var paipai_exception = ts.pp_authenticated == \'0\' || ts.pp_guarantee_compensation == \'0\'\n%>\n<div class="modal-header">\n    <a class="close" data-dismiss="modal">×</a>\n    <h3 class="title">商品同时在多店铺售卖，选择要下架店铺</h3>\n</div>\n<div class="modal-body">\n    <div class="goods-detail-modal-body">\n        <p>\n            <label class="checkbox">\n                <input type="checkbox" checked="checked" name="unloadShopname" value="1" class="js-kdt-shop">从口袋通店铺下架\n            </label>\n        </p>\n        <p>\n            <label class="checkbox">\n                <input type="checkbox" <% if(paipai_exception) { %>disabled="disabled" <% } else { %>checked="checked"<% }%> name="unloadShopname" value="2" class="js-paipai-shop">从拍拍店铺下架\n            </label>\n        </p>\n        <% if(paipai_exception) { %>\n        <p class="" style="color: #dd0000">拍拍店铺异常，无法从拍拍下架。<a href="<%= window._global.url.www + \'/showcase/paipai\' %>">（查看）</a></p>\n        <% } %>\n    </div>\n</div>\n<div class="modal-footer">\n    <div class="pull-left" style="margin-left: 40px;">\n        <a href="javascript:;" class="btn btn-primary js-unload" data-loading-text="下架...">下架</a>\n        <a href="javascript:;" class="btn js-cancel">取消</a>\n    </div>\n</div>\n'
}), define("views/unload_modal", ["require", "underscore", "marionette", "text!templates/unload_modal.html", "core/utils", "components/validation/validate"], function(e) {
	var t = e("underscore"),
		n = e("marionette"),
		i = e("text!templates/unload_modal.html"),
		s = e("core/utils");
	e("components/validation/validate");
	var o = n.ItemView.extend({
		className: "modal fade hide goods-detail-modal",
		template: t.template(i),
		ui: {
			unload: ".js-unload",
			cancel: ".js-cancel"
		},
		events: {
			"change input[name=unloadShopname]": "handleShopChange",
			hidden: "hidden",
			"click @ui.unload": "handleUnload",
			"click @ui.cancel": "handleCancel"
		},
		initialize: function() {
			this.render()
		},
		onRender: function() {
			this.$el.modal("show"), this.$el.css({
				position: "fixed",
				"margin-top": "0"
			})
		},
		serializeData: function() {
			return {
				is_display: this.collection.is_display,
				out_id: this.collection.out_id
			}
		},
		handleShopChange: function() {
			this.$("[name=unloadShopname]:checked").length > 0 ? this.enabledUnloadBtn() : this.disabledUnloadBtn()
		},
		hideModal: function() {
			this.$el.modal("hide")
		},
		hidden: function() {
			t.delay(s.clearNotify, 1e3), this.$el.data("modal", null), this.close()
		},
		handleUnload: function() {
			if (!this.ui.unload.hasClass("btn-disabled")) {
				var e = 0,
					t = {
						operate: 0
					};
				this.$("[name=unloadShopname]:checked").each(function(t, n) {
					var i = +n.value;
					e += i
				}), t.shop = e;
				var n = this;
				this.ui.unload.button("loading"), this.collection.sync(t).done(function() {
					s.successNotify("下架成功。", function() {
						window.location.href = window._global.url.www + "/showcase/goods"
					})
				}).fail(function() {
					n.ui.unload.button("reset")
				})
			}
		},
		handleCancel: function() {
			this.hideModal()
		},
		disabledUnloadBtn: function() {
			this.ui.unload.addClass("btn-disabled").attr("disabled", "disabled")
		},
		enabledUnloadBtn: function() {
			this.ui.unload.removeClass("btn-disabled").removeAttr("disabled")
		}
	});
	return o
}), define("views/step3", ["require", "underscore", "components/showcase/2.0.0/base/views/design", "views/load_modal", "views/unload_modal", "core/reqres", "core/utils"], function(e) {
	var t = e("underscore"),
		n = e("components/showcase/2.0.0/base/views/design"),
		i = e("views/load_modal"),
		s = e("views/unload_modal"),
		o = e("core/reqres"),
		a = e("core/utils"),
		l = n.extend({
			ui: {
				load: ".js-btn-load",
				unload: ".js-btn-unload",
				preview: ".js-btn-preview"
			},
			events: {
				"click @ui.load": "handleLoad",
				"click @ui.unload": "handleUnload",
				"click @ui.preview": "handlePreview"
			},
			regions: t.extend({}, n.prototype.regions, {
				modalRegion: ".js-modal-region"
			}),
			onInit: function(e) {
				var t = this;
				t.collection = e.collection, window.fieldCollection = t.collection, window.design = t, t.setupValidationResp(), t.fetched()
			},
			setupValidationResp: function() {
				var e = this;
				o.setHandler("step3:validate", function() {
					var t = e.collection.validate();
					return t
				})
			},
			handleLoad: function() {
				var e = this,
					t = e.collection.validate();
				return t ? !1 : void(e.needShowModal() ? e.modalRegion.show(new i({
					collection: e.collection
				})) : (e.ui.load.button("loading"), e.sync({
					is_display: 1,
					shop: 1,
					operate: 1
				}).done(function() {
					a.successNotify("上架成功。", function() {
						window.location.href = window._global.url.www + "/showcase/goods"
					})
				}).fail(function() {
					e.ui.load.button("reset")
				})))
			},
			handleUnload: function() {
				var e = this,
					t = e.collection.validate();
				return t ? !1 : void(e.needShowModal() && 3 === +e.collection.is_display ? e.modalRegion.show(new s({
					collection: e.collection
				})) : (e.ui.unload.button("loading"), e.sync({
					shop: e.collection.is_display,
					operate: 0
				}).done(function() {
					a.successNotify("下架成功。", function() {
						window.location.href = window._global.url.www + "/showcase/goods#list&is_display=0"
					})
				}).fail(function() {
					e.ui.unload.button("reset")
				})))
			},
			handlePreview: function() {
				var e = this,
					t = e.collection.validate();
				return t ? !1 : (e.ui.preview.button("loading"), void e.preview().done(function(t) {
					a.successNotify("保存成功，正在重定向到 预览页面。", function() {
						var n = e.collection.alias || t.alias;
						window.location.href = window._global.url.wap + "/showcase/goods?alias=" + n
					})
				}).fail(function() {
					e.ui.preview.button("reset")
				}))
			},
			needShowModal: function() {
				var e = this.collection.at(0),
					t = +e.get("class_type");
				return !!window._global.team_status.pp_shop && t
			}
		});
	return l
}), define("text!templates/app.html", [], function() {
	return '<ul class="ui-nav-tab">\n    <li data-next-step="1" class="js-switch-step js-step-1"><a href="javascript:;">1.选择商品品类</a></li>\n    <li data-next-step="2" class="js-switch-step js-step-2"><a href="javascript:;">2.编辑基本信息</a></li>\n    <li data-next-step="3" class="js-switch-step js-step-3"><a href="javascript:;">3.编辑商品详情</a></li>\n</ul>\n<div id="step-content-region">\n</div>\n'
}), define("views/app", ["require", "underscore", "backbone", "marionette", "vendor/nprogress", "core/reqres", "core/event", "core/utils", "commons/utils", "models/config", "collections/field", "views/step1", "views/step2", "views/step3", "text!templates/app.html"], function(e) {
	var t = e("underscore"),
		n = e("backbone"),
		i = e("marionette"),
		s = e("vendor/nprogress"),
		o = e("core/reqres"),
		a = e("core/event"),
		l = e("core/utils"),
		c = e("commons/utils"),
		r = e("models/config"),
		d = e("collections/field"),
		p = e("views/step1"),
		u = e("views/step2"),
		m = e("views/step3"),
		h = e("text!templates/app.html"),
		v = i.Layout.extend({
			tagName: "div",
			className: "goods-edit-area",
			template: t.template(h),
			regions: {
				stepContentRegion: "#step-content-region"
			},
			ui: {
				tip: ".js-tip",
				switchTabs: "li.js-switch-step",
				switchBtn: "button.js-switch-step",
				switchLink: "a.js-switch-step"
			},
			events: {
				"click @ui.switchTabs": "switchStep",
				"click @ui.switchBtn": "switchStep",
				"click @ui.switchLink": "switchStep"
			},
			modelEvents: {},
			initialize: function() {
				var e = this;
				e.setServerUrl(), e.ajaxFlag = !1, e.listenTo(a, "goods:create", e.openCreateView), e.listenTo(a, "goods:edit", e.openEditView)
			},
			init: function() {},
			onRender: function() {
				var e = this;
				e.bindUIElements()
			},
			onShow: function() {},
			setServerUrl: function() {
				var e = this,
					t = window._global.url.www;
				t += "goods" === window._global.goods_type ? "/showcase/goods/item.json" : "/showcase/material/item.json", e.goodsUrl = t
			},
			showTip: function() {
				var e = this,
					t = e.model.get("class_type");
				"0" != t && e.ui.tip.show()
			},
			updateCurrentStep: function(e) {
				var t = this;
				t.currentStep = e
			},
			openCreateView: function(e) {
				var t = this;
				s.done(), t.collection = new d([], {
					url: t.goodsUrl,
					isCreating: !0,
					localStorage: !1
				});
				var n = t.model = new r;
				t.collection.add(n), (!e || e > 2) && (e = 1), t.initBaseModules(), t.updateCurrentStep(e), t["showStep" + t.currentStep + "View"]()
			},
			openEditView: function(e, t) {
				var n = this;
				return e ? (n.collection = new d([], {
					url: n.goodsUrl,
					id: e,
					isCreating: !1,
					localStorage: !1
				}), t = t || 2, n.updateCurrentStep(t), void n.fetchCollectionData()) : (l.errorNotify("请输入一个正确的商品ID。"), !1)
			},
			initBaseModules: function() {
				var e = this;
				return e.initFlag ? !1 : (e.setAttrsResp(), e.setupValidation(), void(e.initFlag = !0))
			},
			setupValidation: function() {
				var e = this;
				n.Validation.bind(e), e.listenTo(e.model, "change", e.validateModel)
			},
			setAttrsResp: function() {
				var e = this,
					t = e.model;
				o.setHandler("goods_attr:get", function(e) {
					var n = t.get(e);
					return n
				})
			},
			validateModel: function(e) {
				e.validate(e.changed)
			},
			fetchCollectionData: function() {
				var e = this;
				l.clearNotify();
				var t = e.collection.fetch();
				t.done(function(t) {
					e.fetchSuccess(t)
				}).fail(function() {
					e.fetchError()
				})
			},
			fetchSuccess: function() {
				var e = this;
				s.done(), e.model = e.collection.at(0), e.initBaseModules(), e["showStep" + e.currentStep + "View"]()
			},
			fetchError: function() {
				l.errorNotify("获取商品数据失败。")
			},
			switchNavTab: function(e) {
				var t = this;
				t.ui.switchTabs.removeClass("active");
				var n = t.ui.switchTabs.filter(".js-step-" + e);
				n.addClass("active")
			},
			showStep1View: function() {
				var e = this;
				e.step1View = new p({
					model: e.model
				}), e.switchNavTab(1), e.stepContentRegion.show(e.step1View)
			},
			showStep2View: function() {
				var e = this;
				e.step2View = new u({
					model: e.model
				}), e.switchNavTab(2), e.stepContentRegion.show(e.step2View)
			},
			showStep3View: function() {
				var e = this;
				e.step3View = new m({
					collection: e.collection
				}), e.switchNavTab(3), e.stepContentRegion.show(e.step3View)
			},
			toStep1: function() {
				var e = this;
				e.prepareToStep1()
			},
			toStep2: function() {
				var e = this,
					t = e.currentStep,
					n = o.request("step" + t + ":validate");
				if (n) return e.errorHandler(2), !1;
				if (1 === t) {
					var i = o.request("class_info:get", "cid"),
						s = e.model.get("cid"),
						a = e.model.get("sku_name_1");
					i !== s && a ? c.needConfirm("修改商品的综合类目信息需要重新编辑商品规格和库存信息，是否继续？", function() {
						e.prepareToStep2()
					}, null) : e.prepareToStep2()
				} else e.prepareToStep2()
			},
			fixAuctionGoodsPrice: function() {
				var e = this,
					t = e.model,
					n = t.get("selling_way"),
					i = t.get("price"),
					s = t.get("auction_start_price");
				return "1" != n ? !1 : void(i && 0 !== Number(i) || t.set("price", s, {
					silent: !0
				}))
			},
			toStep3: function() {
				var e = this;
				e.fixAuctionGoodsPrice();
				var t = (e.model.validate(), o.request("attrs:validate")),
					n = o.request("stock:validate");
				return t || n > 0 || !e.model.isValid() ? (e.errorHandler(3), !1) : void e.prepareToStep3()
			},
			prepareToStep1: function() {
				var e = this;
				e.showStep1View(), e.appNavigate(1)
			},
			prepareToStep2: function() {
				var e = this,
					t = o.request("class_info:has_changed");
				t && e.updateGoodsModel(), e.showStep2View(), e.appNavigate(2)
			},
			prepareToStep3: function() {
				var e = this;
				e.showStep3View(), e.appNavigate(3)
			},
			collectStep2Data: function() {
				var e = this,
					t = e.getBaseData();
				return t.data[0] = e.model.toJSON(), t.data = JSON.stringify(t.data), t
			},
			getBaseData: function() {
				var e = this,
					t = e.collection.toJSON();
				return t
			},
			saveStep2Data: function(e) {
				{
					var t = this,
						n = t.$("button.js-switch-step");
					$.ajax({
						url: t.goodsUrl,
						type: "POST",
						dataType: "json",
						timeout: 8e3,
						cache: !1,
						data: e,
						beforeSend: function() {
							t.ajaxFlag = !0, c.button(n, "保存中...", !0)
						}
					}).done(function(e) {
						0 === e.code ? t.prepareToStep3(e.data) : (l.errorNotify(e.msg), c.button(n, "下一步", !1))
					}).fail(function() {
						c.button(n, "下一步", !1)
					}).always(function() {
						t.ajaxFlag = !1
					})
				}
			},
			switchStep: function(e) {
				var t = this;
				if (e.preventDefault(), t.ajaxFlag) return !1;
				var n = $(e.currentTarget),
					i = n.data("next-step");
				t["toStep" + i]()
			},
			appNavigate: function(e, t) {
				var i = this;
				i.updateCurrentStep(e);
				var s = i.processHash(e);
				t = "undefined" == typeof t ? !1 : t, n.history.navigate(s, {
					trigger: t
				})
			},
			processHash: function(e) {
				var t = n.history.fragment,
					i = l.deparam(t);
				return i.step = e, t = $.param(i)
			},
			errorHandler: function(e) {
				var t = this;
				return e - t.currentStep > 1 ? (l.errorNotify("请一步步填写页面所需的信息。"), !1) : void t.focusFirstError()
			},
			focusFirstError: function() {
				var e = $(".error-message:eq(0)").parents(".control-group");
				if (0 === e.length) return !1;
				var t = e.offset(),
					n = t.top - 10;
				$(window).scrollTop(n)
			},
			updateGoodsModel: function() {
				var e = this,
					n = {},
					i = o.request("class_info:get");
				t(n).extend(i), e.model.set(n)
			}
		});
	return v
}), define("app", ["require", "underscore", "marionette", "core/utils", "views/app"], function(e) {
	var t = (e("underscore"), e("marionette")),
		n = e("core/utils");
	window.Utils = n;
	var i = e("views/app"),
		s = new t.Application;
	return s.addRegions({
		appRegion: "#app-region"
	}), s.addInitializer(function(e) {
		var t = new i(e);
		s.appRegion.show(t)
	}), s
}), define("routers/router", ["require", "common", "underscore", "components/page_help/help", "backbone", "marionette"], function(e) {
	var t = (e("common"), e("underscore"), e("components/page_help/help")),
		n = (e("backbone"), e("marionette")),
		i = n.AppRouter.extend({
			appRoutes: {
				"": "createGoods",
				"id=:id&step=:step": "editGoods",
				"id=:id": "editGoods",
				"step=:step": "createGoods"
			}
		});
	return t("showcase_goods_create"), i
}), define("controllers/router", ["require", "underscore", "backbone", "marionette", "core/event"], function(e) {
	var t = (e("underscore"), e("backbone"), e("marionette"), e("core/event"));
	return {
		createGoods: function(e) {
			e = e ? Number(e) : "", t.trigger("goods:create", e)
		},
		editGoods: function(e, n) {
			n = n ? Number(n) : "", t.trigger("goods:edit", e, n)
		}
	}
}), define("main", ["require", "common", "backbone", "vendor/nprogress", "bootstrap", "components/message/message_bot_lite", "app", "routers/router", "controllers/router"], function(e) {
	var t = (e("common"), e("backbone")),
		n = e("vendor/nprogress");
	e("bootstrap");
	var i = e("components/message/message_bot_lite"),
		s = e("app"),
		o = e("routers/router"),
		a = e("controllers/router");
	return {
		initialize: function(e) {
			i.init(), n.start(), s.start(e), window.router = new o({
				controller: a
			}), t.history.start()
		}
	}
});
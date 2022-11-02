(function ()
{
    "use strict";
    var pluginName = 'scTabs', 
		defaults =  {
        tabContainer : "#scrollTabs_tab_container", 
		tabSelector : false, 
		contentContainer : "#scrollTabs_content_container", 
		contentInner : "#scrollTabs_content_inner", 
		contentSelector : false, 
		initialTab : 0, 
		autoOrder : true, 
		autoplayInterval : 0, 
		animSpeed : 300,
		autoHeight : true, 
		animation : "easeInOutExpo", 
		direction : "horizontal", 
        onEvent : "click"
    };
    function scTabs(element, options)
    {
        this.element = element;
        this.$element = $(this.element);
        this.options = $.extend({}, defaults, options);
        this.$tab_container = this.$element.find(this.options.tabContainer);
        this.$tab_el = (this.options.tabSelector === false) ? this.$tab_container.children() : this.$tab_container.find(this.options.tabSelector);
        this.$tab_length = this.$tab_el.length - 1;
        this.$content_container = this.$element.find(this.options.contentContainer);
        this.$content_inner = this.$content_container.find(this.options.contentInner);
        this.$content_el = (this.options.contentSelector === false) ? this.$content_inner.children() : this.$content_inner.find(this.options.contentSelector);
        this.$external_tab_link = this.$content_el.find("a[href|='#tab']");
        this.width = this.$element.outerWidth();
        this.visible = null;
        this.interval = null;
        this.query = false;
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }
    scTabs.prototype = 
    {
        init : function ()
        {
            setHtmlDefaults.call(this);
            this.$content_el.css(this.getDirObj(this.width));
            if (this.options.autoplayInterval > 0)
            {
                this.setAutoplay();
                this.$element.on("mouseenter mouseleave", {
                    self : this
                },
                this.bindHover);
            }
            this.$element.find("a[href]").on("click", function (e)
            {
                e.preventDefault();
                return;
            });
            this.$tab_el.on(this.options.onEvent, {
                self : this
            },
            this.bindTabs);
            this.$external_tab_link.on("click", {
                self : this
            },
            function (e)
            {
                var val = e.data.self.getLinkVal($(this));
                if ($.isNumeric(val)) {
                    e.data.self.autoLoad(parseInt(val, 10));
                }
                else {
                    e.data.self.$tab_el.filter(val).trigger(e.data.self.options.onEvent);
                }
            });
            this.autoLoad(this.options.initialTab);
        },
        setAutoplay : function ()
        {
            var self = this;
            clearInterval(this.interval);
            this.interval = setInterval(function ()
            {
                self.autoLoad(self.visible + 1);
            },
            this.options.autoplayInterval);
        },
        bindHover : function (e)
        {
            if (e.type === "mouseenter") {
                clearInterval(e.data.self.interval);
            }
            else {
                e.data.self.setAutoplay();
            }
        },
        bindTabs : function (e)
        {
            e.data.self.showw(this);
        },
        autoLoad : function (i)
        {
            this.showw((i > this.$tab_length) ? this.$tab_el[0] : ((i < 0) ? this.$tab_el[this.$tab_length] : this.$tab_el[i]));
        },
        showw : function (el)
        {
            var i = parseInt(this.getIndex(el), 10), visible_el, new_el, href, direction = (this.visible > i) ? 1 :- 1;
            if (this.visible === i) {
                return;
            }
            if (this.options.autoOrder) {
                visible_el = $(this.$content_el[this.visible]);
                new_el = $(this.$content_el[i]);
            }
            else
            {
                href = this.getHref($(el));
                visible_el = $(this.$content_el.filter(this.getHref(this.$tab_el[this.visible])));
                new_el = $(this.$content_el.filter(href));
            }
            if (visible_el.length && visible_el.queue("fx").length) {
                return false;
            }
            this.toggleActiveTab(i);
            new_el.css(this.getDirObj(-direction * this.width)).stop(true, true).animate(this.getDirObj(0), 
            this.options.animSpeed, this.options.animation);
            visible_el.stop(true, true).animate(this.getDirObj(direction * this.width), this.options.animSpeed, 
            this.options.animation);
            this.setHeight(new_el);
            this.visible = i;
        },
        toggleActiveTab : function (i)
        {
            this.$tab_el.filter(".active").removeClass("active");
            $(this.$tab_el[i]).addClass("active");
        },
        setHeight : function (el)
        {
            if (this.options.autoHeight)
            {
                this.$content_container.stop(true, true).animate({
                    height : this.getHeight(el) 
                },
                this.options.animSpeed * 2  / 3, this.options.animation);
            }
        },
        getDirObj : function (val)
        {
            return (this.options.direction === "vertical") ? {
                top : val
            }
             : {
                left : val
            };
        },
        getIndex : function (el)
        {
            return parseInt($(el).index(), 10);
        },
        getHeight : function (el)
        {
            return el.outerHeight();
        },
        getLinkVal : function (el)
        {
            var temp = this.getHref(el).split("-");
            return temp[temp.length - 1];
        },
        getHref : function (el)
        {
            return $(el).attr("href") || false;
        }
    };
    $.fn[pluginName] = function (options)
    {
        return this.each(function ()
        {
            if (!$.data(this, 'plugin_' + pluginName)) {
                $.data(this, 'plugin_' + pluginName, new scTabs(this, options));
            }
        });
    };
    function setHtmlDefaults()
    {
        if (typeof this.$element.attr("class") == "undefined") {
            return false;
        }
        var arr_class = this.$element.attr("class").split(" ");
        var self = this;
        $.grep(arr_class, function (n, i)
        {
            if (n.split("-").length == 2 && n.split("-")[0]in self._defaults)
            {
                var val = n.split("-");
                if (parseInt(val[1], 10) == val[1] && typeof self.options[val[0]] == "number") {
                    self.options[val[0]] = parseInt(val[1], 10);
                }
                if (typeof self.options[val[0]] == "string") {
                    self.options[val[0]] = (val[1]);
                }
                else if (typeof self.options[val[0]] == "boolean") {
                    try {
                        self.options[val[0]] = eval(val[1]);
                    }
                    catch (er) {
                        console.log(er);
                    }
                }
                return true;
            }
            if (n in self._defaults) {
                self.options[n] = true;
                return true;
            }
        });
    }
})(jQuery);

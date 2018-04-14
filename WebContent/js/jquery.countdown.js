(function ($, window, document, undefined) {

    "use strict";
    var pluginName = 'countDown';

    var defaults = {
        css_class: 'countdown',
        always_show_days: false,
        with_labels: true,
        with_seconds: true,
        with_separators: true,
        with_hh_leading_zero: true,
        with_mm_leading_zero: true,
        with_ss_leading_zero: true,
        label_dd: 'days',
        label_hh: '',
        label_mm: '',
        label_ss: '',
        separator: ':',
        separator_days: ','
    };

    function CountDown(element, options) {
        this.element = $(element);
        this.options = $.extend({}, defaults, options);
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    $.extend(CountDown.prototype, {

        init: function () {
            if (this.element.children().length) {
                return;
            }
            if (this.element.attr('datetime')) {  // Try to parse the datetime attribute first.
                this.endDate = this.parseEndDate(this.element.attr('datetime'));
            }
            if (this.endDate === undefined) {  // Fallback on the text content.
                this.endDate = this.parseEndDate(this.element.text());
            }
            if (this.endDate === undefined) {  // Unable to parse a date.
                return;
            }
            if (this.element.is('time')) {
                this.timeElement = this.element;
            } else {
                this.timeElement = $('<time></time>');
                this.element.html(this.timeElement);
            }
            this.markup();
            this.setTimeoutDelay = this.sToMs(1);
            this.daysVisible = true;
            this.timeElement.on('time.elapsed', this.options.onTimeElapsed);
            this.timeElement.on('time.tick', this.options.onTick);
            this.doCountDown();
        },

        parseEndDate: function (str) {

            var d;

            d = this.parseDuration(str);
            if (d instanceof Date) {
                return d;
            }

            d = this.parseDateTime(str);
            if (d instanceof Date) {
                return d;
            }

            d = this.parseHumanReadableDuration(str);
            if (d instanceof Date) {
                return d;
            }

            // Try to parse a string representation of a date.
            // https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date/parse
            d = Date.parse(str);
            if (!isNaN(d)) {
                return new Date(d);
            }

        },

        parseDuration: function (str) {
            var timeArray = str.match(/^P(?:(\d+)D)?T?(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)(?:\.(\d{1,3}))?S)?$/);
            if (timeArray) {
                var d, dd, hh, mm, ss, ms;
                dd = timeArray[1] ? this.dToMs(timeArray[1]) : 0;
                hh = timeArray[2] ? this.hToMs(timeArray[2]) : 0;
                mm = timeArray[3] ? this.mToMs(timeArray[3]) : 0;
                ss = timeArray[4] ? this.sToMs(timeArray[4]) : 0;
                ms = timeArray[5] ? parseInt(timeArray[5], 10) : 0;
                d = new Date();
                d.setTime(d.getTime() + dd + hh + mm + ss + ms);
                return d;
            }
        },
        parseDateTime: function (str) {
            var timeArray = str.match(
                /^(\d{4,})-(\d{2})-(\d{2})[T\s](\d{2}):(\d{2})(?:\:(\d{2}))?(?:\.(\d{1,3}))?([Z\+\-\:\d]+)?$/);
            if (timeArray) {
                var offset = timeArray[8] ? timeArray[8].match(/^([\+\-])?(\d{2}):?(\d{2})$/) : undefined;

                // Time difference between UTC and the given time zone in milliseconds.
                var utcOffset = 0;
                if (offset) {
                    utcOffset = this.hToMs(offset[2]) + this.mToMs(offset[3]);
                    utcOffset = (offset[1] === '-') ? utcOffset : -utcOffset;
                }

                var d, yy, mo, dd, hh, mm, ss, ms;
                yy = timeArray[1];
                mo = timeArray[2] - 1;
                dd = timeArray[3];
                hh = timeArray[4] || 0;
                mm = timeArray[5] || 0;
                ss = timeArray[6] || 0;
                ms = timeArray[7] || 0;
                d = new Date(Date.UTC(yy, mo, dd, hh, mm, ss, ms));

                d.setTime(d.getTime() + utcOffset);

                return d;

            }
        },

        parseHumanReadableDuration: function (str) {
            var timeArray = str.match(/^(?:(\d+).+\s)?(\d+)[h:]\s?(\d+)[m:]?\s?(\d+)?[s]?(?:\.(\d{1,3}))?$/);
            if (timeArray) {
                var d, dd, hh, mm, ss, ms;
                d = new Date();
                dd = timeArray[1] ? this.dToMs(timeArray[1]) : 0;
                hh = timeArray[2] ? this.hToMs(timeArray[2]) : 0;
                mm = timeArray[3] ? this.mToMs(timeArray[3]) : 0;
                ss = timeArray[4] ? this.sToMs(timeArray[4]) : 0;
                ms = timeArray[5] ? parseInt(timeArray[5], 10) : 0;
                d.setTime(d.getTime() + dd + hh + mm + ss + ms);
                return d;
            }
        },

        // Convert seconds to milliseconds.
        sToMs: function (s) {
            return parseInt(s, 10) * 1000;
        },

        // Convert minutes to milliseconds.
        mToMs: function (m) {
            return parseInt(m, 10) * 60 * 1000;
        },

        // Convert hours to milliseconds.
        hToMs: function (h) {
            return parseInt(h, 10) * 60 * 60 * 1000;
        },

        // Convert days to milliseconds.
        dToMs: function (d) {
            return parseInt(d, 10) * 24 * 60 * 60 * 1000;
        },

        // Extract seconds (0-59) from the given timedelta expressed in milliseconds.
        // A timedelta represents a duration, the difference between two dates or times.
        msToS: function (ms) {
            return parseInt((ms / 1000) % 60, 10);
        },

        // Extract minutes (0-59) from the given timedelta expressed in milliseconds.
        msToM: function (ms) {
            return parseInt((ms / 1000 / 60) % 60, 10);
        },

        // Extract hours (0-23) from the given timedelta expressed in milliseconds.
        msToH: function (ms) {
            return parseInt((ms / 1000 / 60 / 60) % 24, 10);
        },

        // Extract the number of days from the given timedelta expressed in milliseconds.
        msToD: function (ms) {
            return parseInt((ms / 1000 / 60 / 60 / 24), 10);
        },

        markup: function () {
            // Prepare the HTML content of the <time> element.
            var html = [
                '<span class="item item-dd">',
                    '<span class="dd"></span>',
                    '<span class="label label-dd">', this.options.label_dd, '</span>',
                '</span>',
                '<span class="separator separator-dd">', this.options.separator_days, '</span>',
                '<span class="item item-hh">',
                    '<span class="hh-1"></span>',
                    '<span class="hh-2"></span>',
                    '<span class="label label-hh">', this.options.label_hh, '</span>',
                '</span>',
                '<span class="separator">', this.options.separator, '</span>',
                '<span class="item item-mm">',
                    '<span class="mm-1"></span>',
                    '<span class="mm-2"></span>',
                    '<span class="label label-mm">', this.options.label_mm, '</span>',
                '</span>',
                '<span class="separator">', this.options.separator, '</span>',
                '<span class="item item-ss">',
                    '<span class="ss-1"></span>',
                    '<span class="ss-2"></span>',
                    '<span class="label label-ss">', this.options.label_ss, '</span>',
                '</span>'
            ];
            this.timeElement.html(html.join(''));
            // Customize HTML according to options.
            if (!this.options.with_labels) {
                this.timeElement.find('.label').remove();
            }
            if (!this.options.with_separators) {
                this.timeElement.find('.separator').remove();
            }
            if (!this.options.with_seconds) {
                this.timeElement.find('.item-ss').remove();
                this.timeElement.find('.separator').last().remove();
            }
            // Cache elements.
            this.item_dd       = this.timeElement.find('.item-dd');
            this.separator_dd  = this.timeElement.find('.separator-dd');
            this.remaining_dd  = this.timeElement.find('.dd');
            this.remaining_hh1 = this.timeElement.find('.hh-1');
            this.remaining_hh2 = this.timeElement.find('.hh-2');
            this.remaining_mm1 = this.timeElement.find('.mm-1');
            this.remaining_mm2 = this.timeElement.find('.mm-2');
            this.remaining_ss1 = this.timeElement.find('.ss-1');
            this.remaining_ss2 = this.timeElement.find('.ss-2');
            // Set the css class of the <time> element.
            this.timeElement.addClass(this.options.css_class);
        },

        doCountDown: function () {
            // Calculate the difference between the two dates in milliseconds.
            var ms = this.endDate.getTime() - new Date().getTime();
            // Extract seconds, minutes, hours and days from the timedelta expressed in milliseconds.
            var ss = this.msToS(ms);
            var mm = this.msToM(ms);
            var hh = this.msToH(ms);
            var dd = this.msToD(ms);
            // Prevent display of negative values.
            if (ms <= 0) {
                ss = mm = hh = dd = 0;
            }
            this.displayRemainingTime({
                'ss': ss < 10 ? (this.options.with_ss_leading_zero ? '0' : ' ') + ss.toString() : ss.toString(),
                'mm': mm < 10 ? (this.options.with_mm_leading_zero ? '0' : ' ') + mm.toString() : mm.toString(),
                'hh': hh < 10 ? (this.options.with_hh_leading_zero ? '0' : ' ') + hh.toString() : hh.toString(),
                'dd': dd.toString()
            });
            // If seconds are hidden, stop the counter as soon as there is no minute left.
            if (!this.options.with_seconds && dd === 0 && mm === 0 && hh === 0) {
                ss = 0;
            }
            if (dd === 0 && mm === 0 && hh === 0 && ss === 0) {
                return this.timeElement.trigger('time.elapsed');
            }
            // Reload it.
            var self = this;
            window.setTimeout(function () { self.doCountDown(); }, self.setTimeoutDelay);
            return this.timeElement.trigger('time.tick', ms);
        },

        
        displayRemainingTime: function (remaining) {
            var attr = [];
            attr.push('P');
            if (remaining.dd !== '0') {
                attr.push(remaining.dd, 'D');
            }
            attr.push('T', remaining.hh, 'H', remaining.mm, 'M');
            if (this.options.with_seconds) {
                attr.push(remaining.ss, 'S');
            }
            this.timeElement.attr('datetime', attr.join(''));
            // Remove days if necessary.
            if (this.daysVisible && !this.options.always_show_days && remaining.dd === '0') {
                this.item_dd.remove();
                this.separator_dd.remove();
                this.daysVisible = false;
            }
            this.remaining_dd.text(remaining.dd);
            this.remaining_hh1.text(remaining.hh[0].trim());
            this.remaining_hh2.text(remaining.hh[1]);
            this.remaining_mm1.text(remaining.mm[0].trim());
            this.remaining_mm2.text(remaining.mm[1]);
            this.remaining_ss1.text(remaining.ss[0].trim());
            this.remaining_ss2.text(remaining.ss[1]);
        }

    });

    $.fn[pluginName] = function (options) {

        var args = arguments;

        // If the first parameter is an object (options) or was omitted, instantiate a new plugin instance.
        if (options === undefined || typeof options === 'object') {
            return this.each(function () {
                if (!$.data(this, 'plugin_' + pluginName)) {
                    $.data(this, 'plugin_' + pluginName, new CountDown(this, options));
                }
            });
        }

        else if (typeof options === 'string' && options[0] !== '_' && options !== 'init') {

            // Cache the method call to make it possible to return a value.
            var returns;

            this.each(function () {
                var instance = $.data(this, 'plugin_' + pluginName);
                // Tests that there's already a plugin instance and checks that the requested public method exists.
                if (instance instanceof CountDown && typeof instance[options] === 'function') {
                    // Call the method of our plugin instance, and pass it the supplied arguments.
                    returns = instance[options].apply(instance, Array.prototype.slice.call(args, 1));
                }
                // Allow instances to be destroyed via the 'destroy' method.
                if (options === 'destroy') {
                    $.data(this, 'plugin_' + pluginName, null);
                }
            });
            return returns !== undefined ? returns : this;
        }
    };

})(window.jQuery, window, document);

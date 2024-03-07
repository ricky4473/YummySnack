/*** BEGIN FILE: /home/hightman/newcz/web/assets/46598012/spin.js/spin.min.js ***/
// http://spin.js.org/#v2.3.2
!function(a,b){"object"==typeof module&&module.exports?module.exports=b():"function"==typeof define&&define.amd?define(b):a.Spinner=b()}(this,function(){"use strict";function a(a,b){var c,d=document.createElement(a||"div");for(c in b)d[c]=b[c];return d}function b(a){for(var b=1,c=arguments.length;c>b;b++)a.appendChild(arguments[b]);return a}function c(a,b,c,d){var e=["opacity",b,~~(100*a),c,d].join("-"),f=.01+c/d*100,g=Math.max(1-(1-a)/b*(100-f),a),h=j.substring(0,j.indexOf("Animation")).toLowerCase(),i=h&&"-"+h+"-"||"";return m[e]||(k.insertRule("@"+i+"keyframes "+e+"{0%{opacity:"+g+"}"+f+"%{opacity:"+a+"}"+(f+.01)+"%{opacity:1}"+(f+b)%100+"%{opacity:"+a+"}100%{opacity:"+g+"}}",k.cssRules.length),m[e]=1),e}function d(a,b){var c,d,e=a.style;if(b=b.charAt(0).toUpperCase()+b.slice(1),void 0!==e[b])return b;for(d=0;d<l.length;d++)if(c=l[d]+b,void 0!==e[c])return c}function e(a,b){for(var c in b)a.style[d(a,c)||c]=b[c];return a}function f(a){for(var b=1;b<arguments.length;b++){var c=arguments[b];for(var d in c)void 0===a[d]&&(a[d]=c[d])}return a}function g(a,b){return"string"==typeof a?a:a[b%a.length]}function h(a){this.opts=f(a||{},h.defaults,n)}function i(){function c(b,c){return a("<"+b+' xmlns="urn:schemas-microsoft.com:vml" class="spin-vml">',c)}k.addRule(".spin-vml","behavior:url(#default#VML)"),h.prototype.lines=function(a,d){function f(){return e(c("group",{coordsize:k+" "+k,coordorigin:-j+" "+-j}),{width:k,height:k})}function h(a,h,i){b(m,b(e(f(),{rotation:360/d.lines*a+"deg",left:~~h}),b(e(c("roundrect",{arcsize:d.corners}),{width:j,height:d.scale*d.width,left:d.scale*d.radius,top:-d.scale*d.width>>1,filter:i}),c("fill",{color:g(d.color,a),opacity:d.opacity}),c("stroke",{opacity:0}))))}var i,j=d.scale*(d.length+d.width),k=2*d.scale*j,l=-(d.width+d.length)*d.scale*2+"px",m=e(f(),{position:"absolute",top:l,left:l});if(d.shadow)for(i=1;i<=d.lines;i++)h(i,-2,"progid:DXImageTransform.Microsoft.Blur(pixelradius=2,makeshadow=1,shadowopacity=.3)");for(i=1;i<=d.lines;i++)h(i);return b(a,m)},h.prototype.opacity=function(a,b,c,d){var e=a.firstChild;d=d.shadow&&d.lines||0,e&&b+d<e.childNodes.length&&(e=e.childNodes[b+d],e=e&&e.firstChild,e=e&&e.firstChild,e&&(e.opacity=c))}}var j,k,l=["webkit","Moz","ms","O"],m={},n={lines:12,length:7,width:5,radius:10,scale:1,corners:1,color:"#000",opacity:.25,rotate:0,direction:1,speed:1,trail:100,fps:20,zIndex:2e9,className:"spinner",top:"50%",left:"50%",shadow:!1,hwaccel:!1,position:"absolute"};if(h.defaults={},f(h.prototype,{spin:function(b){this.stop();var c=this,d=c.opts,f=c.el=a(null,{className:d.className});if(e(f,{position:d.position,width:0,zIndex:d.zIndex,left:d.left,top:d.top}),b&&b.insertBefore(f,b.firstChild||null),f.setAttribute("role","progressbar"),c.lines(f,c.opts),!j){var g,h=0,i=(d.lines-1)*(1-d.direction)/2,k=d.fps,l=k/d.speed,m=(1-d.opacity)/(l*d.trail/100),n=l/d.lines;!function o(){h++;for(var a=0;a<d.lines;a++)g=Math.max(1-(h+(d.lines-a)*n)%l*m,d.opacity),c.opacity(f,a*d.direction+i,g,d);c.timeout=c.el&&setTimeout(o,~~(1e3/k))}()}return c},stop:function(){var a=this.el;return a&&(clearTimeout(this.timeout),a.parentNode&&a.parentNode.removeChild(a),this.el=void 0),this},lines:function(d,f){function h(b,c){return e(a(),{position:"absolute",width:f.scale*(f.length+f.width)+"px",height:f.scale*f.width+"px",background:b,boxShadow:c,transformOrigin:"left",transform:"rotate("+~~(360/f.lines*k+f.rotate)+"deg) translate("+f.scale*f.radius+"px,0)",borderRadius:(f.corners*f.scale*f.width>>1)+"px"})}for(var i,k=0,l=(f.lines-1)*(1-f.direction)/2;k<f.lines;k++)i=e(a(),{position:"absolute",top:1+~(f.scale*f.width/2)+"px",transform:f.hwaccel?"translate3d(0,0,0)":"",opacity:f.opacity,animation:j&&c(f.opacity,f.trail,l+k*f.direction,f.lines)+" "+1/f.speed+"s linear infinite"}),f.shadow&&b(i,e(h("#000","0 0 4px #000"),{top:"2px"})),b(d,b(i,h(g(f.color,k),"0 0 1px rgba(0,0,0,.1)")));return d},opacity:function(a,b,c){b<a.childNodes.length&&(a.childNodes[b].style.opacity=c)}}),"undefined"!=typeof document){k=function(){var c=a("style",{type:"text/css"});return b(document.getElementsByTagName("head")[0],c),c.sheet||c.styleSheet}();var o=e(a("group"),{behavior:"url(#default#VML)"});!d(o,"transform")&&o.adj?i():j=d(o,"animation")}return h});
/*** END FILE: /home/hightman/newcz/web/assets/46598012/spin.js/spin.min.js ***/
/*** BEGIN FILE: /home/hightman/newcz/web/assets/46598012/jquery.loadmask.spin/jquery.loadmask.spin.js ***/
/**
 * Copyright (c) 2009 Sergiy Kovalchuk (serg472@gmail.com)
 * 
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *  
 * Following code is based on Element.mask() implementation from ExtJS framework (http://extjs.com/)
 *
 */
(function($){
	
	/**
	 * Displays loading mask over selected element(s). Accepts both single and multiple selectors 	
	 * @param options the options to be used to display the mask
	 * @example $('el').mask({spinner: false, label: 'Some Text'});
	 * @example $('el').mask({spinner: { lines: 10, length: 4, width: 2, radius: 5}, delay: 100, label: 'Loading...'});
	 */
	$.fn.mask = function(options) {
		options = $.extend({
			spinner: { lines: 10, length: 4, width: 2, radius: 5},
			spinnerPadding: 5,
			label: "",
			delay: 0,
			overlayOpacity: 0.75,
			overlaySize: false
		}, options);

		return $(this).each(function() {
			var element = $(this);

			if(options.delay > 0) {
				element.data("_mask_timeout", setTimeout(function() { $.maskElement(element, options)}, options.delay));
			} else {
				$.maskElement(element, options);
			}
		});
	};
	
	/**
	 * Removes mask from the element(s). Accepts both single and multiple selectors.
	 */
	$.fn.unmask = function(){
		return $(this).each(function() {
			$.unmaskElement($(this));
		});
	};
	
	/**
	 * Checks if a single element is masked. Returns false if mask is delayed or not displayed. 
	 */
	$.fn.isMasked = function(){
		return this.hasClass("masked");
	};

	$.maskElement = function(element, options) {
		
		//if this element has delayed mask scheduled then remove it and display the new one
		if (element.data("_mask_timeout") !== undefined) {
			clearTimeout(element.data("_mask_timeout"));
			element.removeData("_mask_timeout");
		}

		if(element.isMasked()) {
			$.unmaskElement(element);
		}
		
		if(element.css("position") == "static") {
			element.addClass("masked-relative");
		}
		
		element.addClass("masked");
		
		var maskDiv = $('<div class="loadmask"></div>').css({opacity: 0 });

		if(options.overlaySize !== false) {
			if(options.overlaySize.height !== undefined)
				maskDiv.height(options.overlaySize.height)

			if(options.overlaySize.width !== undefined)
				maskDiv.width(options.overlaySize.width)
		}
		
		// auto height fix for IE
		if(navigator.userAgent.toLowerCase().indexOf("msie") > -1){
			maskDiv.height(element.height() + parseInt(element.css("padding-top")) + parseInt(element.css("padding-bottom")));
			maskDiv.width(element.width() + parseInt(element.css("padding-left")) + parseInt(element.css("padding-right")));
		}
		
		// fix for z-index bug with selects in IE6
		if(navigator.userAgent.toLowerCase().indexOf("msie 6") > -1){
			element.find("select").addClass("masked-hidden");
		}
		
		element.append(maskDiv);

		if(options.label.length > 0 || options.spinner !== false) {
			var maskMsgDiv = $('<div class="loadmask-msg" style="display:none;"></div>').css({'opacity':0});

			if(options.spinner !== false)
				maskMsgDiv.append(new Spinner(options.spinner).spin().el);

			if(options.label.length > 0) {
				var label = $('<div class="loadmask-label">' + options.label + '</div>')
				maskMsgDiv.append(label)
			}

			element.append(maskMsgDiv);

			// calculate center position
			// TODO there must be cleaner way to do this; check newer jQuery methods and see if anything will fit
			maskMsgDiv.css("top", Math.round(maskDiv.height() / 2 - (maskMsgDiv.height() - parseInt(maskMsgDiv.css("padding-top")) - parseInt(maskMsgDiv.css("padding-bottom"))) / 2)+"px");
			maskMsgDiv.css("left", Math.round(maskDiv.width() / 2 - (maskMsgDiv.width() - parseInt(maskMsgDiv.css("padding-left")) - parseInt(maskMsgDiv.css("padding-right"))) / 2)+"px");
			maskMsgDiv.show();

			if(options.spinner !== false && options.label.length > 0) {
				var spinnerSquare = options.spinner.radius * 2 + (options.spinner.width + options.spinner.length) * 2

				// The center of the spinner is positioned at the top left corner of this DIV
				// center the label text vertically, and align the label to the right of the spinner
				label.css({
					'margin-left': spinnerSquare / 2 + options.spinnerPadding,
					'margin-top': -label.height() / 2
				})
			}

			maskMsgDiv.fadeTo('slow', 1)
		}

		// TODO this should be customizable
		maskDiv.fadeTo('slow', options.overlayOpacity);
	};
	
	$.unmaskElement = function(element){
		//if this element has delayed mask scheduled then remove it
		if (element.data("_mask_timeout") !== undefined) {
			clearTimeout(element.data("_mask_timeout"));
			element.removeData("_mask_timeout");
		}
		
		element.find(".loadmask-msg,.loadmask").remove();
		element.removeClass("masked");
		element.removeClass("masked-relative");
		element.find("select").removeClass("masked-hidden");
	};
 
})(jQuery);
/*** END FILE: /home/hightman/newcz/web/assets/46598012/jquery.loadmask.spin/jquery.loadmask.spin.js ***/
/*** BEGIN FILE: /home/hightman/newcz/web/assets/dfc0cc9c/yii.activeForm.js ***/
/**
 * Yii form widget.
 *
 * This is the JavaScript widget used by the yii\widgets\ActiveForm widget.
 *
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
(function($){$.fn.yiiActiveForm=function(method){if(methods[method]){return methods[method].apply(this,Array.prototype.slice.call(arguments,1))}else if(typeof method==='object'||!method){return methods.init.apply(this,arguments)}else{$.error('Method '+method+' does not exist on jQuery.yiiActiveForm');return!1}};var events={/**
         * beforeValidate event is triggered before validating the whole form.
         * The signature of the event handler should be:
         *     function (event, messages, deferreds)
         * where
         *  - event: an Event object.
         *  - messages: an associative array with keys being attribute IDs and values being error message arrays
         *    for the corresponding attributes.
         *  - deferreds: an array of Deferred objects. You can use deferreds.add(callback) to add a new deferred validation.
         *
         * If the handler returns a boolean false, it will stop further form validation after this event. And as
         * a result, afterValidate event will not be triggered.
         */
        beforeValidate: 'beforeValidate',
        /**
         * afterValidate event is triggered after validating the whole form.
         * The signature of the event handler should be:
         *     function (event, messages, errorAttributes)
         * where
         *  - event: an Event object.
         *  - messages: an associative array with keys being attribute IDs and values being error message arrays
         *    for the corresponding attributes.
         *  - errorAttributes: an array of attributes that have validation errors. Please refer to attributeDefaults for the structure of this parameter.
         */
        afterValidate: 'afterValidate',
        /**
         * beforeValidateAttribute event is triggered before validating an attribute.
         * The signature of the event handler should be:
         *     function (event, attribute, messages, deferreds)
         * where
         *  - event: an Event object.
         *  - attribute: the attribute to be validated. Please refer to attributeDefaults for the structure of this parameter.
         *  - messages: an array to which you can add validation error messages for the specified attribute.
         *  - deferreds: an array of Deferred objects. You can use deferreds.add(callback) to add a new deferred validation.
         *
         * If the handler returns a boolean false, it will stop further validation of the specified attribute.
         * And as a result, afterValidateAttribute event will not be triggered.
         */
        beforeValidateAttribute: 'beforeValidateAttribute',
        /**
         * afterValidateAttribute event is triggered after validating the whole form and each attribute.
         * The signature of the event handler should be:
         *     function (event, attribute, messages)
         * where
         *  - event: an Event object.
         *  - attribute: the attribute being validated. Please refer to attributeDefaults for the structure of this parameter.
         *  - messages: an array to which you can add additional validation error messages for the specified attribute.
         */
        afterValidateAttribute: 'afterValidateAttribute',
        /**
         * beforeSubmit event is triggered before submitting the form after all validations have passed.
         * The signature of the event handler should be:
         *     function (event)
         * where event is an Event object.
         *
         * If the handler returns a boolean false, it will stop form submission.
         */
        beforeSubmit: 'beforeSubmit',
        /**
         * ajaxBeforeSend event is triggered before sending an AJAX request for AJAX-based validation.
         * The signature of the event handler should be:
         *     function (event, jqXHR, settings)
         * where
         *  - event: an Event object.
         *  - jqXHR: a jqXHR object
         *  - settings: the settings for the AJAX request
         */
        ajaxBeforeSend: 'ajaxBeforeSend',
        /**
         * ajaxComplete event is triggered after completing an AJAX request for AJAX-based validation.
         * The signature of the event handler should be:
         *     function (event, jqXHR, textStatus)
         * where
         *  - event: an Event object.
         *  - jqXHR: a jqXHR object
         *  - textStatus: the status of the request ("success", "notmodified", "error", "timeout", "abort", or "parsererror").
         */
        ajaxComplete: 'ajaxComplete',
        /**
         * afterInit event is triggered after yii activeForm init.
         * The signature of the event handler should be:
         *     function (event)
         * where
         *  - event: an Event object.
         */
        afterInit: 'afterInit'
    };

    // NOTE: If you change any of these defaults, make sure you update yii\widgets\ActiveForm::getClientOptions() as well
    var defaults = {
        // whether to encode the error summary
        encodeErrorSummary: true,
        // the jQuery selector for the error summary
        errorSummary: '.error-summary',
        // whether to perform validation before submitting the form.
        validateOnSubmit: true,
        // the container CSS class representing the corresponding attribute has validation error
        errorCssClass: 'has-error',
        // the container CSS class representing the corresponding attribute passes validation
        successCssClass: 'has-success',
        // the container CSS class representing the corresponding attribute is being validated
        validatingCssClass: 'validating',
        // the GET parameter name indicating an AJAX-based validation
        ajaxParam: 'ajax',
        // the type of data that you're expecting back from the server
        ajaxDataType: 'json',
        // the URL for performing AJAX-based validation. If not set, it will use the the form's action
        validationUrl: undefined,
        // whether to scroll to first visible error after validation.
        scrollToError: true,
        // offset in pixels that should be added when scrolling to the first error.
        scrollToErrorOffset: 0,
        // where to add validation class: container or input
        validationStateOn: 'container'
    };

    // NOTE: If you change any of these defaults, make sure you update yii\widgets\ActiveField::getClientOptions() as well
    var attributeDefaults = {
        // a unique ID identifying an attribute (e.g. "loginform-username") in a form
        id: undefined,
        // attribute name or expression (e.g. "[0]content" for tabular input)
        name: undefined,
        // the jQuery selector of the container of the input field
        container: undefined,
        // the jQuery selector of the input field under the context of the form
        input: undefined,
        // the jQuery selector of the error tag under the context of the container
        error: '.help-block',
        // whether to encode the error
        encodeError: true,
        // whether to perform validation when a change is detected on the input
        validateOnChange: true,
        // whether to perform validation when the input loses focus
        validateOnBlur: true,
        // whether to perform validation when the user is typing.
        validateOnType: false,
        // number of milliseconds that the validation should be delayed when a user is typing in the input field.
        validationDelay: 500,
        // whether to enable AJAX-based validation.
        enableAjaxValidation: false,
        // function (attribute, value, messages, deferred, $form), the client-side validation function.
        validate: undefined,
        // status of the input field, 0: empty, not entered before, 1: validated, 2: pending validation, 3: validating
        status: 0,
        // whether the validation is cancelled by beforeValidateAttribute event handler
        cancelled: false,
        // the value of the input
        value: undefined,
        // whether to update aria-invalid attribute after validation
        updateAriaInvalid: true
    };


    var submitDefer;

    var setSubmitFinalizeDefer = function($form) {
        submitDefer = $.Deferred();
        $form.data('yiiSubmitFinalizePromise', submitDefer.promise());
    };

    // finalize yii.js $form.submit
    var submitFinalize = function($form) {
        if(submitDefer) {
            submitDefer.resolve();
            submitDefer = undefined;
            $form.removeData('yiiSubmitFinalizePromise');
        }
    };


    var methods = {
        init: function (attributes, options) {
            return this.each(function () {
                var $form = $(this);
                if ($form.data('yiiActiveForm')) {
                    return;
                }

                var settings = $.extend({}, defaults, options || {});
                if (settings.validationUrl === undefined) {
                    settings.validationUrl = $form.attr('action');
                }

                $.each(attributes, function (i) {
                    attributes[i] = $.extend({value: getValue($form, this)}, attributeDefaults, this);
                    watchAttribute($form, attributes[i]);
                });

                $form.data('yiiActiveForm', {
                    settings: settings,
                    attributes: attributes,
                    submitting: false,
                    validated: false,
                    options: getFormOptions($form)
                });

                /**
                 * Clean up error status when the form is reset.
                 * Note that $form.on('reset', ...) does work because the "reset" event does not bubble on IE.
                 */
                $form.on('reset.yiiActiveForm', methods.resetForm);

                if (settings.validateOnSubmit) {
                    $form.on('mouseup.yiiActiveForm keyup.yiiActiveForm', ':submit', function () {
                        $form.data('yiiActiveForm').submitObject = $(this);
                    });
                    $form.on('submit.yiiActiveForm', methods.submitForm);
                }
                var event = $.Event(events.afterInit);
                $form.trigger(event);
            });
        },

        // add a new attribute to the form dynamically.
        // please refer to attributeDefaults for the structure of attribute
        add: function (attribute) {
            var $form = $(this);
            attribute = $.extend({value: getValue($form, attribute)}, attributeDefaults, attribute);
            $form.data('yiiActiveForm').attributes.push(attribute);
            watchAttribute($form, attribute);
        },

        // remove the attribute with the specified ID from the form
        remove: function (id) {
            var $form = $(this),
                attributes = $form.data('yiiActiveForm').attributes,
                index = -1,
                attribute = undefined;
            $.each(attributes, function (i) {
                if (attributes[i]['id'] == id) {
                    index = i;
                    attribute = attributes[i];
                    return false;
                }
            });
            if (index >= 0) {
                attributes.splice(index, 1);
                unwatchAttribute($form, attribute);
            }

            return attribute;
        },

        // manually trigger the validation of the attribute with the specified ID
        validateAttribute: function (id) {
            var attribute = methods.find.call(this, id);
            if (attribute != undefined) {
                validateAttribute($(this), attribute, true);
            }
        },

        // find an attribute config based on the specified attribute ID
        find: function (id) {
            var attributes = $(this).data('yiiActiveForm').attributes,
                result = undefined;
            $.each(attributes, function (i) {
                if (attributes[i]['id'] == id) {
                    result = attributes[i];
                    return false;
                }
            });
            return result;
        },

        destroy: function () {
            return this.each(function () {
                $(this).off('.yiiActiveForm');
                $(this).removeData('yiiActiveForm');
            });
        },

        data: function () {
            return this.data('yiiActiveForm');
        },

        // validate all applicable inputs in the form
        validate: function (forceValidate) {
            if (forceValidate) {
                $(this).data('yiiActiveForm').submitting = true;
            }

            var $form = $(this),
                data = $form.data('yiiActiveForm'),
                needAjaxValidation = false,
                messages = {},
                deferreds = deferredArray(),
                submitting = data.submitting;

            if (submitting) {
                var event = $.Event(events.beforeValidate);
                $form.trigger(event, [messages, deferreds]);

                if (event.result === false) {
                    data.submitting = false;
                    submitFinalize($form);
                    return;
                }
            }

            // client-side validation
            $.each(data.attributes, function () {
                this.$form = $form;
                var $input = findInput($form, this);

                if ($input.is(":disabled")) {
                    return true;
                }
                // pass SELECT without options
                if ($input.length && $input[0].tagName.toLowerCase() === 'select') {
                    if (!$input[0].options.length) {
                        return true;
                    } else if (($input[0].options.length === 1) && ($input[0].options[0].value === '')) {
                        return true;
                    }
                }
                this.cancelled = false;
                // perform validation only if the form is being submitted or if an attribute is pending validation
                if (data.submitting || this.status === 2 || this.status === 3) {
                    var msg = messages[this.id];
                    if (msg === undefined) {
                        msg = [];
                        messages[this.id] = msg;
                    }

                    var event = $.Event(events.beforeValidateAttribute);
                    $form.trigger(event, [this, msg, deferreds]);
                    if (event.result !== false) {
                        if (this.validate) {
                            this.validate(this, getValue($form, this), msg, deferreds, $form);
                        }
                        if (this.enableAjaxValidation) {
                            needAjaxValidation = true;
                        }
                    } else {
                        this.cancelled = true;
                    }
                }
            });

            // ajax validation
            $.when.apply(this, deferreds).always(function() {
                // Remove empty message arrays
                for (var i in messages) {
                    if (0 === messages[i].length) {
                        delete messages[i];
                    }
                }
                if (needAjaxValidation && ($.isEmptyObject(messages) || data.submitting)) {
                    var $button = data.submitObject,
                        extData = '&' + data.settings.ajaxParam + '=' + $form.attr('id');
                    if ($button && $button.length && $button.attr('name')) {
                        extData += '&' + $button.attr('name') + '=' + $button.attr('value');
                    }
                    $.ajax({
                        url: data.settings.validationUrl,
                        type: $form.attr('method'),
                        data: $form.serialize() + extData,
                        dataType: data.settings.ajaxDataType,
                        complete: function (jqXHR, textStatus) {
                            $form.trigger(events.ajaxComplete, [jqXHR, textStatus]);
                        },
                        beforeSend: function (jqXHR, settings) {
                            $form.trigger(events.ajaxBeforeSend, [jqXHR, settings]);
                        },
                        success: function (msgs) {
                            if (msgs !== null && typeof msgs === 'object') {
                                $.each(data.attributes, function () {
                                    if (!this.enableAjaxValidation || this.cancelled) {
                                        delete msgs[this.id];
                                    }
                                });
                                updateInputs($form, $.extend(messages, msgs), submitting);
                            } else {
                                updateInputs($form, messages, submitting);
                            }
                        },
                        error: function () {
                            data.submitting = false;
                            submitFinalize($form);
                        }
                    });
                } else if (data.submitting) {
                    // delay callback so that the form can be submitted without problem
                    window.setTimeout(function () {
                        updateInputs($form, messages, submitting);
                    }, 200);
                } else {
                    updateInputs($form, messages, submitting);
                }
            });
        },

        submitForm: function () {
            var $form = $(this),
                data = $form.data('yiiActiveForm');
            if (data.validated) {
                // Second submit's call (from validate/updateInputs)
                data.submitting = false;
                var event = $.Event(events.beforeSubmit);
                $form.trigger(event);
                if (event.result === false) {
                    data.validated = false;
                    submitFinalize($form);
                    return false;
                }
                updateHiddenButton($form);
                return true;   // continue submitting the form since validation passes
            } else {
                // First submit's call (from yii.js/handleAction) - execute validating
                setSubmitFinalizeDefer($form);

                if (data.settings.timer !== undefined) {
                    clearTimeout(data.settings.timer);
                }
                data.submitting = true;
                methods.validate.call($form);
                return false;
            }
        },

        resetForm: function () {
            var $form = $(this);
            var data = $form.data('yiiActiveForm');
            // Because we bind directly to a form reset event instead of a reset button (that may not exist),
            // when this function is executed form input values have not been reset yet.
            // Therefore we do the actual reset work through setTimeout.
            window.setTimeout(function () {
                $.each(data.attributes, function () {
                    // Without setTimeout() we would get the input values that are not reset yet.
                    this.value = getValue($form, this);
                    this.status = 0;
                    var $container = $form.find(this.container),
                        $input = findInput($form, this),
                        $errorElement = data.settings.validationStateOn === 'input' ? $input : $container;

                    $errorElement.removeClass(
                      data.settings.validatingCssClass + ' ' +
                      data.settings.errorCssClass + ' ' +
                      data.settings.successCssClass
                    );
                    $container.find(this.error).html('');
                });
                $form.find(data.settings.errorSummary).hide().find('ul').html('');
            }, 1);
        },

        /**
         * Updates error messages, input containers, and optionally summary as well.
         * If an attribute is missing from messages, it is considered valid.
         * @param messages array the validation error messages, indexed by attribute IDs
         * @param summary whether to update summary as well.
         */
        updateMessages: function (messages, summary) {
            var $form = $(this);
            var data = $form.data('yiiActiveForm');
            $.each(data.attributes, function () {
                updateInput($form, this, messages);
            });
            if (summary) {
                updateSummary($form, messages);
            }
        },

        /**
         * Updates error messages and input container of a single attribute.
         * If messages is empty, the attribute is considered valid.
         * @param id attribute ID
         * @param messages array with error messages
         */
        updateAttribute: function(id, messages) {
            var attribute = methods.find.call(this, id);
            if (attribute != undefined) {
                var msg = {};
                msg[id] = messages;
                updateInput($(this), attribute, msg);
            }
        }
    };

    var watchAttribute = function ($form, attribute) {
        var $input = findInput($form, attribute);
        if (attribute.validateOnChange) {
            $input.on('change.yiiActiveForm', function () {
                validateAttribute($form, attribute, false);
            });
        }
        if (attribute.validateOnBlur) {
            $input.on('blur.yiiActiveForm', function () {
                if (attribute.status == 0 || attribute.status == 1) {
                    validateAttribute($form, attribute, true);
                }
            });
        }
        if (attribute.validateOnType) {
            $input.on('keyup.yiiActiveForm', function (e) {
                if ($.inArray(e.which, [16, 17, 18, 37, 38, 39, 40]) !== -1 ) {
                    return;
                }
                if (attribute.value !== getValue($form, attribute)) {
                    validateAttribute($form, attribute, false, attribute.validationDelay);
                }
            });
        }
    };

    var unwatchAttribute = function ($form, attribute) {
        findInput($form, attribute).off('.yiiActiveForm');
    };

    var validateAttribute = function ($form, attribute, forceValidate, validationDelay) {
        var data = $form.data('yiiActiveForm');

        if (forceValidate) {
            attribute.status = 2;
        }
        $.each(data.attributes, function () {
            if (!isEqual(this.value, getValue($form, this))) {
                this.status = 2;
                forceValidate = true;
            }
        });
        if (!forceValidate) {
            return;
        }

        if (data.settings.timer !== undefined) {
            clearTimeout(data.settings.timer);
        }
        data.settings.timer = window.setTimeout(function () {
            if (data.submitting || $form.is(':hidden')) {
                return;
            }
            $.each(data.attributes, function () {
                if (this.status === 2) {
                    this.status = 3;
                    $form.find(this.container).addClass(data.settings.validatingCssClass);
                }
            });
            methods.validate.call($form);
        }, validationDelay ? validationDelay : 200);
    };

    /**
     * Compares two value whatever it objects, arrays or simple types
     * @param val1
     * @param val2
     * @returns boolean
     */
    var isEqual = function(val1, val2) {
        // objects
        if (val1 instanceof Object) {
            return isObjectsEqual(val1, val2)
        }

        // arrays
        if (Array.isArray(val1)) {
            return isArraysEqual(val1, val2);
        }

        // simple types
        return val1 === val2;
    };

    /**
     * Compares two objects
     * @param obj1
     * @param obj2
     * @returns boolean
     */
    var isObjectsEqual = function(obj1, obj2) {
        if (!(obj1 instanceof Object) || !(obj2 instanceof Object)) {
            return false;
        }

        var keys1 = Object.keys(obj1);
        var keys2 = Object.keys(obj2);
        if (keys1.length !== keys2.length) {
            return false;
        }

        for (var i = 0; i < keys1.length; i += 1) {
            if (!obj2.hasOwnProperty(keys1[i])) {
                return false;
            }
            if (obj1[keys1[i]] !== obj2[keys1[i]]) {
                return false;
            }
        }

        return true;
    };

    /**
     * Compares two arrays
     * @param arr1
     * @param arr2
     * @returns boolean
     */
    var isArraysEqual = function(arr1, arr2) {
        if (!Array.isArray(arr1) || !Array.isArray(arr2)) {
            return false;
        }

        if (arr1.length !== arr2.length) {
            return false;
        }
        for (var i = 0; i < arr1.length; i += 1) {
            if (arr1[i] !== arr2[i]) {
                return false;
            }
        }
        return true;
    };

    /**
     * Returns an array prototype with a shortcut method for adding a new deferred.
     * The context of the callback will be the deferred object so it can be resolved like ```this.resolve()```
     * @returns Array
     */
    var deferredArray = function () {
        var array = [];
        array.add = function(callback) {
            this.push(new $.Deferred(callback));
        };
        return array;
    };

    var buttonOptions = ['action', 'target', 'method', 'enctype'];

    /**
     * Returns current form options
     * @param $form
     * @returns object Object with button of form options
     */
    var getFormOptions = function ($form) {
        var attributes = {};
        for (var i = 0; i < buttonOptions.length; i++) {
            attributes[buttonOptions[i]] = $form.attr(buttonOptions[i]);
        }

        return attributes;
    };

    /**
     * Applies temporary form options related to submit button
     * @param $form the form jQuery object
     * @param $button the button jQuery object
     */
    var applyButtonOptions = function ($form, $button) {
        for (var i = 0; i < buttonOptions.length; i++) {
            var value = $button.attr('form' + buttonOptions[i]);
            if (value) {
                $form.attr(buttonOptions[i], value);
            }
        }
    };

    /**
     * Restores original form options
     * @param $form the form jQuery object
     */
    var restoreButtonOptions = function ($form) {
        var data = $form.data('yiiActiveForm');

        for (var i = 0; i < buttonOptions.length; i++) {
            $form.attr(buttonOptions[i], data.options[buttonOptions[i]] || null);
        }
    };

    /**
     * Updates the error messages and the input containers for all applicable attributes
     * @param $form the form jQuery object
     * @param messages array the validation error messages
     * @param submitting whether this method is called after validation triggered by form submission
     */
    var updateInputs = function ($form, messages, submitting) {
        var data = $form.data('yiiActiveForm');

        if (data === undefined) {
            return false;
        }

        var errorAttributes = [], $input;
        $.each(data.attributes, function () {
            var hasError = (submitting && updateInput($form, this, messages)) || (!submitting && attrHasError($form, this, messages));
            $input = findInput($form, this);

            if (!$input.is(":disabled") && !this.cancelled && hasError) {
                errorAttributes.push(this);
            }
        });

        $form.trigger(events.afterValidate, [messages, errorAttributes]);

        if (submitting) {
            updateSummary($form, messages);
            if (errorAttributes.length) {
                if (data.settings.scrollToError) {
                    var top = $form.find($.map(errorAttributes, function(attribute) {
                        return attribute.input;
                    }).join(',')).first().closest(':visible').offset().top - data.settings.scrollToErrorOffset;
                    if (top < 0) {
                        top = 0;
                    } else if (top > $(document).height()) {
                        top = $(document).height();
                    }
                    var wtop = $(window).scrollTop();
                    if (top < wtop || top > wtop + $(window).height()) {
                        $(window).scrollTop(top);
                    }
                }
                data.submitting = false;
            } else {
                data.validated = true;
                if (data.submitObject) {
                    applyButtonOptions($form, data.submitObject);
                }
                $form.submit();
                if (data.submitObject) {
                    restoreButtonOptions($form);
                }
            }
        } else {
            $.each(data.attributes, function () {
                if (!this.cancelled && (this.status === 2 || this.status === 3)) {
                    updateInput($form, this, messages);
                }
            });
        }
        submitFinalize($form);
    };

    /**
     * Updates hidden field that represents clicked submit button.
     * @param $form the form jQuery object.
     */
    var updateHiddenButton = function ($form) {
        var data = $form.data('yiiActiveForm');
        var $button = data.submitObject || $form.find(':submit:first');
        // TODO: if the submission is caused by "change" event, it will not work
        if ($button.length && $button.attr('type') == 'submit' && $button.attr('name')) {
            // simulate button input value
            var $hiddenButton = $('input[type="hidden"][name="' + $button.attr('name') + '"]', $form);
            if (!$hiddenButton.length) {
                $('<input>').attr({
                    type: 'hidden',
                    name: $button.attr('name'),
                    value: $button.attr('value')
                }).appendTo($form);
            } else {
                $hiddenButton.attr('value', $button.attr('value'));
            }
        }
    };

    /**
     * Updates the error message and the input container for a particular attribute.
     * @param $form the form jQuery object
     * @param attribute object the configuration for a particular attribute.
     * @param messages array the validation error messages
     * @return boolean whether there is a validation error for the specified attribute
     */
    var updateInput = function ($form, attribute, messages) {
        var data = $form.data('yiiActiveForm'),
            $input = findInput($form, attribute),
            hasError = attrHasError($form, attribute, messages);

        if (!$.isArray(messages[attribute.id])) {
            messages[attribute.id] = [];
        }

        attribute.status = 1;
        if ($input.length) {
            var $container = $form.find(attribute.container);
            var $error = $container.find(attribute.error);
            updateAriaInvalid($form, attribute, hasError);

            var $errorElement = data.settings.validationStateOn === 'input' ? $input : $container;

            if (hasError) {
                if (attribute.encodeError) {
                    $error.text(messages[attribute.id][0]);
                } else {
                    $error.html(messages[attribute.id][0]);
                }
                $errorElement.removeClass(data.settings.validatingCssClass + ' ' + data.settings.successCssClass)
                  .addClass(data.settings.errorCssClass);
            } else {
                $error.empty();
                $errorElement.removeClass(data.settings.validatingCssClass + ' ' + data.settings.errorCssClass + ' ')
                  .addClass(data.settings.successCssClass);
            }
            attribute.value = getValue($form, attribute);
        }

        $form.trigger(events.afterValidateAttribute, [attribute, messages[attribute.id]]);

        return hasError;
    };

    /**
     * Checks if a particular attribute has an error
     * @param $form the form jQuery object
     * @param attribute object the configuration for a particular attribute.
     * @param messages array the validation error messages
     * @return boolean whether there is a validation error for the specified attribute
     */
    var attrHasError = function ($form, attribute, messages) {
        var $input = findInput($form, attribute),
            hasError = false;

        if (!$.isArray(messages[attribute.id])) {
            messages[attribute.id] = [];
        }

        if ($input.length) {
            hasError = messages[attribute.id].length > 0;
        }

        return hasError;
    };

    /**
     * Updates the error summary.
     * @param $form the form jQuery object
     * @param messages array the validation error messages
     */
    var updateSummary = function ($form, messages) {
        var data = $form.data('yiiActiveForm'),
            $summary = $form.find(data.settings.errorSummary),
            $ul = $summary.find('ul').empty();

        if ($summary.length && messages) {
            $.each(data.attributes, function () {
                if ($.isArray(messages[this.id]) && messages[this.id].length) {
                    var error = $('<li/>');
                    if (data.settings.encodeErrorSummary) {
                        error.text(messages[this.id][0]);
                    } else {
                        error.html(messages[this.id][0]);
                    }
                    $ul.append(error);
                }
            });
            $summary.toggle($ul.find('li').length > 0);
        }
    };

    var getValue = function ($form, attribute) {
        var $input = findInput($form, attribute);
        var type = $input.attr('type');
        if (type === 'checkbox' || type === 'radio') {
            var $realInput = $input.filter(':checked');
            if ($realInput.length > 1) {
                var values = [];
                $realInput.each(function(index) {
                    values.push($($realInput.get(index)).val());
                });
                return values;
            }

            if (!$realInput.length) {
                $realInput = $form.find('input[type=hidden][name="' + $input.attr('name') + '"]');
            }

            return $realInput.val();
        } else {
            return $input.val();
        }
    };

    var findInput = function ($form, attribute) {
        var $input = $form.find(attribute.input);
        if ($input.length && $input[0].tagName.toLowerCase() === 'div') {
            // checkbox list or radio list
            return $input.find('input');
        } else {
            return $input;
        }
    };

    var updateAriaInvalid = function ($form, attribute, hasError) {
        if (attribute.updateAriaInvalid) {
            $form.find(attribute.input).attr('aria-invalid', hasError ? 'true' : 'false');
        }
    }
})(window.jQuery);
/*** END FILE: /home/hightman/newcz/web/assets/dfc0cc9c/yii.activeForm.js ***/
/*** BEGIN FILE: /home/hightman/newcz/web/assets/dfc0cc9c/yii.validation.js ***/
/**
 * Yii validation module.
 *
 * This JavaScript module provides the validation methods for the built-in validators.
 *
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
yii.validation=(function($){var pub={isEmpty:function(value){return value===null||value===undefined||($.isArray(value)&&value.length===0)||value===''},addMessage:function(messages,message,value){messages.push(message.replace(/\{value\}/g,value))},required:function(value,messages,options){var valid=!1;if(options.requiredValue===undefined){var isString=typeof value=='string'||value instanceof String;if(options.strict&&value!==undefined||!options.strict&&!pub.isEmpty(isString?$.trim(value):value)){valid=!0}}else if(!options.strict&&value==options.requiredValue||options.strict&&value===options.requiredValue){valid=!0}
if(!valid){pub.addMessage(messages,options.message,value)}},'boolean':function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
var valid=!options.strict&&(value==options.trueValue||value==options.falseValue)||options.strict&&(value===options.trueValue||value===options.falseValue);if(!valid){pub.addMessage(messages,options.message,value)}},string:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
if(typeof value!=='string'){pub.addMessage(messages,options.message,value);return}
if(options.is!==undefined&&value.length!=options.is){pub.addMessage(messages,options.notEqual,value);return}
if(options.min!==undefined&&value.length<options.min){pub.addMessage(messages,options.tooShort,value)}
if(options.max!==undefined&&value.length>options.max){pub.addMessage(messages,options.tooLong,value)}},file:function(attribute,messages,options){var files=getUploadedFiles(attribute,messages,options);$.each(files,function(i,file){validateFile(file,messages,options)})},image:function(attribute,messages,options,deferredList){var files=getUploadedFiles(attribute,messages,options);$.each(files,function(i,file){validateFile(file,messages,options);if(typeof FileReader==="undefined"){return}
var deferred=$.Deferred();pub.validateImage(file,messages,options,deferred,new FileReader(),new Image());deferredList.push(deferred)})},validateImage:function(file,messages,options,deferred,fileReader,image){image.onload=function(){validateImageSize(file,image,messages,options);deferred.resolve()};image.onerror=function(){messages.push(options.notImage.replace(/\{file\}/g,file.name));deferred.resolve()};fileReader.onload=function(){image.src=this.result};fileReader.onerror=function(){deferred.resolve()};fileReader.readAsDataURL(file)},number:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
if(typeof value==='string'&&!options.pattern.test(value)){pub.addMessage(messages,options.message,value);return}
if(options.min!==undefined&&value<options.min){pub.addMessage(messages,options.tooSmall,value)}
if(options.max!==undefined&&value>options.max){pub.addMessage(messages,options.tooBig,value)}},range:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
if(!options.allowArray&&$.isArray(value)){pub.addMessage(messages,options.message,value);return}
var inArray=!0;$.each($.isArray(value)?value:[value],function(i,v){if($.inArray(v,options.range)==-1){inArray=!1;return!1}else{return!0}});if(options.not===undefined){options.not=!1}
if(options.not===inArray){pub.addMessage(messages,options.message,value)}},regularExpression:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
if(!options.not&&!options.pattern.test(value)||options.not&&options.pattern.test(value)){pub.addMessage(messages,options.message,value)}},email:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
var valid=!0,regexp=/^((?:"?([^"]*)"?\s)?)(?:\s+)?(?:(<?)((.+)@([^>]+))(>?))$/,matches=regexp.exec(value);if(matches===null){valid=!1}else{var localPart=matches[5],domain=matches[6];if(options.enableIDN){localPart=punycode.toASCII(localPart);domain=punycode.toASCII(domain);value=matches[1]+matches[3]+localPart+'@'+domain+matches[7]}
if(localPart.length>64){valid=!1}else if((localPart+'@'+domain).length>254){valid=!1}else{valid=options.pattern.test(value)||(options.allowName&&options.fullPattern.test(value))}}
if(!valid){pub.addMessage(messages,options.message,value)}},url:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
if(options.defaultScheme&&!/:\/\//.test(value)){value=options.defaultScheme+'://'+value}
var valid=!0;if(options.enableIDN){var matches=/^([^:]+):\/\/([^\/]+)(.*)$/.exec(value);if(matches===null){valid=!1}else{value=matches[1]+'://'+punycode.toASCII(matches[2])+matches[3]}}
if(!valid||!options.pattern.test(value)){pub.addMessage(messages,options.message,value)}},trim:function($form,attribute,options,value){var $input=$form.find(attribute.input);if($input.is(':checkbox, :radio')){return value}
value=$input.val();if(!options.skipOnEmpty||!pub.isEmpty(value)){value=$.trim(value);$input.val(value)}
return value},captcha:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
var hash=$('body').data(options.hashKey);hash=hash==null?options.hash:hash[options.caseSensitive?0:1];var v=options.caseSensitive?value:value.toLowerCase();for(var i=v.length-1,h=0;i>=0;--i){h+=v.charCodeAt(i)}
if(h!=hash){pub.addMessage(messages,options.message,value)}},compare:function(value,messages,options,$form){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
var compareValue,valid=!0;if(options.compareAttribute===undefined){compareValue=options.compareValue}else{var $target=$('#'+options.compareAttribute);if(!$target.length){$target=$form.find('[name="'+options.compareAttributeName+'"]')}
compareValue=$target.val()}
if(options.type==='number'){value=value?parseFloat(value):0;compareValue=compareValue?parseFloat(compareValue):0}
switch(options.operator){case '==':valid=value==compareValue;break;case '===':valid=value===compareValue;break;case '!=':valid=value!=compareValue;break;case '!==':valid=value!==compareValue;break;case '>':valid=value>compareValue;break;case '>=':valid=value>=compareValue;break;case '<':valid=value<compareValue;break;case '<=':valid=value<=compareValue;break;default:valid=!1;break}
if(!valid){pub.addMessage(messages,options.message,value)}},ip:function(value,messages,options){if(options.skipOnEmpty&&pub.isEmpty(value)){return}
var negation=null,cidr=null,matches=new RegExp(options.ipParsePattern).exec(value);if(matches){negation=matches[1]||null;value=matches[2];cidr=matches[4]||null}
if(options.subnet===!0&&cidr===null){pub.addMessage(messages,options.messages.noSubnet,value);return}
if(options.subnet===!1&&cidr!==null){pub.addMessage(messages,options.messages.hasSubnet,value);return}
if(options.negation===!1&&negation!==null){pub.addMessage(messages,options.messages.message,value);return}
var ipVersion=value.indexOf(':')===-1?4:6;if(ipVersion==6){if(!(new RegExp(options.ipv6Pattern)).test(value)){pub.addMessage(messages,options.messages.message,value)}
if(!options.ipv6){pub.addMessage(messages,options.messages.ipv6NotAllowed,value)}}else{if(!(new RegExp(options.ipv4Pattern)).test(value)){pub.addMessage(messages,options.messages.message,value)}
if(!options.ipv4){pub.addMessage(messages,options.messages.ipv4NotAllowed,value)}}}};function getUploadedFiles(attribute,messages,options){if(typeof File==="undefined"){return[]}
var fileInput=$(attribute.input,attribute.$form).get(0);if(typeof fileInput==="undefined"){return[]}
var files=fileInput.files;if(!files){messages.push(options.message);return[]}
if(files.length===0){if(!options.skipOnEmpty){messages.push(options.uploadRequired)}
return[]}
if(options.maxFiles&&options.maxFiles<files.length){messages.push(options.tooMany);return[]}
return files}
function validateFile(file,messages,options){if(options.extensions&&options.extensions.length>0){var index=file.name.lastIndexOf('.');var ext=!~index?'':file.name.substr(index+1,file.name.length).toLowerCase();if(!~options.extensions.indexOf(ext)){messages.push(options.wrongExtension.replace(/\{file\}/g,file.name))}}
if(options.mimeTypes&&options.mimeTypes.length>0){if(!validateMimeType(options.mimeTypes,file.type)){messages.push(options.wrongMimeType.replace(/\{file\}/g,file.name))}}
if(options.maxSize&&options.maxSize<file.size){messages.push(options.tooBig.replace(/\{file\}/g,file.name))}
if(options.minSize&&options.minSize>file.size){messages.push(options.tooSmall.replace(/\{file\}/g,file.name))}}
function validateMimeType(mimeTypes,fileType){for(var i=0,len=mimeTypes.length;i<len;i++){if(new RegExp(mimeTypes[i]).test(fileType)){return!0}}
return!1}
function validateImageSize(file,image,messages,options){if(options.minWidth&&image.width<options.minWidth){messages.push(options.underWidth.replace(/\{file\}/g,file.name))}
if(options.maxWidth&&image.width>options.maxWidth){messages.push(options.overWidth.replace(/\{file\}/g,file.name))}
if(options.minHeight&&image.height<options.minHeight){messages.push(options.underHeight.replace(/\{file\}/g,file.name))}
if(options.maxHeight&&image.height>options.maxHeight){messages.push(options.overHeight.replace(/\{file\}/g,file.name))}}
return pub})(jQuery);+(function($){'use strict';var DraggableItem=function(el,option){var opts=$.extend({},{'container':null,'onInit':null,'onStart':null,'onDrag':null,'onDragged':null},option),$el=$(el),active=!1,startX,startY;var $container=opts.container instanceof jQuery?opts.container:$(opts.container);var setPosition=function(left,top){if($container.size()>0){var pos=$container.offset(),wC=$container.outerWidth(),hC=$container.outerHeight(),w=$el.outerWidth(),h=$el.outerHeight();if(left+w>pos.left+wC){left=pos.left+wC-w}
if(top+h>pos.top+hC){top=pos.top+hC-h}
if(left<pos.left){left=pos.left}
if(top<pos.top){top=pos.top}}
$el.offset({left:left,top:top})};$el.on('mousedown touchstart',function(e){var pos=$el.offset();startX=e.originalEvent.pageX-pos.left;startY=e.originalEvent.pageY-pos.top;active=!0;if(opts.onStart!==null){opts.onStart.call(el)}
if(window.mozInnerScreenX===null){return!1}});$(document).on('mousemove touchmove',function(e){if(active){e.preventDefault();setPosition(e.originalEvent.pageX-startX,e.originalEvent.pageY-startY);if(opts.onDrag!==null){opts.onDrag.call(el)}}}).on('mouseup touchend',function(){if(active){active=!1;if(opts.onDragged!==null){opts.onDragged.call(el)}}});$el.appendTo('body').css({zIndex:99,cursor:'move',position:'absolute'});setPosition(0,0);if(opts.onInit!==null){opts.onInit.call(el)}};$.fn.dragMove=function(option){return this.each(function(){DraggableItem(this,option)})}})(jQuery);+(function($){'use strict';$.fn.ajaxSubmit=function(onSuccess){return this.each(function(){var $form=$(this);!$form.data('ajax-bound')&&$form.data('ajax-bound',!0).submit(function(){if($form.isMasked()){return!1}
$form.mask();$form.find('.form-group').removeClass('has-error');$.ajax({'url':$form.attr('action'),'type':$form.attr('method'),'data':$form.serialize(),'dataType':'json','complete':function(){$form.unmask()},'success':function(data){var hasError=!1;for(var i in data){if(typeof data[i]==='object'&&data[i].length>0){var $el=$('#'+i);if($el.size()>0){hasError=!0;$el.focus().closest('.form-group').addClass('has-error').find('.help-block').html(data[i][0])}}}
if(!hasError&&typeof onSuccess==='function'){onSuccess.call($form.get(0),data)}},'error':function(x,s){var title,description;if(typeof x.responseJSON==='object'&&x.responseJSON.name){title=x.responseJSON.name;description=x.responseJSON.message}else{title=s.toUpperCase();description=x.responseText}
var $alert=$form.find('.alert');if($alert.size()>0){$alert.removeClass('hidden').find('span').html('<strong>'+title+'</strong> '+description)}else{alert(title+': '+description)}}});return!1})})}})(jQuery)
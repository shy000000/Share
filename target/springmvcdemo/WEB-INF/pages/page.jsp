<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">


        <script type="text/javascript">
            window.logs = {
                pagetime: {}
            };
            window.logs.pagetime['html_begin'] = (+new Date());
        </script>
        

<script type="text/javascript"> 

    var page_begintime = (+new Date());

    var biz = "MzAxODI5ODMwOA=="||"";
    var sn = "faa53bb0f7da8b1fc0438bcac783c3ad" || ""|| "";
    var mid = "2666538966" || ""|| "";
    var idx = "1" || "" || "";

    
    var is_rumor = ""*1;
    var norumor = ""*1;
    if (!!is_rumor&&!norumor){
      if (!document.referrer || document.referrer.indexOf("mp.weixin.qq.com/mp/rumor") == -1){
        location.href = "http://mp.weixin.qq.com/mp/rumor?action=info&__biz=" + biz + "&mid=" + mid + "&idx=" + idx + "&sn=" + sn + "#wechat_redirect";
      }
    }

    
    
</script>
<script type="text/javascript">
var MutationObserver = window.WebKitMutationObserver||window.MutationObserver||window.MozMutationObserver;
var isDangerSrc = function(src) {
    if(src) {
        var host = src.match(/http(?:s)?:\/\/([^\/]+?)(\/|$)/);
        if(host && !/qq\.com$/.test(host[1])) {
            return true;
        }
    }
    return false;
}
var ishttp = location.href.indexOf("http://")==0;
if (ishttp && typeof MutationObserver === 'function') {
    window.__observer_data = {count:0, exec_time: 0, list:[]};
    window.__observer = new MutationObserver(function(mutations) {
        
        window.__observer_data.count++;
        var begin = new Date(), deleteNodes = [];
        mutations.forEach(function(mutation) {
            var nodes = mutation.addedNodes;
            for (var i = 0; i < nodes.length; i++) {
                var node = nodes[i];

                if (node.tagName === 'SCRIPT') {
                    var scriptSrc = node.src;
                    if(isDangerSrc(scriptSrc)) {
                        window.__observer_data.list.push(scriptSrc);
                        deleteNodes.push(node);
                    }
                
                }
            }
        });
        for(var i=0; i<deleteNodes.length; i++) {
            var node = deleteNodes[i];
            node.parentNode.removeChild(node);
        }
        window.__observer_data.exec_time += (new Date() - begin);
    });
    window.__observer.observe(document, {subtree: true, childList: true});
}
(function() {
    if (Math.random()<0.01 && ishttp && HTMLScriptElement.prototype.__lookupSetter__ && typeof Object.defineProperty !== "undefined") {
        window.__danger_src = {xmlhttprequest:[], script_src: [], script_setAttribute: []};
        var t = "$"+Math.random();
        
        
        HTMLScriptElement.prototype.__old_method_script_src = HTMLScriptElement.prototype.__lookupSetter__ ('src');
        HTMLScriptElement.prototype.__defineSetter__ ('src', function(url) {
            if (url && isDangerSrc(url)) {
                
                window.__danger_src.script_src.push(url);
            }
            this.__old_method_script_src(url);
        });
        var element_setAttribute_method = "element_setAttribute"+t;
        Object.defineProperty(Element.prototype, element_setAttribute_method, {
            value: Element.prototype.setAttribute,
            enumerable: false
        });
        Element.prototype.setAttribute = function(name, url) {
            if (this.tagName == 'SCRIPT' && name == 'src' && isDangerSrc(url)) {
                
                window.__danger_src.script_setAttribute.push(url);
            }
            this[element_setAttribute_method](name, url);
        };
    }
})();
</script>

        <link rel="dns-prefetch" href="//res.wx.qq.com">
<link rel="dns-prefetch" href="//mmbiz.qpic.cn">
<link rel="shortcut icon" type="image/x-icon" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/favicon22c41b.ico">
<script type="text/javascript">
    String.prototype.html = function(encode) {
        var replace =["&#39;", "'", "&quot;", '"', "&nbsp;", " ", "&gt;", ">", "&lt;", "<", "&amp;", "&", "&yen;", "¥"];
        if (encode) {
            replace.reverse();
        }
        for (var i=0,str=this;i< replace.length;i+= 2) {
             str=str.replace(new RegExp(replace[i],'g'),replace[i+1]);
        }
        return str;
    };

    window.isInWeixinApp = function() {
        return /MicroMessenger/.test(navigator.userAgent);
    };

    window.getQueryFromURL = function(url) {
        url = url || 'http://qq.com/s?a=b#rd'; 
        var query = url.split('?')[1].split('#')[0].split('&'),
            params = {};
        for (var i=0; i<query.length; i++) {
            var arg = query[i].split('=');
            params[arg[0]] = arg[1];
        }
        if (params['pass_ticket']) {
        	params['pass_ticket'] = encodeURIComponent(params['pass_ticket'].html(false).html(false).replace(/\s/g,"+"));
        }
        return params;
    };

    (function() {
	    var params = getQueryFromURL(location.href);
        window.uin = params['uin'] || '';
        window.key = params['key'] || '';
        window.wxtoken = params['wxtoken'] || '';
        window.pass_ticket = params['pass_ticket'] || '';
    })();

</script>

        <title>Vim新手节省时间的10多个小技巧</title>
        
<link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve2d1390.css">
<style>
     
    </style>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_pc2c9cd6.css">
<![endif]-->
<script type="text/javascript">
    document.domain = "qq.com";
</script>

    </head>
    <body id="activity-detail" class="zh_CN mm_appmsg" ontouchstart="">
        
    <script type="text/javascript">
        var write_sceen_time = (+new Date());
    </script>
    
    <div id="js_cmt_mine" class="discuss_container editing access" style="display:none;">
        <div class="discuss_container_inner">
            <h2 class="rich_media_title">Vim新手节省时间的10多个小技巧</h2>
            <span id="log"></span>
            <div class="frm_textarea_box_wrp">
                <span class="frm_textarea_box">
                    <textarea id="js_cmt_input" class="frm_textarea" placeholder="留言将由公众号筛选后显示，对所有人可见。"></textarea>
                    <div class="emotion_tool">
                        <span class="emotion_switch" style="display:none;"></span>
                        <span id="js_emotion_switch" class="pic_emotion_switch_wrp">
                            <img class="pic_default" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/emotion/icon_emotion_switch.2x278965.png" alt="">
                            <img class="pic_active" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/emotion/icon_emotion_switch_active.2x278965.png" alt="">
                        </span>
                        <div class="emotion_panel" id="js_emotion_panel">
                            <span class="emotion_panel_arrow_wrp" id="js_emotion_panel_arrow_wrp">
                                <i class="emotion_panel_arrow arrow_out"></i>
                                <i class="emotion_panel_arrow arrow_in"></i>
                            </span>
                            <div class="emotion_list_wrp" id="js_slide_wrapper">
                                
                                
                            </div>
                            <ul class="emotion_navs" id="js_navbar">
                                
                            </ul>
                        </div>
                    </div>
                </span>
            </div>
            <div class="discuss_btn_wrp"><a id="js_cmt_submit" class="btn btn_primary btn_discuss btn_disabled" href="javascript:;">提交</a></div>
            <div class="discuss_list_wrp" style="display:none">
                <div class="rich_tips with_line title_tips discuss_title_line">
                    <span class="tips">我的留言</span>
                </div>
                <ul class="discuss_list" id="js_cmt_mylist"></ul>
            </div>
            <div class="rich_tips tips_global loading_tips" id="js_mycmt_loading">
                <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/icon_loading_white2805ea.gif" class="rich_icon icon_loading_white" alt="">
                <span class="tips">加载中</span>
            </div>
            <div class="wx_poptips" id="js_cmt_toast" style="display:none;">
                <img alt="" class="icon_toast" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGoAAABqCAYAAABUIcSXAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3NpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyMTUxMzkxZS1jYWVhLTRmZTMtYTY2NS0xNTRkNDJiOGQyMWIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MTA3QzM2RTg3N0UwMTFFNEIzQURGMTQzNzQzMDAxQTUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MTA3QzM2RTc3N0UwMTFFNEIzQURGMTQzNzQzMDAxQTUiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChNYWNpbnRvc2gpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NWMyOGVjZTMtNzllZS00ODlhLWIxZTYtYzNmM2RjNzg2YjI2IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjIxNTEzOTFlLWNhZWEtNGZlMy1hNjY1LTE1NGQ0MmI4ZDIxYiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pmvxj1gAAAVrSURBVHja7J15rF1TFMbXk74q1ZKHGlMkJVIhIgg1FH+YEpEQJCKmGBpThRoSs5jVVNrSQUvEEENIhGiiNf9BiERICCFIRbUiDa2qvudbOetF3Tzv7XWGffa55/uS7593977n3vO7e5+199p7v56BgQGh0tcmvAUERREUQVEERREUQVEERREUQVEERREUQVEERREUQVEERREUQVEERVAUQVEERVAUQbVYk+HdvZVG8b5F0xj4RvhouB+eCy8KrdzDJc1RtAX8ILxvx98V1GyCSkN98Cx4z/95/Wn4fj6j6tUEeN4wkFSnw1MJqj5NhBfAuwaUHREUg4lqNMmePVsHll/HFhVfe1t3FwpJI8DXCCquDrCWNN4B6Tb4M3Z98aTPmTvh0YHl18PXw29yZiKejoPvcUD6E74yFBJbVDk6Bb7K8aP/Hb4c/tRzEYIqprPhSxzlf4Uvhb/0Xoig8qnHAJ3lqPMzfDH8XZ4LEpRf2sVdA5/sqPO9Qfop70UJyn+/boaPddT5yrq7VUUvTIVJI7q74MMddXR8NB1eXcYvhBpZm0s2w72/o86HFoKvLau/pYaXzjLMdUJ6y0LwtWV9CIIaXtvA8+G9HHV03u5q+K+yH47U0NoRngPv7KjzHDwTLj0bS1BDazfJJlcnOOostC6ysnCT+q80G/sIvFVgeW09D8FPVT0uoP7VfvAD8NjA8pqmuAN+OcYAjso0RbIZ8DGB5TVNcRO8JMaHY9SXSdfa3eeANJimWBLrA7JFiZwIXye+NMUV8CcxP2SRFjXefok7NRjSGZJlWUPvw2/wtNiQirSoXWyMsR28wR7AzzYM0oXw+Y7yK+CLJGeaoqjyrJSdZJD6Ov4+z5y6NJc0Az7NUecHydIUy+v60KNyQHoM3nKI1y7YCFiq0i7uBvgER52vDdKqWn9djhY1Dn4G3n6Ecqm2rF74dvgoR53S0hQxW9RJAZAGW5bSn58QJA27dQ7uIEedjywEX5NKVxCqsY6y+qA+LxFI4+yZ6oH0trWkNan80jygtIUsc5SflgAsDXgehfdx1KkkTRE76tN+Xue2jnTU0Ru1oIbvpt30bBtKhOp5yaaRkts0lic8V1i6dPcIRx2d/l8Y8XtNNEg7OOo8bl1kmmOKnDsO88CaYzejau0hWZqiL7C83oCH4SeTHvwV2BqqsHRVztSEYOmWF80NeXZT6Hd4KflResE9vCnBOlCyGfDNAstHTVPUDWoQ1t3iW+9WNizvlhfd4aerXd+ThqiMfNR6+9LvOOro5OY5JX2H4+F7HZD+kGzlamMgldWiirQsjcwWFbjmqZJteekJLK9pisvgL6RhKvuciZiwzrWWGapfrPy30kBVcSBIrw0aD3PU0XB6cehntq7rTMf7/2iQlktDVdXJLXlg6VjmiYBn6rWSTRCH6hvJ0hQrpcGq8oidsmHpTP8t8DGO9/vcWt9qabiqPgup1yKyQwvC2tSefZ73SSpNkUJ4PlLorlHZ+446nc8f3fIyywlJhwrTuwVSjBa1ccvSxN0hjjoK5xVrYZMd9V6XbFfgBukixTwGLg8sDam3dZR/wZ6L/dJlin1en8LS+bgpFbz3Ygvzu1J1HKxYNqxGpCmaCEo12rrBorD6LRp8UbpcdR5VWhTW35KlKd6QFqjuM2XzwlpnMxTvSkuUwuG/Xlg6NtPjbT6WFimF/VG6LEvXgn8QGDjMbBukVECFwhpoS+CQatfX2Q1q6H7wENHdrfCr0lKleEB9JyxNneus+VJpsVL9TwI6W65LovWIGl3KtVJaLv7LBwYTFEERFEVQFEERFEVQFEERFEVQFEERFEVQFEERFEVQFEERFFWq/hFgADUMN4RzT6/OAAAAAElFTkSuQmCC">
                <p class="toast_content">已留言</p>
            </div>
        </div>
    </div>

    <div id="js_article" class="rich_media">
        
        <div id="js_top_ad_area" class="top_banner">
 
        </div>
                

        <div class="rich_media_inner">
            <div id="page-content">
                <div id="img-content" class="rich_media_area_primary">
                    <h2 class="rich_media_title" id="activity-name">
                        Vim新手节省时间的10多个小技巧 
                    </h2>
                    <div class="rich_media_meta_list">
                        						                        <em id="post-date" class="rich_media_meta rich_media_meta_text">2016-04-28</em>

                                                <a class="rich_media_meta rich_media_meta_link rich_media_meta_nickname" href="javascript:void(0);" id="post-user">Linux爱好者</a>
                        <span class="rich_media_meta rich_media_meta_text rich_media_meta_nickname">Linux爱好者</span>

                        <div id="js_profile_qrcode" class="profile_container" style="display:none;">
                            <div class="profile_inner">
                                <strong class="profile_nickname">Linux爱好者</strong>
                                <img class="profile_avatar" id="js_profile_qrcode_img" src="" alt="">

                                <p class="profile_meta">
                                <label class="profile_meta_label">微信号</label>
                                <span class="profile_meta_value">LinuxHub</span>
                                </p>

                                <p class="profile_meta">
                                <label class="profile_meta_label">功能介绍</label>
                                <span class="profile_meta_value">分享Linux/Unix相关的技术文章、教程和工具。</span>
                                </p>
                                
                            </div>
                            <span class="profile_arrow_wrp" id="js_profile_arrow_wrp">
                                <i class="profile_arrow arrow_out"></i>
                                <i class="profile_arrow arrow_in"></i>
                            </span>
                        </div>
                    </div>
                    
                    
                    
                    
                                                            
                                                            
                    
                    <div class="rich_media_content " id="js_content">
                        
                        <p><span style="font-size: 16px;"></span></p><p style="line-height: 25.6px; white-space: normal; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; line-height: 1.6; font-size: 14px; color: rgb(255, 41, 65); box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; line-height: 22.4px; box-sizing: border-box !important; word-wrap: break-word !important;">（点击</span><span style="max-width: 100%; line-height: 22.4px; color: rgb(0, 128, 255); box-sizing: border-box !important; word-wrap: break-word !important;">上方公众号</span><span style="max-width: 100%; line-height: 22.4px; box-sizing: border-box !important; word-wrap: break-word !important;">，可快速关注）</span></span></p><p style="line-height: 25.6px; white-space: normal; max-width: 100%; min-height: 1em; color: rgb(62, 62, 62); text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; line-height: 1.6; font-size: 14px; color: rgb(255, 41, 65); box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; line-height: 22.4px; box-sizing: border-box !important; word-wrap: break-word !important;"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"  /></span></span></p><blockquote style="line-height: 25.6px; white-space: normal; max-width: 100%; color: rgb(62, 62, 62); box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><h1 style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;">来自：Specs&#39; Blog-就爱PHP</span></h1><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;">链接：http://9iphp.com/linux/time-saving-tips-for-unix-vim-beginners.html</span></p></blockquote><p><span style="font-size: 16px;"><br  /></span></p><p><span style="font-size: 16px;">Vim 是很多开发者的首选编辑器，通过设置正确的命令和快捷方式，它可以帮你更快的完成工作。这篇文章我们为 Vim 新手提供一些快捷键等方面的小技巧，帮你提升工作效率。</span></p><p><br  /></p><p><strong><span style="font-size: 16px; color: rgb(171, 25, 66);">1. 配置 vimrc</span></strong></p><p><br  /></p><p><span style="font-size: 16px;">当我最初使用 vim 的时候，我浪费了好多时间来缩进代码，我不知道通过修改 Vim 的 .vimrc 配置文件来实现代码缩进、语法高亮、显示行号等功能。</span></p><p><span style="font-size: 16px;">在你的 Home 目录下创建一个 .vimrc 文件，添加下面的代码来设置行号、代码缩进等。</span></p><p><br  /></p><blockquote><p><span style="font-size: 12px; color: rgb(178, 178, 178);">set number &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # 显示行号&nbsp;</span></p><p><span style="font-size: 12px; color: rgb(178, 178, 178);">set autoindent &nbsp; &nbsp; &nbsp; &nbsp; # 自动缩进&nbsp;</span></p><p><span style="font-size: 12px; color: rgb(178, 178, 178);">set nowrap &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; # 不换行</span></p></blockquote><p><br  /></p><p><strong><span style="font-size: 16px; color: rgb(171, 25, 66);">2. 不关闭终端退出编辑器</span></strong></p><p><br  /></p><p><span style="font-size: 16px;">使用 Vim 编辑器保存并退出编辑状态是一件轻而易举的事，你只需记住按 ESC 键切换到正常模式，然后输入冒号(:)，之后输入 wq 即可实现保存并退出。</span></p><p><br  /></p><blockquote><p><span style="font-size: 12px; color: rgb(178, 178, 178);">: wq</span></p></blockquote><p><br  /></p><p><span style="font-size: 16px;">如果不想保存，则按 ESC 键切换到正常模式，然后输入冒号(:)，之后输入 q! 即可。</span></p><p><br  /></p><blockquote><span style="font-size: 12px; color: rgb(178, 178, 178);">&nbsp;: q!</span></blockquote><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">3. 删除一行或多行</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">通过退格键(Backspace)来删除一行代码显然是太麻烦了。可以通过切换到正常模式(编辑模式下按 ESC 键)来进行操作：</span></p><p><br  /></p><blockquote><p><span style="font-size: 12px; color: rgb(178, 178, 178);">dd ： (输入两次 d，下同)删除当前行；5dd ：删除当前行开始的5行；&nbsp;</span></p><p><span style="font-size: 12px; color: rgb(178, 178, 178);">dG ：(先输入d，然后按 shift 键输入 g)删除当前行至最后一行的所以行。</span></p></blockquote><p><span style="font-size: 16px;"><br  /></span></p><p><strong><span style="font-size: 16px; color: rgb(171, 25, 66);">4. 复制粘贴一块代码</span></strong></p><p><br  /></p><p><span style="font-size: 16px;">你可能经常需要复制一行或一大块代码，使用 Vim 快捷键来实现此功能是非常简单的：</span></p><p><span style="font-size: 16px;"><br  /></span></p><blockquote><p><span style="font-size: 14px;">按 Esc 切换到正常模式；</span></p><p><span style="font-size: 14px;">把光标移到你需要复制的代码行首；&nbsp;</span></p><p><span style="font-size: 14px;">按 V 选择整行，可移动光标选择多行；&nbsp;</span></p><p><span style="font-size: 14px;">按 d 剪切或按 y 复制选择的代码；&nbsp;</span></p><p><span style="font-size: 14px;">移动光标到你需要粘贴的位置，按 p 粘贴代码到光标后的位置，或按 P 粘贴到光标前。</span></p></blockquote><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">5. 撤销与重做</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">在使用 Vim 或其他编辑器的时候，你可能经常需要对某些修改进行撤销或重做。在 Vim 中，你可以切换到正常模式，按 u 来撤销操作，按 Ctrl+r 来重做。</span></p><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">6. 代码注释</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">代码注释：</span></p><p><span style="font-size: 16px;"><br  /></span></p><blockquote><p><span style="font-size: 14px;">按 Ctrl+v 切换到可视化模式；&nbsp;</span></p><p><span style="font-size: 14px;">移动光标(j 或 k)选中需要注释的行的开头；&nbsp;</span></p><p><span style="font-size: 14px;">按大写 I，然后输入注释符，如 #；
最后按 Esc。</span></p></blockquote><p><br  /></p><p><span style="font-size: 16px;">取消注释：</span></p><p><span style="font-size: 16px;"><br  /></span></p><blockquote><p><span style="font-size: 14px;">按 Ctrl+v 切换到可视化模式；&nbsp;</span></p><p><span style="font-size: 14px;">按 j 或 k 选择要删除的注释符；&nbsp;</span></p><p><span style="font-size: 14px;">按 d 或 x 删除注释符</span></p></blockquote><p><br  /></p><p><span style="font-size: 16px;">如果使用 // 符号注释，则取消注释时需进行两遍操作。</span></p><p><br  /></p><p><strong><span style="font-size: 16px; color: rgb(171, 25, 66);">7. 搜索</span></strong></p><p><br  /></p><p><span style="font-size: 16px;">搜索在很多时候都是一个非常重要的功能。在文件中搜索一个特定的词，可以切换到正常模式，然后输入斜线( / )，之后跟上要搜索的词，回车即可。</span></p><p><span style="font-size: 16px;"><br  /></span></p><blockquote><span style="color: rgb(178, 178, 178); font-size: 12px;">/word-to-be-searched</span></blockquote><p><br  /></p><p><span style="font-size: 16px;">按 n 显示下一个搜索结果，按 N 显示上一个搜索结果。</span></p><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">8. 把外部文件读入 Vim</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">我开始使用 Vim 的时候，经常会打开一个文件、复制内容、关闭文件、打开另一个文件、然后粘贴进去复制到内容。其实 Vim 中读取另一个文件的内容非常方便。切换到正常模式，然后按 :read。使用此快捷键你不需要手动打开文件来复制内容。</span></p><p><br  /></p><blockquote><p><span style="font-size: 12px; color: rgb(178, 178, 178);">:read readme.md</span></p></blockquote><p><br  /></p><p><strong><span style="font-size: 16px; color: rgb(171, 25, 66);">9. 把命令的结果读入 Vim</span></strong></p><p><br  /></p><p><span style="font-size: 16px;">有时候你需要把某个命令的结果复制到 Vim 中，这在 Vim 也非常简单。切换到正常模式，然后输入 :read !command 即可把 command 的结果输入到 vim 中。</span></p><p><br  /></p><blockquote><p><span style="color: rgb(178, 178, 178); font-size: 12px;">:read !ls -l</span></p></blockquote><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">10. 切换到上次修改的位置</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">想知道你在文件中做的最后一次修改是在什么位置？切换到正常模式，输入 g; 来即可切换到上次修改的位置。</span></p><p><br  /></p><p><span style="color: rgb(171, 25, 66);"><strong><span style="font-size: 16px;">11. 移动到文件顶部或底部</span></strong></span></p><p><br  /></p><p><span style="font-size: 16px;">当需要移动到文件顶部或底部时，通过 j 或 k 来一行行的移动显得有点麻烦。Vim 提供了一个快捷键可直接实现此功能。切换到正常模式，输入 gg 返回文件顶部，输入 G 返回文件底部。</span></p><p><br  /></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; color: rgb(136, 136, 136); line-height: 28.4444px; box-sizing: border-box !important; word-wrap: break-word !important;">【今日微信公号推荐↓】</span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><img data-s="300,640" data-type="png" data-src="http://mmbiz.qpic.cn/mmbiz/9aPYe0E1fb3F3vfLrFzUFjcX1gIhlGXHoHr8TWVpgnFjgzx4UPia3r2vfjCFMFFPDfwODvQGO4JcIdxxM0q9IjQ/0?wx_fmt=png" data-ratio="0.6258992805755396" data-w=""  /><br  /><span style="max-width: 100%; line-height: 25.6px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;">更多推荐请看</span><strong style="max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;">《</span></strong><a href="http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&amp;mid=415754379&amp;idx=1&amp;sn=fabfe6514dc817145df3bac5a8c571b3&amp;scene=21#wechat_redirect" target="_blank" data_ue_src="http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&amp;mid=415754379&amp;idx=1&amp;sn=fabfe6514dc817145df3bac5a8c571b3&amp;scene=21#wechat_redirect" style="max-width: 100%; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; color: rgb(255, 169, 0); box-sizing: border-box !important; word-wrap: break-word !important;">值得关注的技术和设计公众号</span></a><span style="max-width: 100%; line-height: 25.6px; font-size: 14px; box-sizing: border-box !important; word-wrap: break-word !important;"><strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 16px; box-sizing: border-box !important; word-wrap: break-word !important;">》</span></strong></span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; font-size: 14px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><span style="max-width: 100%; font-size: 14px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">其中推荐了包括<strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">技术</strong>、<strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">设计</strong>、<strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">极客&nbsp;</strong>和&nbsp;<strong style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">IT相亲</strong>相关的热门公众号。技术涵盖：Python、Web前端、Java、安卓、iOS、PHP、C/C++、.NET、Linux、数据库、运维、大数据、算法、IT职场等。点击《</span><a href="http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&amp;mid=415754379&amp;idx=1&amp;sn=fabfe6514dc817145df3bac5a8c571b3&amp;scene=21#wechat_redirect" target="_blank" data_ue_src="http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&amp;mid=415754379&amp;idx=1&amp;sn=fabfe6514dc817145df3bac5a8c571b3&amp;scene=21#wechat_redirect" style="max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="max-width: 100%; font-size: 14px; color: rgb(255, 169, 0); box-sizing: border-box !important; word-wrap: break-word !important;">值得关注的技术和设计公众号</span></a><span style="max-width: 100%; font-size: 14px; color: rgb(136, 136, 136); box-sizing: border-box !important; word-wrap: break-word !important;">》，发现精彩！</span></p><p style="max-width: 100%; min-height: 1em; white-space: pre-wrap; line-height: 25.6px; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important; background-color: rgb(255, 255, 255);"><img data-s="300,640" data-type="png" data-ratio="0.9172661870503597" data-w="" width="auto" data-src="http://mmbiz.qpic.cn/mmbiz/9aPYe0E1fb3pM7icLAjgAQoDMB78Lq9AejNpNtib1G9XaxbSQMjT7xCQn0tVRkOxhTTkpwByiaYNErwwiallcatdBA/640?wx_fmt=png" style="box-sizing: border-box !important; word-wrap: break-word !important; width: auto !important; visibility: visible !important;"  /></p>
                    </div>
                    <script type="text/javascript">
                        var first_sceen__time = (+new Date());

                        if ("" == 1 && document.getElementById('js_content'))
                            document.getElementById('js_content').addEventListener("selectstart",function(e){ e.preventDefault(); });

                                        (function(){
                            if (navigator.userAgent.indexOf("WindowsWechat") != -1){
                                var link = document.createElement('link');
                                var head = document.getElementsByTagName('head')[0];
                                link.rel = 'stylesheet';
                                link.type = 'text/css';
                                link.href = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_winwx2c9cd6.css";
                                head.appendChild(link);
                            }
                        })();
                    </script>
                    <link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_combo2d1390.css">
                    
                    
                                        
                                        
                                        <div class="rich_media_tool" id="js_toobar3">
                                                                    <div id="js_read_area3" class="media_tool_meta tips_global meta_primary" style="display:none;">阅读 <span id="readNum3"></span></div>

                        <span style="display:none;" class="media_tool_meta meta_primary tips_global meta_praise" id="like3">
                            <i class="icon_praise_gray"></i><span class="praise_num" id="likeNum3"></span>
                        </span>

                        <a id="js_report_article3" style="display:none;" class="media_tool_meta tips_global meta_extra" href="javascript:void(0);">投诉</a>

                    </div>



                                    </div>

                <div class="rich_media_area_primary sougou" id="sg_tj" style="display:none">

                </div>

                <div class="rich_media_area_extra">

                    
                                        <div class="mpda_bottom_container" id="js_bottom_ad_area">
                        
                    </div>
                                        
                    <div id="js_iframetest" style="display:none;"></div>
                                        
                                        <div class="rich_media_extra" id="js_cmt_area" style="display:none">

                        <div class="discuss_container" id="js_cmt_main" style="display:none">
                            <div class="rich_tips with_line title_tips discuss_title_line">
                                <span class="tips">精选留言</span>
                            </div>
                            <p class="tips_global tc title_bottom_tips" id="js_cmt_nofans1" style="display:none;">该文章作者已设置需关注才可以留言</p>
                            <p class="discuss_icon_tips title_bottom_tips tr" id="js_cmt_addbtn1" style="display:none">
                                
                                                                <a href="#comment">写留言<img class="icon_edit" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/icon_edit25ded2.png" alt=""></a>
                                                            </p>
                            <ul class="discuss_list" id="js_cmt_list"></ul>
                        </div>


                        <div class="tips_global rich_split_tips tc" id="js_cmt_nofans2" style="display:none;">
                            该文章作者已设置需关注才可以留言
                        </div>

                        <p class="discuss_icon_tips rich_split_tips tr" id="js_cmt_addbtn2" style="display:none">
                            
                                                        <a href="#comment">写留言<img class="icon_edit" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/icon_edit25ded2.png" alt=""></a>
                                                    </p>

                        <p class="rich_split_tips tc tips_global" id="js_cmt_tips" style="display:none;"></p>


                        <div class="rich_tips tips_global loading_tips" id="js_cmt_loading">
                            <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/icon_loading_white2805ea.gif" class="rich_icon icon_loading_white" alt="">
                            <span class="tips">加载中</span>
                        </div>

                        <div class="rich_tips with_line tips_global" id="js_cmt_statement" style="display:none">
                            <span class="tips">以上留言由公众号筛选后显示</span>
                        </div>

                        <p class="rich_split_tips tc" id="js_cmt_qa" style="display:none;">
                            <a href="http://kf.qq.com/touch/sappfaq/150211YfyMVj150313qmMbyi.html?scene_id=kf264">
                                了解留言功能详情
                            </a>
                        </p>

                    </div>
                                    </div>
               
            </div>
            <div id="js_pc_qr_code" class="qr_code_pc_outer" style="display:none;">
                <div class="qr_code_pc_inner">
                    <div class="qr_code_pc">
                        <img id="js_pc_qr_code_img" class="qr_code_pc_img">
                        <p>微信扫一扫<br>关注该公众号</p>
                    </div>
                </div>
            </div>

        </div>
    </div>


        
        <script>
    var __DEBUGINFO = {
        debug_js : "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/debug/console2ca724.js",
        safe_js : "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/safe/moonsafe2d5cb8.js",
        res_list: []
    };
</script>
        <script>window.moon_map = {"appmsg/emotion/caret.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/caret278965.js","biz_wap/jsapi/cardticket.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/cardticket275627.js","appmsg/emotion/map.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/map278965.js","appmsg/emotion/textarea.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/textarea27cdc5.js","appmsg/emotion/nav.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/nav278965.js","appmsg/emotion/common.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/common278965.js","appmsg/emotion/slide.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/slide2a9cd9.js","pages/report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/report2c9cd6.js","pages/music_player.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/music_player2b674b.js","pages/loadscript.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/loadscript2c9cd6.js","appmsg/emotion/dom.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/dom278965.js","biz_wap/utils/hashrouter.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/hashrouter2805ea.js","a/gotoappdetail.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/gotoappdetail2a2c13.js","a/ios.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/ios275627.js","a/android.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/android2c5484.js","a/profile.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/profile29b1f8.js","a/mpshop.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/mpshop2d1390.js","a/card.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/a/card2d1390.js","biz_wap/utils/position.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/position29b1f8.js","appmsg/a_report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a_report2b6c15.js","biz_common/utils/respTypes.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/respTypes2c57d0.js","appmsg/cmt_tpl.html.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cmt_tpl.html2a2c13.js","sougou/a_tpl.html.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/sougou/a_tpl.html2c6e7c.js","appmsg/emotion/emotion.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/emotion/emotion2a9cd9.js","biz_common/utils/report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/report275627.js","biz_common/utils/huatuo.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/huatuo293afc.js","biz_common/utils/cookie.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/cookie275627.js","pages/voice_component.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/voice_component2c5484.js","new_video/ctl.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/new_video/ctl2d441f.js","biz_common/utils/monitor.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/monitor2a30ee.js","biz_common/utils/spin.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/spin275627.js","biz_wap/jsapi/pay.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/pay275627.js","appmsg/reward_entry.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/reward_entry2b1291.js","appmsg/comment.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/comment2d39f3.js","appmsg/like.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/like2b5583.js","appmsg/a.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a2d55d3.js","pages/version4video.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/pages/version4video2c7543.js","rt/appmsg/getappmsgext.rt.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/rt/appmsg/getappmsgext.rt2c21f6.js","biz_wap/utils/storage.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/storage2a74ac.js","biz_common/tmpl.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/tmpl2b3578.js","appmsg/img_copyright_tpl.html.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/img_copyright_tpl.html2a2c13.js","appmsg/a_tpl.html.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/a_tpl.html2d1390.js","biz_common/ui/imgonepx.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/ui/imgonepx275627.js","biz_common/dom/attr.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/attr275627.js","biz_wap/utils/ajax.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/ajax2c7a90.js","biz_common/utils/string/html.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/string/html29f4e9.js","sougou/index.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/sougou/index2c7543.js","biz_wap/safe/mutation_observer_report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/safe/mutation_observer_report2d5cb8.js","appmsg/report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/report2cf2a3.js","biz_common/dom/class.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/class275627.js","appmsg/report_and_source.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/report_and_source2c0ff9.js","appmsg/page_pos.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/page_pos2d38d6.js","appmsg/cdn_speed_report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cdn_speed_report2c57d0.js","appmsg/voice.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/voice2ab8bd.js","appmsg/qqmusic.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/qqmusic2ab8bd.js","appmsg/iframe.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/iframe2cc9e4.js","appmsg/review_image.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/review_image2d0cfe.js","appmsg/outer_link.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/outer_link275627.js","biz_wap/jsapi/core.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/core2c30c1.js","biz_common/dom/event.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/dom/event275627.js","appmsg/copyright_report.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/copyright_report2c57d0.js","appmsg/cache.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cache2a74ac.js","appmsg/pay_for_reading.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/pay_for_reading2c5484.js","appmsg/async.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/async2d625d.js","biz_wap/ui/lazyload_img.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/ui/lazyload_img2b18f6.js","biz_common/log/jserr.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/log/jserr2805ea.js","appmsg/share.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/share2d39f3.js","biz_wap/utils/mmversion.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/mmversion275627.js","appmsg/cdn_img_lib.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/cdn_img_lib275627.js","biz_common/utils/url/parse.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_common/utils/url/parse2d1e61.js","biz_wap/utils/device.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/utils/device2b3aae.js","biz_wap/jsapi/a8key.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/jsapi/a8key2a30ee.js","appmsg/index.js":"http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/appmsg/index2d625d.js"};window.moon_crossorigin = true;</script><script type="text/javascript" src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/js/biz_wap/moon2c7b0a.js" crossorigin></script>
    <script id="voice_tpl" type="text/html">        
        <span id="voice_main_<#=voiceid#>_<#=posIndex#>" class="db audio_area <#if(!musicSupport){#> unsupport<#}#>">
            <span class="tc tips_global unsupport_tips" <#if(show_not_support!==true){#>style="display:none;"<#}#>>
            当前浏览器不支持播放音乐或语音，请在微信或其他浏览器中播放            </span>
            <span class="audio_wrp db">
                <span id="voice_play_<#=voiceid#>_<#=posIndex#>" class="audio_play_area">
                    <i class="icon_audio_default"></i>
                    <i class="icon_audio_playing"></i>
                    <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/audio/icon_audio_unread26f1f1.png" alt="" class="pic_audio_default">
                </span>
                <span class="audio_length tips_global"><#=duration_str#></span>
                <span class="db audio_info_area">
                    <strong class="db audio_title"><#=title#></strong>
                    <span class="audio_source tips_global"><#if(window.nickname){#>来自<#=window.nickname#><#}#></span>
                </span>
                <span id="voice_progress_<#=voiceid#>_<#=posIndex#>" class="progress_bar" style="width:0px;"></span>
            </span>
        </span>
    </script>

    <script id="qqmusic_tpl" type="text/html">        
        <span id="qqmusic_main_<#=comment_id#>_<#=posIndex#>" class="db qqmusic_area <#if(!musicSupport){#> unsupport<#}#>">
            <span class="tc tips_global unsupport_tips" <#if(show_not_support!==true){#>style="display:none;"<#}#>>
            当前浏览器不支持播放音乐或语音，请在微信或其他浏览器中播放            </span>
            <span class="db qqmusic_wrp">
                <span class="db qqmusic_bd">
                    <span id="qqmusic_play_<#=musicid#>_<#=posIndex#>" class="play_area">
                        <i class="icon_qqmusic_switch"></i>
                        <img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/qqmusic/icon_qqmusic_default.2x26f1f1.png" alt="" class="pic_qqmusic_default">
                        <img src="<#=music_img#>" data-autourl="<#=audiourl#>" data-musicid="<#=musicid#>" class="qqmusic_thumb" alt="">
                    </span>
                                        <a id="qqmusic_home_<#=musicid#>_<#=posIndex#>" href="javascript:void(0);" class="access_area">
                        <span class="qqmusic_songname"><#=music_name#></span>
                        <span class="qqmusic_singername"><#=singer#></span>
                        <span class="qqmusic_source"><img src="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/appmsg/qqmusic/icon_qqmusic_source263724.png" alt=""></span>
                    </a>
                </span>
            </span>       
        </span>
    </script>
  <script type="text/javascript">
      var not_in_mm_css = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/not_in_mm2c9cd6.css";
      var windowwx_css = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_winwx2c9cd6.css";
      var tid = "";
      var aid = "";
      var clientversion = "0";
      var appuin = "MzAxODI5ODMwOA=="||"";

      var source = "0";
      var scene = 75;
      
      var itemidx = "";

      var _copyright_stat = "0";
      var _ori_article_type = "";

      var nickname = "Linux爱好者";
      var appmsg_type = "9";
      var ct = "1461849383";
      var publish_time = "2016-04-28" || "";
      var user_name = "gh_9f1efcd6f4ab";
      var user_name_new = "";
      var fakeid   = "Mjg3OTA0MzM0MA==";
      var version   = "";
      var is_limit_user   = "0";
      var round_head_img = "http://mmbiz.qpic.cn/mmbiz/9aPYe0E1fb1xxYVVwic8apof3IibkbkMC7OgWGiccue7ib3ymGtK0dicyiaSTCibozOqLia6njASFKPU3Z9WgMjuqHtZicg/0";
      var msg_title = "Vim新手节省时间的10多个小技巧";
      var msg_desc = "Vim&nbsp;是很多开发者的首选编辑器，通过设置正确的命令和快捷方式，它可以帮你更快的完成工作。这篇文章我们为&nbsp;Vim&nbsp;新手提供一些快捷键等方面的小技巧，帮你提升工作效率。";
      var msg_cdn_url = "http://mmbiz.qpic.cn/mmbiz/9aPYe0E1fb3Xv99H3SYxloIEZN6cBsZ34UQ6D0XIUjtgPsjkvRdN64g3I1YUbHrLqExqrZlP3PwIIOTtet9fNA/0?wx_fmt=png";
      var msg_link = "http://mp.weixin.qq.com/s?__biz=MzAxODI5ODMwOA==&amp;mid=2666538966&amp;idx=1&amp;sn=faa53bb0f7da8b1fc0438bcac783c3ad#rd";
      var user_uin = "0"*1;
      var msg_source_url = '';
      var img_format = 'png';
      var srcid = '';
      var networkType;
      var appmsgid = '' || '2666538966'|| "";
      var comment_id = "3415706704" * 1;
      var comment_enabled = "" * 1;
      var is_need_reward = "0" * 1;
      var is_https_res = ("" * 1) && (location.protocol == "https:");

      var devicetype = "";
      var source_username = "";  
      var profile_ext_signature = "" || "";
      var reprint_ticket = "";
      var source_mid = "";
      var source_idx = "";

      var show_comment = "";
      var __appmsgCgiData = {
            can_use_page : "0"*1,
            is_wxg_stuff_uin : "0"*1,
            card_pos : "",
            copyright_stat : "0",
            source_biz : "",
            hd_head_img : "http://wx.qlogo.cn/mmhead/Q3auHgzwzM53GhuQezzicrp8s6KwSxMK27OhdKPAOPHg64G3QMRaIibg/0"||(window.location.protocol+"//"+window.location.host + "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/appmsg/pic_rumor_link.2x264e76.jpg")
      };
      var _empty_v = "http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/pic/pages/voice/empty26f1f1.mp3";

      var copyright_stat = "0" * 1;

      var pay_fee = "" * 1;
      var pay_timestamp = "";
      var need_pay = "" * 1;

      var need_report_cost = "0" * 1;
      var use_tx_video_player = "0" * 1;

      var friend_read_source = "" || "";
      var friend_read_version = "" || "";
      var friend_read_class_id = "" || "";
      
            window.wxtoken = "";
          if(!!window.__initCatch){
        window.__initCatch({
            idkey : 27613,
            startKey : 0,
            limit : 128,
            reportOpt : {
                uin : uin,
                biz : biz,
                mid : mid,
                idx : idx,
                sn  : sn
            },
            extInfo : {
                network_rate : 0.01    
            }
        });
    }
  </script>
  <script type="text/javascript">
          seajs.use('appmsg/index.js');
  </script>

    </body>
</html>

 

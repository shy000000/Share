var myScroll, pullUpEl, pullUpOffset, iFload = false;
var pageIndex = 0;	// 查询第几页
var pageNum   = 10;	// 每页显示多少条
var h = $(window).height();
var cH = 0;

$(function() {
	cH = h - $('.header').innerHeight() - $('.menu').innerHeight() - $('#pullUp').innerHeight();
})

function loaded() {
	
	pullUpEl = document.getElementById('pullUp');	
	pullUpOffset = pullUpEl.offsetHeight;

	myScroll = new iScroll('contentWrap', {
		scrollbarClass: 'myScrollbar',
		useTransition: true,
		onRefresh: function () {
			if (pullUpEl.className.match('loadData')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '↑上拉加载更多...';
			}
		},
		onScrollMove: function () {
			if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
				pullUpEl.className = 'flip';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '<span class="load"></span>松手开始更新...';
				this.maxScrollY = this.maxScrollY;
			} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
				pullUpEl.className = '';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '↑上拉加载更多...';
				this.maxScrollY = pullUpOffset;
			}
		},
		onScrollEnd: function () {
			if (pullUpEl.className.match('flip')) {
				pullUpEl.className = 'loadData';
				pullUpEl.querySelector('.pullUpLabel').innerHTML = '<span class="load"></span>正在加载中...';
				loadList();
				$('.myScrollbarV').css('visibility','visible');
			}
		}
	});
	loadList();
	$('.loading-list').fadeOut();
	
	$("menu.menu ul li a").removeClass("active");
	var arr = $("menu.menu ul li a");
	var hasActive = false;
	for (i = 0; i < arr.length; i++) {
		if ($("#classify_index").val() == $(arr[i]).data("index")) {
			$(arr[i]).addClass("active");
			hasActive = true;
			return;
		}
	}
	if (!hasActive) $("menu.menu ul li a").eq(0).addClass("active");
}

//初始化绑定iScroll控件 
document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);

$(document).on('click', '.opacity', function() {
	//获取子列表id
	var cid = $("#cid").val();
	var url = $(this).attr("url");
	$.ajax({
		url: 'goldPointingController/search.action',
		data:{"rsp":1,"cid":cid,"url":url},
		dataType: 'text',
		success: function (data) {
			window.location.replace(data);
		}
	});
});
$(document).ready(function() {
	$("menu.menu ul li a").on("click", function() {
		if ($(this).hasClass("active")) return;
		
		$("menu.menu ul li a").removeClass("active");
		$(this).addClass("active");

		$("#classify_index").val($(this).data("index"));
		pageIndex = 0;
		$(".listDiv").html("");
		loadList();
	});
});


//获取列表数据
function loadList() {
	pageIndex ++;
	console.log(pageIndex);
	var url = 'index.php/Article/articlelist/page/' + pageIndex + '/num/' + pageNum + '/type/' + $("#classify_index").val();
	$.ajax({
		url : url,
		type: 'GET',
		dataType:'json',
		timeout: 5000,
		success : function(data) {
			var len = data.data.length;
			
			if (data.data != "404") {
				var content = '';
				for (var i = 0; i < len; i++) {
					content += '<a class="opacity" href="index.php/Article/info/id/'+data.data[i].id+'/uid/'+ uid +'">'+
						'<figure>'+
							'<img src="' + data.data[i].pic + '" width="60" height="60" />'+
							'<figcaption class="listCon">'+
								'<h3 class="title">'+data.data[i].title+'</h3>'+
								'<p class="numberDiv">'+
									'<span class="forward">阅读次数:'+data.data[i].pv+'次</span>'+
								'</p>'+
							'</figcaption>'+
						'</figure>'+
					'</a>';
				}
				$('.listDiv').append(content); 
				myScroll.refresh();
			} else {
				$('.pullUpLabel').html('-_-亲，没有更多内容了！');
				pageIndex -= 1;
			}
		},
		error: function(error){
			pageIndex -= 1;
		}
	});
}


// JavaScript Document
$(document).ready(function(e) {
	/** *不需要自动滚动，去掉即可** */
	time = window.setInterval(function() {
		$('.og_next').click();
	}, 5000);
	/** *不需要自动滚动，去掉即可** */
	linum = $('.mainlist li').length;// 图片数量
	var gundong = 320;// 每次移动的宽度
	w = linum * 320;// ul宽度
	$('.piclist').css('width', w + 'px');// ul宽度
	$('.swaplist').html($('.mainlist').html());// 复制内容

	$('.og_next').click(function() {

		if ($('.swaplist,.mainlist').is(':animated')) {
			$('.swaplist,.mainlist').stop(true, true);
		}

		if ($('.mainlist li').length > 1) {// 多于1张图片
			ml = parseInt($('.mainlist').css('left'));// 默认图片ul位置
			sl = parseInt($('.swaplist').css('left'));// 交换图片ul位置
			if (ml <= 0 && ml > w * -1) {// 默认图片显示时
				$('.swaplist').css({
					left : gundong + 'px'
				});// 交换图片放在显示区域右侧
				$('.mainlist').animate({
					left : ml - gundong + 'px'
				}, 'slow');// 默认图片滚动
				if (ml === (w - gundong) * -1) {// 默认图片最后一屏时
					$('.swaplist').animate({
						left : '0px'
					}, 'slow');// 交换图片滚动
				}
			} else {// 交换图片显示时
				$('.mainlist').css({
					left : gundong + 'px'
				});// 默认图片放在显示区域右
				$('.swaplist').animate({
					left : sl - gundong + 'px'
				}, 'slow');// 交换图片滚动
				if (sl === (w - gundong) * -1) {// 交换图片最后一屏时
					$('.mainlist').animate({
						left : '0px'
					}, 'slow');// 默认图片滚动
				}
			}
		}
	});
	$('.og_prev').click(function() {

		if ($('.swaplist,.mainlist').is(':animated')) {
			$('.swaplist,.mainlist').stop(true, true);
		}

		if ($('.mainlist li').length > 1) {
			ml = parseInt($('.mainlist').css('left'));
			sl = parseInt($('.swaplist').css('left'));
			if (ml <= 0 && ml > w * -1) {
				$('.swaplist').css({
					left : w * -1 + 'px'
				});
				$('.mainlist').animate({
					left : ml + gundong + 'px'
				}, 'slow');
				if (ml === 0) {
					$('.swaplist').animate({
						left : (w - gundong) * -1 + 'px'
					}, 'slow');
				}
			} else {
				$('.mainlist').css({
					left : (w - gundong) * -1 + 'px'
				});
				$('.swaplist').animate({
					left : sl + gundong + 'px'
				}, 'slow');
				if (sl === 0) {
					$('.mainlist').animate({
						left : '0px'
					}, 'slow');
				}
			}
		}
	});
});

$(document).ready(function() {
	$('.og_prev,.og_next').hover(function() {
		$(this).fadeTo('fast', 1);
	}, function() {
		$(this).fadeTo('fast', 0.7);
	});

});

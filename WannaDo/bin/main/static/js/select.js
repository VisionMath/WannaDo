$(document).ready(function () {
	$('.style_select').click(function () {
		/*$('.style_select').removeClass('style_active');*/
		$(this).toggleClass('style_active');
		var active = "";
		active = $(this).text();
		/*$('.style_active').each(function (i) {
			active.push($(this).text());
		})*/
		$.ajax({
			url: 'select',
			type: 'post',
			dataType: 'html',
			data: {
				"active": active,
			},
			success: function (data) {
				console.log(data);
			}
		}).done(function (res) {
			$('.main').empty();
			$('.main').append(res);
		});
	})
});
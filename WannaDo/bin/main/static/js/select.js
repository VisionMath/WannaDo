$(document).ready(function () {
	$('.style_select').click(function () {
		$(this).toggleClass('style_active');
		var active = "";
		active = $(this).text();
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
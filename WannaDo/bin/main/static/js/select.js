$(document).ready(function () {
	$('.style_select').click(function () {
		$(this).toggleClass('style_active');
		var active = [];
		$('.style_active').each(function (i) {
			active.push($(this).text());
		})
		$.ajax({
			url: 'select',
			type: 'post',
			dataType: 'html',
			data: {
				"active": active,
			},
			success: function (data) {
				$('.main').innerHTML='';
			}
		}).done(function (res) {
			$('.main').innerHTML='';
			$('.main').append(res);
			/*console.log(res);
			if (res == "index1234") {
				console.log("리턴값 여기로");
			} else {
				console.log("전송 실패");
			}*/
		});
	})
});
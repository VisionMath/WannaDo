/**
 * 
 */
 
$(document).ready(function(){
	//alert("aaaaaaaaaaaaaaa");
	//var exp = /^[0-9]{3}[0-9]{4}[0-9]{4}$/
	var regex = /[^0-9]/g;
	
	$("#orderConfirm").click(function(){
		if($("#address").val()==""){
			alert("배송지를 입력하세요");
			$("#address").focus();
			return false;
		}
		
		var data={
			"amount":$("#amount").val(),
			"price":parseInt($("#price").val().replace(regex, "")),
			"fee":parseInt($("#fee").val().replace(regex, "")),
			"total":parseInt($("#total").val().replace(regex, "")),
			"userid":$("#userid").val(),
			"address":$("#address").val(),
			"status":"배송전",
			"coffeeid":$("#coffeeid").val(),
		}
		
		$.ajax({
			type:"post",
			url:"/orderConfirm",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data)
		})
		.done(function(res){
			if(res=="success"){
				alert("주문이 처리되었습니다.");
				location.href="/orderResult";
			}else if(res=="fail"){
				alert("주문이 실패했습니다.");
				$("#id").val("")
			}
		})
	});
});

		$(document).ready(function() {
			$("#x").click(function() {
				$("#hide").toggle();
			});
		});
		$(document).ready(function() {
			$("#x").click(function() {
				$("#container0").toggle();
			});
		});
		$(document).ready(function(){
			  $(".delete").click(function(){
				var cus=$(this).closest('tr');
				let va=cus.find('td:eq(5)').text();
				console.log(va,"xxx");
				if(va=='Đã hoàn thành'||va=='Đang thực hiện'||va=='Đã kết thúc'||va=='Tạm ngưng')
				{
					alert("Không thể xóa chiến dịch đã bắt đầu ")
					return false;
				}
			    if(confirm("Bạn chắc chắn muốn xóa chiến dịch ?")){}
			    else{
			    	alert("Xóa chiến dịch thất bại ")
			    return false;
			    }
			  });
			});
		$(document).ready(function(){
			  $("#add").click(function(){
				  $(location).attr('href', 'http://localhost:8150/Charity_project/addcampaign');
			  });
			});
		$(document).ready(function(){
			  $(".kl").click(function(){
				  $(location).attr('href', 'http://localhost:8150/Charity_project/updatecampaign')
			  });
			});
		
		
     
        
 
 
/**
 * 
 */
 $(document).ready(function(){
			  $(".delete").click(function(){
				var cus=$(this).closest('tr');
				let va=cus.find('td:eq(5)').text();
				console.log(va,"xxx");
				var z=cus.find('td:eq(6)').text();
				if(z==="Pending"||z==="NoActive"||z==="Banned")
				{
					 if(confirm("Tài khoản này đang đã thực hiện quyên góp không thể xóa bạn có muốn tắt trạng thái hoạt động của tài khoản này  ?")){
						$(location).attr('href', 'http://localhost:7598/Charity_project/manage?action=updatestatus&id='+cus.find('td:eq(1)').text())
						return false;
					}
					else{
					return false;}
				}
			    if(confirm("Bạn chắc chắn muốn xóa thành viên này ?")){
				$(location).attr('href', 'http://localhost:7598/Charity_project/manage?action=delete&check='+cus.find('td:eq(1)').text())
			 }
			    else{
			    	alert("Xóa thất bại ")
			    return false;
			    }
			  });
			});
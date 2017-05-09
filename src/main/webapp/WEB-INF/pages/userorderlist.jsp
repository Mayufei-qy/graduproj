<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/static/mycss/userpage.css" rel="stylesheet">
<link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path %>/static/jquery/jquery.min.js"></script>
<script src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/static/js/jquery.form.js"></script>
<title>外卖点餐系统个人中心</title>
</head>
<body>
<input style="display:none;" value="${haveorders}" id="haveordersdomain"/>
<nav class="navbar navbar-default navbar-fixed-top" style="background:#FFA500;" role="navigation">
	    <div class="container-fluid">
	    	<div class="row">
	    		<div class="navbar-header col-md-2">
			        <a class="navbar-brand" href="<%=path %>">首页</a>
			    </div>
			    <div class="navbar-header col-md-2">
			        <a class="navbar-brand" href="" onclick="islogined();return false;">申请成为商家</a>
			    </div>
			    <div class="col-md-2  col-md-offset-4">
			    	<form class="navbar-form navbar-left" role="search" style="float:right">
			            <div class="input-group">
		            		<input type="text" class="form-control">
		            		<span class="input-group-addon glyphicon glyphicon-search" style="top:0px"></span>
		        		</div>
			        </form>
			    </div>
			    <div class="col-md-2">
	    			<div class="dropdown" style="margin-top:8px;margin-right:60px;">
						<button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">${user.email}
							<span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="<%=path %>/toUserOrderListPage">我的订单</a>
							</li>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="#">我的收藏</a>
							</li>
							<li role="presentation" class="divider"></li>
							<li role="presentation">
								<a role="menuitem" tabindex="-1" href="<%=path %>/login/logout">退出</a>
							</li>
						</ul>
					</div>
			    </div>
	    	</div>
	    </div>
	</nav>
	
	<div class="page-wrap">
		<div class="inner-wrap">
			<div class="orders-cont clearfix">
				<div class="orders-tab fl">
					<span href="javascript:;" class="tab">
						<span class="title">订单查询</span>
						<ul>
							<li><a href="<%=path %>/toUserOrderListPage" id="myorderslia" class="borderradius-1 order-today active">我的订单</a></li>
						</ul>
					</span>  
					<span href="javascript:;" class="tab">
						<span class="title">账号管理</span>
						<ul>
							<li><a href="<%=path %>/toUserAccount" id="myaccountlia" class="borderradius-1 my-account ">我的账号</a></li>
							<li><a href="/favorite/restaurant" id="myfavoritelia" class="borderradius-1 my-favorite ">我的收藏</a></li>
						</ul>
					</span>
				</div>
				<div class="orders-list">
					<div class="empty-tips">
						<div style="padding-top:30px;" id = "orderlistshow">
							<c:forEach items="${orderlist}" var="o" varStatus="status">
								<table class="table table-condensed" style="width:100%;background:#F5F5F5; text-align:left;">
									<thead>
										<tr>
											<th style="height:45px;">
												<div>订单号:${o.flowNum}</div>
											</th>
											<th style="height:45px; text-align:right;">
												<div>下单时间：${o.orderTime}</div>
											</th >
										</tr>
									</thead>
									<tbody id="orderTableTbody">
										<c:forEach items="${o.dishList}" var="i" varStatus="status">
											<tr style="text-indent:45px;">
												<td>${i.dishName}</td>
												<td id="packingBoxTd">${i.dishPrice} * ${i.dishnum}</td>
											</tr>
										</c:forEach>
										<tr style="text-indent:45px;">
												<td>餐盒</td>
												<td id="packingBoxTd">${o.packingBox}</td>
										</tr>
										<tr>
											<td id="totalCountTd" colspan="2" style="text-align:right;"><b>金额：￥${o.totalPrice}</b></td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th colspan="2">
												<div><a href="javascript:commontModal(${o.shopid},${user.userid})" style="text-decoration: none;color:#FFA735;">评价商家:</a></div>
											</th>
										</tr>
									</tfoot>
								</table>
							</c:forEach>
						</div>
						<div class="tips-inner borderradius-5" id = "noorderlistshow">
							<i class="icon i-uncomment fl"></i>
							<span class="fl">您暂时还没有订单，<a class="cc-lightred-new" href="/">猛击这里</a>，现在就来一份外卖！</span>
						</div>
					</div>
				</div>
			</div>
			<div id="anti_token" data-token="QTj3VDqooFmmNEUBLK7YcAsKstAE7PyB/9euLGm1JjPF6nuhaO+5OgGnD/QK7jCz"></div>
			<div class="modal fade" tabindex="-1" role="dialog" id="commentModalBox">
			  <div class="modal-dialog" role="document" style="width:400px;">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h5 class="modal-title"><b>添加评论内容：</b></h5>
			      </div>
			      <div class="modal-body">
			       	<form id="userCommontForm" class="myform">
			       		<textarea name="commcontent" rows="8" cols="53" style="resize: none;"></textarea>
			       		<span style="color:black;">点击星星为店铺打分：</span>
			       		<div style="display:inline;">
			       			<span class="glyphicon glyphicon-star"></span>
				       		<span class="glyphicon glyphicon-star"></span>
				       		<span class="glyphicon glyphicon-star"></span>
				       		<span class="glyphicon glyphicon-star"></span>
				       		<span class="glyphicon glyphicon-star"></span>
			       		</div>
			       		
			       		<input name="shopid" id="commontShopId" style="display:none;"/>
			       		<input name="userid" id="commontUserId" style="display:none;"/>
			       		<input name="score" id="commontScore" style="display:none;">
			       	</form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			        <button type="button" class="btn btn-primary" onclick="submitComment()">确定</button>
			      </div>
			    </div><!-- /.modal-content -->
			  </div><!-- /.modal-dialog -->
			</div><!-- /.modal -->
		</div>
	</div>
	<script type="text/javascript">
		var show = $("#haveordersdomain").val();
		if(show == 'true'){
			$("#orderlistshow").css("display","block");
			$("#noorderlistshow").css("display","none");
		}else {
			$("#orderlistshow").css("display","none");
			$("#noorderlistshow").css("display","block");
		}
		
		function commontModal(shopid, userid){
			$("#commentModalBox").modal("show");
			$("#commontShopId").val(shopid);
			$("#commontUserId").val(userid);
		}
		
		$(".glyphicon-star").click(function(){
			$(this).parent().find("span").css("color", "#a5a7ab");
			
			var index = $(this).index();
			$("#commontScore").val(index + 1);
			var fullIndex = index;
			while(fullIndex >= 0){
				$(this).parent().find("span").eq(fullIndex).css("color", "yellow");
				fullIndex--;
			}
			console.log(index);
			
		});
		
		function submitComment(){
			$("#userCommontForm").ajaxSubmit({
				type: "POST",
				url:"<%=path %>/submitComment",
				dataType: "json",
			    success: function(data){
			    	console.log(data);
			    	if(data.resultFlag == 1){
			    	    $("#commentModalBox").modal('hide');
			    	}
				}
			});
		}
	</script>
</body>
</html>
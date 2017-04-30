<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=path %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/cart.css" rel="stylesheet"> 
<link href="<%=path %>/static/mycss/shoppage.css" rel="stylesheet">
<link href="<%=path %>/static/mycss/loginpage.css" rel="stylesheet">
<script src="<%=path %>/static/jquery/jquery.min.js"></script>
<script src="<%=path %>/static/jquery/jquery.cookie.js"></script>
<script src="<%=path %>/static/bootstrap/js/bootstrap.min.js"></script>




<title>外卖点餐系统店铺主页</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$('.f2').click(function(){
		$('.box2').show();
		});
	$('.login5 a').click(function(){
		$('.box2').hide();
		$("#loginfailerr").css("display","none");
		});
	});
</script>
<body>

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
			    	<c:choose>  
					     <c:when test="${user != null}">
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
					     </c:when>  
					     <c:otherwise>
					        <div style="margin-top:8px;">
			        			<button class="button f1 f2" onclick="">登录</button>
								<button class="button f1" onclick="javascrtpt:window.location.href='<%=path %>/register/to_register'">注册</button>
					        </div>
					     </c:otherwise>  
					</c:choose>
			    </div>
	    	</div>
	    </div>
	</nav>

	<div class="shopping-cart clearfix" data-status="1" data-poiname="潮汕砂锅粥" data-poiid="8446">
	    <form method="post" action="/order/shoppingcart" id="shoppingCartForm">

          <div class="first-to-app clearfix j-first-to-app">
            <span class="fl">电脑下单不享优惠了哦，优惠活动手机专享~</span>

          </div>

  	    <div class="order-list">
  	      <div class="title">
  	        <span class="fl dishes">菜品<a href="javascript:removeCartItems(${shopinfo.shopid});" class="clear-cart">[清空]</a></span>
  	        <span class="fl">份数</span>
  	        <span class="fl ti-price">价格</span>
  	      </div>
  	      <ul id="cartItems" style="height: auto; overflow: visible;">
  	      	
  	      </ul>
  	      
  	      <div class="other-charge">
  	        <div class="clearfix packing-cost">
  	          <span class="fl">包装盒</span>
  	          <span class="fr boxtotalprice" id="packingBoxSpan">￥0</span>
  	        </div>
  	        <!-- <div class="clearfix delivery-cost">
  	          <span class="fl">配送费(不计入起送价)</span>
  	          <span class="fr shippingfee">￥0</span>
  	        </div> -->
  	      </div>
  	      <div class="privilege hidden">
  	      </div>
  	      <div class="total">共<span id = "dishCountSpanId" class="totalnumber">0</span>份，总计<span id = "countSpanId" class="bill">￥0</span></div>
  	    </div>
  	    
  	    <div class="footer clearfix">
          <div class="logo icon fl"></div>
          <div class="brief-order fl">
            <span class="count"></span>
            <span class="price"></span>
          </div>
          <div class="fr">
            <a class="ready-pay borderradius-2" href="javascript:;">还差<span data-left="20" class="margintominprice">20</span>元起送</a>
            <div class="go-pay borderradius-2" onclick="submitCartData(${shopinfo.shopid });">去下单</div>
            <input type="hidden" value="" class="order-data" name="shop_cart">
          </div>
        </div>
      </form>
    </div>


	<div class="container">
		<div class="row title">
		
			<div class="page-wrap">
        		<div class="inner-wrap">
					<div class="rest-info">
					    <div class="right-bar fr clearfix ct-lightgrey">

					      <div class="fl average-speed">
					        <div class="desc">评价</div>
					        <div class="nu">(11111)</div>
					      </div>

					      <div class="fl in-ti">
					        <div class="desc">收藏</div>
					        <div class="nu">
					        <img alt="收藏" src="<%=path %>/static/image/favorite.png" />
					        </div>
					      </div>
					    </div>
					  <div class="details">
					    <div class="up-wrap clearfix">
					      <div class="avatar fl">
					        <img class="scroll-loading" src="http://p0.meituan.net/120.0/xianfu/f5c0fc4ed7a3ad4182a85dad71276b71422918.jpg" data-src="http://p0.meituan.net/120.0/xianfu/f5c0fc4ed7a3ad4182a85dad71276b71422918.jpg" data-max-width="120" data-max-height="90" style="width: 120px; height: 90px;">
					      </div>
					      <div class="list">
					        <div class="na">
					        <a href="/restaurant/144716875534175536">
					          <span>    ${shopinfo.shopname }   </span><i class="icon i-triangle-dn"></i>
					        </a>
					        </div>
					        <div class="clearfix">

					          <div class="stars clearfix" style="margin-top:7px;">
					            <span>店铺电话：</span><span class="info-detail">${shopinfo.shopphonenum }</span>
					          </div>

					            <div class="rest-info-thirdpart" style="color: rgb(67, 67, 67); margin-top: 6px; max-width: 285px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
					              商家地址：${shopinfo.shopaddress }
					            </div>

					        </div>
					      </div>
					    </div>
					  </div>
					</div>


					<div class="food-list fl">
					  	<div class="food-nav">

					    	<div class="category">
						        <h3 class="title title-0" title="">
						          <span class="tag-na">    本店提供以下菜品</span>
						        </h3>
						        <div class="pic-food-cont clearfix">
						        
						        	<c:forEach items="${dish_of_shop}" var="o" varStatus="status">
						        		<div class="j-pic-food pic-food  " id="232080519">
										    <div class="avatar">
										      <img src="${o.dishimage}" class="food-shape scroll-loading">
										    </div>
										    <div class="np clearfix">
										      <span class="name fl" title="香菇鸡肉粥">${o.dishname}</span>
										    </div>
			    							<div class="sale-info clearfix">
										        <div class="fr zan-count">
										          <i class="icon i-zan"></i>
										          <span class="cc-lightred-new">(2)</span>
										        </div>
										      <div class="sold-count ct-lightgrey"><span>月售：${o.salsenum} 份</span></div>
										    </div>
	
										    <div class="labels clearfix">
										        <a href="javascript:addToCart(${shopinfo.shopid},${o.dishid},'${o.dishname}',${o.dishprice});" class="add fr icon i-addcart j-addcart"></a>
										        <span id="food232080519-cart-num" class="pic-food-cart-num fr" style="display:none;">0</span>
	
										      <div class="price fl">
										          <div class="only">${o.dishprice}/份</div>
										      </div>
										    </div>
	 									</div>
									</c:forEach>
						        
	  							</div>
         					</div>
      					</div>
 				 	</div>
     			</div>
    		</div>
		</div>
	</div>
	
	<div class="box">
		<div class="box2">
			<div class="login5">
				<h2>登录</h2>
				<a class="close"></a>
			</div>
			<div class="login51" style="width:380px;height:380px;">
				<form name="login5form" action="">
					<div class="login5left">
						<span></span>
						<div class="login5left1">
							<input type="text" name="email" id="email" placeholder="用户名/手机号/邮箱" /></input>
						</div>
						<div class="login5left1">
							<input type="password" name="password" id="password" placeholder="密码" /></input>
						</div>
						<div class="login5left2">
							<span class="dl" id="login">登&nbsp;&nbsp;&nbsp;&nbsp;录</span>
							<a class="wjmm">忘记密码</a>
						</div>
						
						<span id="loginfailerr" style="color:red;display:none;font-size:15px;" >邮箱或密码错误！！！</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
		window.totalPrice = 0;
		window.dishcount = 0;
		function addToCart(shopid, dishid, dishname, dishprice){
			var cook = shopid+'cartStr'+dishid;
			if ($.cookie(cook) == null) { 
			       var o = { shopId:shopid, dishId:dishid, dishName: dishname, dishPrice: dishprice, dishNum:1, orderNote:'' }; 
			       var str = JSON.stringify(o);
			       $.cookie(cook, str, { 
			         expires:1
			       });
			       addCartItem(o);
			       window.totalPrice+=dishprice;
			       window.dishcount++;
			       /* alert(o.dishName);  */
			 } else { 
			       var str1 = $.cookie(cook); 
			       var o1 = JSON.parse(str1);
			       o1.dishNum++;
			       var str = JSON.stringify(o1);
			       $.cookie(cook, str, { 
			         expires:1
			       });
			       var inputid = dishid + 'dishNumberIpt';
			       $("#" + inputid).val(o1.dishNum);
			       window.totalPrice+=dishprice;
			       window.dishcount++;
			       /* alert(o1.dishName); */
			} 
			$("#packingBoxSpan").html('￥' + window.dishcount);
			$("#countSpanId").html('￥' + (window.totalPrice + window.dishcount));
			$("#dishCountSpanId").html(window.dishcount);
		}
		
		function addCartItem(data){
			var str = '<li class="clearfix">'
	      		+'<div class="fl na clearfix">'    
	      		+'<div style="text-indent:12px;">' + data.dishName + '</div>'     
	      		+'</div>'    
	      		+'<div class="fl modify clearfix">'    
	      		+'<a href="javascript:;" class="fl minus">-</a>'    
	      		+'<input id="' + data.dishId + 'dishNumberIpt" class="fl txt-count" value="'
	      		+ data.dishNum
	      		+ '" maxlength="2" type="text">'    
	      		+'<a href="javascript:;" class="fl plus">+</a>'  
	      		+'</div>'  
	      		+'<div class="fl pri ">'    
	      		+'<span>¥' + data.dishPrice +'</span>'  
	      		+'</div>'  
	      		+'</li>';
			$("#cartItems").append(str);
		}
		
		function removeCartItems(shopid){
			var tempStr = shopid+'cartStr';
			var strCookie = document.cookie;
			var arrCookie = strCookie.split("; ");
			for(var i=0;i<arrCookie.length;i++){
				var arr = arrCookie[i].split("=");
				var isThisShopStr = arr[0].indexOf(tempStr);
				if(isThisShopStr == 0){
					$.cookie(arr[0],'',{expires:-1});
				}
			}
			$.cookie('countCook','',{expires:-1});
			$("#countSpanId").html('￥' + 0);
			$("#packingBoxSpan").html('￥' + 0);
			$("#dishCountSpanId").html(0);
			$("#cartItems li").remove();
			window.totalPrice = 0;
			window.dishcount = 0;
		}
		
		function submitCartData(shopid){
			var logStr = $("#dropdownMenu1").val();
			if(logStr == undefined){
				alert('请先登录');
				$('.f2').click();
			}else{
				location.href='<%=path %>/toConfigOrderPage?shopId=' + shopid;
			}
			
		}
	</script>
	
	<script type="text/javascript">
	
		$("#login").click(function(){
			$.ajax({
				url:'<%=path %>/login/dologin',
				type:'post',
				data:{
					email:$("#email").val(),
					password:$("#password").val()
				},
				
				dataType:'json',
				success:function(result){
					if(result.loginmsg == "true"){
						console.log(result.url);
						if(typeof(result.url) != "undefined"){
							location.href='<%=path %>/' + result.url;
						}else{
							var url = window.location.href;
							location.href=url;
						}
					}else{
						/* alert("登录失败"); */
						$("#loginfailerr").css("display","block");
					}
				}
			});
		});
	
	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mypath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>外卖点餐系统商家信息填写页面</title>
<link rel="stylesheet" type="text/css" href="<%=mypath %>/static/mycss/registerpage.css">
<link href="<%=mypath %>/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="<%=mypath %>/static/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.mytable{
	width:100%;
	font-size:15px;
	text-align:left;
}
.mytable td {
	padding:10px;
}
.mytable td a {
	text-decoration: none;
}
.mytable td input {
	width:200px;
}
</style>
</head>
<body>
<%-- ${user.email}填写你的信息 --%>
<div>
	<div style="padding-top:50px;padding-left:100px;">
		<span style="font-size:16px;"><b>请如实填写以下信息：</b></span>
	</div>
	<HR width="86%" color=#987cb9 SIZE=10>
	<div style="padding-left:230px;">
		<form action="">
			<table class="mytable" style="">
			  <thead>
			    <tr>
			      <th style="width:120px;"></th>
			      <th style="width:200px;"></th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>店铺名称：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td>店主姓名：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td>身份证号：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td>营业执照编号：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td>店铺电话：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td>店铺地址：</td>
			      <td><input></td>
			    </tr>
			    <tr>
			      <td></td>
			      <td>
			      	<input type="submit" value="确定" class="btn btn-primary" style="width:80px;background:#55ACEF;border:none;">
			      	<a class="btn btn-primary" style="width:80px;background:#55ACEF;border:none;float:right;">取消</a>
			      </td>
			    </tr>
			  </tbody>
			</table>
		</form>
	</div>
</div>

</body>
</html>
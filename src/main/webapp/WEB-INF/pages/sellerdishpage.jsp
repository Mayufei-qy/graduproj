<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mypath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=mypath %>/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=mypath%>/static/font-awesome-4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/AdminLTE.min.css">
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/_all-skins.min.css">
<link rel="stylesheet" href="<%=mypath %>/static/sellerpagestyle/dataTables.bootstrap.css">
<style>
.form-control{
	width:78%;
	display:inline;
}
</style>
<title>外卖点餐系统菜品管理</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <a href="" class="logo"  style="background:black;">
      <span style="font-size:20px;color:white;">商家中心</span>
    </a>
    <nav class="navbar navbar-static-top" role="navigation">
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  <div class="container-fluid">
		  <div class="row">
		  	<div class="col-md-8">
	  		  <div style="width:280px;">
		      	<form action="#" method="get" class="sidebar-form" style="">
					<div class="input-group" >
						<input type="text" name="q" class="form-control" placeholder="Search..." style="background:#ffffff;height:30px;">
						<span class="input-group-btn">
							<button type="submit" name="search" id="search-btn" class="btn btn-flat" style="background:#ffffff;height:30px;padding:4px 10px;"><i class="fa fa-search" style="height:30px;color:black;"></i>
							</button>
						</span>
					</div>
				</form> 
			  </div>
		  	</div>
		  	<div class="col-md-3">
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
					  <li>
						<a>
						  <span class="glyphicon glyphicon-user"></span>
						  <span>${user.email}</span>
						</a>
					  </li>
					  <li>
						<a href="<%=mypath %>/login/logout"><span class="glyphicon glyphicon-log-out"></span></a>
					  </li>
					</ul>
				</div>
		  	</div>
		  </div>
	  </div>
    </nav>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu">
        <li>
          <a href="<%=mypath %>/login/toSellerPage">
            <span>商家主页</span>
          </a>
        </li>
        
        <li class="treeview">
          <a href="">
            <span>订单管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<%=mypath %>/toSellerOrderListPage?urlFlag=1"><i class="fa fa-circle-o"></i> 新订单</a></li>
            <li><a href=""><i class="fa fa-circle-o"></i> 催&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单</a></li>
            <li><a href="<%=mypath %>/toSellerOrderListPage?urlFlag=0"><i class="fa fa-circle-o"></i> 历史订单</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="<%=mypath %>/toSellerDishPage">
            <span>菜品管理</span>
          </a>
        </li>
        
      </ul>
    </section>
  </aside>

  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
		<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">本店所有菜品：</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>菜品名称</th>
                  <th>菜品价格</th>
                  <th>优惠价</th>
                  <th>菜品描述</th>
                  <th>菜品图片</th>
                  <th style="width:80px;">操作</th>
                </tr>
                </thead>
                <!-- <tbody id="databody">
                
                </tbody> -->
                <tfoot>
                <tr>
                  <th colspan="6">
                  <button type="button" class="btn btn-primary" onclick="addAdish()" style="width:80px;"><span class="glyphicon glyphicon-plus"></span>新增</button>
                  </th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
    </section>
  </div>

	<div class="modal fade" tabindex="-1" role="dialog" id="addDishModelBox">
	  <div class="modal-dialog" role="document" style="width:400px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title"><b>新增菜品</b></h5>
	      </div>
	      <div class="modal-body">
	       	<form role="form" id="newDishForm" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="newDishName">菜品名称：</label>
                  <input name="dishname" class="form-control" id="newDishName">
                </div>
                <div class="form-group">
                  <label for="newDishPrice">菜品价格：</label>
                  <input name="dishprice" class="form-control" id="newDishPrice">
                </div>
                <div class="form-group">
                  <label for="newDIshSalePrice">优惠价格：</label>
                  <input name="saleprice" class="form-control" id="newDIshSalePrice">
                </div>
                <div class="form-group">
                  <label for="newDishDescriptioin">菜品描述：</label>
                  <input name="dishdesc" class="form-control" id="newDishDescriptioin">
                </div>
                <div class="form-group">
                  <label for="newDishImageName">菜品图片：</label>
                  <input name="dishimage" class="form-control" id="newDishImageName" style="width:65%;">
                  <span>
				        <button type="button" class="btn btn-info btn-flat" onclick="myFileUpload()" style="vertical-align: baseline;"><span class="glyphicon glyphicon-folder-open"></span></button>
				  </span>
                </div>
                <div class="form-group">
					<input type="file" name="imageIptfile" id="hiddenFileInput" name="imageIpt" onchange='uploadFile(this)' style="display:none;">
                </div>
              </div>
            </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="imageUpLoadAndFormSubmit()">确定</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<div class="modal fade" tabindex="-1" role="dialog" id="UpdateDishModel">
	  <div class="modal-dialog" role="document" style="width:400px;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title"><b>修改菜品</b></h5>
	      </div>
	      <div class="modal-body">
	       	<form role="form" id="updateDishForm" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="updateDishName">菜品名称：</label>
                  <input name="dishname" class="form-control" id="updateDishName">
                </div>
                <div class="form-group">
                  <label for="updateDishPrice">菜品价格：</label>
                  <input name="dishprice" class="form-control" id="updateDishPrice">
                </div>
                <div class="form-group">
                  <label for="updateDIshSalePrice">优惠价格：</label>
                  <input name="saleprice" class="form-control" id="updateDIshSalePrice">
                </div>
                <div class="form-group">
                  <label for="updateDishDescriptioin">菜品描述：</label>
                  <input name="dishdesc" class="form-control" id="updateDishDescriptioin">
                </div>
                <div class="form-group">
                  <label for="updateDishImageName">菜品图片：</label>
                  <input name="dishimage" class="form-control" id="updateDishImageName" style="width:65%;">
                  <span>
				        <button type="button" class="btn btn-info btn-flat" onclick="myFileUpload2()" style="vertical-align: baseline;"><span class="glyphicon glyphicon-folder-open"></span></button>
				  </span>
                </div>
                <div class="form-group">
					<input type="file" name="imageIptfile" id="hiddenFileInput2" name="imageIpt" onchange='uploadFile2(this)' style="display:none;">
                </div>
              </div>
            </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" onclick="imageUpLoadAndFormSubmit()">确定</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>
  <div class="control-sidebar-bg"></div>
</div>

<script type="text/javascript" src="<%=mypath %>/static/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%=mypath %>/static/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=mypath %>/static/js/app.min.js"></script>
<script src="<%=mypath %>/static/js/jquery.dataTables.min.js"></script>
<script src="<%=mypath %>/static/js/dataTables.bootstrap.min.js"></script>
<script src="<%=mypath %>/static/js/jquery.form.js"></script>
<script type="text/javascript">
$('#example1').DataTable( {
	"ordering": false,
    "ajax": "<%=mypath %>/dishmanager/getAllDish",
    "columns": [
        {"data": "dishname"},
        {"data": "dishprice"},
        {"data": "saleprice"},
        {"data": "dishdesc"},
        {"data": "dishimage"},
        {  
            "data": null,  
            "orderable": false,  
            "border-bottom":"1px solid red",
            "defaultContent": '<button type="button" id="edit" class="btn btn-sm btn-primary" style="width:40px;"><span class="glyphicon glyphicon-edit"></span></button>' + 
            '<button id="del" type="button" class="btn btn-sm btn-primary" style="width:40px;margin-left:10px;"><span class="glyphicon glyphicon-remove"></span></button>' 
        }  
    ]
});
$('#example1 tbody').on('click', '#del', function () {
	var table = $('#example1').DataTable();
    var data = table.row($(this).parents('tr')).data();
    var row = $(this);
    console.log(row);
    if(confirm("确定要删除吗？")){
    	$.ajax({
            url: "<%=mypath %>/dishmanager/deleteDish?dishid=" + data.dishid,
            type: "POST",
            dataType:"JSON"
        }).done(function (result) {
            if (result.resultFlag == 1) {
            	table
                .row( row.parents('tr') )
                .remove()
                .draw();
            }
        });
    }
});
$('#example1 tbody').on('click', '#edit', function(){
	var table = $('#example1').DataTable();
	var data = table.row($(this).parents('tr')).data();
	$("#UpdateDishModel").modal("show");
	$("#updateDishName").val(data.dishname);
	$("#updateDishPrice").val(data.dishprice);
	$("#updateDIshSalePrice").val(data.saleprice);
	$("#updateDishDescriptioin").val(data.dishdesc);
	$("#updateDishImageName").val(data.dishimage);
});
function myFileUpload(){
	$("#hiddenFileInput").click();
}
function myFileUpload2(){
	$("#hiddenFileInput2").click();
}
function uploadFile(target) {
    $("#newDishImageName").val(target.files[0].name);
}
function uploadFile2(target) {
    $("#updateDishImageName").val(target.files[0].name);
}
function addAdish(){
	$("#addDishModelBox").modal("show");
}
function imageUpLoadAndFormSubmit(){
	$("#newDishForm").ajaxSubmit({
		type: "POST",
		url:"<%=mypath %>/dishmanager/dishadd",
		dataType: "json",
	    success: function(data){
	    	console.log(data);
	    	if(data.resultmsg == 'true'){
	    		var table = $('#example1').DataTable();
	    		var rowNode = table.row.add( {
	    	        "dishname":       $("#newDishName").val(),
	    	        "dishprice":   	$("#newDishPrice").val(),
	    	        "saleprice":     $("#newDIshSalePrice").val(),
	    	        "dishdesc": $("#newDishDescriptioin").val(),
	    	        "dishimage":     $("#newDishImageName").val(),
	    	    } ).draw().node();;
	    	    $("#addDishModelBox").modal('hide');
	    		$( rowNode )
	    	    	.css( 'color', '#3c8dbc' )
	    	    	.animate( { color: 'black' } );
	    		table.page( 'last' ).draw( false ); 
	    	}
		}
	});
}
</script>
</body>
</html>
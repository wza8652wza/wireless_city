<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>无线城市-提供商管理页</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">
<!--css,js-->
<link type="text/css" href="css/reset.css" rel="stylesheet">
<style type="text/css">
/*header beign*/
::selection {
	color: #fff;
	background: #f99750;
}

body {
	background: #f1f1f1;
	cursor: default;
	color: #444;
}

.title_fixed {
	width: 100%;
	height: 26px;
	background: #fafafa;
}

.title_fixed .s_right {
	float: right;
	width: 400px;
	font-size: 12px;
	line-height: 26px;
}

.title_fixed .s_right .r_login, .r_register {
	width: 50px;
	height: 43px;
	float: right;
	cursor: pointer;
}

.title_fixed .s_right .r_login, .r_register a {
	color: #444;
}
/*header end*/
.nav {
	width: 100%;
	height: 80px;
	background: #e45050;
}

.nav .nav_center {
	width: 1200px;
	height: 80px;
	padding-top: 15px;
}

.nav .nav_center .c_logo {
	width: 188px;
	height: 50px;
	margin: 0px 10px 0px 25px;
	background: url(images/logo1.png) no-repeat;
	float: left;
}

.nav .nav_center .c_content {
	width: 500px;
	height: 50px;
	float: left;
}

.nav .nav_center .c_content ul li {
	float: left;
	margin-left: 20px;
}

.nav .nav_center .c_content ul li a {
	height: 50px;
	font-size: 16px;
	color: #fff;
	text-align: center;
	line-height: 50px;
	width: 80px;
	display: block;
}

.nav .nav_center .c_content ul li a.sel {
	background: #fff;
	color: #e45050;
	border-radius: 25px;
	-webkit-border-radius: 25px;
}

.nav .nav_center .c_search {
	float: right;
	margin-top: 10px;
}

.nav .nav_center .c_search input {
	width: 200px;
	height: 30px;
	line-height: 30px;
	color: #666;
	padding-left: 10px;
	display: block;
	float: left;
	border: 2px solid #ccc;
}

.nav .nav_center .c_search .s_btn {
	width: 80px;
	height: 34px;
	background: #ccc;
	color: #444;
	line-height: 30px;
	text-align: center;
	font-size: 16px;
	border: 0;
	float: left;
	cursor: pointer;
}

.layout_all {
	width: 900px;
	margin: 40px auto;
	padding-bottom: 10px;
}

.layout_all .wrapper_left {
	float: left;
	width: 130px;
}

.layout_all .wrapper_left dl dt {
	color: #000;
	font-weight: 700;
	margin-top: 30px;
}

.layout_all .wrapper_left dl dt:first-child {
	margin-top: 0;
}

.layout_all .wrapper_left dl dd {
	margin-top: 10px;
}

.layout_all .wrapper_right {
	float: left;
	width: 770px;
}

/*查詢開始*/
.layout_all .wrapper_right .r_select .hd_reference {
	height: 20px;
	height: 20px;
}

.layout_all .wrapper_right .r_select .hd_reference a {
	display: block;
	float: left;
	padding: 2px;
}

.layout_all .wrapper_right .r_select .hd_reference a:nth-child(odd):hover
	{
	text-decoration: underline;
}

.layout_all .wrapper_right .r_select .hd_attrref {
	height: 20px;
	border-top: 1px solid #005ea7;
	margin-top: 10px;
	padding-top: 20px;
}

.layout_all .wrapper_right .r_select .hd_attrref:after {
	content: "";
	display: block;
	clear: both;
}

.layout_all .wrapper_right .r_select .hd_attrref p {
	float: left;
	border: 1px solid #ccc;
	background: #f1f1f1;
}

.layout_all .wrapper_right .r_select .hd_attrref p:first-child {
	border: 0;
	background: #fff;
}

.layout_all .wrapper_right .r_select .hd_attrref a {
	padding: 2px;
}

.layout_all .wrapper_right .r_select  .icon {
	display: block;
	float: left;
	background: url(images/more_delete.png) no-repeat;
	width: 12px;
	height: 12px;
}

.layout_all .wrapper_right .r_select  .delete_icon {
	background-position: -209px -407px;
}

.layout_all .wrapper_right .r_select  .more_icon {
	background-position: -124px -408px;
}
/*-226px -410px*/
.layout_all .wrapper_right .r_select .hd_attrref p a {
	display: block;
	float: left;
}

.layout_all .wrapper_right .r_select .hd_sort {
	margin-left: 20px;
}

.layout_all .wrapper_right .r_select .hd_sort .s_details {
	margin-top: 10px;
	padding-bottom: 10px;
}

.layout_all .wrapper_right .r_select .hd_sort .s_details  a {
	padding: 0px 5px;
}

.layout_all .wrapper_right .r_select .hd_sort .s_details  a:hover {
	text-decoration: underline;
}

.layout_all .wrapper_right .r_select .hd_sort .s_details span a:first-child
	{
	font-weight: 700;
	color: #000;
}

.layout_all .wrapper_right .r_select .hd_sort .s_details span a:hover {
	text-decoration: none;
}

.layout_all .wrapper_right .r_select .hd_attribute {
	margin-left: 20px;
}

.layout_all .wrapper_right .r_select .hd_attribute p {
	padding-top: 20px;
}

.layout_all .wrapper_right .r_select .hd_attribute span:first-child {
	font-weight: 700;
	color: #000;
	padding-right: 10px;
}

.layout_all .wrapper_right .r_select .hd_attribute p span a {
	padding-right: 10px;
}

.layout_all .wrapper_right .r_select .hd_attribute p span a:hover {
	text-decoration: underline;
}

/*查詢結束*/
.layout_all .wrapper_right .r_select, .r_list {
	background: #fff;
	padding: 20px 20px;
}

.layout_all .wrapper_right .r_select .s_main_title {
	height: 30px;
	font-weight: 900;
	color: #000;
}

.layout_all .wrapper_right .r_select .s_sort input {
	margin-top: 20px;
	cursor: pointer;
	display: block;
	height: 30px;
	width: 50px;
	background: #0181ec;
	color: #fff;
	text-align: center;
	line-height: 30px;
	border: 0;
}

.layout_all .wrapper_right .r_select .s_sort .s_main {
	width: 142px;
	float: left;
}

.layout_all .wrapper_right .r_select .s_sort .s_main select {
	width: 100px;
}

.layout_all .wrapper_right .r_select .s_attribute {
	margin-top: 20px;
	display: none;
}

.layout_all .wrapper_right .r_select .s_attribute p {
	padding-top: 20px;
}

.layout_all .wrapper_right .r_select .s_attribute p:first-child {
	border-top: 1px solid #005ea7;
}

.layout_all .wrapper_right .r_select .s_attribute p span a {
	color: #005ea7;
}

.layout_all .wrapper_right .r_select .s_attribute p span a:first-child {
	font-weight: 900;
	color: #000;
}

.layout_all .wrapper_right .r_list {
	margin-top: 20px;
}

.layout_all .wrapper_right .r_list .servic_title {
	width: 730px;
	height: 40px;
	background: #d1d1d1;
}

.layout_all .wrapper_right .r_list .servic_title .t_left {
	height: 40px;
	line-height: 40px;
	float: left;
	color: #000;
	font-weight: 900;
	text-indent: 4px;
}

.layout_all .wrapper_right .r_list .servic_title .t_right {
	height: 40px;
	float: right;
	margin-right: 30px;
	line-height: 30px;
}

.layout_all .wrapper_right .r_list .servic_title .t_right .r_search,
	.r_add {
	float: left;
	margin-top: 10px;
}

.layout_all .wrapper_right .r_list .servic_title .t_right .r_search input
	{
	width: 150px;
	height: 20px;
	line-height: 20px;
	font-size: 12px;
	color: #666;
	padding-left: 10px;
	display: block;
	float: left;
	border: 2px solid #39393f;
}

.layout_all .wrapper_right .r_list .servic_title .t_right .r_search .s_btn
	{
	float: left;
	width: 80px;
	height: 24px;
	background: #39393f;
	color: #fff;
	line-height: 20px;
	text-align: center;
	border: 0;
	cursor: pointer;
}

.layout_all .wrapper_right .r_list .servic_title .t_right .r_add span.span_text
	{
	width: 100px;
	height: 24px;
	display: block;
	float: left;
	text-align: center;
	margin-left: 10px;
	background: #39393f;
	color: #fff;
	line-height: 24px;
	cursor: pointer;
}

.layout_all .wrapper_right .r_list .content_title {
	width: 730px;
	height: 40px;
	line-height: 40px;
	background: #f1f1f1;
}

.layout_all .wrapper_right .r_list .content_title div {
	height: 40px;
	border-left: 1px dotted #ccc;
	float: left;
	width: 134px;
	padding-left: 5px;
	position: relative;
}

.layout_all .wrapper_right .r_list .content_title a {
	background: url(images/icon.gif) no-repeat -49px -337px;
	position: absolute;
	top: 14px;
	left: 32px;
	width: 10px;
	height: 10px;
	display: block;
	cursor: pointer;
}

.layout_all .wrapper_right .r_list .content_title div:first-child {
	border-left: 0px;
}

.layout_all .wrapper_right .r_list .l_content {
	width: 730px;
	height: 120px;
	border-bottom: 1px solid #999;
	padding-top: 10px;
}

.layout_all .wrapper_right .r_list .l_content div {
	padding-left: 5px;
	float: left;
	width: 135px;
	height: 100px;
}

.layout_all .wrapper_right .r_list .l_content .l_operation {
	float: left;
}

.layout_all .wrapper_right .r_list .l_content .l_operation a {
	width: 60px;
	height: 30px;
	background: #0181ec;
	display: block;
	line-height: 30px;
	text-align: center;
	color: #fff;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	margin-bottom: 10px;
	margin-left: 50px;
}

.layout_all .wrapper_right .r_list .bd_paging {
	height: 40px;
	margin: 0 auto;;
	margin-top: 10px;
	width: 400px;
}

.layout_all .wrapper_right .r_list .bd_paging a {
	color: #0181ec;
	padding: 0 8px;
	height: 20px;
	display: block;
	float: left;
	line-height: 20px;
	border: 1px solid #ccc;
	margin-left: 10px;
	margin-top: 10px;
	border-radius: 2px;
	-webkit-border-radius: 2px;
}

.layout_all .wrapper_right .r_list .bd_paging span {
	color: #0181ec;
	padding: 0 4px;
	height: 20px;
	font-weight: 700;
	display: block;
	float: left;
	line-height: 20px;
	margin-left: 10px;
	margin-top: 10px;
}

.layout_all .wrapper_right .r_list .bd_paging a.sel {
	border-color: #b61d1d;
	background: #b61d1d;
	color: #fff;
	font-weight: 700;
}

/*add_services begin*/
.add_services {
	z-index: 11;
	width: 900px;
	position: fixed;
	background: #fff;
	box-shadow: 0 3px 7px 2px rgba(0, 0, 0, .4);
	-webkit-box-shadow: 0 3px 7px 2px rgba(0, 0, 0, .4);
	-webkit-border-radius: 3px;
	border-radius: 3px;
	top: 50%;
	left: 50%;
	margin-left: -450px;
	display: none;
	padding-bottom: 40px;
}

.add_services .a_s_2 {
	display: none;
}

.add_services .a_s_title {
	position: relative;
	height: 40px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	border: 1px solid #ccc;
}

.add_services .a_s_title .t_icon {
	width: 20px;
	height: 20px;
	display: block;
	background: url(images/wireless_icon.png) no-repeat -50px -2px;
	cursor: pointer;
	position: absolute;
	top: 10px;
	left: 870px;
}

.add_services .a_s_title .t_icon:hover {
	background-position: -71px -2px;
}

.add_services  .a_s_main .a_s_pic, .a_s_desc, .a_s_sel, .a_s_choose {
	margin-top: 10px;
	margin-left: 20px;
}

.add_services  .a_s_main .a_s_choose {
	height: 30px;
	line-height: 30px;
	font-size: 14px;
}

.add_services  .a_s_main .a_s_sel .s_sort {
	margin-left: 20px;
}

.add_services  .a_s_main .a_s_sel .s_sort .s_main {
	width: 142px;
	float: left;
}

.add_services  .a_s_main .a_s_sel .s_sort .s_main select {
	width: 100px;
}

.add_services  .a_s_main .a_s_name {
	height: 60px;
	margin-left: 20px;
	margin-top: 10px;
}

.add_services  .a_s_main .a_s_name span {
	font-size: 14px;
	height: 30px;
	line-height: 30px;
	display: block;
}

.add_services  .a_s_main .a_s_name input {
	height: 30px;
	display: block;
	line-height: 30px;
	padding-left: 10px;
	margin-left: 20px;
}

.add_services  .a_s_main .a_s_pic .p_upload {
	width: 50px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
}

.add_services  .a_s_main .a_s_pic .p_preview {
	height: 100px;
	margin-top: 10px;
}

.add_services  .a_s_main .a_s_pic .p_preview img {
	margin-left: 20px;
}

.add_services  .a_s_main .a_s_desc textarea {
	resize: none;
	width: 700px;
	height: 40px;
	margin-left: 20px;
	border: 1px soid #ccc;
}

.add_services  .a_s_main .a_s_desc div {
	font-size: 14px;
	margin-bottom: 10px;
}

.add_services  .next_step, .pre_step {
	width: 50px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	margin: 40px 0px 0px 425px;
}

.add_services  .a_s_main .a_s_attribute p {
	margin-top: 10px;
	float: left;
	margin-left: 40px;
}

.add_services  .a_s_main .a_s_attribute p input {
	font-size: 12px;
	padding-left: 5px;
	width: 100px;
	height: 20px;
	line-height: 20px;
	vertical-align: middle;
	margin-left: 10px;
}

.add_services  .a_s_main .a_s_attribute .at_fill {
	float: left;
	width: 430px;
}

.add_services  .a_s_main .a_s_attribute .at_fill:first-child {
	border-right: 1px dashed #ccc;
}

.add_services  .a_s_main .a_s_attribute .at_fill .at_add_newattribute {
	margin-left: 20px;
	width: 60px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	margin-top: -30px;
}

.add_services  .a_s_main .a_s_attribute .at_fill .at_new {
	
}

.add_services  .a_s_2 .next_step, .pre_step {
	margin: 0;
	float: left;
	margin: 40px 0px 0px 20px;
}

.add_services  .pre_step {
	margin-left: 390px;
}
/*end add_services*/
/*update_services begin*/
.update_services {
	z-index: 11;
	width: 900px;
	position: fixed;
	background: #fff;
	box-shadow: 0 3px 7px 2px rgba(0, 0, 0, .4);
	-webkit-box-shadow: 0 3px 7px 2px rgba(0, 0, 0, .4);
	-webkit-border-radius: 3px;
	border-radius: 3px;
	top: 50%;
	left: 50%;
	margin-left: -450px;
	display: none;
	padding-bottom: 40px;
}

.update_services .a_s_2 {
	display: none;
}

.update_services .a_s_title {
	position: relative;
	height: 40px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	border: 1px solid #ccc;
}

.update_services .a_s_title .t_icon {
	width: 20px;
	height: 20px;
	display: block;
	background: url(images/wireless_icon.png) no-repeat -50px -2px;
	cursor: pointer;
	position: absolute;
	top: 10px;
	left: 870px;
}

.update_services .a_s_title .t_icon:hover {
	background-position: -71px -2px;
}

.update_services  .a_s_main .a_s_pic, .a_s_desc, .a_s_sel, .a_s_choose {
	margin-top: 10px;
	margin-left: 20px;
}

.update_services  .a_s_main .a_s_choose {
	height: 30px;
	line-height: 30px;
	font-size: 14px;
}

.update_services  .a_s_main .a_s_sel .s_sort {
	margin-left: 20px;
}

.update_services  .a_s_main .a_s_sel .s_sort .s_main {
	width: 142px;
	float: left;
}

.update_services  .a_s_main .a_s_name {
	height: 60px;
	margin-left: 20px;
	margin-top: 10px;
}

.update_services  .a_s_main .a_s_name span {
	font-size: 14px;
	height: 30px;
	line-height: 30px;
	display: block;
}

.update_services  .a_s_main .a_s_name input {
	height: 30px;
	display: block;
	line-height: 30px;
	padding-left: 10px;
	margin-left: 20px;
}

.update_services  .a_s_main .a_s_pic .p_upload {
	width: 50px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
}

.update_services  .a_s_main .a_s_pic .p_preview {
	height: 100px;
	margin-top: 10px;
}

.update_services  .a_s_main .a_s_pic .p_preview img {
	margin-left: 20px;
}

.update_services  .a_s_main .a_s_desc textarea {
	width: 700px;
	height: 40px;
	margin-left: 20px;
	border: 1px soid #ccc;
}

.update_services  .a_s_main .a_s_desc div {
	font-size: 14px;
	margin-bottom: 10px;
}

.update_services  .next_step, .pre_step {
	width: 50px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	margin: 40px 0px 0px 425px;
}

.update_services  .a_s_main .a_s_attribute p {
	margin-top: 10px;
	float: left;
	margin-left: 40px;
}

.update_services  .a_s_main .a_s_attribute p input {
	font-size: 12px;
	padding-left: 5px;
	width: 100px;
	height: 20px;
	line-height: 20px;
	vertical-align: middle;
	margin-left: 10px;
}

.update_services  .a_s_main .a_s_attribute .at_fill {
	float: left;
	width: 430px;
}

.update_services  .a_s_main .a_s_attribute .at_fill:first-child {
	border-right: 1px dashed #ccc;
}

.update_services  .a_s_main .a_s_attribute .at_fill .at_add_newattribute
	{
	margin-left: 20px;
	width: 60px;
	height: 30px;
	background: #0181ec;
	color: #fff;
	line-height: 30px;
	text-align: center;
	cursor: pointer;
	border-radius: 3px;
	-webkit-border-radius: 3px;
	margin-top: -30px;
}

.update_services  .a_s_main .a_s_attribute .at_fill .at_new {
	
}

.update_services  .a_s_2 .next_step, .pre_step {
	margin: 0;
	float: left;
	margin: 40px 0px 0px 20px;
}

.update_services  .pre_step {
	margin-left: 390px;
}
/*end update_services*/

/*yp_dialog begin*/
#yp_dialog {
	width: 250px;
	height: 150px;
	border: 1px solid #282828;
	background: #f7f7f7;
	position: fixed;
	z-index: 10;
	display: none;
}

#yp_dialog .dialog_title {
	width: 250px;
	height: 40px;
	background: #282828;
	color: #fff;
	text-indent: 4px;
	line-height: 40px;
	font-size: 14px;
	position: relative;
}

#yp_dialog .dialog_title span {
	line-height: 20px;
	width: 20px;
	height: 20px;
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

#yp_dialog .dialog_content {
	width: 250px;
	height: 110px;
}

#yp_dialog .dialog_content a {
	background: #3083eb;
	display: block;
	height: 30px;
	width: 50px;
	margin: 40px 0 0 47px;
	float: left;
	color: #fff;
	line-height: 30px;
	font-size: 14px;
	text-align: center;
	border-radius: 3px;
}
/*yp_dialog end*/
</style>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>

<script type="text/javascript" src="js/tmAjax.js"></script>
<script type="text/javascript" src="js/util.js"></script>
</head>
<body>
	<!-- header begin-->
	<div class="title_fixed">
		<div class="s_right" id="s_right">
			<div class="r_login">登录</div>
			<div class="r_register">
				<a href="wireless_register.html">注册</a>
			</div>
		</div>
	</div>
	<!-- header end -->
	<div class="nav">
		<div class="nav_center">
			<div class="c_logo"></div>
			<div class="c_content">
				<ul>
					<li><a href="javascript:void(0)" class="sel">管理中心</a></li>
					<li><a href="font/salor_store.html">企业主页</a></li>
				</ul>
			</div>
			<div class="c_search">
				<input type="text" placeholder="搜索服务资源" />
				<div class="s_btn">搜索</div>
			</div>
		</div>
	</div>
	<div class="layout_all">
		<div class="wrapper_left">
			<dl>
				<dt>服务中心</dt>
				<dd>服务资源</dd>
				<dt>交易中心</dt>
				<dd>订单</dd>
				<dd>资产</dd>
				<dt>设置</dt>
				<dd>企业信息</dd>
			</dl>
		</div>
		<div class="wrapper_right">
			<div class="r_select">
				<div class="hd_reference" id="reference">
					<a href="font/salor.jsp?pid=1">所有分类</a>
				</div>
				<div class="hd_sort">
					<div class="s_details" id="s_details">
						<span> <a href="javascript:void(0)">子类：</a>
						</span>
						<!-- 这里是一类目迭代 -->
						<a href="font/search.jsp?id=101">无线政务</a>
						<!-- 这里是一类目迭代-->
					</div>
				</div>

				<div class="hd_attrref" id="hd_attrref">
					<p>
						<a href="javascript:void(0)">所有属性</a>
					</p>



					<s:iterator value="attrMap">

						<a href="javascript:void(0)" class="more_icon icon"></a>
						<p style="border-color: rgb(204, 204, 204);" class="attr_show">
							<s:a
								href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}">
								<s:property value="value" />
							</s:a>
							<s:a style="background-position: -209px -407px;"
								href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{key}&attrLab=%{value}"
								cssClass="delete_icon icon"></s:a>
						</p>
					</s:iterator>
				</div>
				<div class="hd_attribute" id="hd_attribute">
					<p>
						<a href="javascript:void(0)">所有属性</a>
					</p>
					<!-- 注意data-tag -->
					<s:iterator value="page.attrList" status="rowst">
						<p>
							<span><s:property value="name" />:</span> <span> <s:iterator
									value="enumValue" status="st">
									<s:a
										href="SearchProviderResourceAction_handleAttribute?rsid=%{rsid}&attrStr=%{id}_%{#st.index}&attrLab=%{name}:%{enumValue[#st.index]}">
										<s:property value="enumValue[#st.index]" />
									</s:a>
								</s:iterator>
							</span>
						</p>
					</s:iterator>
					<%-- <p>
						<span>属性1:</span> <span> <a href="javascript:void(0)"
							data-tag="0">属性值1</a> <a href="javascript:void(0)" data-tag="0">属性值2</a>
							<a href="javascript:void(0)" data-tag="0">属性值3</a> <a
							href="javascript:void(0)" data-tag="0">属性值4</a>
						</span>
					</p>
					<p>
						<span>属性2:</span> <span> <a href="javascript:void(0)"
							data-tag="1">属性值11</a> <a href="javascript:void(0)" data-tag="1">属性值22</a>
							<a href="javascript:void(0)" data-tag="1">属性值33</a>
						</span>
					</p> --%>
				</div>
			</div>
			<div class="r_list">
				<div class="servic_title">
					<div class="t_left">全部服务</div>
					<div class="t_right">
						<div class="r_search">
							<s:form action="SearchProviderResourceAction_nextKeyWordSearch">
								<s:textfield name="keyWord" id="search_service_form"></s:textfield>
								<s:hidden name="rsid"></s:hidden>
								<div class="s_btn" id="search_service">查询</div>
							</s:form>
						</div>
						<div class="r_add">
							<span class="span_text" id="add_service_btn">增加服务资源</span>
						</div>
					</div>
				</div>
				<div class="content_title">
					<div>图片</div>
					<div>
						名称
						<s:a id="name_sort"
							href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=1"></s:a>
					</div>
					<div>描述</div>
					<div>
						时间
						<s:a id="time_sort"
							href="SearchProviderResourceAction_changeOrder?rsid=%{rsid}&&orderName=0"></s:a>
					</div>
					<div>操作</div>
				</div>
				<div id="l_content">
					<s:iterator value="page.list" var="resource">
						<div class="l_content">
							<div class="l_img">
								<img alt="" src="images/list_demo.jpg" height="100" width="100" />
							</div>
							<div class="l_name">
								<s:property value="resource_name" />
							</div>
							<div class="l_desc">
								<s:property value="description" />
							</div>
							<div class="l_time">
								<s:property value="create_time" />
							</div>
							<div class="l_operation">
								<a href="javascript:void(0)" class="update">修改</a> <a
									href="javascript:void(0)" class="delete">删除</a> <a
									href="javascript:void(0)">查看详情</a>
							</div>
						</div>
					</s:iterator>
				</div>
				<div class="bd_paging" id="paging">
					<s:a
						href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=1">首页</s:a>
					<s:if test="pageNum-3>0">
						<span>...</span>
					</s:if>
					<s:if test="pageNum-2>0">
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum-2}">
							<s:property value="%{pageNum-2}" />
						</s:a>
					</s:if>
					<s:if test="pageNum-1>0">
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum-1}">
							<s:property value="%{pageNum-1}" />
						</s:a>
					</s:if>
					<s:a
						href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum}">
						<s:property value="%{pageNum}" />
					</s:a>
					<s:if test="pageNum+1<=page.totalPageNumber">
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum+1}">
							<s:property value="%{pageNum+1}" />
						</s:a>
					</s:if>
					<s:if test="pageNum+2<=page.totalPageNumber">
						<s:a
							href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{pageNum+2}">
							<s:property value="%{pageNum+2}" />
						</s:a>
					</s:if>
					<s:if test="pageNum+3<=page.totalPageNumber">
						<span>...</span>
					</s:if>
					<s:a
						href="SearchProviderResourceAction_changePageNo?rsid=%{rsid}&pageNum=%{page.totalPageNumber}">
					     尾页
					</s:a>
				</div>
				<!-- <div class="l_paging">
					<a href="javascript:void(0)" class="sel">1</a>
					<a href="javascript:void(0)">2</a>
					<a href="javascript:void(0)">3</a>
					<a href="javascript:void(0)">4</a>
					<a href="javascript:void(0)" class="next">下一页&gt;</a>
				</div> -->
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="yy"></div>
	<div class="add_services" id="add_services">
		<div class="a_s_title">
			增加服务资源
			<div class="t_icon" id="close_1"></div>
		</div>
		<div class="a_s_1" id="a_s_1">
			<div class="a_s_main">
				<div class="a_s_choose">服务资源类型选择：</div>
				<div class="a_s_sel">
					<div class="s_sort" id="s_sort">
						<div class="s_main">
							<span>一类</span> <select id="category1">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>二类</span> <select id="category2">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>三类</span> <select id="category3">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>四类</span> <select id="category4">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main dis_none">
							<span>五类</span> <select id="category5">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="a_s_name">
					<span>名称：</span><input type="text" id="sevice_name" />
				</div>
				<div class="a_s_pic">
					<div class="p_upload">上传图片</div>
					<div class="p_preview">
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
						<img alt="" width="100" height="100" src="images/list_demo.jpg" />
					</div>
				</div>
				<div class="a_s_desc">
					<div>描述：</div>
					<textarea id="sevice_desc"></textarea>
				</div>
			</div>
			<div class="next_step" id="next_step">下一步</div>
		</div>
		<div class="a_s_2" id="a_s_2">
			<div class="a_s_main">
				<div class="a_s_choose">属性填写：</div>
				<div class="a_s_attribute">
					<div class="at_fill" id="at_fill">
						<%-- <p>
							<span>属性1:</span><input type="text" placeholder="填写属性"/>
						</p>
						<p>
							<span>属性2:</span><input type="text" placeholder="填写属性"/>
						</p> --%>
					</div>
					<div class="at_fill">
						<div class="at_add_newattribute" id="new_attribute">添加属性</div>
						<div class="at_new" id="at_new"></div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="a_s_attibute"></div>
			</div>
			<div class="pre_step" id="pre_step">上一步</div>
			<div class="next_step" id="submit">提交</div>
		</div>
	</div>
	<%-- <div class="update_services" id="update_services">
		<div class="a_s_title">
			增加服务资源
			<div class="t_icon" id="close_2"></div>
		</div>
		<div class="a_s_1" id="u_s_1">
			<div class="a_s_main">
				<div class="a_s_choose">服务资源类型选择：</div>
				<div class="a_s_sel">
					<div class="s_sort">
						<div class="s_main">
							<span>一类</span>
							<select id="category_1">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main">
							<span>二类</span>
							<select id="category_2">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main">
							<span>三类</span>
							<select id="category_3">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main">
							<span>四类</span>
							<select  id="category_4">
								<option value="">-请选择-</option>
							</select>
						</div>
						<div class="s_main">
							<span>五类</span>
							<select  id="category_5">
								<option value="">-请选择-</option>
							</select>
						</div>	
						<div class="clear"></div>
					</div>
				</div>
				<div class="a_s_name">
					<span>名称：</span><input type="text" />
				</div>
				<div class="a_s_pic">
					<div class="p_upload">上传图片</div>
					<div class="p_preview">
						<img alt="" width="100" height="100" src="images/list_demo.jpg"/>
						<img alt="" width="100" height="100" src="images/list_demo.jpg"/>
						<img alt="" width="100" height="100" src="images/list_demo.jpg"/>
						<img alt="" width="100" height="100" src="images/list_demo.jpg"/>
						<img alt="" width="100" height="100" src="images/list_demo.jpg"/>
					</div>
				</div>
				<div class="a_s_desc">
					<div>描述：</div>
					<textarea></textarea>
				</div>
			</div>
			<div class="next_step" id="update_next_step">下一步</div>
		</div>
		<div class="a_s_2" id="u_s_2">
			<div class="a_s_main">
				<div class="a_s_choose">属性填写：</div>
				<div class="a_s_attribute">
					<div class="at_fill">
						<p>
							<span>属性1:</span><input type="text" value="属性值1"/>
						</p>
						<p>
							<span>属性2:</span><input type="text" value="属性值2"/>
						</p>
						<p>
							<span>属性3:</span><input type="text" value="属性值3"/>
						</p>
						<p>
							<span>属性4:</span><input type="text" value="属性值4"/>
						</p>
						<p>
							<span>属性5:</span><input type="text" value="属性值5"/>
						</p>
						<p>
							<span>属性6:</span><input type="text" value="属性值6"/>
						</p>
						<p>
							<span>属性7:</span><input type="text" value="属性值7"/>
						</p>
						<p>
							<span>属性8:</span><input type="text" value="属性值8"/>
						</p>
					</div>
					<div class="at_fill">
						<div class="at_add_newattribute" id="update_new_attribute">添加属性</div>
						<div class="at_new" id="ut_new">
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="a_s_attibute"></div>
			</div>
			<div class="pre_step" id="update_pre_step">上一步</div>
			<div class="next_step" id="update_submit">提交</div>
		</div>
	</div> --%>

	<!-- bottom begin -->
	<s:include value="bottom.jsp"></s:include>
	<!-- bottom end -->

	<div id="yp_dialog">
		<p class="dialog_title">
			确定删除吗？<span class="close">X</span>
		</p>
		<div class="dialog_content">
			<a href="javascript:void(0)" class="sure">确定</a> <a
				href="javascript:void(0)" class="close">取消</a>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			init();
			initialize();
		});
		function getChildCategory(idName, nextIdName) {
			$("#" + idName)
					.off("change")
					.on(
							"change",
							function() {
								var h = "<option value=''>-请选择-</option>";
								var nextId = nextIdName.substr(8, 1);
								$("#category" + nextId).parents(".s_main")
										.show();
								for (var i = nextId; i < 6; i++) {
									$("#category" + i).html(h);
									if (i < 5) {
										$("#category" + (i * 1 + 1)).parents(
												".s_main").hide();
									}
								}
								var pid = $(this).val();
								if (isEmpty(pid)) {
									return;
								}
								var options = {
									beforeSend : function() {
									},
									params : {
										parentid : pid
									},
									callback : function(data) {
										if (data == "[]") {

										} else {
											var $data = $.parseJSON(data);
											var length = $data.length;
											var html = "";
											for (var i = 0; i < length; i++) {
												html += "<option value='"+$data[i].id+"'>"
														+ $data[i].name
														+ "</option>";
											}
											$("#" + nextIdName).append(html);
										}
									}
								};
								findCategory(options);
							});
		}
		function initialize() {
			//查询服务资源
			$("#search_service").click(function() {
				$("#search_service_form")[0].submit();
			});
			//排序
			$("#name_sort").off("click").click(function() {
				alert("-49px -354px");
				/* background-position":"-49px -354px" */
				window.location.href = "javascript:void(0)";/* 这里是根据名称排序   action*/
			});
			$("#time_sort").off("click").click(function() {
				alert("-49px -354px");
				/* background-position":"-49px -354px" */
				window.location.href = "javascript:void(0)";/* 这里是根据名称排序  查询服务资源 action*/
			});
			//属性筛选
			$("#hd_attrref").on(
					{
						"mouseenter" : function() {
							$(this).css("border-color", "#f00");
							$(this).find(".delete_icon").css(
									"backgroundPosition", "-226px -407px");
						},
						"mouseleave" : function() {
							$(this).css("border-color", "#ccc");
							$(this).find(".delete_icon").css(
									"backgroundPosition", "-209px -407px");
						},
						"click" : function() {
							var tag = $(this).data("tag");
							$(this).prev().remove();
							$(this).remove();

							$("#hd_attribute").find("a").each(function() {
								if ($(this).data("tag") == tag) {
									$(this).css("color", "#444");
								}
							});
						}
					}, ".attr_show");
			$("#hd_attribute")
					.off("click")
					.on(
							"click",
							"a",
							function() {
								var $this = $(this);
								$this.css({
									"color" : "#005ea7",
									"fontWeight" : "700"
								}).siblings().css("color", "#444");
								var tag = $this.data("tag");
								$("#hd_attrref").find("p").each(function() {
									if ($(this).data("tag") == tag) {
										$(this).prev().remove();
										$(this).remove();

									}
								});
								var html = "	<a href='javascript:void(0)' class='more_icon icon'></a>"
										+ "	<p class='attr_show' data-tag='"+tag+"'>"
										+ "	<a href='javascript:void(0)'>"
										+ $(this).text()
										+ "</a>"
										+ "	<a href='javascript:void(0)' class='delete_icon icon'></a>"
										+ "</p>";
								$("#hd_attrref").append(html);
							});
			//查询一类目
			var options = {
				params : {
					parentid : "1"
				},
				callback : function(data) {
					if (data == "[]") {

					} else {
						var $data = $.parseJSON(data);
						var length = $data.length;
						var html = "";
						for (var i = 0; i < length; i++) {
							html += "<option value='"+$data[i].id+"'>"
									+ $data[i].name + "</option>";
						}
						$("#category1").append(html);
					}
				}
			};
			findCategory(options);
			//查询2类目
			getChildCategory("category1", "category2");
			//查询3类目
			getChildCategory("category2", "category3");
			//查询4类目
			getChildCategory("category3", "category4");
			//查询5类目
			getChildCategory("category4", "category5");

			$("input[placeholder]").placeholder();
			/*添加服务按钮*/
			$("#add_service_btn").on("click", function() {
				var height = $("#add_services").height();
				$("#add_services").css("marginTop", "-" + height / 2 + "px");
				$("#add_services,#yy").show();
			});
			$("#close_1").on(
					"click",
					function() {
						$("#add_services,#yy").hide();
						$("#a_s_2").hide();
						$("#a_s_1").show();
						$("#at_new").html("");
						$("#sevice_name").val("");
						$("#sevice_desc").val("");
						$("#category1").find("select").find("option:eq(0)")
								.attr("selected", "selected");
						$("#category2").parents(".s_main").hide();
						$("#category3").parents(".s_main").hide();
						$("#category4").parents(".s_main").hide();
						$("#category5").parents(".s_main").hide();
					});
			$("#next_step")
					.on(
							"click",
							function() {
								alert("表单提交哪些参数？");
								var n = -2;
								$("#s_sort").find(".s_main").each(function() {
									if ($(this).css("display") == "block")
										n++;
								});
								if (n < 0) {
									return false;
								}
								var pid = $("#s_sort").find(
										".s_main:eq(" + n + ")").find("select")
										.val();
								//alert(pid);
								var param = {
									pid : pid
								};/* 修改1 参数只有pid?*/
								$
										.ajax({
											data : param,
											type : "post",
											url : "",/* 查询服务资源模板属性名称action *//* 修改2 */
											success : function(data) {
												alert(data);
												var html = "";
												var $data = $.parseJSON(data);
												var length = $data.length;
												for (var i = 0; i < length; i++) {
													html += "<p data-id='"+$data.id+"'>"
															+ /* 修改3   id  name */
															"<span>"
															+ $data.name
															+ "</span><input type='text' placeholder='填写属性'/>"
															+ "</p>";
												}
												$("#at_fill").html(html);
											}
										});
								$("#a_s_1").hide();
								$("#a_s_2").show();
								var height = $("#add_services").height();
								$("#add_services").css("marginTop",
										"-" + height / 2 + "px");
								//第二个框框
								$("#pre_step").on(
										"click",
										function() {
											$("#a_s_2").hide();
											$("#a_s_1").show();
											var height = $("#add_services")
													.height();
											$("#add_services").css("marginTop",
													"-" + height / 2 + "px");
											$("#at_new").html("");
										});
								$("#submit").on(
										"click",
										function() {
											alert("表单提交哪些参数？");
											//pid service_name service_desc还需要什么参数？
											var service_name = $(
													"#service_name").val();
											var service_desc = $(
													"#service_desc").val();
											var param = {/* 修改4 */
												pid : pid,
												service_name : service_name,
												service_desc : service_desc,
												attribute : {
													attribute1 : [ {
														attribute_id : "",
														attribute_value : ""
													} ]
												}
											};
											$.ajax({
												data : param,
												url : "",/* 添加服务资源action *//* 修改5 */
												type : "post"
											});
											$("#add_services,#yy").hide();
											$("#a_s_2").hide();
											$("#a_s_1").show();
											$("#at_new").html("");
											$("#sevice_name").val("");
											$("#sevice_desc").val("");
											$("#category1").find("select")
													.find("option:eq(0)").attr(
															"selected",
															"selected");
											$("#category2").parents(".s_main")
													.hide();
											$("#category3").parents(".s_main")
													.hide();
											$("#category4").parents(".s_main")
													.hide();
											$("#category5").parents(".s_main")
													.hide();
											/* var html="<div class='l_content' style='display:none;'>"+
														"<div class='l_img'>"+
														"	<img alt='' src='images/list_demo.jpg' height='100' width='100' />"+
														"</div>"+
														"<div class='l_name'>"+
														"	名称撒旦撒的撒旦撒旦撒旦撒大声地撒旦撒"+
														"</div>"+
														"<div class='l_desc'>"+
														"	描述"+
														"</div>"+
														"<div class='l_time'>"+
														"	发布时间"+
														"</div>"+
														"<div class='l_operation'>"+
														"	<a href='javascript:void(0)' class='update'>修改</a>"+
														"	<a href='javascript:void(0)' class='delete'>删除</a>"+
														"	<a href='javascript:void(0)'>查看详情</a>"+
														"</div>"+
													"</div>";
											$("#l_content").prepend(html);
											$("#l_content").find(".l_content:first").slideDown("slow"); */
										});
								$("#new_attribute")
										.on(
												"click",
												function() {
													var html = "<p>"
															+ "<input placeholder='属性' type='text'/><input type='text' placeholder='属性值'/>"
															+ "</p>";
													$(this).next().append(html);
													$("input[placeholder]")
															.placeholder();
												});
							});

			/*添加服务按钮*/
			/*删除服务按钮*/
			$("#l_content").on("click", ".delete", function() {
				$("#yy").show();
				dialogShow($(this));
			});
			/*删除服务按钮*/
		}
		/*dialog show*/
		function dialogShow(obj) {
			var $dialog = $("#yp_dialog");
			var dW = $dialog.width();
			var dH = $dialog.height();
			//var cW=getWidth();
			//var cH=getHeight();
			var newTop = -dH / 2;
			var newLeft = -dW / 2;
			$dialog.css({
				"marginLeft" : newLeft,
				"marginTop" : newTop,
				"top" : "50%",
				"left" : "50%"
			}).slideDown("slow");
			$dialog.find(".close").click(function() {
				$dialog.slideUp("slow");
				$("#yy").hide();
			});
			$dialog.find(".sure").off("click").on("click", function() {
				window.location.href = "javascript:void(0)";/* 删除服务资源action *//* 修改6 */
			});
		}
		/*dialog show*/
	</script>
</body>
</html>
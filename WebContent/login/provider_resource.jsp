<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h3>
		Welcome
		<s:property value="#session.provider.name" />
	</h3>
	<br>
	<s:debug></s:debug>
	<table>
		<tr>
			<td><a href="<%=request.getContextPath() %>/CatalogueAction_toAddResourcePage">增加资源</a></td>
		</tr>
	</table>
    <table>
         <tr>
            <td>一级目录</td>
            <td><s:iterator var="s" value="catalogue.child">
                 
            </s:iterator></td>
         </tr>
    </table>
</body>
</html>
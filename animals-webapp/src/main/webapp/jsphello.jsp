<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello from JSP</title>
</head>
<body>
<h1>Hello from toplevel JSP</h1>
<p>
    request.getRequestURL() returns <%=request.getRequestURL()%>
</p>
<p>
    Listing for "/" :
</p>
<ul>
    <%
        for (String item : request.getServletContext().getResourcePaths("/")) {
    %>
    <li><%=item%></li>
    <%
        }
    %>
</ul>
</body>
</html>

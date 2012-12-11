<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple resource browser</title>
</head>
<body>
<h1>Simple resource browser</h1>
<p>
    request.getRequestURL() returns <%=request.getRequestURL()%>
</p>
<p>
    This browser uses <code>request.getServletContext().getResourcePaths()</code> method
</p>
<%
    String path = request.getParameter("path");
    if (path == null || path.isEmpty()) {
        path = "/";
    }
%>
<hr/>
<%
    if (!path.equals("/")) {
        int n = path.lastIndexOf('/');
        if (path.endsWith("/")) {
            n = path.lastIndexOf('/', n - 1);
        }
        final String parent = path.substring(0, n) + "/";
%>
<p>[<a href="?path=<%=parent%>">go up: <%=parent%>
</a>]</p>
<%
} else {
%>
<p>This is the top level.</p>
<%
    }
%>
<h2>Browsing: <%=path%></h2>
<hr/>
<ul>
    <%
        final Set<String> resourcePathsUnsorted = request.getServletContext().getResourcePaths(path);
        final List<String> resourcePaths = new ArrayList<String>(resourcePathsUnsorted);
        Collections.sort(resourcePaths);
        for (String item : resourcePaths) {
            if (item.endsWith("/")) {
    %>
    <li>[<a href="?path=<%=item%>"><%=item%>
    </a>]
    </li>
    <%
    } else {
    %>
    <li><a href="<%=item%>"><%=item%>
    </a></li>
    <%
            }
        }
    %>
</ul>
</body>
</html>

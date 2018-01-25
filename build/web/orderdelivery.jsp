<%@include file="connect.jsp" %>

<%
String oid=request.getParameter("oid");
//out.println(oid);
PreparedStatement ps=con.prepareStatement("update  placeorder set status=1 where orderid=?");
ps.setInt(1,Integer.parseInt(oid));
ps.executeUpdate();
con.close();
response.sendRedirect("ViewOrders.jsp");
%>
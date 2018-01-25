<%@page import="java.sql.*" %>
<%!Statement st=null;Connection con=null;%>
<%
try{
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minventory","root","root");
 st=con.createStatement();
 //out.println(con);
}catch(Exception e){out.println(e);}
%>
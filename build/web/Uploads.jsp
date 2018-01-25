<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Shop</title>
<%@page  import="java.sql.*,java.io.*"%>
<%
String s=(String)session.getAttribute("user");
if(s==null)
    {
response.sendRedirect("index.jsp");
}
else
{
try{
String saveFile="";
String contentType = request.getContentType();
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength) {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

String ph=request.getSession().getServletContext().getRealPath("/Uploaded/");
File ff=new File(ph);
if(!ff.exists())
    ff.mkdir();

String mn=(String)session.getAttribute("mn");

saveFile=ph+"/"+mn+".jpg";
File f = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(f);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();

request.setAttribute("msg","You have successfully upload the file by the name of "+saveFile);

}
}catch(Exception e)
        {
        e.printStackTrace();
        }
%>
<jsp:forward page="AddProduct.jsp" />
<%
}
%>
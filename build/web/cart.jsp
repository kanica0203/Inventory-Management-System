<!DOCTYPE html>
<!--
	ustora by freshdesignweb.com
	Twitter: https://twitter.com/freshdesignweb
	URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Shop Page- Ustora Demo</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/responsive.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   
    <div class="header-area">
        <div class="container">
           </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
              <!--  <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="./"><img src="img/logo.png"></a></h1>
                    </div>
                </div>
                -->
               <!-- <div class="col-sm-6">
                    <div class="shopping-item">
                        <a href="cart.html">Cart - <span class="cart-amunt">$100</span> <i class="fa fa-shopping-cart"></i> <span class="product-count">5</span></a>
                    </div>
                </div>-->
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="customerhome.jsp">Home</a></li>
                     <!--   <li class="active"><a href="shop.html">Shop page</a></li>
                        <li><a href="single-product.html">Single product</a></li>
                        <li><a href="cart.html">Cart</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                        <li><a href="#">Category</a></li>
                        <li><a href="#">Others</a></li>-->
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Mobile Inventory Shop</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
  <div class="single-product-area">
        <div class="zigzag-bottom"></div>
      <div class="container">
        <div align="center"><strong>
        <h2>Welcome at Customer Home :<%
String uid=(String)session.getAttribute("user");
        out.println(uid);
        %></h2>
        </strong></div>
      </div>
      <p>&nbsp;</p>
      <center>
      <%@include file="connect.jsp" %>
     <%!String cat=null;%>
   <%
String pid=request.getParameter("t1");
String s2=request.getParameter("t2");

cat=request.getParameter("cat");

if(pid!=null && s2!=null)
{
  
int qua=Integer.parseInt(s2);
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select modelname,quantity,sunitprice from product where pid="+pid);
String pname="";int avail=0,up1=0;
if(rs1.next())
{
pname=rs1.getString("modelname");
avail=rs1.getInt("quantity");
up1=rs1.getInt("sunitprice");
}
if(avail>=qua)
{
 //con.setAutoCommit(false);
Statement st2=con.createStatement();
int x=0;
synchronized(this)
{
st2.executeUpdate("update product set quantity=quantity-"+qua+" where pid="+pid);
String sql="insert into placeorder(companyname,modelname,productcode,orderquantity,totalcost,user,date,status) values(?,?,?,?,?,?,?,?)";
PreparedStatement ps=con.prepareStatement(sql);
ps.setString(1,cat);
ps.setString(2,pname);
String productcode=cat+" "+pname;
ps.setString(3,productcode);
ps.setInt(4,qua);
ps.setInt(5,up1*qua);
ps.setString(6,(String)session.getAttribute("user"));
java.util.Date d=new java.util.Date();
ps.setString(7,d.toString());
ps.setInt(8,0);

 x=ps.executeUpdate();
}if(x==1)
 {//con.commit();
   out.println("<centre><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>Order of <b>"+pname+" </b> placed successfully</b></font><centre>");
}

}
else
 {
out.println("<centre><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color=red>Insufficient Quantity</b></font><centre>");

}

}
   %>


   <h2>Products:</h2>
          <table width="425" height="68" border="1">
          <tr>
             <th >PID </th>
            <th>Company Name</th>
            <th>Model Name </th>
            <th>Available quantity</th>
            <th>Unit Price </th>
            </tr>
   <%!int up=0;%>
         <%
      String cat=request.getParameter("cat");
 ResultSet rs=st.executeQuery("select * from product where companyname='"+cat+"'");
 while(rs.next())
 {
     %>
   <tr>

            <td height="20"><%=rs.getInt("pid")%></td>
            <td><%=rs.getString("companyname")%></td>
            <td><a href="modeldesc.jsp?mn=<%=rs.getString("modelname")%>"><%=rs.getString("modelname")%></a></td>
            <td><%=rs.getString("quantity")%></td>
            <td><%=rs.getInt("sunitprice")%></td>
           
          </tr>

     <%
   }
 //con.close();
 %>
          
        </table>
 
<br/><br/>


 <form action="" method="post"><pre>

    Product Id <input type="text" name="t1" size="3"/>   Order Quantity <input type="text" name="t2" size="3"/>


                        <input type="submit" value="Add to Cart" />
</pre>
</form>

        <p>&nbsp; </p>
        
        <table width="441" height="30" border="1">
          <tr>
            <th height="20" scope="col">Product Name </th>
            <th scope="col">Order Quantity</th>
            <th scope="col">Total Cost </th>
          </tr>
          <%
   
 ResultSet rs5=st.executeQuery("select modelname,orderquantity,totalcost from placeorder where companyname='"+cat+"' and user='"+(String)session.getAttribute("user")+"'");
 while(rs5.next())
 {
     %>

            <tr>
            <td><%=rs5.getString("modelname")%></td>
            <td><%=rs5.getString("orderquantity")%></td>
            <td><%=rs5.getString("totalcost")%></td>
          </tr>
     <%
   }
 %>
        </table>
<br/><br/>
        <form action="FinalOrder.jsp" method="Post">
<pre>
<%!String dd,tt;%>
            <%
java.util.Date d=new java.util.Date();
java.text.SimpleDateFormat sf=new java.text.SimpleDateFormat("dd/MM/yyyy");
dd=sf.format(d);
tt=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();

%>
                  Date           <input type="text" name="time" value="<%=dd%>" readonly /> 
       Delivery Address          <textarea  name="venue" ></textarea>

                          <input type="submit" value="CheckOut" />
</pre>   </form>
     
     
     </center>
     
  </div>
            
        <div class="footer-top-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="footer-about-us">
                        <h2>u<span>Stora</span></h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                        <div class="footer-social">
                            <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                            <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">User Navigation </h2>
                        <ul>
                            <li><a href="">My account</a></li>
                            <li><a href="">Order history</a></li>
                            <li><a href="">Wishlist</a></li>
                            <li><a href="">Vendor contact</a></li>
                            <li><a href="">Front page</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-menu">
                        <h2 class="footer-wid-title">Categories</h2>
                        <ul>
                            <li><a href="">Mobile Phone</a></li>
                            <li><a href="">Home accesseries</a></li>
                            <li><a href="">LED TV</a></li>
                            <li><a href="">Computer</a></li>
                            <li><a href="">Gadets</a></li>
                        </ul>                        
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-6">
                    <div class="footer-newsletter">
                        <h2 class="footer-wid-title">Newsletter</h2>
                        <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                        <div class="newsletter-form">
                            <input type="email" placeholder="Type your email">
                            <input type="submit" value="Subscribe">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                       <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>
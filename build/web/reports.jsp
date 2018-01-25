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
                        <li><a href="adminhome.jsp">Home</a></li>
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
    <%@include file="connect.jsp" %>
    
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
  
<%@page import="java.util.*" %>
<%! int total;
ArrayList<String> uproduct;
ArrayList<Integer> uproductq;

%>
<%
uproduct=new ArrayList<String>();
uproductq=new ArrayList<Integer>();
Statement stt=con.createStatement();
ResultSet rs=stt.executeQuery("SELECT  DISTINCT(companyname) FROM product");
  
while(rs.next() )
 {
	
	 Statement stt1=con.createStatement();
	 ResultSet rs1=stt1.executeQuery("SELECT  sum(orderquantity) FROM placeorder where companyname='"+rs.getString(1)+"'");
      if(rs1.next())
      {//out.println(rs1.getInt(1));
      uproductq.add(rs1.getInt(1));
      }
 }
out.println(uproductq.get(0));
 
/*Statement st1=con.createStatement();
 ResultSet rs1=st1.executeQuery("select count(*) from placeorder");
 while(rs1.next())
 {
	 total=rs1.getInt(1);
 }
SELECT  pid, SUM(orderquantity)
FROM testing
GROUP BY productcode
ORDER BY SUM(orderquantity) DESC LIMIT 3;
*/ //con.close();
 
 
 %>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">     </script>
 <script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
  function drawChart() {

    var data = google.visualization.arrayToDataTable([
      ['Product', 'Percentage'],
      ['Samsung',     <%=uproductq.get(0)%>], //This static data needs to reflect dynamic data from html table
      ['Micromax',    <%=uproductq.get(1)%>], //This static data needs to reflect dynamic data from html table
      ['Apple',  <%=uproductq.get(2)%>], //This static data needs to reflect dynamic data from html table
      ['Gionee',  <%=uproductq.get(3)%>],
      ['Blackberry',<%= uproductq.get(4)%>],
      ['HTC',  <%=uproductq.get(5)%>],
      ['Karbonn', <%=uproductq.get(6)%>],
      ['Lava',  <%=uproductq.get(7)%>],
      ['Blackberry',  <%=uproductq.get(8)%>],
      ['Lenevo',  <%=uproductq.get(9)%>],
      ['LG',  <%=uproductq.get(10)%>],
      ['Nokia', <%=uproductq.get(11)%>],
      ['Oppo',  <%=uproductq.get(12)%>],
      ['Penasonic', <%=uproductq.get(13)%>],
      ['Redmi',  <%=uproductq.get(14)%>],
      
      ]);

    var options = {
      title: 'Total Product Sold'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));

    chart.draw(data, options);
  }
</script>

  <div class="single-product-area">
        <div class="zigzag-bottom"></div>
      <div class="container">
        <div align="center"><strong>Welcome at Admin Home</strong></div>
      </div>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
      <p align="center">Product Sell Graph</p>
      
      <center>
      <div id="piechart" style="width: 900px; height: 500px;"></div>
      </center>
      
      
      
      <p align="center">


    
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
           <p align="center"></p>
      <p align="center">&nbsp;</p>
      <p align="center">&nbsp;</p>
     <!-- <p align="center"><h2><center>Total Transaction=<%=total %></center></h2></h2></p>
    
      <p align="center">Total Sell of Product </p>
      <p align="center">&nbsp;</p>
      <p align="center">
      <center>
 <table border="1">
<tr><th>PID</th><th>PNAME</th></tr>
<% 
/*
for(String product:uproduct)
{

ResultSet rss=st.executeQuery("select count(*),sum(orderquantity) from placeorder where companyname='"+product+"'");
 while(rss.next())
 {
 */ %>
 <tr> <td><%//product %></td><td>AAAAAAAAA<%//rss.getInt(2)%></td></tr> 
  <%
 /*}
 }*/%>
<tr></tr>

</table>
</center> --> 
     </p>
      <p align="center">&nbsp;</p>
      <p align="center"><center><h2>ABC Class Category </h2></center></p>
      <p align="center">
      <%@page import="java.util.Map.Entry" %>
      <% 
         ArrayList<String> hs=new ArrayList<String>();
        
        try{
PreparedStatement ps=con.prepareStatement("select distinct(orderid) from placeorder");
ResultSet rsm=ps.executeQuery();
while(rsm.next())
{
     String orderid=rsm.getString(1);
   PreparedStatement ps1=con.prepareStatement("select productcode from placeorder where orderid=?");
   ps1.setString(1,orderid);
   ResultSet rss=ps1.executeQuery();
   
   while(rss.next())
   {
      //out.println("<br/>"+rss.getString(1));
       hs.add(rss.getString(1));
   
   }
}

  Map<String,Integer> map = new HashMap<String, Integer>();
        for(int i=0;i<hs.size();i++){            
            Integer count = map.get(hs.get(i));       
            map.put(hs.get(i), count==null?1:count+1);   //auto boxing and count
        }
 /*for(Map.Entry me:map.entrySet())
  { 
    out.println("<font color=red><b>"+me.getKey()+"  "+ me.getValue()+"</B></font><br/>");
  }*/
        Set<Entry<String, Integer>> set = map.entrySet();
        List<Entry<String, Integer>> list = new ArrayList<Entry<String, Integer>>(set);
        Collections.sort( list, new Comparator<Map.Entry<String, Integer>>()
        {
            public int compare( Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2 )
            {
                return (o2.getValue()).compareTo( o1.getValue() );
            }
        } );
        
        int size=list.size();
        %>
 <center>
 <table border="1">
 <tr><th>Model Name</th><th>Class Category</th></tr>
   <% 
            for(Map.Entry<String, Integer> me:list){
         	       %>
         	      <tr> <td><%=me.getKey() %></td><td><%if(me.getValue()==3) out.println("<font color=red>A Class</font>");
         	      else if(me.getValue()==2) out.println("<font color=blue>B Class</font>");
         	      else
         	    	 out.println("<font color=green>C Class</font>");
         	      %></td>
        	       </tr><% 
     	          }
        %>
        </table>
        </center>
        
        <% 

  // con.close();  
  }catch(Exception e)
   {
     out.println(e);
   }
      
   %>   
      </p>
      <br/><br/><br/>
      
      <p align=""><center><h1>% Contribution for Revenue </h1></center></p>
 <br/><br/>     <p align="center">
     <center>
       <table border="1">
      
       <% 
       try{
    	   
       float gtotal=0;
    	   PreparedStatement ps=con.prepareStatement("select sum(totalcost) from placeorder ");
    	   ResultSet rsmm=ps.executeQuery();
    	   if(rsmm.next())
    	   {
    		   gtotal=rsmm.getFloat(1);
    	   }
    	   %>
    	   <tr><th>Total Revenue</th><th><%=gtotal %>&nbsp;Rs.</th><th></th></tr>
    	   <tr><th>Product</th><th>Revenue</th><th>Contributions</th></tr>
    	  <%  
    	  //out.println("Total Revenue>>"+gtotal+"<br/><br/><br/>");
    	  float total=0;
    	  
    	 TreeSet<String> ts=new TreeSet<String>();
    	  ts.addAll(hs);
    	  float yy=0.0f,mm=0.0f;
    	  for(String k:ts)
    	  {
    	   ps=con.prepareStatement("select sum(totalcost) from placeorder where productcode=?");
    	   ps.setString(1,k);
    	   ResultSet rsmm1=ps.executeQuery();
    	   if(rsmm1.next())
    	   {  
    		   total=rsmm1.getFloat(1);
    		   mm=mm+total;
    		   float perc=(float)((total*100)/gtotal);
    		   if(perc!=0)
    		   {
    			   yy=yy+perc;
    		   %>
        	   <tr> <td><%=k%></td><td><%=total%>&nbsp;Rs.</td><td><%=perc%>%</td>
        	  <%
        	  }
    		 
    		   //out.println(k+" >>>> "+total+" >>> "+" Contribution "+perc+"%<br/>");
    	     }    
    	   }
//    	  out.println(mm+"JJJJJJJJJJJJJJJJJJJJJJJJJJJJ"+yy);
       
       }catch(Exception e)
       {
    		   out.println(e);
       }
       
       %>
       </table>
      </center>
      
      </p>
  </div>
  
  
  
        <p align=""><center><h1>% Contribution for Revenue </h1></center></p>
 <br/><br/>     <p align="center">
     <center>
       <table border="1">
      <%! int gtotal=0; Map<String,Integer> mapA,mapB,mapC;%>
       <% 
       Map<String,Integer> map=new HashMap<String,Integer>();
       try{
    	   
      
    	   PreparedStatement ps=con.prepareStatement("select sum(totalcost) from placeorder");
    	   ResultSet rsmm=ps.executeQuery();
    	   if(rsmm.next())
    	   {
    		   gtotal=rsmm.getInt(1);
    	   }
    	   %>
    	   <tr><th>Total Revenue</th><th><%=gtotal %>&nbsp;Rs.</th><th></th></tr>
    	    </table>
     
    	   <%  
    	  //out.println("Total Revenue>>"+gtotal+"<br/><br/><br/>");
    	  int total=0;
    	  for(String k:hs)
    	  {
    	   ps=con.prepareStatement("select sum(totalcost) from placeorder where productcode=? order by totalcost desc");
    	   ps.setString(1,k);
    	   ResultSet rsmm1=ps.executeQuery();
    	   if(rsmm1.next())
    	   {
    		   total=rsmm1.getInt(1);
    		   map.put(k,total);
    		   
    		   }  
          }
    	
    	  Set<Entry<String, Integer>> set = map.entrySet();
          List<Entry<String, Integer>> list = new ArrayList<Entry<String, Integer>>(set);
          Collections.sort( list, new Comparator<Map.Entry<String, Integer>>()
          {
              public int compare( Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2 )
              {
                  return (o2.getValue()).compareTo( o1.getValue() );
              }
          } );
          
          int p70=0,p25=0,p5=0;
          p70=(gtotal/100)*70;
          p25=(gtotal/100)*25;
          p5=(gtotal/100)*5;
          
          mapA=new HashMap<String,Integer>();
          mapB=new HashMap<String,Integer>();
           mapC=new HashMap<String,Integer>();
          
          
          for(Map.Entry<String, Integer> entry:list){
             
        	    
        	 // out.println("<br/> KKKKK >>>> "+entry.getKey()+"========= "+entry.getValue());
                 if((p70-entry.getValue())>0)
                 {	 mapA.put(entry.getKey(),entry.getValue());
                    p70=p70-entry.getValue();
                 }else if((p25-entry.getValue())>0)
                 { mapB.put(entry.getKey(),entry.getValue());
                 p25=p25-entry.getValue();
                 }else  if((p5-entry.getValue())>0)
                 { mapC.put(entry.getKey(),entry.getValue());
                 p5=p5-entry.getValue();
                 }
          }
    	  
        //  out.println("<br/><br/>MAPA"+mapA);
        //  out.println("<br/><br/>MAPB"+mapB);
        //  out.println("<br/><br/>MAPC"+mapC);
          
            out.println("<br/><br/>70% of total revenue="+p70);
            out.println("<br/><br/>25% of total revenue="+p25);
            out.println("<br/><br/>5% of total revenue="+p5);
            
          
       }catch(Exception e)
       {
    		   out.println(e);
       }
       
       %>
       <br/><br/>
       
       <Table border="1" >
       
       <tr><th>Product Name</th><th>Class</th></tr>
        <%
        for(Map.Entry me:mapA.entrySet())
        {
        %>
        <tr><td><font color="red"><%=me.getKey()%></font></td><td><font color="red">Class A</font></td></tr>
       <%
       }
        for(Map.Entry me:mapB.entrySet())
        {
        %>
        <tr><td><font color="green"><%=me.getKey()%></font></td><td><font color="green">Class B</font></td></tr>
       <%
        }
        for(Map.Entry me:mapC.entrySet())
        {
        %>
        
        <tr><td><font color="blue"><%=me.getKey()%></font></td><td><font color="blue">Class C</font></td></tr>
       <%
        }
       %> 
       
       </table>
       
        </p>
        
        <br/><br/><br/>
         <p align="center"><center><h2>Reordering of Products </h2></center></p>
      <p align="center">
      <center>


  
<table border="1">
<tr><th>Company Name</th><th>Model</th><th>Reorder Priority</th></tr>
<%
String ac="",bc="",cc="";
for(Map.Entry me: mapA.entrySet())
{
	ac=ac+","+me.getKey();
}
for(Map.Entry me: mapB.entrySet())
{
	bc=bc+","+me.getKey();
}
for(Map.Entry me: mapC.entrySet())
{
	cc=cc+","+me.getKey();
}

ResultSet rs4=st.executeQuery("select * from product where quantity < 5");
while(rs4.next())
{
	String  cn=rs4.getString("Companyname");
	String  mn=rs4.getString("modelname");
	String pc=cn+" "+mn;
	
	//out.println(mapA+"<br/>");
	//out.println(mapB+"<br/>");
	//out.println(mapC+"<br/>");
	
	if(mapA.containsKey(pc))
	{
		
%>
<tr>
<td><font color="red"><%=cn%></font></td>
<td><font color="red"><%=mn%></font></td>
<td><font color="red">High</font></td>
</tr> 
<% 
	}
	if(mapB.containsKey(pc))
	{
%>
<tr>
<td><font color="green"><%=cn%></font></td>
<td><font color="green"><%=mn%></font></td>
<td><font color="green">Medium</font></td>

</tr> 
<% 
	}
	if(mapC.containsKey(pc))
	{
%>
<tr>
<td><font color="blue"><%=cn%></font></td>
<td><font color="blue"><%=mn%></font></td>
<td><font color="blue">Low</font></td>
</tr> 
<% 
	}
	
	
}





%>
</table>
</center>


        </p>
        
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
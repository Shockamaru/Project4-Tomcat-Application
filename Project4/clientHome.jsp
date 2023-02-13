<!doctype html">

<%-- 
    Name: Jonathan Bivona
    Course: CNT 4714–Fall2022–Project 4
    Assignment title: A Three-Tier Distributed Web-Based Application
    Date: Sunday December 4, 2022
--%>
<%-- start scriptlet --%>
<%
    String sqlStatement = (String) session.getAttribute("sqlStatement");
    if (sqlStatement == null) sqlStatement = "select * from suppliers";
    String message = (String) session.getAttribute("message");
    if (message == null) message = " ";
%>

<html>
<head>
   <title>CNT 4714 Remote Database Management System</title>
   <style>
    <!--
	    body{background-color: black; text-align: center; font-family: Arial;}
        h1 {color:yellow; font-size:28pt;}
        h2 {color:lime; font-size:24pt;}
        h3 {color:black; font-size:13pt;}
        input {color:yellow; background:#665D1E; font-weight:bold; font-size: 16pt;}
        p {color:black; font-size:13pt;}
        .red{color:red}
        .lime{color:lime}
        table{font-family: Verdana; border:3px solid black;}
        textarea {background: blue; color: white; font-family: Verdana; font-size:15pt; width: 900px; height: 275px;}
        th, td {padding: 5px; border: 1px solid black;}
        .button {padding: 0px 0px; background:#665D1E;}
        .main {color:white;}
        #bl {color: #708090;}
	-->
	</style>
    <script type="text/javascript">
        function eraseText() {
            document.getElementById("cmd").innerHTML = " ";
        }
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
		$(document).ready(function(){
  			$("button").click(function(){
    			$("p").remove();
  			});
		});
	</script>
</head>
<body>
    <h1>Welcome to the Fall 2022 Project 4 Enterprise Database System</h1>
    <h2>A Servlet/JSP-based Multi-tiered Enterprise Application Using A Tomcat Container </h2>
    <hr>
    <h3 class="main">You are connected to the Project 4 Enterprise System database as a <span class="red">client-level</span> user. <br />
        Please enter any valid SQL query or update command. <br />
    </h3>
    <form action="clientServlet" method="post">
        <textarea id="cmd" name="sqlStatement" cols=60 rows=8><%=sqlStatement%></textarea><br>
        <br>
        <input type="submit" value= "Execute Command" <span class="green"></span> /> &nbsp; &nbsp; &nbsp;
        <input type="reset" value="Reset Form" onclick="javascript:eraseText();" <span class="red"></span> /> &nbsp; &nbsp; &nbsp; &nbsp;
        <button class="button"><input type="reset" value="Clear Result" /></button>
    </form>
    <h3 class="main"> <br /> All execution results will appear below this line. </h3>
    <hr>
    <center>
    	<h3>
    		<b class="main">Database Results:</b><br>
    	</h3>
        <p>
            <table>
                <%=message%>
            </table>
        </p>    
    </center>
</body>
</html>
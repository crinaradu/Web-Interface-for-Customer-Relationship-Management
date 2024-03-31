<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Comenzi</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Comenzi:</h1>
        <br/>
        <p align="center"><a href="nou_Comanda.jsp"><b>Adauga o noua comanda.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("comenzi", "idcomanda", aux);
            rs.first();
            String Valoare = rs.getString("valoare");
            String TipProdus = rs.getString("tipprodus");
            String Cantitate = rs.getString("cantitate");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Comanda.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdComanda:</td>
                    <td> <input type="text" name="idcomanda" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Valoare:</td>
                    <td> <input type="text" name="valoare" size="30" value="<%= Valoare%>"/></td>
                </tr>
                <tr>
                    <td align="right">TipProdus:</td>
                    <td> <input type="text" name="tipprodus" size="30" value="<%= TipProdus%>"/></td>
                </tr>
                <tr>
                    <td align="right">Cantitate:</td>
                    <td> <input type="text" name="cantitate" size="30" value="<%= Cantitate%>"/></td>
                </tr>
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

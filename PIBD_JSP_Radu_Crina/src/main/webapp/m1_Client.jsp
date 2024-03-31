<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Clienti</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center">Tabela Clienti:</h1>
        <br/>
        <p align="center"><a href="nou_Client.jsp"><b>Adauga un nou client.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("clienti", "idclient", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Adresa = rs.getString("adresa");
            String Telefon = rs.getString("telefon");
            String Mail = rs.getString("mail");
            rs.close();
            jb.disconnect();
        %>
        <form action="m2_Client.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdClient:</td>
                    <td> <input type="text" name="idclient" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">Nume:</td>
                    <td> <input type="text" name="nume" size="30" value="<%= Nume%>"/></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" value="<%= Adresa%>"/></td>
                </tr>
                <tr>
                    <td align="right">Telefon:</td>
                    <td> <input type="text" name="telefon" size="30" value="<%= Telefon%>"/></td>
                </tr>
                <tr>
                    <td align="right">Mail:</td>
                    <td> <input type="text" name="mail" size="30" value="<%= Mail%>"/></td>
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

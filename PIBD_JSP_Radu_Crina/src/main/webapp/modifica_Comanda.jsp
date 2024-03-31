<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Comenzi</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Comenzi:</h1>
        <br/>
        <p align="center"><a href="nou_Comanda.jsp"><b>Adauga o noua comanda.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Comanda.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdComanda:</b></td>
                    <td><b>Valoare:</b></td>
                    <td><b>TipProdus:</b></td>
                    <td><b>Cantitate:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("comenzi");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcomanda");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("valoare")%></td>
                    <td><%= rs.getString("tipprodus")%></td>
                    <td><%= rs.getString("cantitate")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
        </p>
    </body>
</html>

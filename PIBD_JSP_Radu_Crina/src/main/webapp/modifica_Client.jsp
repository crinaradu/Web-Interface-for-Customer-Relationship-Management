<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Clienti</title>  
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Clienti:</h1>
        <br/>
        <p align="center"><a href="nou_Client.jsp"><b>Adauga un nou client.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Client.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdClient:</b></td>
                    <td><b>Nume:</b></td>
                    <td><b>Adresa:</b></td>
                    <td><b>Telefon:</b></td>
                    <td><b>Mail:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("clienti");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idclient");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("adresa")%></td>
                    <td><%= rs.getString("telefon")%></td>
                    <td><%= rs.getString("mail")%></td>
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

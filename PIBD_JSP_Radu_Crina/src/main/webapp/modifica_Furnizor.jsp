<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Furnizori</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Furnizori:</h1>
        <br/>
        <p align="center"><a href="nou_Furnizor.jsp"><b>Adauga un nou furnizor.</b></a> <a href="index.html"><b>Home</b></a></p>
        <form action="m1_Furnizor.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdFurnizor:</b></td>
                    <td><b>IdClient:</b></td>
                    <td><b>NumeClient:</b></td>
                    <td><b>AdresaClient:</b></td>
                    <td><b>Telefon:</b></td>
                    <td><b>Mail:</b></td>
                    <td><b>IdComanda:</b></td>
                    <td><b>Valoare:</b></td>
                    <td><b>TipProdusComanda:</b></td>
                    <td><b>Cantitate:</b></td>
                    <td><b>AdresaFurnizor:</b></td>
                    <td><b>TipProdusFurnizor:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeFurnizor();
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idfurnizor");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getInt("idclient_furnizor")%></td>
                    <td><%= rs.getString("NumeClient")%></td>
                    <td><%= rs.getString("AdresaClient")%></td>
                    <td><%= rs.getString("Telefon")%></td>
                    <td><%= rs.getString("Mail")%></td>
                    <td><%= rs.getInt("idcomanda_furnizor")%></td>
                    <td><%= rs.getString("ValoareComanda")%></td>
                    <td><%= rs.getString("TipProdus")%></td>
                    <td><%= rs.getString("Cantitate")%></td>
                    <td><%= rs.getString("AdresaFurnizor")%></td>
                    <td><%= rs.getString("TipProdusFurnizor")%></td>
                    
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

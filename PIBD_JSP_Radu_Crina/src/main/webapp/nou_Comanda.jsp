<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga Comanda</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Valoare = request.getParameter("valoare");
            String TipProdus = request.getParameter("tipprodus");
            String Cantitate = request.getParameter("cantitate");
            if (Valoare != null) {
                jb.connect();
                jb.nou_Comanda(Valoare, TipProdus, Cantitate);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Comanda.</h1>
        <form action="nou_Comanda.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Valoare:</td>
                    <td> <input type="text" name="valoare" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">TipProdus:</td>
                    <td> <input type="text" name="tipprodus" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Cantitate:</td>
                    <td> <input type="text" name="cantitate" size="30" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga comanda" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

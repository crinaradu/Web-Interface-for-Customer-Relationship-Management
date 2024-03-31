<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga client</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            String Nume = request.getParameter("nume");
            String Adresa = request.getParameter("adresa");
            String Telefon = request.getParameter("telefon");
            String Mail = request.getParameter("mail");
            if (Nume != null) {
                jb.connect();
                jb.nou_Client(Nume, Adresa, Telefon, Mail);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        %>
        <h1> Suntem in tabela Client.</h1>
        <form action="nou_Client.jsp" method="post">
            <table>
                <tr>
                    <td align="right">Nume Client:</td>
                    <td> <input type="text" name="nume" size="40" /></td>
                </tr>
                <tr>
                    <td align="right">Adresa:</td>
                    <td> <input type="text" name="adresa" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Telefon:</td>
                    <td> <input type="text" name="telefon" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">Mail:</td>
                    <td> <input type="text" name="mail" size="40" /></td>
                </tr>
            </table>
            <input type="submit" value="Adauga clientul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>

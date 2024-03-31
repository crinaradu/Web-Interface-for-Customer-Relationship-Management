<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Furnizori</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="table.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <h1 align="center"> Tabela Furnizori:</h1>
        <br/>
        <p align="center"><a href="nou_Furnizor.jsp"><b>Adauga un nou furnizor.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            int aux = java.lang.Integer.parseInt(request.getParameter("idfurnizor"));
            String idclient = request.getParameter("idclient");
            String idcomanda = request.getParameter("idcomanda");
            String AdresaFurnizor = request.getParameter("adresa");
            String TipProdusFurnizor = request.getParameter("tipprodus");
         

            String[] valori = {idclient, idcomanda, AdresaFurnizor, TipProdusFurnizor};
            String[] campuri = {"idclient", "idcomanda", "adresa", "tipprodus"};
            jb.modificaTabela("furnizori", "idfurnizor", aux, campuri, valori);
            jb.disconnect();
        %>
        <h1 align="center">Modificarile au fost efectuate !</h1>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
</html>

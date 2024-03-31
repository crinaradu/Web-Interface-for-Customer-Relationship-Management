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
        <h1 align="center">Tabela Furnizori:</h1>
        <br/>
        <p align="center"><a href="nou_Consultatie.jsp"><b>Adauga un nou furnizor.</b></a> <a href="index.html"><b>Home</b></a></p>
        <%
            jb.connect();
            String NumeClient, AdresaClient, Telefon, Mail, Valoare, TipProdusComanda, AdresaFurnizor, TipProdusFurnizor;
			Float Cantitate;
            int aux = java.lang.Integer.parseInt(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceFurnizorId(aux);
            rs.first();
            int id1 = rs.getInt("idclient_furnizor");
            int id2 = rs.getInt("idcomanda_furnizor");

            NumeClient = rs.getString("NumeClient");
            AdresaClient = rs.getString("AdresaClient");
            Telefon = rs.getString("Telefon");
            Mail = rs.getString("Mail");
            Valoare = rs.getString("ValoareComanda");
            TipProdusComanda = rs.getString("TipProdusFurnizor");
            Cantitate = rs.getFloat("Cantitate");
            AdresaFurnizor = rs.getString("AdresaFurnizor");
            TipProdusFurnizor = rs.getString("TipProdusFurnizor");

            ResultSet rs1 = jb.vedeTabela("clienti");
            ResultSet rs2 = jb.vedeTabela("comenzi");
            int idclient, idcomanda;


        %>
        <form action="m2_Furnizor.jsp" method="post">
            <table align="center">
                <tr>
                    <td align="right">IdFurnizor:</td>
                    <td> <input type="text" name="idfurnizor" size="30" value="<%= aux%>" readonly/></td>
                </tr>
                <tr>
                    <td align="right">IdClient:</td>
                    <td> 
                        <SELECT NAME="idclient">
                            <%
                                while (rs1.next()) {
                                    idclient = rs1.getInt("idclient");
                                    NumeClient = rs1.getString("nume");
                                    AdresaClient = rs1.getString("adresa");
                                    Telefon = rs1.getString("telefon");
                                    Mail = rs1.getString("mail");
                                    if (idclient != id1) {
                            %>
                            <OPTION VALUE="<%= idclient%>"><%= idclient%>, <%= NumeClient%>, <%= AdresaClient%>, <%= Telefon%>, <%= Mail%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idclient%>"><%= idclient%>, <%= NumeClient%>, <%= AdresaClient%>, <%= Telefon%>, <%= Mail%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">IdComanda:</td>
                    <td> 
                        <SELECT NAME="idcomanda">
                            <%
                                while (rs2.next()) {
                                    idcomanda = rs2.getInt("idcomanda");
                                    Valoare = rs2.getString("valoare");
                                    TipProdusComanda = rs2.getString("tipprodus");
                                    Cantitate = rs2.getFloat("cantitate");
                            if (idcomanda != id2) {
                            %>
                            <OPTION VALUE="<%= idcomanda%>"><%= idcomanda%>, <%= Valoare%>, <%= TipProdusComanda%>, <%= Cantitate%></OPTION>
                                <%
                                        } else {
                                %>                
                            <OPTION selected="yes" VALUE="<%= idcomanda%>"><%= idcomanda%>, <%= Valoare%>, <%= TipProdusComanda%>, <%= Cantitate%></OPTION>
                                <%
                                        }
                                    }
                                %>
                        </SELECT>

                    </td>
                </tr>
                <tr>
                    <td align="right">AdresaFurnizor:</td>
                    <td> <input type="text" name="adresa" size="30" value="<%= AdresaFurnizor%>"/></td>
                </tr>
                <tr>
                    <td align="right">TipProdusFurnizor:</td>
                    <td> <input type="text" name="tipprodus" size="30" value="<%= TipProdusFurnizor%>"/></td>
                </tr>
                
            </table><p align="center">
                <input type="submit" value="Modifica linia">
            </p>
        </form>
        <p align="center"">
            <a href="index.html"><b>Home</b></a>
            <br/>
    </body>
    <%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>

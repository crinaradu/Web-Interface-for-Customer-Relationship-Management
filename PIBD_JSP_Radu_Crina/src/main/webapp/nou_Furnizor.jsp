<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga furnizor</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            int idclient, idcomanda;
            String id1, id2, NumeClient, AdresaClient, Telefon, Mail, Valoare, TipProdusComanda, Cantitate, AdresaFurnizor, TipProdusFurnizor;
            id1 = request.getParameter("idclient");
            id2 = request.getParameter("idcomanda");
            AdresaFurnizor = request.getParameter("adresa");
            TipProdusFurnizor = request.getParameter("tipprodus");
            
            if (id1 != null) {
                jb.connect();
                jb.nou_Furnizor(java.lang.Integer.parseInt(id1), java.lang.Integer.parseInt(id2), AdresaFurnizor, TipProdusFurnizor);
                jb.disconnect();
        %>
        <p>Datele au fost adaugate.</p><%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("clienti");
        ResultSet rs2 = jb.vedeTabela("comenzi");
        %>
        <h1> Suntem in tabela Furnizori.</h1>
        <form action="nou_Furnizor.jsp" method="post">
            <table>
                <tr>
                    <td align="right">IdClient:</td>
                    <td> 
                        Selectati clientul:
			<SELECT NAME="idclient">
                                <%
                                    while(rs1.next()){
                                        idclient = rs1.getInt("idclient");
                                        NumeClient = rs1.getString("nume");
                                        AdresaClient = rs1.getString("adresa");
                                        Telefon = rs1.getString("telefon");
                                        Mail = rs1.getString("mail");
                                %>
                                    <OPTION VALUE="<%= idclient%>"><%= idclient%>,<%= NumeClient%>,<%= AdresaClient%>,<%= Telefon%>,<%= Mail%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                    
                    </td>
                </tr>
                <tr>
                    <td align="right">IdComanda:</td>
                    <td> 
                        Selectati comanda:
			<SELECT NAME="idcomanda">
				<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
                                <%
                                    while(rs2.next()){
                                        idcomanda = rs2.getInt("idcomanda");
                                        Valoare = rs2.getString("valoare");
                                        TipProdusComanda = rs2.getString("tipprodus");
                                        Cantitate = rs2.getString("cantitate");
                                %>
                                    <OPTION VALUE="<%= idcomanda%>"><%= idcomanda%>,<%= Valoare%>,<%= TipProdusComanda%>,<%= Cantitate%></OPTION>
                                <%
                                    }
                                %>
			</SELECT>
                     </td>
                </tr>
                <tr>
                    <td align="right">AdresaFurnizor:</td>
                    <td> <input type="text" name="adresa" size="30" /></td>
                </tr>
                <tr>
                    <td align="right">TipProdusFurnizor:</td>
                    <td> <input type="text" name="tipprodus" size="30" /></td>
                </tr>
                
            </table>
            <input type="submit" value="Adauga furnizorul" />
        </form>
        <%
            }
        %>
        <br/>
        <a href="index.html"><b>Home</b></a>
        <br/>
    </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Furnizori</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Tabela Furnizori</h1>
        <div class="text-center mb-4">
            <a href="nou_Furnizor.jsp" class="btn btn-primary mr-2"><b>Adauga un nou furnizor</b></a>
            <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
        </div>
        <form action="sterge_Furnizor.jsp" method="post">
            <table class="table table-bordered table-hover mx-auto">
                <thead class="thead-light">
                    <tr>
                        <th><input type="checkbox" id="select-all" /></th>
                        <th>IdFurnizor</th>
                        <th>IdComanda</th>
                        <th>IdClient</th>
                        <th>Valoare</th>
                        <th>TipProdus</th>
                        <th>Cantitate</th>
                        <th>NumeClient</th>
                        <th>AdresaClient</th>
                        <th>Telefon</th>
                        <th>Mail</th>
                        <th>AdresaFurnizor</th>
                        <th>TipProdusFurnizor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        jb.connect();
                        ResultSet rs = jb.vedeFurnizor();
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idfurnizor");
                    %>
                    <tr>
                        <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                        <td><%= x%></td>
                        <td><%= rs.getInt("idcomanda_furnizor")%></td>
                        <td><%= rs.getInt("idclient_furnizor")%></td>
                        <td><%= rs.getString("ValoareComanda")%></td>
                        <td><%= rs.getString("TipProdus")%></td>
                        <td><%= rs.getFloat("Cantitate")%></td>
                        <td><%= rs.getString("NumeClient")%></td>
                        <td><%= rs.getString("AdresaClient")%></td>
                        <td><%= rs.getString("Telefon")%></td>
                        <td><%= rs.getString("Mail")%></td>
                        <td><%= rs.getString("AdresaFurnizor")%></td>
                        <td><%= rs.getString("TipProdusFurnizor")%></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        jb.disconnect();
                    %>
                </tbody>
            </table>
            <div class="text-center">
                <input type="submit" class="btn btn-danger" value="Sterge liniile marcate">
            </div>
        </form>
        <p class="text-center mt-3">
            <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
        </p>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Select/Deselect All Script -->
    <script>
        $(document).ready(function() {
            $("#select-all").change(function() {
                $("input:checkbox").prop('checked', $(this).prop("checked"));
            });
        });
    </script>
</body>
</html>

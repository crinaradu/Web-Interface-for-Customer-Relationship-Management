<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Comenzi</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center mb-4">Tabela Comenzi</h1>
        <div class="text-center mb-4">
            <a href="nou_Comanda.jsp" class="btn btn-primary mr-2"><b>Adauga o noua comanda</b></a>
            <a href="index.html" class="btn btn-secondary"><b>Home</b></a>
        </div>
        <form action="sterge_Comanda.jsp" method="post">
            <table class="table table-bordered table-hover mx-auto">
                <thead class="thead-light">
                    <tr>
                        <th><input type="checkbox" id="select-all" /></th>
                        <th>IdComanda</th>
                        <th>Valoare</th>
                        <th>TipProdus</th>
                        <th>Cantitate</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        jb.connect();
                        ResultSet rs = jb.vedeTabela("comenzi");
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idcomanda");
                    %>
                    <tr>
                        <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                        <td><%= x%></td>
                        <td><%= rs.getString("valoare")%></td>
                        <td><%= rs.getString("tipprodus")%></td>
                        <td><%= rs.getString("cantitate")%></td>
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

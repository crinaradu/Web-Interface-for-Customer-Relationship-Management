<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabela Clienti</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .btn-custom {
            font-weight: bold;
        }

        .table thead th {
            text-align: center;
        }

        .table tbody td {
            text-align: center;
        }
    </style>
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
    <div class="container">
        <h1 class="text-center mb-4">Tabela Clienti</h1>
        <div class="text-center mb-4">
            <a href="nou_Client.jsp" class="btn btn-primary btn-custom mr-2">Adauga un nou client</a>
            <a href="index.html" class="btn btn-secondary btn-custom">Home</a>
        </div>
        <form action="sterge_Client.jsp" method="post">
            <table class="table table-bordered table-hover mx-auto">
                <thead class="thead-light">
                    <tr>
                        <th><input type="checkbox" id="select-all" /></th>
                        <th>IdClient</th>
                        <th>Nume</th>
                        <th>Adresa</th>
                        <th>Telefon</th>
                        <th>Mail</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        jb.connect();
                        ResultSet rs = jb.vedeTabela("clienti");
                        long x;
                        while (rs.next()) {
                            x = rs.getInt("idclient");
                    %>
                    <tr>
                        <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                        <td><%= x%></td>
                        <td><%= rs.getString("nume")%></td>
                        <td><%= rs.getString("adresa")%></td>
                        <td><%= rs.getString("telefon")%></td>
                        <td><%= rs.getString("mail")%></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        jb.disconnect();
                    %>
                </tbody>
            </table>
            <div class="text-center">
                <input type="submit" class="btn btn-danger btn-custom" value="Sterge liniile marcate">
            </div>
        </form>
        <p class="text-center mt-3">
            <a href="index.html" class="btn btn-secondary btn-custom">Home</a>
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

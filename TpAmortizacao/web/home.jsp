<%-- 
    Document   : home
    Created on : 16/03/2019, 10:14:09
    Author     : Casa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/estilo.jspf" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TP 02 - Amortização</title>
    </head>
    <body> 
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <br>
        <h1> A aplicação realiza cálculos de amortização americana, constante e constrói a tabela price.</h1>
        <br>
        <h2> Integrantes: </h2>
        <br>
        <h3> Felipe Venâncio </h3>
        <h3> Matheus da Silva Morais </h3>
        <br>
        <h2>
            <a href="amortizacao-americana.jsp">
                Ir para a Amortização Americana
            </a>
        </h2>
        <h2>
            <a href="amortizacao-constante.jsp">
               Ir para a Amortização Constante
            </a>
        </h2>
        <h2>
            <a href="tabela-price.jsp">
                Ir para a Tabela Price 
            </a>
        </h2>
    </body>
    <br>
    <br>
    <br>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>   
</html>

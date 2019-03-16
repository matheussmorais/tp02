<%-- 
    Document   : amortizacao-constante
    Created on : 16/03/2019, 10:17:35
    Author     : Casa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/estilo.jspf" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Amortização Constante: </h1>
        
        <form>
            Capital:<input type="number" name="c"/>
            <br>
            <br>
            Parcelas:<input type="number" name="n"/>
            <br>
            <br>
            Taxa mensal:<input type="number" name="i"/>
            <br>
            <br>
            <input type="submit" name="form" value="Calcular"/>
        </form>
        <%if (request.getParameter("form") != null) {%>
        <%try {%>
        
        <%} catch (Exception ex) {%>
        <h3> Erro! %></h3>
        <%}%>
        <%}%>   
    </body>
    <br>
    <br>
    <br>
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
</html>

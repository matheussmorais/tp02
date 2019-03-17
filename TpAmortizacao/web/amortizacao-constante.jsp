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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Amortização Constante: </h1>
        <div id ="divCenter">
            <form id="frmPost" action="">
                Capital:<input type="number" name="c"/>
                <br>
                <br>
                Parcelas:<input type="number" name="n"/>
                <br>
                <br>
                Taxa mensal:<input type="number" name="i"/>
                <br>
                <br>
                <button class="btn btn-primary" name="form" type="submit">Calcular</button>
            </form>
        </div>
        <%if (request.getParameter("form") != null) {%>
        <%try {%>
        <table border="1">
            <%double n = Integer.parseInt(request.getParameter("n"));%>
            <%double c = Integer.parseInt(request.getParameter("c"));%>
            <%double i = Integer.parseInt(request.getParameter("i"));%>
            <% double cc;
                cc = c;
            %>
            <br>
            <br>
            <tr>
                <th>Parcelas</th>
                <th>Prestações</th>
                <th>Amortizações</th>
                <th>Juros</th>
                <th>Saldo Devedor</th>
            </tr>
            <tr>
                <th> </th>
                <th>R$</th>
                <th>R$</th>
                <th>R$</th>
                <th>R$</th>
            </tr>
            <%for (int cria = 0; cria <= n; cria++) {%>
            <%
                double a, j, dc, pr;
                dc = 0;
                a = 0;
                j = 0;
                pr = 0;
                if (cria <= 0) {
                    dc = c;
                    a = cc / n;
                    j = ((i / 100)) * c;
                } else {
                    j = ((i / 100)) * c;
                    a = cc / n;
                    pr = j + a;
                }
            %>
            <%if (cria <= 0) {%>  
            <tr>
                <td><%=cria%></td>
                <td></td>
                <td></td>
                <td></td>
                <td><%=dc%></td>
            </tr>
            <%} else {%>
            <tr>
                <td><%=cria%></td>
                <td><%=pr%></td>
                <td><%=a%></td>
                <td><%=j%></td>
                <td><%=c += -a%></td>
            </tr>
            <%}%>
            <%}%>
        </table>
        <%} catch (Exception ex) {%>
        <br>
        <br>
        <h3> Erro!</h3>
        <%}%>
        <%}%>
        <p><%@include file="WEB-INF/jspf/rodape.jspf" %></p>
    </body>
    <br>
    <br>
    <br>
</html>

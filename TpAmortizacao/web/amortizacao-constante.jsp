<%-- 
    Document   : amortizacao-constante
    Created on : 16/03/2019, 10:17:35
    Author     : Casa

--%>
<%@page import="java.text.DecimalFormat"%>
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
            Capital:<input type="number" name="c" placeholder="Digite o capital."/>
            <br>
            <br>
            Parcelas:<input type="number" name="n" placeholder="Digite o n° de parcelas."/>
            <br>
            <br>
            Taxa mensal:<input type="number" name="i" placeholder="Digite a taxa de juros."/>
            <br>
            <br>
            <button class="btn btn-primary" name="form" type="submit">Calcular</button>
            <br>
        </form>
    </div>
    <% double sj, sp, sa;
        sj = 0;
        sp = 0;
        sa = 0;%>
    <%if (request.getParameter("form") != null) {%>
    <%try {%>
    <table border="3">
        <%double n = Integer.parseInt(request.getParameter("n"));%>
        <%double c = Integer.parseInt(request.getParameter("c"));%>
        <%double i = Integer.parseInt(request.getParameter("i"));%>
        <% double cc;
            cc = c;
            DecimalFormat df = new DecimalFormat("###,##0.00");
        %>
        <br>
        <br>
        <tr>
            <th><center>Parcelas</center></th>
    <th><center>Prestações</center></th>
<th><center>Amortizações</center></th>
<th><center>Juros</center></th>
<th><center>Saldo Devedor</center></th>
</tr>
<tr>
    <th><center> - </center> </th>
    <th><center>R$</center></th>
<th><center>R$</center></th>
<th><center>R$</center></th>
<th><center>R$</center></th>
</tr>
<%for (int cria = 0; cria <= n; cria++) {%>
<%

    double a, j, dc, pr;
    int ct, cn;
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
        sj = sj + j;
        a = cc / n;
        sa = sa + a;
        pr = j + a;
        sp = sp + pr;
    }
%>
<%if (cria <= 0) {%>  
<tr>
    <td><center><%=cria%></center></td>
    <td><center>-</center></td>
<td><center>-</center></td>
<td><center>-</center></td>
<td><center><%=dc%></center></td>
</tr>
<%} else {%>
<tr>
    <td><center><%=cria%></center></td>
<td><center><%=df.format(pr)%></center></td>
<td><center><%=df.format(a)%></center></td>
<td><center><%=df.format(j)%></center></td>
<td><center><%=df.format(c += -a)%></center></td>
</tr>
<%}%>
<%}%>
<tr>
    <td> Total Acumulado > </td>
    <td><center><%= df.format(sp)%></center></td>
<td><center><%= df.format(sa)%></center></td>
<td><center><%= df.format(sj)%></center></td>
<td> < Total Acumulado </td>
</tr>
</table>
<%} catch (Exception ex) {%>
<br>
<br>
<h3 style="color: red"><center>Algo deu errado! Digite novamente os campos.</center></h3>
<%}%>
<%}%>
<p><%@include file="WEB-INF/jspf/rodape.jspf" %></p>
</body>
<br>
</html>
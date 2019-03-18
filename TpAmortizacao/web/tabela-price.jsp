<%-- 
    Document   : tabela-price
    Created on : 16/03/2019, 10:18:20
    Author     : Casa
--%>
<%@page import="java.lang.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/estilo.jspf" %>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <head>  
        <%@include file="WEB-INF/jspf/estilo.jspf" %>   
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h1>Tabela Price: </h1>
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

    double a, j, dc, pr,p1,p2,p3,pd;
    
    dc = 0;
    a = 0;
    j = 0;
    pr = 0;
    
    if (cria <= 0) {
        dc = c;
        j = ((i / 100)) * c;
        p1 = (1+(i/100));
        p2 = Math.pow(p1, n)-1;
        p3 = Math.pow(p1, n)*(i/100);
        pd = p2/p3;
        pr = cc / pd;
        a = pr - j ;
    } else {
        j = ((i / 100)) * c;
        sj = sj + j;
        p1 = (1+(i/100));
        p2 = Math.pow(p1, n)-1;
        p3 = Math.pow(p1, n)*(i/100);
        pd = p2/p3;
        pr = cc / pd;
        a = pr - j ;
        sa = sa + a;
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
</body>
<br>
<br>
<br>
<%@include file="WEB-INF/jspf/rodape.jspf" %>
</html>

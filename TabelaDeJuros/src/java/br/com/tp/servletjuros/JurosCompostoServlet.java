/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.tp.servletjuros;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Andr0id
 */
public class JurosCompostoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");

            out.println("<title>Calcular Juros Composto</title>");
            out.println("<style type=\"text/css\">"
                    + "                                        fieldset{width: 200px; position: relative; top:80px}"
                    + "                                        h1{position: absolute; left: 30px}"
                    + "                               </style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Juros Composto</h1>");
            out.println("<form method=\"post\">\n"
                    + "		<fieldset>\n"
                    + "		<p> Capital:<br> <input type=\"number\" name=\"capital\" required=\"\"> </p>\n"
                    + "		<p>Taxa (em porcentagem):<br> <input type=\"text\" name=\"taxa\" required=\"\"></p>\n"
                    + "		<p>Tempo (em meses):<br> <input type=\"number\" name=\"periodo\" required=\"\"></p>\n"
                    + "		<p><input type=\"submit\" value=\"Calcular\" name=\"botao\"></p>");
            out.println("<a href=home.html>Voltar</a>");
            out.println("</form>");
            //out.println("</fieldset>");
            if (request.getParameter("botao") != null) {
                DecimalFormat df = new DecimalFormat("#.00");
                try {
                    double taxa = Double.parseDouble(request.getParameter("taxa"));
                    double capital = Double.parseDouble(request.getParameter("capital"));
                    double periodo = Double.parseDouble(request.getParameter("periodo"));
                    
                    out.print("<style>\n"
                            + "table {\n"
                            + "  font-family: arial, sans-serif;\n"
                            + "  border-collapse: collapse;\n"
                            + "  width: 100%;\n"
                            + "}\n"
                            + "\n"
                            + "td, th {\n"
                            + "  border: 1px solid #000000;\n"
                            + "  text-align: center;\n"
                            + "  padding: 8px;\n"
                            + "}\n"
                            + "\n"
                            + "tr:nth-child(even) {\n"
                            + "  background-color: #dddddd;\n"
                            + "}\n"
                            + "</style>");
                    
                    out.print("<table border='0'>");
                    out.print("<tr>");
                    out.print("<th> Mês </th>");
                    out.print("<th> Montante </th>");
                    out.print("<tr>");
                    for (int i = 0; i < periodo + 1; i++) {
                        double acumulado = 0;
                        acumulado = acumulado + (taxa/100);
                        out.print("<td>" + i + "</td>");
                        double montante = capital * Math.pow((1 + (taxa / 100)), i);
                        out.print("<td> R$" + df.format(montante) + "</td>");
                        out.print("<tr>");
                    }

                } catch (Exception e) {
                    out.println("<h2>Erro ao inserir os valores!<h2>");
                }
            }
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

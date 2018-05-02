<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar3</title>
    </head>
   <body style="background-image:url('beavis-on-computer.gif')">
    <center>
        <h1>Erro/ALterar</h1>
        <% try {
                Conecta_Banco conexao = new Conecta_Banco();
                Connection resposta = conexao.conecta_postgre("Teste");
                if (resposta != null) {
                    PreparedStatement pst = resposta.prepareStatement("UPDATE cliente SET nome='"+request.getParameter("nome")+"', email='"+request.getParameter("email")+"', senha="+request.getParameter("senha")+" WHERE id="+request.getParameter("id")+" ");
                    pst.execute();
                    response.sendRedirect("Listar3.jsp");
                }
            } catch (SQLException e) {
                out.println("<b>FALHA AO ATUALIZAR O NOME= " + request.getParameter("nome") + "E/OU O EMAIL=" + request.getParameter("email") + " NO BANCO</b>");
                out.println("<br/><br/> ERRO :" + e);
                // LINK NAO FUNCIONA!!!! ??? out.println("<br/> <a href="Listar3.jsp"> VOLTAR </a> <br/>");

            }
            // out.println(request.getParameter("nome"));
            //out.println(request.getParameter("email"));
        %>

        <br><br> <a href="Listar3.jsp">VOLTAR</a>
    </center>
</body>
</html>

<%@page import="modelo.Cliente"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="controle.Conecta_Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PaginaLogin</title>
    </head>
    <body style="background-color: deepskyblue">
        <%
            Conecta_Banco conn = new Conecta_Banco ();
            Connection conexao = conn.conecta_postgre("Teste");

            if (conexao != null) {
                out.println("Conectado");
            } else {
                out.println("Nao conectado");
            }
        %>
    <center>
        <h1>Login</h1>
        <form action="Index3.jsp" method="POST">
            Nome:<input type="text" name="nome" id="nome" /> <br/><br/>
            Senha:<input type="text" name="senha" id="senha"/> <br/><br/>
            <%
                if (conexao != null) {
                    if (request.getParameter("nome") != null
                            && request.getParameter("senha") != null) {

                        Statement st;
                        ResultSet rs;

                        st = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                        try {
                            rs = st.executeQuery("SELECT * FROM cliente WHERE nome ='" + request.getParameter("nome") + "' AND senha ='" + request.getParameter("senha") + "' ");

                             Cliente c= new Cliente();
                             c.setNome(request.getParameter("nome"));
                             c.setSenha(request.getParameter("senha"));
                             
                            
                            if (rs.next()) {
                               
                                response.sendRedirect("Wellcome3.jsp");
                                                           
                            } else {
                                out.println("Usuario ou senha incorretos ");
                            }

                        } catch (SQLException e) {
                            out.println("ERRO");
                        }
                    }
                } 

            %>
             <br/>
            <input type="submit" value="Logar" />
        </form>
    </center>
</body>
</html>
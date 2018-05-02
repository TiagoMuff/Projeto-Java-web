<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wellcome</title>
    </head>
    <body style="background-color: orange">
    <center>
        <!--if (request.getParameter("nome").equals("Tiago")
                    && request.getParameter("senha").equals("123")) {  } else {
                    out.print("Nome ou senha incorretos");
                }
        -->
        <h1>
            <%
                // out.println("Olá " +request.getParameter("nome")+" Sua senha é "+request.getParameter("senha"));
                Cliente cc = new Cliente();
                out.print("Bem vindo " + cc.getNome()
                        + " Sua senha é : " + cc.getSenha());
            %>
        </h1>
        <br/><center><div>
                <form method="POST">
                    <input type="submit" value="Listar" onclick="form.action = 'Listar3.jsp'" />
                    <input type="submit" value="Inserir"  onclick="form.action = 'Inserir3.jsp'" />
                    <input type="submit" value="Alterar" onclick="form.action = 'Alterar3.jsp'" />
                    <input type="submit" value="Excluir"  onclick="form.action = 'Excluir3.jsp'" />
            </div> </center><br/>
        <div>
            <a href="Index3.jsp">INICIO</a>
        </div>
        <br/>

        <p></p>

        <p style="text-align: center;"><a href="http://www.duckduckgo.com"target="_blank">
                www.duckcuckgo.com</a></p>
        <p>       
            <a href="http://www.duckduckgo.com" target="_blank">
                <img style="display: block; margin-left: auto; margin-right: auto;" 
                     src="14125147o_o.png"
                     alt="" width="540" height="230"/>
            </a>
        </p>


    </center>
</body>
</html>

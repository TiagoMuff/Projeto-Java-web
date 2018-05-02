<%@page import="java.sql.Connection"%>
<%@page import="controle.Conecta_Banco"%>
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

                Conecta_Banco conexao = new Conecta_Banco();
                Connection resp;
                resp = conexao.conecta_postgre("Teste");
                conexao.ExecutaSql("SELECT * FROM cliente ORDER BY id");
                conexao.resultset.first();

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
                    <br/><br/> Nome:<input type="text" name="nome" id="nome" /> <br/><br/>
                    Email:<input type="text" name="email" id="email"/> <br/><br/>
                    Senha:<input type="text" name="senha" id="senha"/><br/><br/>
                    ID __:<input type="text" name="id" id="id"/>
            </div> </center>
            <center><div>
                <h1>Lista do banco de dados</h1>
                <%                do {
                        out.println("ID= " + conexao.resultset.getInt("id") + " | Nome= " + conexao.resultset.getString("nome") + " | Email= " + conexao.resultset.getString("email") + "<br/>");
                        out.println();
                    } while (conexao.resultset.next());

                %>

            </div> </center><br/>
        <a href= "Wellcome3.jsp">VOLTAR</a>
        <br/>

        <p>


        </p>
    </center>
</body>
</html>

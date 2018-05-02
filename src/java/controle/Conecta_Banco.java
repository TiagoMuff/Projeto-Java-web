package controle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;

public class Conecta_Banco {

    public Statement statement;
    public ResultSet resultset;
    public Connection con = null;
    String url = "jdbc:postgresql://localhost:5432/";
    String usuario = "postgres";
    String senha = "sql2014";

    public Connection conecta_postgre(String banco) throws SQLException {

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url + banco, usuario, senha);
        } catch (SQLException e) {
            System.out.println("Erro conexao: Caminho, senha ou usuario incorretos" + e);
        } catch (ClassNotFoundException ex) {
            System.err.println("Erro driver nao encontrado" + ex);
        }
        return con;
    }

    public void ExecutaSql(String sql) {
        try {
            //statement = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
            statement = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            resultset = statement.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("ERRO :" + e);
        }
    }
}

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao{

    private static String caminhoDoBanco = "jdbc:mysql://127.0.0.1:3306/aeroporto";
    private static String usuario = "root";
    private static String senha = "";
    private static Connection connection;

    /**
     * Constrói um objeto conexão com as informações definidas como padrão
     */
    public Conexao(){
        caminhoDoBanco = "jdbc:mysql://127.0.0.1:3306/cadastro";
        usuario = "root";
        senha = "";

        criarConexao();

    }

    public static Connection criarConexao(){

        try{
            connection = DriverManager.getConnection(caminhoDoBanco, usuario, senha);

        }catch(SQLException e){
            System.out.println("Problema ao criar a conexão " + e.getMessage());

        }

        return connection;

    }

    public void fecharConexao(){

        try{
            connection.close();
        
        }catch(SQLException e){
            System.out.println("Problema ao fechar a conexão: " + e.getMessage());

        }

    }

    public String getCaminhoDoBanco(){
        return caminhoDoBanco;

    }

    public String getUsuario(){
        return usuario;

    }

    public String getSenha(){
        return senha;

    }

    public static Connection getConnection(){
        return connection;

    }

}

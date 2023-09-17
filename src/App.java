import java.util.Scanner;

public class App{

    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        String comandoSQL = "SELECT ID, NOME FROM GAFANHOTO";
        
        Conexao conexao = new Conexao();
        Operacao operacao = new Operacao(comandoSQL);

        conexao.fecharConexao();
        scanner.close();
        
    }

}
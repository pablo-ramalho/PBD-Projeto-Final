import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
//import java.sql.Types;
import java.util.Scanner;

public class App{

    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        String comandoSQL;

        comandoSQL = "SELECT * FROM PASSAGEIRO";
        
        Conexao conexao = new Conexao();
        Operacao operacao = new Operacao(comandoSQL);

        conexao.fecharConexao();
        scanner.close();
        System.out.println("SCANNER DA ENTRADA PADRÃO FECHADO COM SUCESSO! V");

        /*
        TRECHO VOLTADO A TESTES
        String url = "jdbc:mysql://127.0.0.1:3306/aeroporto",                   //Marcelo tem que ver qual o host dele (se não for 127.0.0.1)
               nomeDoUsuario = "root",                                          //e a porta do MySQL (se não for 3306)
               senha = "",
               comandoSQL,
               formatacaoNomeDaColuna[],
               formatacaoValor[];

        Scanner leitor = new Scanner(System.in);                                //Cria um scanner que usa a entrada padrão
        
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        ResultSetMetaData resultSetMetaData = null;
        
        Integer numeroDeColunas,
                indiceDaColuna;

        System.out.print("Digite o comando de consulta (SQL) que deseja executar: ");
        comandoSQL = leitor.nextLine();
        
        comandoSQL = comandoSQL.replace(" as ", " ");
        comandoSQL = comandoSQL.replace(" aS ", " ");
        comandoSQL = comandoSQL.replace(" As ", " ");
        comandoSQL = comandoSQL.replace(" AS ", " ");

        System.out.println("Comando final: " + comandoSQL);
        
        System.out.print("Pressione ENTER para continuar");
        leitor.nextLine();                                                      //Limpa o buffer (Só apertar ENTER)
        
        try{
            connection = DriverManager.getConnection(url, nomeDoUsuario, senha);//Abre a conexão com o banco 
            statement = connection.createStatement();                           //Cria uma estrutura para executar o comando SQL
            resultSet = statement.executeQuery(comandoSQL);                     //Executa a consulta e retorna um conjunto de resultados
            resultSetMetaData = resultSet.getMetaData();                        //Obtém as informações sobre as colunas do conjunto de resultados

            numeroDeColunas = resultSetMetaData.getColumnCount();

            formatacaoNomeDaColuna = new String[numeroDeColunas];
            formatacaoValor = new String[numeroDeColunas];

            //IMPRIME OS NOMES DAS COLUNAS (SEPARADAS POR DOIS ESPAÇOS)
            for(indiceDaColuna = 1; indiceDaColuna <= numeroDeColunas; indiceDaColuna++){
                formatacaoNomeDaColuna[indiceDaColuna - 1] = "  " + resultSetMetaData.getColumnName(indiceDaColuna).toUpperCase() + "  | ";

                System.out.print(formatacaoNomeDaColuna[indiceDaColuna - 1]);

            }

            System.out.println();

            //IMPRIME OS VALORES DAS LINHAS (OU TUPLAS)
            while(resultSet.next()){

                for(indiceDaColuna = 1; indiceDaColuna <= numeroDeColunas; indiceDaColuna++){
                    formatacaoValor[indiceDaColuna - 1] = resultSet.getString(indiceDaColuna);

                    System.out.print(formatacaoValor[indiceDaColuna - 1]);

                    //SE O VALOR DA COLUNA CORRESPONDENTE TIVER MENOS CARACTERES QUE O NOME DA COLUNA
                    if(formatacaoValor[indiceDaColuna - 1].length() <= formatacaoNomeDaColuna[indiceDaColuna - 1].length()){

                        for(int espaco = formatacaoValor[indiceDaColuna - 1].length(); 
                            espaco < formatacaoNomeDaColuna[indiceDaColuna - 1].length(); 
                            espaco++
                           )
                        System.out.print(" ");

                    }else{  //SE O VALOR DA COLUNA CORRESPONDENTE TIVER MAIS CARACTERES QUE O NOME DA COLUNA
                        //TODO implementar formatação para quando o número de caracteres do valor for maior do que o número de caracteres do nome da coluna
                        System.out.print(" ");

                    }

                    System.out.print("|");

                }

                System.out.println();

            }                                                //Fecha a conexão com o banco

        }catch(SQLException e){
            System.out.println("Problema: " + e.getMessage());

        }finally{
            System.out.println("\nINFORMAÇÕES SOBRE LIBERAÇÃO DE RECURSOS:");

            leitor.close();              
            System.out.println("SCANNER DA ENTRADA PADRÃO FECHADO COM SUCESSO! V");                     //Fecha o scanner que usa a entrada padrão
            
            App.fechar(connection, statement);                //Fecha o statement e a conexão com o banco de dados AEROPORTO                 

        }
        */

    }


    /*
    MÉTODO VOLTADO PARA TESTES
    static void fechar(Connection connection, Statement statement){

        try{
            statement.close();
            connection.close();

            System.out.println("STATEMENT FECHADO COM SUCESSO! V");
            System.out.println("CONEXÃO ENCERRADA COM SUCESSO! V");
                
        }catch(SQLException e){
            System.out.println("Problema ao fechar recurso: " + e.getMessage());

        }     

    }
    */


}
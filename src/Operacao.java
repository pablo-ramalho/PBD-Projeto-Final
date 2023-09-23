import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;

public class Operacao{

    private String comandoSQL;
    private Statement statement;

    public Operacao(String comandoSQL){
        this.comandoSQL = comandoSQL;

    }

    /**
     * Realiza um conjunto de operações para obter as informações relacionadas
     * ao nome da tabela em questão, os nomes das colunas e os seus respectivos valores.
     * <strong>OBS: </strong>o comando que se adequa ao propósito
     * deste método é o comando <strong>SELECT</strong>. Qualquer outro comando
     * que seja identificado será considerado inválido pelo método.
     */
    public void consultar(){
        ResultSet resultSet;
        ResultSetMetaData resultSetMetaData;

        try{
            
            if(comandoSQL.contains("SELECT") == false || 
               comandoSQL.contains("SELECT".toLowerCase()) == false)
                System.out.println("Este comando não é um SELECT!");

            else{
                //CRIA O COMANDO PARA REALIZAR A CONSULTA E OBTÉM OS METADADOS DO RESULTADO DA CONSULTA
                    statement = Conexao.getConnection().createStatement();
                
                resultSet = statement.executeQuery(this.comandoSQL);
                resultSetMetaData = resultSet.getMetaData();

                //FAZ A IMPRESSÃO DAS INFORMAÇÕES DA CONSULTA
                this.percorrerTuplas(resultSet, resultSetMetaData);

                //FECHA O COMANDO
                this.encerrarComando();

            }

        }catch(SQLException e){
            System.out.println("Problema ao realizar a consulta ou ao criar o comando: " + e.getMessage());

        }
        
    }

    /**
     * Este método é usado para exibir informações sobre a consulta realizada.
     * @param resultSet o resultado da consulta
     * @param resultSetMetaData os metadados da consulta, como contagem do número de colunas, nome da tabela, nome de uma coluna específica...
     */
    private void percorrerTuplas(ResultSet resultSet, ResultSetMetaData resultSetMetaData){
        int numeroDeColunas; 
        String nomeDaTabela = ""; 
        
        try{
            numeroDeColunas = resultSetMetaData.getColumnCount();
            nomeDaTabela = resultSetMetaData.getTableName(1).toUpperCase();

            //IMPRIME O NOME DA TABELA EM QUESTÃO
            System.out.println("TABELA " + nomeDaTabela + ":");


            //IMPRIME OS NOMES DAS COLUNAS, UMA POR VEZ
            for(int coluna = 1; coluna <= numeroDeColunas; coluna++)
                System.out.println(resultSetMetaData.getColumnName(coluna).toUpperCase() + " |");


            //PERCORRE AS TUPLAS DA TABELA
            while(resultSet.next()){

                for(int coluna = 1; coluna <= numeroDeColunas; coluna++)
                    System.out.println(resultSet.getString(coluna) + " | ");

                System.out.println("\n");

            }

        }catch(SQLException e){
            System.out.println("Problema ao percorrer as tuplas da tabela " + nomeDaTabela + ": " + e.getMessage());

        }

    }

    /**
     * Executa um comando do tipo <strong>DDL</strong> (Data Definition Language)
     * e mostra informações sobre o comando executado. 
     * O comando deve ser <strong>CREATE</strong>, <strong>ALTER</strong> ou <strong>DROP</strong>. 
     * Se o comando especificado não for um dos citados anteriormente o comando será considerado
     * inválido pelo método e não será executado.
     */
    public void definir(){
        int tuplasAfetadas;
        ResultSet resultSet = null;
        ResultSetMetaData resultSetMetaData = null;

        try{

            if(comandoSQL.contains("CREATE ") == false || comandoSQL.contains("CREATE ".toLowerCase()) == false ||
               comandoSQL.contains("ALTER ") == false || comandoSQL.contains("ALTER ".toLowerCase()) == false ||
               comandoSQL.contains("DROP ") == false || comandoSQL.contains("DROP ".toLowerCase()) == false)
                System.out.println("Este comando não é um comando DDL (CREATE, ALTER ou DROP)!");

            else{

                //CRIA O COMANDO PARA EXECUTAR O COMANDO DDL ESPECIFICADO
                if(statement != null)
                    Conexao.getConnection().createStatement();

                if(comandoSQL.contains("DROP ") == false){
                    tuplasAfetadas = statement.executeUpdate(comandoSQL);

                    resultSet = statement.getResultSet();
                    resultSetMetaData = resultSet.getMetaData();
                    
                    this.imprimirInfosComandoDDL(resultSetMetaData);

                }else{
                    tuplasAfetadas = statement.executeUpdate(comandoSQL);

                    this.imprimirInfosComandoDDL();

                }

                System.out.println(tuplasAfetadas + " tupla" + 
                                  ((tuplasAfetadas > 1) ? "s " : " ") + "afetada" +
                                  ((tuplasAfetadas > 1) ? "s.": "."));

                this.encerrarComando();

            }

        }catch(SQLException e){
            System.out.println("Problema ao executar comando DDL: " + e.getMessage());

        }

    }

    /* TODO criar método para tratar comandos DML*/
    
    /**
     * Sobrecarga do método imprimirInfosComandosDDL().
     * @param resultSetMetaData os metadados relacionados ao ResultSet (nomes das tabelas, colunas, tipos, ...). 
     * Usado quando um comando CREATE ou ALTER é especificado
     */
    private void imprimirInfosComandoDDL(ResultSetMetaData resultSetMetaData){
        int numeroDeColunas;
        String nomeDaTabela = "";
        String nomeDaColuna = "";
        String tipoDaColuna = "";

        
        try{
            nomeDaTabela = resultSetMetaData.getTableName(1);
            
            //CASO O COMANDO DE CRIAÇÃO DE TABELA SEJA ESPECIFICADO
            if(comandoSQL.contains("CREATE TABLE") || comandoSQL.contains("CREATE TABLE".toLowerCase())){
                numeroDeColunas = resultSetMetaData.getColumnCount();

                System.out.println("Criada tabela " + nomeDaTabela + " com " + numeroDeColunas + " colunas.");
                
                System.out.println("Dados associados à tabela criada:");

                for(int coluna = 1; coluna <= numeroDeColunas; coluna++){
                    nomeDaColuna = resultSetMetaData.getColumnName(coluna);
                    tipoDaColuna = resultSetMetaData.getColumnTypeName(coluna);

                    System.out.print(nomeDaColuna.toUpperCase());
                    System.out.println(" do tipo " + tipoDaColuna.toUpperCase());

                }

            }    



            //CASO O COMANDO DE ALTERAÇÃO DE TABELA SEJA ESPECIFICADO
            if(comandoSQL.contains("ALTER TABLE") || comandoSQL.contains("ALTER TABLE".toLowerCase())){
                String[] chavePrimaria;
                String[] chaveEstrangeira;
                String nomeDaTabelaReferenciada;
                
                System.out.println("Alterada estrutura da tabela " + nomeDaTabela.toUpperCase() + ".");

                System.out.println("Alterações realizadas:");
                

                //CASO O COMANDO ESPECIFICADO SEJA PARA ASSOCIAR UMA CHAVE PRIMÁRIA À TABELA
                if(comandoSQL.contains("ADD PRIMARY KEY") || comandoSQL.contains("ADD PRIMARY KEY".toLowerCase())){
                    chavePrimaria = this.extrairNomesDasChavesPrimarias();

                    for(int contador = 0; contador < chavePrimaria.length; contador++)
                        System.out.println("Coluna " + chavePrimaria[contador].toUpperCase() + " definida como chave primária");

                    System.out.print("Chave primária da tabela " + nomeDaTabela.toUpperCase() + ": (");

                    for(int contador = 0; contador < chavePrimaria.length; contador++)
                        System.out.print(chavePrimaria[contador].toUpperCase() + " ");

                    System.out.println(")\n");

                }



                //CASO O COMANDO ESPECIFICADO SEJA PARA ASSOCIAR UMA CHAVE ESTRANGEIRA À TABELA DESIGNADA PARA QUE ESTA REFERENCIE OUTRA TABELA
                if(comandoSQL.contains("ADD FOREIGN KEY ") || comandoSQL.contains("ADD FOREIGN KEY".toLowerCase())){
                    chavePrimaria = this.extrairNomesDasChavesPrimarias();
                    chaveEstrangeira = this.extrairNomeDasChavesEstrangeiras(nomeDaTabela);

                    for(int contador = 0; contador < chavePrimaria.length; contador++)
                        System.out.println("Coluna " + chaveEstrangeira[contador].toUpperCase() + " definida como chave estrangeira");

                    for(int contador = 0; contador < chaveEstrangeira.length; contador++){
                        nomeDaTabelaReferenciada = comandoSQL.substring(comandoSQL.indexOf("REFERENCES ") + 11, comandoSQL.lastIndexOf(" (")).toUpperCase();

                        System.out.print (chavePrimaria[contador].toUpperCase());
                        System.out.print(" referencia " + nomeDaTabelaReferenciada.toUpperCase() + "(" + chaveEstrangeira[contador].toUpperCase() + ")");

                    }

                    //LADO QUE REFERENCIA (PK1, PK2, ..., PKn)
                    System.out.print("(");

                    for(int contador = 0; contador < chavePrimaria.length; contador++){

                        if(contador != chavePrimaria.length - 1)
                            System.out.print(chavePrimaria[contador].toUpperCase() + ", ");

                        else
                            System.out.print(chavePrimaria[contador].toUpperCase());

                    }


                    System.out.print(") --> ");


                    //LADO REFERENCIADO --> (FK1, FK2, ..., FKn)
                    System.out.print("(");

                    for(int contador = 0; contador < chaveEstrangeira.length; contador++){

                        if(contador != chaveEstrangeira.length - 1)
                            System.out.print(chaveEstrangeira[contador].toUpperCase() + ", ");

                        else
                            System.out.print(chaveEstrangeira[contador].toUpperCase());

                    }

                    System.out.println(")\n");

                }

            }
    
        }catch(SQLException e){
            System.out.println("Problema: " + e.getMessage());

        }

    }

    /**
     * Sobrecarga do método imprimirInfosComandoDDL(). 
     * Usado quando um comando DROP é especificado
     */
    private void imprimirInfosComandoDDL(){
        int delimitadorInicio;
        int delimitadorFim;
        String nomeDaTabela = null;

        if(comandoSQL.contains("DROP TABLE") || comandoSQL.contains("DROP TABLE".toLowerCase())){
            delimitadorInicio = comandoSQL.indexOf(comandoSQL.lastIndexOf("TABLE ") + 1);
            delimitadorFim = comandoSQL.indexOf(delimitadorInicio + 6 + comandoSQL.substring(delimitadorInicio + 6));
            nomeDaTabela = comandoSQL.substring(delimitadorInicio, delimitadorFim);

            System.out.print("Tabela " + nomeDaTabela + " removida");

        }

    }

    public String[] extrairNomesDasChavesPrimarias(){
        int delimitadorInicio;
        int delimitadorFim;
        String nomeDasColunas;
        String[] chavePrimaria;

        delimitadorInicio = comandoSQL.indexOf('(');
        delimitadorFim = comandoSQL.indexOf(')');
        
        nomeDasColunas = comandoSQL.substring(delimitadorInicio + 1, delimitadorFim);
        chavePrimaria = nomeDasColunas.split(",");

        return chavePrimaria;

    }

    public String[] extrairNomeDasChavesEstrangeiras(String nomeDaTabela){
        int delimitadorInicio;
        int delimitadorFim;
        String nomeDasColunas;
        String[] chaveEstrangeira;

        delimitadorInicio = comandoSQL.lastIndexOf('(');
        delimitadorFim = comandoSQL.lastIndexOf(')');

        nomeDasColunas = comandoSQL.substring(delimitadorInicio + 1, delimitadorFim);
        chaveEstrangeira = nomeDasColunas.split(",");

        return chaveEstrangeira;

    }

    /**
     * Encerra o processamento do comando atual
     */
    public void encerrarComando(){

        try{
            statement.close();
            System.out.println("COMANDO ENCERRADO COM SUCESSO! V");

        }catch(SQLException e){
            System.out.println("Problema ao encerrar o comando: " + e.getMessage());

        }

    }

    public String getComandoSQL(){
        return comandoSQL;

    }

    public void setComandoSQL(String comandoSQL){
        this.comandoSQL = comandoSQL;
    
    }
    
}

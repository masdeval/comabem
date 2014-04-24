<?
if(!@($conexao = pg_connect("localhost dbname=dbsample port=5432 user=postgres password=java")))
{
   print "Não foi possível estabelecer uma conexão com o banco de dados.";
}else{

$db = pg_connect($conexao); // aqui ele executa a conexão com o DNS da variavel $conexao

$query = "select * from person";
$resultado = pg_query($db,$query); // Executa a query $query na conexão $db

	echo "lala";

}

?>


<?php
require_once('../cnn.php');
$postjson = json_decode(file_get_contents('php://input'), true);

# Variáveis que vão ser utilizadas para pegar as 
# informações do usuário
$idusuario = $postjson['idUsuario'];
$nome = $postjson['nome'];
$cpf = $postjson['cpf'];
$num_CNH = $postjson['num_CNH'];
$validade_CNH = $postjson['validade_CNH'];
$telefone = $postjson['telefone'];
$email =  = $postjson['email'];

# Algoritmos de validação dos dados
if ($nome == "") {
    echo json_encode(array('mensagem' => 'Preencha o Campo Nome!'));
    exit();
}

# Preencha o SQL com as informações do banco
$res = $pdo->prepare("INSERT INTO usuarios SET nome = :nome,
        cpf = :cpf, 
        num_CNH = :num_CNH, 
        validade_CNH = :validade_CNH, 
        telefone = :telefone, 
        email = :email 
        ");

# bind do sql com os dados que serão inseridos no banco
$res->bindValue(":nome", $nome);
$res->bindValue(":cpf", $cpf);
$res->bindValue(":num_CNH", $num_CNH);
$res->bindValue(":validade_CNH", $validade_CNH);
$res->bindValue(":telefone", $telefone);
$res->bindValue(":email", $email);

$res->execute();


$result = json_encode(array('erro' => 0, 'mensagem' => 'Salvo com Sucesso'));
echo $result;

?>
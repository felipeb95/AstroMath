<?php
session_start();
include 'database.php';

$conexion = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($conexion->connect_error) {
    die("La conexion falló: " . $conexion->connect_error);
}
$sql = "SELECT * FROM plat_parametros_con";
$result = $conexion->query($sql);
$data = $result->fetch_assoc();
$menorMultiplo = $data["menorMultiplo"];
$mayorMultiplo = $data["mayorMultiplo"];
$porcBuenas = $data["porcBuenas"];
$porcMalas = $data["porcMalas"];
$debug = $data["debug"];
$pPuntos = $data["pPuntos"];
$pMultiplicador = $data["pMultiplicador"];
$pEscudo = $data["pEscudo"];
$pPoder = $data["pPoder"];
$pSlowmo = $data["pSlowmo"];
$vidas = $data["vidas"];

$tMax = $data["tMax"];
$tMin = $data["tMin"];
$tiempo = $data["tiempo"];
$timeMuerte = $data["timeMuerte"];

$feedback = $data["feedback"];
$tInicial = $data["tInicial"];
$tAumento = $data["tAumento"];
$porcT = $data["porcT"];
if(!isset($_SESSION['grupo'])){
    $grupo = 1;
}
else $grupo = $_SESSION['grupo'];
//API URL
$url = $direccion.'parametros.php';

//Initiate cURL.
$ch = curl_init($url);

$data = '{';
$data.= '"menorMultiplo":'.$menorMultiplo.',';
$data.= '"mayorMultiplo":'.$mayorMultiplo.',';
$data.= '"porcBuenas":'.$porcBuenas.',';
$data.= '"porcMalas":'.$porcMalas.',';
$data.= '"debug":'.$debug.',';
$data.= '"pPuntos":'.$pPuntos.',';
$data.= '"pMultiplicador":'.$pMultiplicador.',';
$data.= '"pEscudo":'.$pEscudo.',';
$data.= '"pPoder":'.$pPoder.',';
$data.= '"pSlowmo":'.$pSlowmo.',';
$data.= '"feedback":'.$feedback.',';
$data.= '"tInicial":'.$tInicial.',';
$data.= '"tAumento":'.$tAumento.',';
$data.= '"grupo":'.$grupo.',';
$data.= '"porcT":'.$porcT.',';
$data.= '"tMax":'.$tMax.',';
$data.= '"tMin":'.$tMin.',';
$data.= '"tiempo":'.$tiempo.',';
$data.= '"timeMuerte":'.$timeMuerte.',';
$data .= '"vidas":"'.$vidas.'"}';
//The JSON data.
$jsonData = $data;
 
//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
 
//Tell cURL that we want to send a POST request.
curl_setopt($ch, CURLOPT_POST, 1);
 
//Attach our encoded JSON string to the POST fields.
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);
 
//Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
//Execute the request
$result = curl_exec($ch);

$data = json_decode(file_get_contents('php://input'), true);
echo $data;

?>
<?php
session_start();
include 'database.php';

$conexion = new mysqli(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
if ($conexion->connect_error) {
    die("La conexion falló: " . $conexion->connect_error);
}
$sql = "SELECT * FROM popit_parametros_con";
$result = $conexion->query($sql);
$data = $result->fetch_assoc();

$minNumber = $data["minNumber"];
$maxNumber = $data["maxNumber"];
$bonusProbability = $data["bonusProbability"];
$bonusPlus = $data["bonusPlus"];
$bonusMultiplier = $data["bonusMultiplier"];
$bonusFiftyFifty = $data["bonusFiftyFifty"];
$bonusShowCorrect = $data["bonusShowCorrect"];
$minSpeed = $data["minSpeed"];
$maxSpeed = $data["maxSpeed"];
$debugMode = $data["debugMode"];
$porcBuenas = $data["porcBuenas"];
$porcMalas = $data["porcMalas"];
$rangoBuena = $data["rangoBuena"];
if(!isset($_SESSION['grupo'])){
    $grupo = 1;
}
else $grupo = $_SESSION['grupo'];

//API URL
$url = $direccion.'parametros.php';

//Initiate cURL.
$ch = curl_init($url);

$data = '{';
$data.= '"minNumber":'.$minNumber.',';
$data.= '"maxNumber":'.$maxNumber.',';
$data.= '"bonusProbability":'.$bonusProbability.',';
$data.= '"bonusPlus":'.$bonusPlus.',';
$data.= '"bonusMultiplier":'.$bonusMultiplier.',';
$data.= '"bonusFiftyFifty":'.$bonusFiftyFifty.',';
$data.= '"bonusShowCorrect":'.$bonusShowCorrect.',';
$data.= '"minSpeed":'.$minSpeed.',';
$data.= '"maxSpeed":'.$maxSpeed.',';
$data.= '"grupo":'.$grupo.',';
$data.= '"porcBuenas":'.$porcBuenas.',';
$data.= '"porcMalas":'.$porcMalas.',';
$data.= '"rangoBuena":'.$rangoBuena.',';
$data.= '"debugMode":'.$debugMode.'}';

//The JSON data.
$jsonData = $data;
 
//Encode the array into JSON.
$jsonDataEncoded = json_encode($jsonData);
 
//Tell cURL that we want to send a POST request.
//curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_POSTREDIR, 3);
//Attach our encoded JSON string to the POST fields.
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonDataEncoded);
 
//Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json')); 
 
//Execute the request
$result = curl_exec($ch);

$data = json_decode(file_get_contents('php://input'), true);
echo $data;

?>

<?php
// include('../CONNEXION/Db.php');		
// $db=new Database();
// $id=$_POST['id'];
// $result=array();
//     $conn = $db->connect();
//     $stmt = $conn->query("SELECT * FROM  `vdetailapprovisionnement`where id_approvisionnement=$id ");
//     // $stmt->bindParam(':id', $id);
//     $result= $stmt->fetchAll(PDO::FETCH_ASSOC);
// echo json_encode($result);

include('../CONNEXION/Db.php');		
$db = new Database();
$result = [];

if (isset($_POST['id']) && is_numeric($_POST['id'])) {
    $id = (int) $_POST['id']; // on force un entier pour plus de sécurité
    $conn = $db->connect();

    $stmt = $conn->prepare("SELECT * FROM `vdetailapprovisionnement` WHERE approvisionnement_id = :id");
    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->execute();

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
} else {
    $result = ['error' => 'ID invalide ou manquant'];
}

echo json_encode($result);
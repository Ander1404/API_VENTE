<?php
include('../CONNEXION/Db.php');		
$db=new Database();
$id=$_POST['id'];
$result=array();
    $conn = $db->connect();
    $stmt = $conn->query("SELECT * FROM  `vdetailvente` where vente_id=$id ");
    // $stmt->bindParam(':id', $id);
    $result= $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>
<?php
$sevr = "localhost";
$user = "root";
$pass = "";
$Db = "test";
$conn = new mysqli($sevr,$user,$pass,$Db);

if (isset($_POST['ac']))
    $ac = $_POST['ac'];
if (isset($_POST['u_id']))
    $u_id = $_POST['u_id'];
if (isset($_POST['data']))
    $data = $_POST['data'];



if($ac=="INSERT"){
    $sql = "INSERT INTO `user`(`u_id`, `data`) VALUES (null,'$data')";
    $result = $conn->query($sql);
    if($result){
       
        echo "Insert succes $data";
    }else{
        echo $sql;
    }
}

if ($ac == "SELECT") {
    $sql = "SELECT * FROM `user` ";
    $result = $conn->query($sql);
    if ($result) {
        $arr = array();
        while ($row = $result->fetch_assoc()) {
            $arr[] = $row;
        }

        echo json_encode($arr);
    } else {
        echo $sql;
    }
}
if($ac=="SELECT_ID"){
    $sql = "SELECT * FROM `user` where u_id = $u_id";
    $result = $conn->query($sql);
    if($result){
        $arr = array();
        while($row = $result->fetch_assoc()){
            $arr[] = $row;
        }

        echo json_encode($arr);
    }else{
        echo $sql;
    }
}
if($ac=="UPDATE"){
    $sql = "UPDATE `user` SET `data`='$data' WHERE u_id = $u_id";
    $result = $conn->query($sql);
    if($result){
        
        echo "update u_id: $u_id success";
    }else{
        echo $sql;
    }
}
if($ac=="DELETE"){
    $sql = "DELETE FROM `user` WHERE u_id = $u_id";
    $result = $conn->query($sql);
    if($result){
       

        echo "Delete u_id: $u_id success";
    }else{
        echo $sql;
    }
}
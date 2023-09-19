<?php

require_once '../models/Veterinaria.php';

$veterinaria = new Veterinaria();

if(isset($_POST['op'])){

  //Registrar cliente

  if($_POST['op'] == 'addClientes'){

    $register = [
      "apellidos" => $_POST["apellidos"],
      "nombres"   => $_POST["nombres"],
      "dni"       => $_POST["dni"],
      "claveacceso" => $_POST["claveacceso"],
    ];

    $veterinaria->addClientes($register);
  }

   //Registrar mascota

   if($_POST['op'] == 'addMascotas'){

    $register = [
      "idcliente"   => $_POST["idcliente"],
      "idraza"      => $_POST["idraza"],
      "nombre"      => $_POST["nombre"],
      "fotografia"  => $_POST["fotografia"],
      "color"       => $_POST["color"],
      "genero"      => $_POST["genero"],
    ];

    $veterinaria->addMascotas($register);
  }

  if($_POST['op'] == 'buscarMascota'){
    $data = $veterinaria->buscarMascota($_POST['idcliente']);

    echo json_encode($data);


  }
}


?>
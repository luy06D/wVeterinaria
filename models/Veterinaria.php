<?php

require_once 'Conexion.php';

class Veterinaria extends Conexion{
  
  private $access;

  public function __CONSTRUCT(){
    $this->access = parent::getConnection();

  }

  public function addClientes($data = []){
    try{
      $query = $this->access->prepare("CALL spu_add_clientes(?,?,?,?)");
      $query->execute(
        array(
          $data['apellidos'],
          $data['nombres'],
          $data['dni'],
          $data['claveacceso'],
        )
      );

    }catch(Exception $e){
      die($e->getMessage());
  
    }
  
  }

  public function addMascotas($data = []){
    try{
      $query = $this->access->prepare("CALL spu_add_mascotas(?,?,?,?,?,?)");
      $query->execute(
        array(
          $data['idcliente'],
          $data['idraza'],
          $data['nombre'],
          $data['fotografia'],
          $data['color'],
          $data['genero']
        )
      );
  
    }catch(Exception $e){
      die($e->getMessage());
  
    }
  
  }


  public function buscarMascota($idcliente = 0){
    try{
      $query = $this->access->prepare("CALL spu_buscar_mascota(?)");
      $query->execute(array($idcliente));
      return $query->fetch(PDO::FETCH_ASSOC);
      
    }catch(Exception $e){
      die($e->getMessage());
    }

  }
}





?>
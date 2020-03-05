package Modelo;

public class tipoVehiculo {
  //Atributos - propiedades
  private int idtv;
  private String nomtv;
  
  //constructor
  public tipoVehiculo() {
    this.idtv = 0;
    this.nomtv = "";
  }
  
  //Constructor con parámetros
  public tipoVehiculo(int idtv, String nomtv) {
    this.idtv = idtv;
    this.nomtv = nomtv;
  }

  public int getIdtv() {
    return idtv;
  }

  public void setIdtv(int idtv) {
    this.idtv = idtv;
  }

  public String getNomtv() {
    return nomtv;
  }

  public void setNomtv(String nomtv) {
    this.nomtv = nomtv;
  }
  
  
}

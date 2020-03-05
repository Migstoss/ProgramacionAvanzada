package dao;

import Modelo.tipoVehiculo;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class tipoVehiculoDAO {
  
  //Método insert
  public static boolean inserterTv(tipoVehiculo tv){
    try {
      Connection conn = conexionLib.conectarnosDB();
      String SQL = "INSERT INTO tipovehiculo (id, tipoVehiculo) VALUES (?, ?)";
      
      PreparedStatement ps = conn.prepareStatement(SQL);
      ps.setInt(1, tv.getIdtv());
      ps.setString(2, tv.getNomtv());
      
      return ps.executeUpdate() > 0;
      
    } catch (Exception ex) {
      return false;
    }
  }
}

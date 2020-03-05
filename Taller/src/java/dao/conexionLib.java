package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionLib {
  public static Connection conectarnosDB(){
    try {
      //Datos conexión
      String dbDriver = "com.mysql.jdbc.Driver"; 
      String dbURL = "jdbc:mysql://localhost:3306/";
      
      //Datos de la DB
      String dbNombre = "dbtaller_cesde";
      String dbUsuario = "root";
      String dbPassword = "";
      
      Class.forName(dbDriver);
      Connection conn = DriverManager.getConnection(dbURL + dbNombre, dbUsuario, dbPassword);
      
      return conn;
      
    } catch (ClassNotFoundException | SQLException ex) {
      return null;
    }
  }
}
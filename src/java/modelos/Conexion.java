package modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Conexion {

    private static Connection conn = null;
    private static String login = "BLACKBOARD1";
    private static String clave = "12345";
    private static String url = "jdbc:oracle:thin:@localhost:1521:xe";

    public Conexion() {
    }

    public Connection conectar() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, login, clave);
            conn.setAutoCommit(false);
            System.out.println("conexion exitosa!!!");

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("conexion fallida");
        }
        return conn;
    }

    public void desconectar() {
        try {
            conn.commit();
            conn.close();
        } catch (SQLException e) {
            System.out.println("fallida desconexion");
        }

    }

}

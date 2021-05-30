package controlador;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.Conexion;
import modelos.Usuario;

/**
 * @author Dennis_Andino
 */
public class UsuarioController {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public Usuario validar(Usuario us) {
        String sql = "select * from tbl_usuario WHERE UsuLogin=? AND UsuPassword=?";
        int resultado = 0;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getUsuLogin());
            ps.setString(2, us.getUsuPassword());
            rs = ps.executeQuery();

            while (rs.next()) {
                resultado++;
                us.setUsucodigo(rs.getInt(1));
                us.setUsuNombre(rs.getString(2));
                us.setUsuLogin(rs.getString(3));
                us.setUsuPassword(rs.getString(4));
                us.setUsurol(rs.getInt(5));
                us.setUsuFechaIngreso(rs.getString(6));
                us.setUsuTelefono(rs.getString(7));
                us.setUsuCarrera(rs.getString(8));
                us.setUsuIdentidad(rs.getString(9));

            }
            rs.close();
            ps.close();
            cn.desconectar();
            if (resultado >= 1) {
                System.out.println("resultado :" + resultado);
                return us;
            } else {
                System.out.println("resultado :" + resultado);
                return null;
            }

        } catch (SQLException e) {
            System.out.println("se disparo el catch: \n" + e.getMessage());
            return null;
        }

    }

    /*
    public List ObtenerUsuarios(int rol) {
        String sql = "select id,nombre,direccion,correo,mesa,voto from usuarios where rol=" + rol;
        List<Usuario> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_us(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setDireccion(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setMesa(rs.getInt(5));
                usuario.setVoto(rs.getInt(6));
                tabla.add(usuario);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
     */

 /*
    public List ObtenerUsuariosPorMesa(int mesa) {
        String sql = "select id,nombre,voto from vista_login where mesa=" + mesa;
        List<Usuario> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_us(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setVoto(rs.getInt(3));
                tabla.add(usuario);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
     */
    public boolean guardar(Usuario usuario) {
        String sql = "INSERT INTO tbl_usuario(UsuCodigo,UsuNombre,UsuLogin,UsuPassword,UsuRol,UsuFechaIngreso,UsuTelefono,UsuCarrera,UsuIdentidad) VALUES(?,?,?,?,?,?,?,?,?)";
        int contador;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, usuario.getUsucodigo());
            ps.setString(2, usuario.getUsuNombre());
            ps.setString(3, usuario.getUsuLogin());
            ps.setString(4, usuario.getUsuPassword());
            ps.setInt(5, usuario.getUsurol());
            ps.setString(6, usuario.getUsuFechaIngreso());
            ps.setString(7, usuario.getUsuTelefono());
            ps.setString(8, usuario.getUsuCarrera());
            ps.setString(9, usuario.getUsuIdentidad());

            contador = ps.executeUpdate();
            cn.desconectar();
            if (contador == 1) {
                System.out.println("Se guardo Correctamente");
                return true;
            }
            cn.desconectar();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return false;
    }

    /*
    public boolean cambiarEstadoVoto(int estado, String id_user) throws SQLException {
        int contador = 0;
        Boolean respuesta = false;
        String sql = "UPDATE usuarios SET voto=? WHERE id=?";
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.setInt(1, estado);
            ps.setString(2, id_user);
            contador = ps.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getCause());
        }
        ps.close();
        cn.desconectar();
        if (contador >= 1) {
            respuesta = true;
        }
        return respuesta;

    }
      
    public String GenerarClave() {
        int n = 99999;
        String clave;
        int numero = (int) (Math.random() * n) + 1;
        clave = "CEU" + numero;
        System.out.println("Clave generada" + clave);
        return clave;
    }
     */
}

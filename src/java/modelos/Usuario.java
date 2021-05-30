package modelos;

public class Usuario {

    /* 1-registro, 2->maestro , 3->alumno*/
    private int Usurol, Usucodigo;
    private String UsuNombre, UsuLogin, UsuPassword, UsuFechaIngreso, UsuTelefono, UsuCarrera, UsuIdentidad;

    public Usuario() {
    }

    public Usuario(int Usurol, int Usucodigi, String UsuNombre, String UsuLogin, String corUsuPasswordreo, String UsuFechaIngreso, String UsuTelefono, String UsuCarrera, String UsuIdentidad) {
        this.Usurol = Usurol;
        this.Usucodigo = Usucodigo;
        this.UsuNombre = UsuNombre;
        this.UsuLogin = UsuLogin;
        this.UsuPassword = UsuPassword;
        this.UsuFechaIngreso = UsuFechaIngreso;
        this.UsuTelefono = UsuTelefono;
        this.UsuCarrera = UsuCarrera;
        this.UsuIdentidad = UsuIdentidad;
    }

    public int getUsurol() {
        return Usurol;
    }

    public void setUsurol(int Usurol) {
        this.Usurol = Usurol;
    }

    public int getUsucodigo() {
        return Usucodigo;
    }

    public void setUsucodigo(int Usucodigi) {
        this.Usucodigo = Usucodigi;
    }

    public String getUsuNombre() {
        return UsuNombre;
    }

    public void setUsuNombre(String UsuNombre) {
        this.UsuNombre = UsuNombre;
    }

    public String getUsuLogin() {
        return UsuLogin;
    }

    public void setUsuLogin(String UsuLogin) {
        this.UsuLogin = UsuLogin;
    }

    public String getUsuPassword() {
        return UsuPassword;
    }

    public void setUsuPassword(String corUsuPasswordreo) {
        this.UsuPassword = corUsuPasswordreo;
    }

    public String getUsuFechaIngreso() {
        return UsuFechaIngreso;
    }

    public void setUsuFechaIngreso(String UsuFechaIngreso) {
        this.UsuFechaIngreso = UsuFechaIngreso;
    }

    public String getUsuTelefono() {
        return UsuTelefono;
    }

    public void setUsuTelefono(String UsuTelefono) {
        this.UsuTelefono = UsuTelefono;
    }

    public String getUsuCarrera() {
        return UsuCarrera;
    }

    public void setUsuCarrera(String UsuCarrera) {
        this.UsuCarrera = UsuCarrera;
    }

    public String getUsuIdentidad() {
        return UsuIdentidad;
    }

    public void setUsuIdentidad(String UsuIdentidad) {
        this.UsuIdentidad = UsuIdentidad;
    }

}

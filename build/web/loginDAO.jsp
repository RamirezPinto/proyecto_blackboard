
<%@page import="controlador.UsuarioController"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%--@page import="encriptacion.EncriptadorAES"--%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%
    String accion = request.getParameter("accion");
    UsuarioController userDAO = new UsuarioController();

    switch (accion) {
        case "Ingresar":
            Usuario user = new Usuario();
            //EncriptadorAES encriptador_ = new EncriptadorAES();
            //final String claveEncriptacion_ = "ceutecProject";
            String claveoriginal_ = request.getParameter("pass").trim();
            //String claveEncriptada_ = encriptador_.encriptar(claveoriginal_, claveEncriptacion_);
            user.setUsuLogin(request.getParameter("username").trim());
            //user.setClave(claveEncriptada_);
            user.setUsuPassword(claveoriginal_);
            user = userDAO.validar(user);
            if (user != null) {
 
               // request.getSession().setAttribute("id", user.getUsucodigo());
                request.getSession().setAttribute("nombre", user.getUsuNombre());
                request.getSession().setAttribute("login", user.getUsuLogin());
                request.getSession().setAttribute("password", user.getUsuPassword());
                request.getSession().setAttribute("rol", user.getUsurol());
                request.getSession().setAttribute("fechaIngreso", user.getUsuFechaIngreso());
                request.getSession().setAttribute("telefono", user.getUsuTelefono());
                request.getSession().setAttribute("carrera", user.getUsuCarrera());
                request.getSession().setAttribute("identidad", user.getUsuIdentidad());
              
                int rol = user.getUsurol();
                switch (rol) {                   

                    case 1: //usuario registro
                        out.print("<script>alert(\"Bienvenido " + request.getSession().getAttribute("nombre") + " \");window.location.href='home_registro.jsp?panel=panel_nuevo_usuario';</script>");
                        break;

                    case 2: //usuario maestro
                        out.print("<script>alert(\"Bienvenido " + request.getSession().getAttribute("nombre") + " \");window.location.href='home_maestro.jsp?panel=panel_nuevo_usuario';</script>");
                        break;

                    case 3: //usuario alumno
                        out.print("<script>alert(\"Bienvenido " + request.getSession().getAttribute("nombre") + " \");window.location.href='home_alumno.jsp?panel=panel_nuevo_usuario';</script>");
                        break;

                    default://usuario sin rol
                        out.print("<script>alert(\"El usuario" + request.getSession().getAttribute("nombre") + " No tiene un rol definido " + " \");window.location.href='index.jsp';</script>");
                        break;
                }

            } else {
                out.print("<script>alert(\" Upps ! no se encontro usuario , verifique sus datos en intentelo nuevamente. \");window.location.href='index.jsp';</script>");
            }
            break;
        /* case "btnRegistro":
            Usuario Nuevouser = new Usuario();
           // EncriptadorAES encriptador = new EncriptadorAES();
            final String claveEncriptacion = "ceutecProject";
            String claveoriginal = request.getParameter("txtclave");
           // String claveEncriptada = encriptador.encriptar(claveoriginal, claveEncriptacion);
            int rol;
            int tipoMembre = Integer.parseInt(request.getParameter("cblicencia"));
            rol = (tipoMembre == 2) ? 3 : 2;
           // Nuevouser.setClave(claveEncriptada);
            Nuevouser.setNombre(request.getParameter("txtnombre"));
            Nuevouser.setCorreo(request.getParameter("txtmail"));
            Nuevouser.setTelefono(request.getParameter("txtelefono"));
            Nuevouser.setFecha_nac(request.getParameter("fechanac"));
            Nuevouser.setRol(rol);
            try {
                if (userDAO.guardar(Nuevouser, tipoMembre)) {
               //     CeuMail correo = new CeuMail(request.getParameter("txtmail").trim());
                 //   correo.enviarMensaje("registro ceucar.com", "Bienvenido a la gran familia de CEUCAR, comienza a disfrutar los mejores  de millones de opciones. \n Atte. Equipo de ceucar.com");
                    out.print("<script>alert(\" Registrado Satisfactoriamente ! Bienvenido \");window.location.href='index.jsp';</script>");
                } else {
                    out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='index.jsp';</script>");

                }
            } catch (Exception e) {
                out.print("" + e);
                out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo guardar :C contactanos a ceucarsupport@ceucar.com ! \");window.location.href='index.jsp';</script>");

            }
            break;*/
        default:
            System.out.println("no se encontro la opcion (switch) linea 68 [loginDao]");
            break;
    }


%>
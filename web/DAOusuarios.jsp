<%@page import="modelos.Usuario"%>
<%@page import="controlador.UsuarioController"%>

<%
    String accion = request.getParameter("accion");
    Usuario usuario = new Usuario();
    UsuarioController control = new UsuarioController();

    switch (accion) {
        case "agregar":
            //usuario.setUsucodigo(Integer.parseInt(request.getParameter("id")));
            usuario.setUsuNombre(request.getParameter("nombre"));
            usuario.setUsuLogin(request.getParameter("login"));
            usuario.setUsuPassword(request.getParameter("password"));
            usuario.setUsurol(Integer.parseInt(request.getParameter("rol")));
            usuario.setUsuFechaIngreso(request.getParameter("fechaIngreso"));
            usuario.setUsuTelefono(request.getParameter("telefono"));
            usuario.setUsuCarrera(request.getParameter("carrera"));
            usuario.setUsuIdentidad(request.getParameter("identidad"));
            if (control.guardar(usuario)) {
                out.print("<script>alert(\"Usuario agregado Satisfactoriamente ! \");window.location.href='home_admin.jsp?panel=panel_usuarios&rol=" + usuario.getUsurol() + "';</script>");
            } else {
                out.print("<script>alert(\"No se pudo agregar el usuario :C ! \");window.location.href='home_admin.jsp?panel=panel_usuarios&rol=" + usuario.getUsurol() + "';</script>");
            }
            break;

        case "eliminar":
            /*
            String idpartido = request.getParameter("idpartido");
            String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaCandidato(idcandidato)) {
                out.print("<script>alert(\"El usuario se elimino satisfactoriamente ! \");window.location.href='home_admin.jsp?panel=descripcion_papeleta&partidoid=" + papeleta.getIdpartido() + "';</script>");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar el usuario, verifica la informacion proporcionada. ! \");window.location.href='home_admin.jsp?panel=descripcion_papeleta&partidoid=" + papeleta.getIdpartido() + "';</script>");
            }*/
            break;
        /*
        case "estado":
         int estado = Integer.parseInt(request.getParameter("estado")) ;
         String id_user = request.getParameter("id_user") ;
             if (control.cambiarEstadoVoto(estado, id_user)) {
                out.print("<script>alert(\"El usuario ha sido habilitado para votar ! \");window.location.href='home_miembro.jsp?panel=panel_electorsXmesa';</script>");
            } else {
                out.print("<script>alert(\"No se pudo habilitar el usuario seleccionado :C ! \");window.location.href='home_miembro.jsp?panel=panel_electorsXmesa';</script>");
            }
            break;
         */
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='home_miembro.jsp?panel=panel_electorsXmesa';</script>");
            break;
    }
%>
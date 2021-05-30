<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/login.css">
        <link rel="stylesheet" type="text/css" href="assets/css/alertify.min.css">
        <script src="assets/js/noback.js"></script>
        <script src="assets/js/jquery-3.5.1.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/alertify.js"></script>
        <title>LOGIN</title>
    </head>
    <body onload="noback();">
        <div class="alineacion">
            <div class="login">
                <h2 class="login-header">PLATAFORMA DUNITEC</h2>
                <div class="login-container">
                    <form action="loginDAO.jsp" method="POST">

                        <div class="" role="alert">
                        </div>

                        <div class="form-group">
                            <p><input type="text" class="form-control" id="username" name="username" placeholder="ID" required></p>
                        </div>
                        <div class="form-group">
                            <p><input type="password" class="form-control" id="pass" name="pass" placeholder="Clave de acceso" required></p>
                        </div>
                        <input type="submit" name="accion" value="Ingresar">
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>

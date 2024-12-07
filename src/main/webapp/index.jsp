<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ERP</title>
    <link rel="stylesheet" type="text/css" href="resources/css/index.css" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form method="post" action="checklogin" class="sign-in-form">
                	<div class="form-message">
                        <% 
                        String message = request.getParameter("message"); 
                        if ("sessionExpired".equals(message)) {
                        %>
                        <h3 style="color: red;">Your session has expired. Please log in again.</h3>
                        <% 
                        } 
                        %>
                    </div>
                	<div class="form-message">
                        <h2 style="color: red;">
                            ${message != null ? message : ""}
                        </h2>
                    </div>
                    <h2 class="title">Login</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="auname" id="auname" placeholder="Email" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="apwd" id="apwd" placeholder="Password" />
                    </div>
                    <input type="submit" value="Login" class="btn solid" />
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>Enterprise Resource Planning</h3><br/>
                </div>
                <img src="resources/img/log.svg" class="image" alt="">
            </div>
        </div>
    </div>
    <script src="./app.js"></script>
</body>
</html>

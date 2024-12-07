<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SignIn&SignUp</title>
    <link rel="stylesheet" type="text/css" href="resources/css/index.css" />
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <div class="forms-container">
            <div class="signin-signup">
                <form method="post" action="checkfacultylogin" class="sign-in-form">
                    <h2 class="title">Faculty Login</h2>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <input type="text" name="email" id="email" placeholder="Username" />
                    </div>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <input type="password" name="pwd" id="pwd" placeholder="Password" />
                    </div>
                    <input type="submit" value="Login" class="btn solid" />
                </form>
            </div>
        </div>
        <div class="panels-container">
            <div class="panel left-panel">
                <div class="content">
                    <h3>Enterprise Resource Planning</h3><br/>
                    <a href="facultylogin" 
                       style="display: inline-block; padding: 10px 20px; background-color: #3c92ef; color: white; text-align: center; text-decoration: none; border-radius: 5px; margin: 5px 0; font-size: 16px;">
                        Admin
                    </a>
                    <a href="administratorlogin" 
                       style="display: inline-block; padding: 10px 20px; background-color: #3c92ef; color: white; text-align: center; text-decoration: none; border-radius: 5px; margin: 5px 0; font-size: 16px;">
                        Administrator
                    </a>
                    <a href="facultyhome.jsp" onclick="redirectWithLoading('.jsp'); return false;"></a>
                    
                    <a href="/" 
                       style="display: inline-block; padding: 10px 20px; background-color: #3c92ef; color: white; text-align: center; text-decoration: none; border-radius: 5px; margin: 5px 0; font-size: 16px;">
                        Student
                    </a>
                </div>
                <img src="resources/img/log.svg" class="image" alt="">
                <!-- Loading GIF (Initially hidden) -->
<div id="loading" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;">
    <img src="129.gif" alt="Loading..." />
    <script>
function redirectWithLoading(url) {
    // Show the loading GIF
    document.getElementById('loading').style.display = 'block';
    
    // Redirect after a short delay (to allow the loading GIF to show)
    setTimeout(() => {
        window.location.href = url;
    }, 500); // You can adjust the delay if needed
}
</script>
    
</div>
            </div>
        </div>
    </div>
    <script src="./app.js"></script>
</body>
</html>

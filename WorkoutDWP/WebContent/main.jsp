<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkoutTracker</title>
</head>
<body>
<form method="GET" action="GetUser.do">
    <input type="text" name="id" placeholder="User ID"/>
    <input type="submit" name="Get Customer"/>    
</form>
<form method="POST" action="GetLogin.do">
    <input type="text" name="username" placeholder="username"/>
    <input type="text" name="password" placeholder="password"/>
    <input type="submit" name="Login"/>
</form>
<h2>Get Started</h2>
<form method="POST" action="GetStarted.do">
    <input type="text" name="username" placeholder="username"/>
    <input type="text" name="password" placeholder="password"/>
    <input type="submit" name="Login"/>
</form>
<form method="GET" action="CreateNewUser.do">
    <h2>User Info:</h2>
    <input type="text" name="firstName" placeholder="First"/>
    <input type="text" name="lastName" placeholder="Last"/>
    <input type="text" name="age" placeholder="age (years)"/>
    <input type="text" name="gender" placeholder="M/F"/>
    <input type="text" name="height" placeholder="height (inches)"/>
    <input type="text" name="weight" placeholder="weight (lbs)"/>
    <input type="text" name="email" placeholder="your@email.address"/>
    <br>
    <h2>Address Info</h2>
    <input type="text" name="address" placeholder="address & street"/>
    <input type="text" name="address2" placeholder="address cont."/>
    <input type="text" name="city" placeholder="city"/>
    <input type="text" name="state" placeholder="state"/>
    <input type="text" name="zip" placeholder="zip"/>
    <input type="text" name="phone" placeholder="phone"/>
    <br>
    <h2>Login Account Settings</h2>
    <input type="text" name="username" placeholder="username"/>
    <input type="text" name="password" placeholder="password"/>
    <br>
    <input type="submit" name="Create New User"/>
</form>

</body>
</html>
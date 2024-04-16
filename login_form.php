<?php

@include 'config.php';

session_start();

if(isset($_POST['submit'])){

   $Username = mysqli_real_escape_string($conn, $_POST['Username']);
   $Password = mysqli_real_escape_string($conn, $_POST['Password']);
   $confirmPassword = mysqli_real_escape_string($conn, $_POST['ConfirmPassword']);
   $user_type = $_POST['user_type'];

   $select = " SELECT * FROM registration WHERE Username = '$Username' && Password = '$Password' ";

   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){

      $row = mysqli_fetch_array($result);

      if($row['user_type'] == 'department'){

         $_SESSION['department_Username'] = $row['Username'];
         header('location:department_page.php');

      }elseif($row['user_type'] == 'dean'){

         $_SESSION['dean_Username'] = $row['Username'];
         header('location:dean_page.php');

      }elseif($row['user_type'] == 'tournamentmanager'){

         $_SESSION['tournamentmanager_Username'] = $row['Username'];
         header('location:tournamentmanager_page.php');

      }elseif($row['user_type'] == 'coach'){

         $_SESSION['coach_Username'] = $row['Username'];
         header('location:coach_page.php');

      }elseif($row['user_type'] == 'athlete'){

         $_SESSION['athlete_Username'] = $row['Username'];
         header('location:athlete_page.php');

      }
     
   }else{
      $error[] = 'incorrect Username or Password!';
   }

};
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login form</title>

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<div class="form-container">

   <form action="" method="post">
      <h3>login now</h3>
      <?php
      if(isset($error)){
         foreach($error as $error){
            echo '<span class="error-msg">'.$error.'</span>';
         };
      };
      ?>
      <input type="text" name="Username" required placeholder="Username">
      <input type="password" name="Password" required placeholder="Password">
      <input type="submit" name="submit" value="login now" class="form-btn">
      <p>don't have an account? <a href="register_form.php">register now</a></p>
   </form>

</div>

</body>
</html>
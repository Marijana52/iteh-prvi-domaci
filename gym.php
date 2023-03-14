<?php

include('config/db_connect.php');

if (isset($_GET['id'])) {
    $id = mysqli_real_escape_string($conn, $_GET['id']);

    // uzimamo teretanu iz baze
    $query = "SELECT * FROM gym WHERE id = $id";
    $result = mysqli_query($conn, $query);
    $gym = mysqli_fetch_assoc($result);
    mysqli_free_result($result);
    $userid = $gym['userid'];

    // uzimamo korisnika koji je postavio teretanu
    $query = "SELECT * FROM user WHERE id = $userid";
    $result = mysqli_query($conn, $query);
    $creator = mysqli_fetch_assoc($result);
    mysqli_free_result($result);
}

if (isset($_POST['delete'])) {
    $id = mysqli_real_escape_string($conn, $_POST['id']);
    $userid = mysqli_real_escape_string($conn, $_POST['userid']);

    $query = "DELETE FROM gym WHERE id = $id AND userid = $userid";
    if (mysqli_query($conn, $query)) {
        header('Location: index.php');
    } else {
        echo 'Error: ' . mysqli_error($conn);
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<?php include('templates/header.php'); ?>

<?php if ($gym == null) : ?>
    <h1 class="center">There is no such gym!</h1>
    <div class="center">
        <a href="index.php" class="btn center grey darken-2">Return</a>
    </div>

<?php else : ?>
    <div class="container center">
        <div class="card z-depth-0 radius-card" style="padding-bottom: 30px;">
            <img src="img/icon.png" alt="icon" class="icon-card">
            <h3><?php echo htmlspecialchars($gym['name']); ?></h3>
            <h5><?php echo htmlspecialchars($gym['type']); ?></h5>
            <h5><?php echo htmlspecialchars($gym['address']) .
                    ', ' . htmlspecialchars($gym['city']); ?></h5>

            <?php if ($userid == $loggedId) { ?>

                <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST" style="padding-top:20px">
                    <input type="hidden" name="id" value="<?php echo $id; ?>">
                    <input type="hidden" name="userid" value="<?php echo $userid; ?>">
                    <input type="submit" name="delete" value="delete" class="btn center grey darken-2">
                </form>

            <?php } else { ?>

                <h6>Posted by: <?php echo $creator['username']; ?></h6>

            <?php }; ?>


        </div>
    </div>

<?php endif; ?>

<?php include('templates/footer.php'); ?>

</html>
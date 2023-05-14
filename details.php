<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>

<body>
    <?php include("includes/header.php"); ?>
    <?php include("includes/connect.php"); ?>
    <?php
    $idnum = (int)$_GET['id'];
    $stmt = $con->prepare("SELECT l_titel, l_detailbeschreibung, l_bild FROM tbl_leistung WHERE l_lid_al=?");
    $stmt->bind_param("s", $_GET['id']);
    $stmt->execute();
    $res = $stmt->get_result();
    $firstrow = $res->fetch_assoc();
    ?>
    <div class="container-fluid d-flex flex-column align-items-center mt-5 gap-4">
        <?php echo "<h1>" . $firstrow['l_titel'] . "</h1>"; ?>
        <div class="container-fluid d-flex flex-row align-items-center justify-content-center" style="gap: 10rem;">
        <?php    
        echo "<img src='{$firstrow['l_bild']}'>";
        echo "<div style='text-align:justify;width:30rem;'>
        {$firstrow['l_detailbeschreibung']}
        </div>"
        ?>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>

</html>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Perfect Pic</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="css/header.css">
</head>

<body>
  <?php include("includes/header.php"); ?>
  <div class="container-fluid d-flex flex-row justify-content-center gap-5 mt-5">
    <?php include("includes/connect.php");
    $res = $con->query("SELECT l_lid_al, l_titel, l_kurzbeschreibung, l_bild FROM tbl_leistung ORDER BY l_titel ASC");
    while ($row = $res->fetch_assoc()) {
      $link = 'details.php?id=' . (int)$row['l_lid_al'];
      echo "<div class='card' style='width: 18rem;'>
      <img src='{$row['l_bild']}' class='card-img-top' alt='...'>
      <div class='card-body'>
      <h5 class='card-title'>{$row['l_titel']}</h5>
       <p class='card-text'>{$row['l_kurzbeschreibung']}</p>
       <a href='$link' class='btn btn-primary'>Details</a>
      </div>
    </div>";
    }
    ?>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>

</body>

</html>
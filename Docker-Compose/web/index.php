<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asgard</title>
</head>
<body>
    <center>
    <h2>Welcome to Asgard</h2>
    <?php 
    $content = file_get_contents('http://application/people');
    $json = json_decode($content);

    $peoples = $json->people;

    foreach ($peoples as $people) {
        echo "<li>$people</li>";
    }
    ?>
    </center>
</body>
</html>
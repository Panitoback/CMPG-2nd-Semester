<?php
    $mixedNumbers = [2,5,7,7,82,1,12,14,13,18,21,24,26, 75];

    $evenNumbers = [];

    $oddNumbers = [];


    //for ($i = 0; $i < sizeof($mixedNumbers); $i++){}

    foreach($mixedNumbers as $number){
        if($number % 2 == 0){
            array_push($evenNumbers, $number);
        }else{
            array_push($oddNumbers, $number);
        }
    };

    //We have you use print_r instead of echo because it is an array
    //Pre tag - preformated text, it is useful for browsers
    
    echo "<pre>";
    print_r($mixedNumbers);
    echo "\n";
    print_r($evenNumbers);
    echo "\n";
    print_r($oddNumbers);
    echo "</pre>";

    $cryptocurrenciesArray = [
        "Bitcoin"  => 70000,
        "Ethereum" => 3700,
        "BNB"      => 700,
        "XRP"      => 0.65,
        "Matic"    => 1
    ];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!-- Using both methods to insert php into html. {} and endforeach -->
    <h1>Even Numbers</h1>
        <ul>
            <?php foreach($evenNumbers as $number) {?>
                <li><?php echo $number; ?></li>
            <?php }?>
        </ul>

    <h1>Odd Numbers</h1>
        <ul>
            <?php foreach($oddNumbers as $number): ?>
                <li><?php echo $number; ?></li>
            <?php endforeach; ?>
        </ul>

    <!--  (<dl>, <dt>, <dd>) -->
    <h1>Cryptocurrencies</h1>
        <dl>
            <?php foreach($cryptocurrenciesArray as $name => $price): ?>
                <dt><?php echo ($name); ?></dt>
                <dd><?php echo ($price); ?></dd>
            <?php endforeach; ?>
        </dl>
</body>
</html>
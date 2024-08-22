<?php
    $primeArray = [2,3,5,7,11,13,17,19,23];

    $exampleArray = [34,22,5,150,20];

    function multiplicationArray ($array){
        $total = 1;
        foreach($array as $number){
            if(is_int($number)){
                $total = $total * $number;  
            }
            else{
                return $total = 0;
            }
        }
        return $total;
    };

    echo(multiplicationArray($exampleArray));


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" href="calculator.png">
    <title>Calculator</title>
</head>
<body>
    <main>
        <form action="" method="post">
            <fieldset>
                <legend>Excel Functions</legend>
                <label for="numbers">Enter your all numeric values with spaces: </label>
                <input id="numbers" name="numbers" type="text" placeholder="1 2 3 4 ...">
                <br>

                
                <input id="autosum" name="function" type="radio" value=1>
                <label for="autosum">Autosum</label>
                <br>
                <input id="average" name="function" type="radio" value=2>
                <label for="average">Average</label>
                <br>
                <input id="max" name="function" type="radio" value=3>
                <label for="max">Max</label>
                <br>
                <input id="min" name="function" type="radio" value=4>
                <label for="min">Min</label>
                <br>

                <input id="calculate" type="submit" value="CALCULATE">
                <br>

                <div id="result_container">
                    <label for="result">Result:</label>
                    <div id="result">
                    <?php
                        if ($_SERVER["REQUEST_METHOD"] == "POST") {
                            if (isset($_POST['numbers'])) {
                                $input_numbers = $_POST['numbers'];

                                if(empty($input_numbers)){
                                    echo "Please enter numeric values separated by spaces.";
                                }else{
                                    $numbers_array = explode(' ', $input_numbers);
                                    $numeric_values = array_map('intval', $numbers_array);

                                    if (isset($_POST['function'])) {
                                        $value = $_POST['function'];

                                        switch($value){
                                            case "1":
                                                $total = 0;
                                                for ($i=0; $i < count($numeric_values); $i++) { 
                                                    $total = $total + $numeric_values[$i];
                                                }
                                                print $total;
                                                break;

                                            case "2":
                                                $total = 0;
                                                for ($i=0; $i < count($numeric_values); $i++) { 
                                                    $total = $total + $numeric_values[$i];
                                                }
                                                print $total/count($numeric_values);
                                                break;

                                            case "3":
                                                $max = 0;
                                                for ($i=0; $i < count($numeric_values); $i++) { 
                                                    if($numeric_values[$i] > $max){
                                                        $max = $numeric_values[$i];
                                                    }
                                                }
                                                print $max;
                                                break;

                                            case "4":
                                                $min = 999999;
                                                for ($i=0; $i < count($numeric_values); $i++) { 
                                                    if($numeric_values[$i] < $min){
                                                        $min = $numeric_values[$i];
                                                    }
                                                }
                                                print $min;
                                                break;

                                            default:
                                                echo "Default";
                                                break;
                                        }
                                    } else {
                                        echo "No function selected.";
                                    }
                                }
                            }else {
                                echo "Please enter numeric values separated by spaces.";
                            }
                        }
                        ?>
                    </div>
                </div>
            </fieldset>
                
        </form>
    </main>

</body>
</html>
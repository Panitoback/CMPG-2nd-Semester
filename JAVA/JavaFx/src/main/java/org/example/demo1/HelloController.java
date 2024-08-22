package org.example.demo1;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TextField;
import javafx.fxml.Initializable;
import java.net.URL;
import java.util.ResourceBundle;

public class HelloController implements Initializable {

    @FXML
    private TextField txtOp1;

    @FXML
    private TextField txtOp2;

    @FXML
    private TextField txResult;

    @FXML
    private Button btnSum;

    @FXML
    private ChoiceBox<String> choiceOperation;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        choiceOperation.getItems().addAll("+", "-", "*", "/");
        choiceOperation.setValue("+");
    }

    @FXML
    private void calculate(ActionEvent event) {
        try {
            int op1 = Integer.parseInt(txtOp1.getText());
            int op2 = Integer.parseInt(txtOp2.getText());
            String operation = choiceOperation.getValue();
            double result = 0;

            switch (operation) {
                case "+":
                    Sum addition = new Sum(op1, op2);
                    result = addition.calculate();
                    break;
                case "-":
                    Subtraction subtraction = new Subtraction(op1, op2);
                    result = subtraction.calculate();
                    break;
                case "*":
                    Multiplication multiplication = new Multiplication(op1, op2);
                    result = multiplication.calculate();
                    break;
                case "/":
                    Division division = new Division(op1, op2);
                    result = division.calculate();
                    break;
            }

            txResult.setText(String.valueOf(result));
        } catch (NumberFormatException e) {
            txResult.setText("Invalid input");
        } catch (ArithmeticException e) {
            txResult.setText("Cannot divide by zero");
        }
    }
}

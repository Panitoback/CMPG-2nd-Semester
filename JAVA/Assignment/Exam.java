import java.util.Scanner;
import java.util.InputMismatchException;

public class Exam {
    public static void main(String[] args) {
        Exam.userInput();
    }






    public static void userInput(){
        Scanner sc = new Scanner(System.in);
        System.out.println("Please insert a value (it has to be integer)");
    
        try {
            int value = sc.nextInt();
            System.out.println("Your number is: " + value);
        } catch (InputMismatchException e) {
            System.out.println("Invalid input! Please enter an integer value.");
        }
    }

}





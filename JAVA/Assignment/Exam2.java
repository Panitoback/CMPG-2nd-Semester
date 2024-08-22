package Assignment;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Exam2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double[] scores = new double[3];
        boolean validInput;
        
        for (int i = 0; i < scores.length; i++) {
            validInput = false;
            while (!validInput) {
                System.out.printf("Enter exam %d (between 0 and 100): ", i + 1);
                try {
                    double score = sc.nextDouble();
                    if (score < 0 || score > 100) {
                        System.out.println("Error: The score must be between 0 and 100.");
                        sc.nextLine(); 
                    } else {
                        scores[i] = score;
                        validInput = true;
                    }
                } catch (InputMismatchException e) {
                    System.out.println("Error: Invalid input. Please enter a numeric value.");
                    sc.nextLine(); 
                }
            }
        }

    
        double average = (scores[0] + scores[1] + scores[2]) / 3;

        
        System.out.printf("The average score is ");
        System.out.println(average);
        
    }
}

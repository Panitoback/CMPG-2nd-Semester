package Assignment;
import java.util.Scanner;

public class ConverterMain {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter '1' for weight converting or '2' for temperature converting");
        int choice = sc.nextInt();
    
        switch (choice) {
            //Mass-Weight value block
            case 1:
                System.out.println("Enter a weight");
                double weight = sc.nextDouble();

                System.out.println("Enter '1' for converting LB to KG, or '2' for converting KG to LB");
                int weightChoice = sc.nextInt();
                double resultMass = Converter.getMass(weight, weightChoice);

                if(weightChoice == 1){
                    System.out.printf("%.2f LB is %.2f KG%n",weight, resultMass);
                }else if(weightChoice == 2){
                    System.out.printf("%.2f KG is %.2f LB%n",weight, resultMass);
                }else{
                    //This block is Redundant since getMass is already validating but anyways we will leave it here.
                    System.out.println("Invalid Choice!");
                }
                break;

            //Temperature value block
            case 2:
                System.out.println("Enter a temperature");
                double t = sc.nextDouble();

                System.out.println("Enter '1' for converting C to F, or '2' for converting F to C");
                int tChoice = sc.nextInt();
                double resultTemp = Converter.getTemperature(t, tChoice);

                if(tChoice == 1){
                    System.out.printf("%.2f C is %.2f F%n",t, resultTemp);
                }else if(tChoice == 2){
                    System.out.printf("%.2f F is %.2f C%n",t, resultTemp);
                }else{
                    //This block is Redundant since getTemperatureis already validating but anyways we will leave it here.
                    System.out.println("Invalid Choice!");
                }
                break;

            default:
                System.out.println("Invalid number");
                break;

        }
    }
}

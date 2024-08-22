package Assignment;

public class Converter {
    public static double massResult;
    public static double tempResult;

    private static double getKilogramValue(double weight){
        return weight/2.2;
    }

    private static double getPoundValue(double weight){
        return weight*2.2;
    }

    private static double getFahrenheitValue(double t){
        return (t*9/5)+32;
    }

    private static double getCelsiusValue(double t){
        return (t-32)*5/9;
    }


    public static double getTemperature(double t, int choice){
        if(choice == 1){
            tempResult = getFahrenheitValue(t);
        }else if(choice == 2){
            tempResult = getCelsiusValue(t);
        }else{
            System.err.println("Invalid Choice!Only 1 or 2 is allowed");
            tempResult = 0;
        }
        return tempResult;
    }

    public static double getMass(double weight, int choice){
        if(choice ==1){
            massResult = getKilogramValue(weight);
        }else if(choice == 2){
            massResult = getPoundValue(weight);
        }else{
            System.err.println("“Invalid Choice! Only 1 or 2 is allowed”");
            massResult = 0;
        }
        return massResult;
    }
}

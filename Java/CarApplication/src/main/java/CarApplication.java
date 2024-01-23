import java.util.Scanner;


public class CarApplication {
    static Scanner myScanner = new Scanner(System.in);

    /**
     * The main method of the application that prints a welcome message and asks the user to select a type of car.
     * If the user enters an invalid input, it prompts the user to enter a valid input.
     */
    public static void main(String[] args) {
        System.out.println("Welcome to my Car Application");

        int carChoice = 1;
        System.out.println("-----------------------------");
        System.out.println("What type of car would you like");
        System.out.println("1. Gas Car");
        System.out.println("2. Electric Car");
        String data = myScanner.nextLine();

        boolean valid = false;
        try{
            carChoice = Integer.parseInt(data);
            valid = true;
        }catch(Exception e){
            System.out.println("Must select from the menu options.");
        }
        if(valid){
            if(carChoice == 1){
                gasCarBuilder();
            }else if(carChoice ==2){
                electricCarBuilder();
            }else{
                System.out.println("Error. Option must be 1 or 2");
            }
        }
    }

    /**
     * A private method that creates a new GasCar object and prompts the user to enter the make, model, year, color,
     * weight, fuel tank size, and fuel type of the car.
     * @return a GasCar object with the entered properties.
     */
    private static GasCar gasCarBuilder() {
        GasCar myGasCar = new GasCar();
        myGasCar.setMake(askCarString("Enter the make of car: "));
        myGasCar.setModel(askCarString("Enter the Model of car: "));
        myGasCar.setYear(askCarInt("Enter the year of car: "));
        myGasCar.setColor(askCarString("Enter the color of car: "));
        myGasCar.setWeight(askCarInt("Enter the weight of car: "));
        myGasCar.setTankSize(askCarDouble("Enter the fuel tank size of car: "));
        myGasCar.setFuelType(askCarString("Enter the fuel type: "));
        System.out.println(myGasCar.toString());
        return myGasCar;
    }

    /**
     * A private method that creates a new ElectricCar object and prompts the user to enter the make, model, year, color,
     * weight, battery capacity, and efficiency of the car.
     * @return an ElectricCar object with the entered properties.
     */
    private static ElectricCar electricCarBuilder() {
        ElectricCar myElectricCar = new ElectricCar();
        myElectricCar.setMake(askCarString("Enter the make of car: "));
        myElectricCar.setModel(askCarString("Enter the Model of car: "));
        myElectricCar.setYear(askCarInt("Enter the year of car: "));
        myElectricCar.setColor(askCarString("Enter the color of car: "));
        myElectricCar.setWeight(askCarInt("Enter the weight of car: "));
        myElectricCar.setKilowatts(askCarDouble("Enter the capacity of the battery: "));
        myElectricCar.setEfficiency(askCarDouble("Enter the efficiency of the car: "));
        System.out.println(myElectricCar.toString());
        return myElectricCar;
    }

    /**
     Asks the user to enter a string for the car attribute.
     @param text the message to display to prompt the user
     @return the string entered by the user
     */
    private static String askCarString(String text) {
        String userString = "Generic";
        boolean valid = false;
        while(!valid){
            System.out.println(text);
            userString = myScanner.nextLine();
            if(userString != null && userString.length() > 3){
                valid = true;
            }
            else{
                System.out.println("Please enter a valid brand");
            }
        }
        return userString;
    }
    /**
     Asks the user to enter an integer for the car attribute.
     @param text the message to display to prompt the user
     @return the integer entered by the user
     */
    private static int askCarInt(String text) {
        int carInt = 0;
        System.out.println(text);
        String data = myScanner.nextLine();
        try{
            carInt = Integer.parseInt(data);
        }catch(Exception e){
            System.out.println("Error, setting to default");
        }
        return carInt;
    }
    /**
     Asks the user to enter a double for the car attribute.
     @param text the message to display to prompt the user
     @return the double entered by the user
     */
    private static double askCarDouble(String text) {
        double carDouble = 0;
        System.out.println(text);
        String data = myScanner.nextLine();
        try{
            carDouble = Double.parseDouble(data);
        }catch(Exception e){
            System.out.println("Error, setting to default");
        }
        return carDouble;
    }
}

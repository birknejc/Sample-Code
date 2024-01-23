/**
 GasCar is a subclass of Car that represents a car with a gas engine.
 */
public class GasCar extends Car {

    /** The size of the gas tank in gallons */
    private double tankSize;

    /** The type of fuel used by the car */
    private String fuelType;

    /**
     Constructs a new GasCar object with the specified make, model, year, color, and weight.
     @param make the make of the car
     @param model the model of the car
     @param year the year the car was manufactured
     @param color the color of the car
     @param weight the weight of the car in pounds
     */
    public GasCar(String make, String model, int year, String color, int weight ) {
        super(make, model, year, color, weight);
        setTankSize(tankSize);
        setFuelType(fuelType);
    }
    /**
     Constructs a new GasCar object with default values for tank size and fuel type.
     */
    public GasCar() {
        super();
        this.tankSize = 20.5;
        this.fuelType = "E85";
    }
    /**
     Returns the size of the gas tank in gallons.
     @return the size of the gas tank in gallons
     */
    public double getTankSize() {
        return tankSize;
    }
    /**
     Sets the size of the gas tank in gallons. If the specified tank size is less than 15.0 gallons,
     sets the tank size to 15.0 gallons.
     @param tankSize the size of the gas tank in gallons
     */
    public void setTankSize(double tankSize) {
        this.tankSize = tankSize;
        if(tankSize < 15.0){
            this.tankSize = 15.0;
        }
        else{
            this.tankSize = tankSize;
        }
    }
    /**
     Returns the type of fuel used by the car.
     @return the type of fuel used by the car
     */
    public String getFuelType() {
        return fuelType;
    }
    /**
     Sets the type of fuel used by the car. If the specified fuel type is null or blank,
     sets the fuel type to "Fuel Type not found".
     @param fuelType the type of fuel used by the car
     */
    public void setFuelType(String fuelType) {
        if(fuelType !=null && !fuelType.trim().isBlank()){
            this.fuelType = fuelType;
        }
        else{
            this.fuelType = "Fuel Type not found";
        }
    }
    /**
     Calculates the cost per fill of the gas tank based on the current pump cost.
     @param pumpCost the current cost per gallon of gas
     @return the cost per fill of the gas tank
     */
    @Override
    public double CalcCostPerFill(double pumpCost) {
        double costPerFill = tankSize * pumpCost;
        return costPerFill;
    }
    /**
     Returns a string representation of the GasCar object, including its make, model, year, color, weight,
     tank size, and fuel type.
     @return a string representation of the GasCar object
     */
    @Override
    public String toString() {
        return "Gas Car" +
                super.toString() +
                "\t\nTank Size: " + tankSize +
                "\t\nFuel Type: " + fuelType;
    }
}
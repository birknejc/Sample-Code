/**
 The ElectricCar class is a subclass of Car, which represents an electric car.
 It contains information about the car's battery capacity in kilowatts and its efficiency.
 */
public class ElectricCar extends Car{
    private double kilowatts;
    private double efficiency;

    /**
     Constructs an ElectricCar object with given make, model, year, color, and weight.
     @param make The make of the electric car.
     @param model The model of the electric car.
     @param year The year of the electric car.
     @param color The color of the electric car.
     @param weight The weight of the electric car.
     */
    public ElectricCar(String make, String model, int year, String color, int weight) {
        super(make, model, year, color, weight);
        setKilowatts(kilowatts);
        setEfficiency(efficiency);
    }
    /**
     Constructs an ElectricCar object with default values for battery capacity and efficiency.
     */
    public ElectricCar() {
        super();
        this.kilowatts = 40.5;
        this.efficiency = 2.9;
    }
    /**
     Returns the battery capacity of the electric car in kilowatts.
     @return The battery capacity of the electric car.
     */
    public double getKilowatts() {
        return kilowatts;
    }
    /**
     Sets the battery capacity of the electric car in kilowatts.
     @param kilowatts The battery capacity of the electric car.
     */
    public void setKilowatts(double kilowatts) {
        this.kilowatts = kilowatts;
    }
    /**
     Returns the efficiency of the electric car.
     @return The efficiency of the electric car.
     */
    public double getEfficiency() {
        return efficiency;
    }
    /**
     Sets the efficiency of the electric car.
     @param efficiency The efficiency of the electric car.
     */
    public void setEfficiency(double efficiency) {
        this.efficiency = efficiency;
    }
    /**
     Returns a string representation of the ElectricCar object.
     @return A string representation of the ElectricCar object.
     */
    @Override
    public String toString() {
        return "ElectricCar" +
                super.toString() +
                "\t\nBattery Capacity: " + kilowatts +
                "\t\nEfficiency: " + efficiency;
    }
    /**
     Calculates the cost per fill for the electric car.
     @param kwCost The cost per kilowatt of electricity.
     @return The cost per fill for the electric car.
     */
    @Override
    public double CalcCostPerFill(double kwCost) {
        double costPerFill = kilowatts * kwCost;
        return costPerFill;
    }
}
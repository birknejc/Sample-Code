/**
 * The Car class represents a basic car with make, model, year, color, and weight properties.
 * It includes overloaded and default constructors, getters and setters for each property,
 * a toString() method to display the car details, and an abstract method for calculating
 * the cost per fill of gas.
 */
public abstract class Car {
    private String make;
    private String model;
    private int year;
    private String color;
    private  int weight;


    //overloaded constructor
    /**
     * Constructs a car with the specified make, model, year, color, and weight.
     * @param make the make of the car
     * @param model the model of the car
     * @param year the year the car was made
     * @param color the color of the car
     * @param weight the weight of the car in pounds
     */
    public Car(String make, String model, int year, String color, int weight) {
        setMake(make);
        setModel(model);
        setYear(year);
        setColor(color);
        setWeight(weight);
    }

    //default constructor
    /**
     * Constructs a default car with a make of "Ford", model of "F150", year of 2008,
     * color of "Blue", and weight of 7200 pounds.
     */
    public Car() {
        setMake("Ford");
        setModel("F150");
        setYear(2008);
        setColor("Blue");
        setWeight(7200);
    }

    /**
     * Returns the make of the car.
     * @return the make of the car
     */
    public String getMake() {
        return make;
    }

    //getters & setters
    /**
     * Sets the make of the car.
     * @param make the make of the car
     */
    public void setMake(String make) {
        if(make !=null && !make.trim().isBlank()){
            this.make = make;
        }
        else{
            this.make = "Make not found";
        }
    }

    /**
     * Returns the model of the car.
     * @return the model of the car
     */
    public String getModel() {
        return model;
    }

    /**
     * Sets the model of the car.
     * @param model the model of the car
     */
    public void setModel(String model) {
        if(model !=null && !model.trim().isBlank()){
            this.model = model;
        }
        else{
            this.model = "Model not found";
        }
    }

    /**
     * Returns the year the car was made.
     * @return the year the car was made
     */
    public int getYear() {
        return year;
    }

    /**
     * Sets the year the car was made. If the specified year is less than 2000,
     * sets the year to 2000.
     * @param year the year the car was made
     */
    public void setYear(int year) {
        this.year = year;
        if(year < 2000){
            this.year = 2000;
        }
        else{
            this.year = year;
        }
    }

    /**
     * Returns the color of the car.
     * @return the color of the car
     */
    public String getColor() {
        return color;
    }

    /**
     * Sets the color of the car.
     * @param color the color of the car
     */
    public void setColor(String color) {
        if(color !=null && !color.trim().isBlank()){
            this.color = color;
        }
        else{
            this.color = "Color not found";
        }
    }

    /**
     Gets the weight of the car.
     @return the weight of the car
     */
    public int getWeight() {
        return weight;
    }

    /**
     Sets the weight of the car to the given value. If the weight is less than 2000, sets the weight to 2000.
     @param weight the weight of the car to set
     */
    public void setWeight(int weight) {
        this.weight = weight;
        if(weight < 2000){
            this.weight = 2000;
        }
        else{
            this.weight = weight;
        }
    }

    /**
     Returns a string representation of the car, including its make, model, year, color, and weight.
     @return a string representation of the car
     */
    @Override
    public String toString() {
        return "\t\nMake: " + make +
                "\t\nModel: " + model +
                "\t\nYear: " + year +
                "\t\nColor: " + color +
                "\t\nWeight: " + weight;
    }

    //abstract method
    /**
     Calculates the cost per fill of the car, given the cost of a gallon of fuel.
     @param pumpCost the cost of a liter of fuel
     @return the cost per fill of the car
     */
    public abstract double CalcCostPerFill(double pumpCost);
}

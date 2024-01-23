import java.io.Serializable;

public class Label implements Serializable, Comparable<Label>{
    private String productName;
    private int calories;
    private int servingPerContainer;
    private double sodium;

    public Label() {
        productName = "Cherub Cherry Tomatoes";
        calories = 50;
        servingPerContainer = 3;
        sodium = 0.03;
    }

    public Label(String productName, int calories, int servingPerContainer, double sodium) {
        setProductName(productName);
        setCalories(calories);
        setServingPerContainer(servingPerContainer);
        setSodium(sodium);
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        if (productName !=null && !productName.trim().isBlank()) {
            this.productName = productName;
        }
        else{
            this.productName = "Product not found";
        }
    }

    public int getCalories() {
        return calories;
    }

    public void setCalories(int calories) {
        this.calories = calories;
        if(calories < 0){
            this.calories = 0;
        }
        else{
            this.calories = calories;
        }
    }

    public int getServingPerContainer() {
        return servingPerContainer;
    }

    public void setServingPerContainer(int servingPerContainer) {
        this.servingPerContainer = servingPerContainer;
        if(servingPerContainer < 0){
            this.servingPerContainer = 5;
        }
        else{
            this.servingPerContainer = servingPerContainer;
        }
    }

    public double getSodium() {
        return sodium;
    }

    public void setSodium(double sodium) {
        this.sodium = sodium;
        if(sodium < 0){
            this.sodium = 30;
        }
        else{
            this.sodium = sodium;
        }
    }

    public int getTotalCalories() {
        return calories * servingPerContainer;
    }

    public double getTotalSodium() {
        return (sodium/2300) * servingPerContainer;
    }

    @Override
    public int compareTo(Label o) {
        if (this.calories < o.getCalories()) {
            return -1;
        } else if (this.calories > o.getCalories()) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public String toString() {
        String output = "Nutritional facts for one serving of " + productName + ":";
        output += "\n- Calories: " + calories;
        output += "\n- Sodium: " + (int) ((sodium/2300) * 100) + "% of daily limit";
        output += "\n\nNutritional facts for the whole container of " + productName + ":";
        output += "\n- Calories: " + getTotalCalories();
        output += "\n- Sodium: " + (int) (getTotalSodium() * 100) + "% of daily limit" + "\n";
        if (getTotalSodium() > 1) {
            output += "\nWARNING: Eating the whole container of " + productName +
                    " will exceed your daily limit of sodium!" + "\n";
        }
        return output;
    }

}

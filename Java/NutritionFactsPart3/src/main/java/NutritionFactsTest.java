public class NutritionFactsTest {
    public static void main(String[] args) {
        // Create a new label using the default constructor
        Label label1 = new Label();
        System.out.println(label1.toString());

        // Create a new label using the parameterized constructor
        Label label2 = new Label("Doritos", 140, 19, 0.07);
        System.out.println(label2.toString());

        // Use getters and setters to update the values of the first label
        label1.setProductName("Apple");
        label1.setCalories(80);
        label1.setServingPerContainer(2);
        label1.setSodium(0.01);

        // Print out the updated label
        System.out.println(label1.toString());
    }
}

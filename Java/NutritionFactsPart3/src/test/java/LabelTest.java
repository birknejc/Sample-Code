import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class LabelTest {
    @Test
    @DisplayName("Test set Product Name")
    public void testSetProductName(){
        Label label = new Label("", 150, 5 ,0.30);
        assertEquals("Product not found", label.getProductName());

        label.setProductName(null);
        assertEquals("Product not found", label.getProductName());

        label.setProductName(" ");
        assertEquals("Product not found", label.getProductName());

        label.setProductName("Product");
        assertEquals("Product", label.getProductName());

    }
    @Test
    public void testSetCalories(){
        Label label = new Label("Product", -1, 5 ,0.30);
        assertEquals(0, label.getCalories());

        label.setCalories(150);
        assertEquals(150, label.getCalories());
    }

    @Test
    public void testServingPerContainer(){
        Label label = new Label("Product", 100, -5 ,0.30);
        assertEquals(5, label.getServingPerContainer());

        label.setServingPerContainer(20);
        assertEquals(20, label.getServingPerContainer());
    }

    @Test
    public void testSodium(){
        Label label = new Label("Product", 100, 100 ,-.10);
        assertEquals(0.30, label.getSodium());

        label.setSodium(20);
        assertEquals(20, label.getSodium());
    }


    @Test
    public void testDefaultConstructor() {
        Label label = new Label();
        assertEquals("Cherub Cherry Tomatoes", label.getProductName());
        assertEquals(50, label.getCalories());
        assertEquals(3, label.getServingPerContainer());
        assertEquals(0.03, label.getSodium(), 0.001);
    }

    @Test
    public void testOverloadedConstructor() {
        Label label = new Label("Product", 100, 1, 0.1);
        assertEquals("Product", label.getProductName());
        assertEquals(100, label.getCalories());
        assertEquals(1, label.getServingPerContainer());
        assertEquals(0.1, label.getSodium(), 0.001);
    }

    @Test
    public void testToString() {
        Label label = new Label("Product", 100, 1, 0.1);
        String expected = "Nutritional facts for one serving of Product:\n- Calories: 100\n- " +
                "Sodium: 10% of daily limit\n\nNutritional facts for the whole container of Product:\n- " +
                "Calories: 100\n- Sodium: 10% of daily limit\n";
        assertEquals(expected, label.toString());
    }

    @Test
    public void testToStringWithWarning() {
        // Create a label with high sodium content
        Label label = new Label("High Sodium Product", 100, 1, 1.5);

        // Verify that the toString method includes the warning
        String expected = "Nutritional facts for one serving of High Sodium Product:\n" +
                "- Calories: 100\n" +
                "- Sodium: 150% of daily limit\n\n" +
                "Nutritional facts for the whole container of High Sodium Product:\n" +
                "- Calories: 100\n" +
                "- Sodium: 150% of daily limit\n\n" +
                "WARNING: Eating the whole container of High Sodium Product will exceed your daily limit of sodium!\n";
        assertEquals(expected, label.toString());
    }


}

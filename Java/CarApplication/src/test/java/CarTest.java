import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class CarTest {

    @Test
    public void testCalcCostPerFillWithKwCost() {
        ElectricCar electricCar = new ElectricCar();
        electricCar.setKilowatts(20);
        double kwCost = 0.15;
        double expected = 3.0; // 20 kilowatts * $0.15 per kilowatt = $3.0
        double actual = electricCar.CalcCostPerFill(kwCost);
        assertEquals(expected, actual, 0.001);
    }

    @Test
    public void testCalcCostPerFillWithPumpCost() {
        GasCar gasCar = new GasCar();
        gasCar.setTankSize(50);
        double pumpCost = 2.5;
        double expected = 125.0; // 50 gallon tank * $2.5 per gallon = $125.0
        double actual = gasCar.CalcCostPerFill(pumpCost);
        assertEquals(expected, actual, 0.001);
    }
}

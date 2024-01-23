import java.io.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class NutritionProgram {
    private static Scanner scanner = new Scanner(System.in);
    private static List<Label> labelList = new ArrayList<>();

    public static void main(String[] args) {
        // Deserialize the labelList from the file if it exists
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream("nutrition.ser"))) {
            labelList = (List<Label>) inputStream.readObject();
            System.out.println("Label list loaded from file nutrition.ser.\n");
        } catch (FileNotFoundException e) {
            System.out.println("File nutrition.ser not found. Starting with an empty label list.\n");
            labelList = new ArrayList<>();
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("Error loading label list from file: " + e);
            labelList = new ArrayList<>();
        }

        int option = 0;
        do {
            printMenu();
            option = getOption();
            executeOption(option);
        } while (option != 3);

        scanner.close();
    }

    private static void printMenu() {
        System.out.println("Please select an option:");
        System.out.println("1. Enter a new product");
        System.out.println("2. Display all products in order of total calories");
        System.out.println("3. Exit");
        System.out.print("Please enter your option: ");
    }

    private static int getOption() {
        int option = 0;
        if (scanner.hasNextInt()) {
            option = scanner.nextInt();
            scanner.nextLine();
        } else {
            System.out.println("Invalid input. Please enter a number between 1 and 3.");
            scanner.nextLine();
        }
        return option;
    }

    private static void executeOption(int option) {
        switch (option) {
            case 1:
                enterProduct();
                break;

            case 2:
                displayAllProducts();
                break;

            case 3:
                System.out.println("Saving label list to file...");
                try (ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream("nutrition.ser"))) {
                    outputStream.writeObject(labelList);
                    System.out.println("Label list saved to file nutrition.ser.\nGoodbye!");
                } catch ( FileNotFoundException e) {
                    System.out.println("Error saving label list to file: File not found.");
                } catch (IOException e) {
                    System.out.println("Error saving label list to file: " + e);
                }
                break;

            default:
                System.out.println("Invalid input. Please enter a number between 1 and 3.");
                break;
        }
    }


    private static void enterProduct() {
        String productName;
        int calories;
        int servingPerContainer;
        double sodium;

        System.out.print("Enter the product name: ");
        productName = scanner.nextLine();

        while (productName.trim().isEmpty()) {
            System.out.println("Product name cannot be empty. Enter the product name:");
            productName = scanner.nextLine();
        }

        System.out.print("Enter the calories per serving: ");
        calories = getIntInput();

        System.out.print("Enter the servings per container: ");
        servingPerContainer = getIntInput();

        System.out.print("Enter the milligrams (mg) of sodium per serving : ");
        sodium = getDoubleInput();

        Label label = new Label(productName, calories, servingPerContainer, sodium);
        labelList.add(label);

        System.out.println("New product added successfully!\n");
    }

    private static void displayAllProducts() {
        if (labelList.size() == 0) {
            System.out.println("No products to display.\n");
            return;
        }

        // Sort the labelList in descending order of total calories
        ArrayList<Label> sortedLabels = new ArrayList<>(labelList);
        Collections.sort(sortedLabels);

        // Print the sorted labels
        for (Label label : sortedLabels) {
            System.out.println(label.toString());
        }
    }

    private static int getIntInput() {
        int value = 0;
        while (true) {
            if (scanner.hasNextInt()) {
                value = scanner.nextInt();
                scanner.nextLine();
                if (value < 0) {
                    System.out.println("Invalid input. Please enter a value greater than or equal to zero.");
                    continue;
                }
                break;
            } else {
                System.out.println("Invalid input. Please enter a value greater than or equal to zero.");
                scanner.nextLine();
                continue;
            }
        }
        return value;
    }

    private static double getDoubleInput() {
        double value = 0;
        while (true) {
            if (scanner.hasNextDouble()) {
                value = scanner.nextDouble();
                scanner.nextLine();
                if (value < 0) {
                    System.out.println("Invalid input. Please enter a value greater than or equal to zero.");
                    continue;
                }
                break;
            } else {
                System.out.println("Invalid input. Please enter a value greater than or equal to zero.");
                scanner.nextLine();
                continue;
            }
        }
        return value;
    }
}


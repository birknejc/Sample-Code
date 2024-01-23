from Database_related.connection import MySQLConnection


class UserInput:
    @staticmethod
    def insert_fossil(connection):
        fossil_id = input("Enter Fossil ID: ")
        fossil_name = input("Enter Fossil Name: ")
        location = input("Enter Location: ")
        description = input("Enter Description: ")
        date = input("Enter Date (YYYY-MM-DD): ")

        query = (f"INSERT INTO Fossils (fossil_id, fossil_name, location_discovered, description, date_acquired) "
                 f"VALUES('{fossil_id}', '{fossil_name}', '{location}', '{description}', '{date}')")

        connection.cursor.execute(query)
        connection.connection.commit()

    @staticmethod
    def insert_fossil_sorting(connection):
        sorting_id = input("Enter Sorting ID:")

        # Query the Fossils table to get a list of existing fossil_id and fossil_name values
        connection.cursor.execute("SELECT fossil_id, fossil_name FROM Fossils")
        existing_fossil_data = connection.cursor.fetchall()

        print("Existing Fossil IDs:")
        for fossil_id, fossil_name in existing_fossil_data:
            print(f"Fossil ID: {fossil_id}, Fossil Name: {fossil_name}")

        # Ask the user to choose a fossil_id
        fossil_id = input("Enter Fossil ID (choose from the existing Fossil IDs):")

        try:
            fossil_id = int(fossil_id)  # Try converting the user input to an integer
        except ValueError:
            print("Invalid input for Fossil ID. Please enter a valid integer.")
            return

        # Ensure the input is a valid existing fossil_id (as an integer)
        if fossil_id not in [row[0] for row in existing_fossil_data]:
            print("Invalid Fossil ID. Please choose from the existing Fossil IDs.")
            return

        fossil_type = input("Enter Fossil Type:")

        query = (f"INSERT INTO FossilSorting (sorting_id, fossil_id, type) "
                 f"VALUES('{sorting_id}', '{fossil_id}', '{fossil_type}')")

        connection.cursor.execute(query)
        connection.connection.commit()

    @staticmethod
    def insert_fossil_transaction(connection):
        purchase_id = input("Enter Purchase ID: ")

        # Query the Fossils table to get a list of existing fossil_id and fossil_name values
        connection.cursor.execute("SELECT fossil_id, fossil_name FROM Fossils")
        existing_fossil_data = connection.cursor.fetchall()

        print("Existing Fossil IDs:")
        for fossil_id, fossil_name in existing_fossil_data:
            print(f"Fossil ID: {fossil_id}, Fossil Name: {fossil_name}")

        # Ask the user to choose a fossil_id
        fossil_id = input("Enter Fossil ID (choose from the existing Fossil IDs):")

        try:
            fossil_id = int(fossil_id)  # Try converting the user input to an integer
        except ValueError:
            print("Invalid input for Fossil ID. Please enter a valid integer.")
            return

        # Ensure the input is a valid existing fossil_id (as an integer)
        valid_fossil_ids = [row[0] for row in existing_fossil_data]
        if fossil_id not in valid_fossil_ids:
            print("Invalid Fossil ID. Please choose from the existing Fossil IDs.")
            return

        # Find the corresponding fossil name for the chosen fossil_id
        fossil_name = next(item[1] for item in existing_fossil_data if item[0] == fossil_id)

        purchase_type = input("Enter Purchase Type:")

        query = (f"INSERT INTO FossilTransactions (purchase_id, fossil_id, purchase_type) "
                 f"VALUES('{purchase_id}', '{fossil_id}', '{purchase_type}')")

        connection.cursor.execute(query)
        connection.connection.commit()


if __name__ == "__main__":
    mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')
    mysql_connection.connect()

    while True:
        print("Choose the table to insert data:")
        print("1. Fossils")
        print("2. FossilSorting")
        print("3. FossilTransactions")
        print("4. Done")

        choice = input("Enter your choice: ")

        if choice == "1":
            UserInput.insert_fossil(mysql_connection)
        elif choice == "2":
            UserInput.insert_fossil_sorting(mysql_connection)
        elif choice == "3":
            UserInput.insert_fossil_transaction(mysql_connection)
        elif choice == "4":
            break
        else:
            print("Invalid choice. Please select 1, 2, 3, or 4.")

    mysql_connection.close()

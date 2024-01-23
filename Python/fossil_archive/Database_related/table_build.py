from Database_related.connection import MySQLConnection

mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')

mysql_connection.connect()
cursor = mysql_connection.cursor

# Define the table names and their corresponding CREATE TABLE statements
tables_to_create = {
    "Fossils": (
        f"CREATE TABLE IF NOT EXISTS Fossils ("
        f"fossil_id INT PRIMARY KEY, "
        f"fossil_name VARCHAR(255), "
        f"location_discovered VARCHAR(50),"
        f"description TEXT, "
        f"date_acquired DATE "
        f")"
    ),
    "FossilSorting": (
        f"CREATE TABLE IF NOT EXISTS FossilSorting ("
        f"sorting_id INT PRIMARY KEY, "
        f"fossil_id INT, "
        f"type VARCHAR(255), "
        f"FOREIGN KEY(fossil_id) REFERENCES Fossils(fossil_id) "
        f")"
    ),
    "FossilTransactions": (
        f"CREATE TABLE IF NOT EXISTS FossilTransactions ("
        f"purchase_id INT PRIMARY KEY, "
        f"fossil_id INT, "
        f"purchase_type VARCHAR(50), "
        f"FOREIGN KEY(fossil_id) REFERENCES Fossils(fossil_id) "
        f")"
    )
}

for table_name, create_query in tables_to_create.items():
    try:
        cursor.execute(create_query)
        print(f"Table '{table_name}' created or already exists.")
    except Exception as e:
        print(f"An error occurred: {e}")

mysql_connection.connection.commit()
mysql_connection.close()

from Database_related.connection import MySQLConnection

mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')
mysql_connection.connect()
cursor = mysql_connection.cursor


class FossilQueries:
    # use this for usr_front_end.py
    def __init__(self, fossil_id=None, fossil_name=None, location=None, description=None, date=None):
        self.query = ''
        self.fossil_id = fossil_id
        self.fossil_name = fossil_name
        self.location = location
        self.description = description
        self.date = date

        self.mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')
        self.mysql_connection.connect()
        self.cursor = self.mysql_connection.cursor

    # use this for selenium_test.py
    # def __init__(self, fossil_id, fossil_name, location, description, date):
    #    self.query = ''
    #    self.fossil_id = fossil_id
    #    self.fossil_name = fossil_name
    #    self.location = location
    #    self.description = description
    #    self.date = date
    #    self.mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')
    #    self.mysql_connection.connect()
    #    self.cursor = self.mysql_connection.cursor

    def insert_fossil(self):
        self.query = (f"INSERT INTO Fossils "
                      f"VALUES('{self.fossil_id}',"
                      f" '{self.fossil_name}',"
                      f" '{self.location}',"
                      f" '{self.description}',"
                      f" '{self.date}')"
                      )
        self.cursor.execute(self.query)

    def fetch_fossil_data(self):
        self.query = "SELECT * FROM Fossils"
        self.cursor.execute(self.query)

        fossil_data = self.cursor.fetchall()

        # fossils = []
        # for fossil_info in fossil_data:
        #     fossils.append(fossil_info)

        # return fossils
        return fossil_data

    def close_database(self):
        self.mysql_connection.connection.commit()
        self.mysql_connection.close()

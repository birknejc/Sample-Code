import unittest
from Database_related.connection import MySQLConnection
import datetime

mysql_connection = MySQLConnection('127.0.0.1', 'root', 'root', 'fossils')
mysql_connection.connect()
cursor = mysql_connection.cursor


class TestSQL(unittest.TestCase):
    def tearDown(self):
        mysql_connection.close()

    def test_insert_fossil(self):
        result = []
        cursor.execute("SELECT *"
                       "FROM fossils")

        for row in cursor.fetchall():
            for column in row:
                result.append(column)

        expec = [793, 'Elephant', 'Africa', 'Missing rib bone, 2 cracks on left side',
                 datetime.date(1987, 9, 16)]
        self.assertEqual(result, expec)

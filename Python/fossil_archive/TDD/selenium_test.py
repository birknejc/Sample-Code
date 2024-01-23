import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By

from Database_related.queries import FossilQueries


driver = webdriver.Firefox()
file_path = 'C:/Users/birkn/Documents/IHCC/Fall 2023/Pyhton with Data Structures/Projects/fossil_archive/index.html'
driver.get(file_path)
queries = FossilQueries


class TestSQL(unittest.TestCase):

    def test_filling_data(self):
        driver.find_element(By.ID, 'fossil-id').clear()
        driver.find_element(By.ID, 'fossil-name').clear()
        driver.find_element(By.ID, 'location-found').clear()
        driver.find_element(By.ID, 'fossil-description').clear()
        driver.find_element(By.ID, 'found-date').clear()

        driver.find_element(By.ID, 'fossil-id').send_keys('658')
        driver.find_element(By.ID, 'fossil-name').send_keys('whale')
        driver.find_element(By.ID, 'location-found').send_keys('ocean')
        driver.find_element(By.ID, 'fossil-description').send_keys('funky little thing')
        driver.find_element(By.ID, 'found-date').send_keys('2023-01-23')

        self.assertEqual(driver.find_element(By.ID, 'fossil-id').get_attribute('value'), '658')
        self.assertEqual(driver.find_element(By.ID, 'fossil-name').get_attribute('value'), 'whale')
        self.assertEqual(driver.find_element(By.ID, 'location-found').get_attribute('value'), 'ocean')
        self.assertEqual(driver.find_element(By.ID, 'fossil-description').get_attribute('value'), 'funky little thing')
        self.assertEqual(driver.find_element(By.ID, 'found-date').get_attribute('value'), '2023-01-23')

        driver.find_element(By.CSS_SELECTOR, '.query-form button').click()

    def test_data_insert(self):
        driver.find_element(By.ID, 'fossil-id').clear()
        driver.find_element(By.ID, 'fossil-name').clear()
        driver.find_element(By.ID, 'location-found').clear()
        driver.find_element(By.ID, 'fossil-description').clear()
        driver.find_element(By.ID, 'found-date').clear()

        # fossil_id has to be unique and cannot already be used even if deleted from database
        driver.find_element(By.ID, 'fossil-id').send_keys('1111')
        driver.find_element(By.ID, 'fossil-name').send_keys('kangaroo')
        driver.find_element(By.ID, 'location-found').send_keys('Austrial')
        driver.find_element(By.ID, 'fossil-description').send_keys('tail missing')
        driver.find_element(By.ID, 'found-date').send_keys('1980-08-07')

        queries = FossilQueries(driver.find_element(By.ID, 'fossil-id').get_attribute('value'),
                                driver.find_element(By.ID, 'fossil-name').get_attribute('value'),
                                driver.find_element(By.ID, 'location-found').get_attribute('value'),
                                driver.find_element(By.ID, 'fossil-description').get_attribute('value'),
                                driver.find_element(By.ID, 'found-date').get_attribute('value'))

        queries.insert_fossil()
        queries.close_database()

import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

class TestMusicLibrary(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        cls.driver = webdriver.Firefox()
        cls.driver.get('C:/Users/birkn/Documents/IHCC/Fall 2023/Pyhton with Data Structures'
                        '/Projects/MusicLibrary2/music_library.html')  # Replace with the actual path to your HTML file
        cls.wait = WebDriverWait(cls.driver, 10)

    #@classmethod
    #def tearDownClass(cls):
        #cls.driver.quit()

    def test_create_playlist(self):
        # Find the playlist name input and create button
        playlist_name_input = self.driver.find_element(By.ID, 'playlist-name')
        create_button = self.driver.find_element(By.XPATH, '//button[text()="Create Playlist"]')

        # Enter playlist name and click "Create Playlist"
        playlist_name_input.send_keys("Test Playlist")
        create_button.click()

        # Assert the playlist is created
        playlist_items = self.driver.find_elements(By.CSS_SELECTOR, '#playlist-container ul li')
        playlist_names = [item.text for item in playlist_items]
        self.assertIn("Test Playlist", playlist_names)

    def test_add_song_to_playlist(self):
        # Find the input fields and add song button
        song_title_input = self.driver.find_element(By.ID, 'song-title')
        artist_input = self.driver.find_element(By.ID, 'artist')
        length_input = self.driver.find_element(By.ID, 'length')
        album_input = self.driver.find_element(By.ID, 'album')
        playlist_dropdown = self.driver.find_element(By.ID, 'select-playlistB')
        add_song_button = self.driver.find_element(By.XPATH, '//button[text()="Add Song"]')

        # Populate input fields
        song_title_input.send_keys("Test Song")
        artist_input.send_keys("Test Artist")
        length_input.send_keys("3:30")
        album_input.send_keys("Test Album")

        # Select a playlist
        playlist_dropdown.send_keys("Test Playlist")

        # Click "Add Song" button
        add_song_button.click()

        # Assert the song is added to the playlist
        playlist_items = self.driver.find_elements(By.CSS_SELECTOR, '#playlist-container ul li')
        added_song = "Test Song - Test Artist"
        self.assertIn(added_song, [item.text for item in playlist_items])

       # / html / body / div / li
        # playlist-container > li:nth-child(2)

    # Add more test methods

if __name__ == '__main__':
    unittest.main()

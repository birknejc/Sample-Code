import unittest


from class_library import *

class MusicUnitTest(unittest.TestCase):
    def test_add_song(self):
        music_library = MusicLibrary()
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        self.assertEqual(len(music_library.library_songs), 1)

    def test_remove_song(self):
        music_library = MusicLibrary()
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        music_library.remove_song("Ain't No Man")
        self.assertEqual(len(music_library.library_songs), 0)

    def test_create_playlist(self):
        music_library = MusicLibrary()
        music_library.create_playlist("My Playlist")
        self.assertTrue("My Playlist" in music_library.playlists)

    def test_add_song_to_playlist(self):
        music_library = MusicLibrary()
        music_library.create_playlist("My Playlist")
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        music_library.add_song_to_playlist("My Playlist", "Ain't No Man")
        self.assertEqual(len(music_library.playlists["My Playlist"]), 1)

    def test_remove_song_from_playlist(self):
        music_library = MusicLibrary()
        music_library.create_playlist("My Playlist")
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        music_library.add_song_to_playlist("My Playlist", "Ain't No Man")
        music_library.remove_song_from_playlist("My Playlist", "Ain't No Man")
        self.assertEqual(len(music_library.playlists["My Playlist"]), 0)

    def test_print_playlist(self):
        music_library = MusicLibrary()
        music_library.create_playlist("My Playlist")
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        music_library.add_song_to_playlist("My Playlist", "Ain't No Man")
        # I am not sure how to finish this

    def test_search_song(self):
        music_library = MusicLibrary()
        music_library.add_song("Ain't No Man", "The Avett Brothers", "3:32", "True Sadness")
        song, playlist_name = music_library.search_song("Ain't No Man")
        self.assertIsNotNone(song)
        self.assertEqual(song["title"], "Ain't No Man")


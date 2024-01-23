class MusicLibrary:
    def __init__(self):
        self.library_songs = []
        self.playlists = {}

    def add_song(self, song_title, artist, song_length, album):
        for song in self.library_songs:
            if song["title"] == song_title:
                print(f"'{song_title}' not found in library.")
                return

        song = {"title": song_title, "artist": artist, "length": song_length, "album": album}
        self.library_songs.append(song)
        print(f"'{song_title}' by {artist} added to the library.")

    def remove_song(self, song_title):
        for song in self.library_songs:
            if song["title"] == song_title:
                self.library_songs.remove(song)
                print(f"'{song_title}' deleted from library.")
                return
        print(f"'{song_title}' not found in the library. Cannot delete.")

    def create_playlist(self, playlist_name):
        if playlist_name not in self.playlists:
            self.playlists[playlist_name] = []
            print(f"Playlist '{playlist_name}' created.")
        else:
            print(f"Playlist '{playlist_name}' already exists.")

    def add_song_to_playlist(self, playlist_name, song_title):
        if playlist_name in self.playlists:
            for song in self.library_songs:
                if song["title"] == song_title:
                    if song not in self.playlists[playlist_name]:
                        self.playlists[playlist_name].append(song)
                        print(f"'{song_title}' added to '{playlist_name}' playlist.")
                    else:
                        print(f"'{song_title}' already exists in '{playlist_name}' playlist.")
                    return
            print(f"'{song_title}' not found in the library.")
        else:
            print(f"Playlist '{playlist_name}' does not exist.")

    def remove_song_from_playlist(self, playlist_name, song_title):
        if playlist_name in self.playlists:
            for song in self.playlists[playlist_name]:
                if song["title"] == song_title:
                    self.playlists[playlist_name].remove(song)
                    print(f"'{song_title}' removed from '{playlist_name}' playlist.")
                    return
            print(f"'{song_title}' not found in '{playlist_name}' playlist.")
        else:
            print(f"Playlist '{playlist_name}' does not exist.")

    def print_playlist(self, playlist_name):
        if playlist_name in self.playlists:
            print(f"Playlist: {playlist_name}")
            for song in self.playlists[playlist_name]:
                print(f"Title: {song['title']}, Artist: {song['artist']}, Length: {song['length']}, Album: {song['album']}")
        else:
            print(f"Playlist '{playlist_name}' does not exist.")

    def search_song(self, song_title):
        for song in self.library_songs:
            if song["title"] == song_title:
                return song, "Library"

        for playlist_name, playlist_songs in self.playlists.items():
            for song in playlist_songs:
                if song["title"] == song_title:
                    return song, playlist_name

        print(f"'{song_title}' not found in the library or any playlist.")
        return None

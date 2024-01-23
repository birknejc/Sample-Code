from class_library import MusicLibrary

def prog_start():
    music_library = MusicLibrary()

    while True:
        control = usr_input(music_library)
        if not control:
            break

def usr_input(library):
    while True:
        activity = input("Do you want to:\n"
                         "  A - Add a song\n"
                         "  D - Delete a song\n"
                         "  C - Create a playlist\n"
                         "  P - Print a playlist\n"
                         "  R - Remove from a playlist\n"
                         "  L - Add to a playlist\n"
                         "  S - Search for a song\n"
                         "  Q - Quit\n"
                         "(Enter the corresponding letter or 'Q' to quit): ").strip().upper()

        if activity == "A":
            song_title = input("Enter the song title: ").strip()
            artist = input("Enter the artist: ").strip()
            song_length = input("Enter the song length (mm:ss): ").strip()
            album = input("Enter the album: ").strip()

            if song_title and artist and song_length and album:
                if not library.search_song(song_title):
                    library.add_song(song_title, artist, song_length, album)
                else:
                    print(f"'{song_title}' already exists in the library. Cannot add duplicates.")
            else:
                print("Invalid input. All fields must be filled.")

        elif activity == "D":
            song_title = input("Enter the song title to delete: ").strip()
            if song_title:
                try:
                    library.remove_song(song_title)
                except KeyError:
                    print(f"'{song_title}' not found in the library. Cannot delete.")
            else:
                print("Invalid input. Song title cannot be empty.")

        elif activity == "C":
            playlist_name = input("Enter the playlist name to create: ").strip()
            if playlist_name:
                library.create_playlist(playlist_name)
                print(f"Playlist '{playlist_name}' created.")
            else:
                print("Invalid input. Playlist name cannot be empty.")

        elif activity == "P":
            playlist_name = input("Enter the playlist name to print: ").strip()
            if playlist_name:
                library.print_playlist(playlist_name)
            else:
                print("Invalid input. Playlist name cannot be empty.")

        elif activity == "R":
            playlist_name = input("Enter the playlist name to remove from: ").strip()
            song_title = input("Enter the song title to remove from the playlist: ").strip()

            if playlist_name and song_title:
                library.remove_song_from_playlist(playlist_name, song_title)
            else:
                print("Invalid input. Playlist name and song title cannot be empty.")

        elif activity == "L":
            playlist_name = input("Enter the playlist name to add to: ").strip()
            song_title = input("Enter the song title to add to the playlist: ").strip()

            if playlist_name and song_title:
                library.add_song_to_playlist(playlist_name, song_title)
            else:
                print("Invalid input. Playlist name and song title cannot be empty.")

        elif activity == "S":
            song_title = input("Enter the song title to search: ").strip()
            if song_title:
                found_song, playlist_name = library.search_song(song_title)
                if found_song:
                    if playlist_name == "Library":
                        print(f"Song found in the library")
                    else:
                        print(f"Song found in playlist: {playlist_name}")
                    print(
                        f"Title: {found_song['title']}, Artist: {found_song['artist']}, Length: {found_song['length']}, Album: {found_song['album']}")
                else:
                    print(f"'{song_title}' not found in the library or any playlist.")
            else:
                print("Invalid input. Song title cannot be empty.")

        elif activity == "Q":
            return False  # Quit the program
        else:
            print("Invalid selection. Please enter a valid option (A/D/C/P/R/L/S/Q).")


if __name__ == "__main__":
    prog_start()

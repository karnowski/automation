#!/usr/local/bin/macruby
framework 'Foundation'
framework 'ScriptingBridge'
 
ITunes = SBApplication.applicationWithBundleIdentifier("com.apple.itunes")
load_bridge_support_file 'iTunes.bridgesupport'
ITunes.run
 
class SBElementArray
  def [](value)
    self.objectWithName(value)
  end
end

def get_playlist(name)
  ITunes.sources["Library"].userPlaylists[name]
end

def get_songs_from_playlist(playlist)
  playlist.fileTracks.select {|t| t.location }
end

def add_songs_to_playlist(songs, playlist)
  urls = songs.map {|song| NSURL.alloc.initFileURLWithPath(song)}
  ITunes.add(NSArray.alloc.initWithArray(urls), :to => playlist)
end

songs_to_add = [
  "/Users/larry/Desktop/Whispering Pines/Family Tree/01 Family Tree.mp3",
  "/Users/larry/Desktop/Whispering Pines/Family Tree/02 Brand New Beat.mp3",
]

playlist = get_playlist("Listen At Least Once")

songs_to_add.each do |song|
  songs_already_in_playlist = get_songs_from_playlist(playlist)
  found_song = songs_already_in_playlist.find {|t| t.location.path == song }
  
  if found_song
    puts "They've already got one! --> #{song}"
    found_song.delete # --> deletes the song from the playlist, not from the music library itself
  else
    puts "Missing song --> #{song}"
    add_songs_to_playlist([song], playlist)
  end
end

# TODO: can I change the location (NSURL) of an existing iTunesFileTrack?  
# (e.g. move a file from a local to an external hard drive, but leave the playlists & ratings as is?)

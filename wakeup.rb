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

def add_songs_to_playlist(songs, playlist)
  urls = songs.map {|song| NSURL.alloc.initFileURLWithPath(song)}
  ITunes.add(NSArray.alloc.initWithArray(urls), :to => playlist)
end

songs = [
  "/Users/larry/Desktop/Whispering Pines/Family Tree/01 Family Tree.mp3",
  "/Users/larry/Desktop/Whispering Pines/Family Tree/02 Brand New Beat.mp3",
]

playlist = get_playlist("Listen At Least Once")
puts add_songs_to_playlist(songs, playlist).inspect
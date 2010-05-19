#!/usr/local/bin/macruby
framework 'Foundation'
framework 'ScriptingBridge'
 
itunes = SBApplication.applicationWithBundleIdentifier("com.apple.itunes")
load_bridge_support_file 'iTunes.bridgesupport'
itunes.run
 
class SBElementArray
  def [](value)
    self.objectWithName(value)
  end
end
 
#itunes.stop
# playlist = itunes.sources["Library"].userPlaylists["Top 100 Most Played"]
# playlist.playOnce(false) if playlist

playlist = itunes.sources["Library"].userPlaylists["Listen At Least Once"]
# playlist.fileTracks.each do |track|
# 
#   if track.location
#     puts "#{track.artist} - #{track.album} - #{track.name}"
#     puts track.location.path
#   # else
#   #   puts "WARNING: iTunes cannot find the song file for: #{track.artist} - #{track.name}"
#   end
# end


song = "/Users/larry/Desktop/Whispering Pines/Family Tree/01 Family Tree.mp3"
# song = ":Users:larry:Desktop:Whispering Pines:Family Tree:01 Family Tree.mp3"
# file_track = ITunesFileTrack.alloc.init
# puts file_track.inspect
# file_track.setLocation(song)
url = NSURL.alloc.initFileURLWithPath(song)
puts url.absoluteString.inspect
# file_track.location = url
# puts file_track.location.inspect
array = NSArray.alloc.initWithArray([url])
#array = NSArray.new([song_file])
track = itunes.add(array, :to => playlist)
puts track.inspect



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

playlist = itunes.sources["Library"].userPlaylists["Listen At Least Once"]
song1 = "/Users/larry/Desktop/Whispering Pines/Family Tree/01 Family Tree.mp3"
song2 = "/Users/larry/Desktop/Whispering Pines/Family Tree/02 Brand New Beat.mp3"
url1 = NSURL.alloc.initFileURLWithPath(song1)
url2 = NSURL.alloc.initFileURLWithPath(song2)
array = NSArray.alloc.initWithArray([url1, url2])
track = itunes.add(array, :to => playlist)
puts track.inspect

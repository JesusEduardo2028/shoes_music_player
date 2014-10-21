# JavaZOOM Sound-API Projects
require 'shoes/swt/support/tritonus_share.jar'
#  - MP3 lib
require 'shoes/swt/support/mp3spi1.9.5.jar'
require 'shoes/swt/support/jl1.0.1.jar'
#  - Ogg/Vorbis lib
require 'shoes/swt/support/jogg-0.0.7.jar'
require 'shoes/swt/support/jorbis-0.0.15.jar'
require 'shoes/swt/support/vorbisspi1.0.3.jar'

require 'shoes/swt/support/basicplayer3.0.jar'
require 'shoes/swt/support/commons-logging-api.jar'
require 'shoes/swt/support/jflac-1.2.jar'
require 'shoes/swt/support/jl1.0.jar'
require 'java'

java_import "javazoom.jlgui.basicplayer.BasicController"
java_import "javazoom.jlgui.basicplayer.BasicPlayer"
java_import "javazoom.jlgui.basicplayer.BasicPlayerEvent"
java_import "javazoom.jlgui.basicplayer.BasicPlayerException"
java_import "javazoom.jlgui.basicplayer.BasicPlayerListener"



class Shoes
  module Swt
    class Sound

      java_implements BasicPlayerListener
      java_signature 'void opened(Object, Map)'
      java_signature 'void progress(int,long, byte[] , Map )'
      java_signature 'void stateUpdated(BasicPlayerEvent)'
      java_signature 'void setController(BasicPlayerEvent)'

      JFile = java.io.File

      attr_reader :progressNow

      def initialize(dsl)
        @basicPlayer = BasicPlayer.new;
        @basicPlayer.addBasicPlayerListener(self);
        @bytesLength = nil
        @progressNow = {seconds: "00", minutes: "00", hours: "00"}
        loadFile(dsl.filepath)
      end

      def play
        begin
          @basicPlayer.play
        rescue Exception => e
          puts e
        end
      end

      def toggle_play
        begin
          if @basicPlayer.getStatus > 1  
            @basicPlayer.play
          else
            if isPaused
              @basicPlayer.resume
            else
              @basicPlayer.pause
            end
          end
        rescue Exception => e
          puts e
        end
      end

      def pause
        begin
          @basicPlayer.pause
        rescue Exception => e
          puts e
        end
      end

      def stop
        begin
          @basicPlayer.stop
          @progressNow = {seconds: "00", minutes: "00", hours: "00"}
        rescue Exception => e
          puts e
        end
      end

      def resume
        begin
          @basicPlayer.resume
        rescue Exception => e
          puts e
        end
      end

      def status
        @basicPlayer.getStatus
      end

      def isPlaying
         @basicPlayer.getStatus == 0
      end

      def isPaused
         @basicPlayer.getStatus == 1
      end

      def isStopped
        @basicPlayer.getStatus > 1
      end

      def loadFile(file_url)
        #@basicPlayer.open(java.net.URL.new(file_url))
        @basicPlayer.open(JFile.new(file_url))
      end

      def opened(arg0 , arg1) 
        if (arg1.containsKey("audio.length.bytes")) 
          @bytesLength = arg1.get("audio.length.bytes")
          puts "Longitud en bytes #{@bytesLength}"
        end
      end

      def progress(bytesread,microseconds,pcmdata, properties) 
        progress_time = microseconds / 1000000
        seconds = progress_time % 60
        progress_time /= 60
        minutes = progress_time % 60
        progress_time /= 60
        hours = progress_time % 24

        @progressNow = {seconds: seconds.to_s.rjust(2, '0') , minutes: minutes.to_s.rjust(2, '0') , hours: hours.to_s.rjust(2, '0') }
      end

      def setController(arg0) 

      end

      def stateUpdated(arg0)

      end
    end
  end

end

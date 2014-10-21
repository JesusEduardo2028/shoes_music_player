class Shoes
  class Sound
    include Common::Inspect

    def initialize(parent, filepath, opts={}, &blk)
      @parent = parent
      @filepath = filepath

      @gui = Shoes.configuration.backend_for(self)
    end

    attr_reader :gui, :filepath, :parent

    def progressNow
      @gui.progressNow
    end

    def toggle_play
      @gui.toggle_play
    end

    def pause
      @gui.pause
    end
    
    def stop
      @gui.stop
    end

    def resume
      @gui.resume
    end
  
    def isPlaying
      @gui.isPlaying
    end

    def isPaused
      @gui.isPaused
    end

    def isStopped
      @gui.isStopped
    end
    def status
      @gui.status
    end
  end
end

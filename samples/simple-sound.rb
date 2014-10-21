Shoes.app do

  @supremacy = sound("https://docs.google.com/file/d/0B6wEtK9O5dmfRWlzbUlTRlZCdEU/edit")
  #@don_omar = sound("https://www.dropbox.com/s/uscefzorf4ebsvc/Don%20Omar%20ft.%20Tego%20Calderon%20-%20Bandolero.mp3")

  @last_song = @supremacy

  button "PLAY" do
    @last_song.play
  end

  button "PAUSE" do
    @last_song.pause
  end

  button "STOP" do
    @last_song.stop
  end

  button "RESUME" do
    @last_song.resume

  end

  button "Supremacy" do
    @last_song.stop
    @last_song = @supremacy
  end

  button "Perreo" do
    @last_song.stop
    @last_song = @don_omar
  end

end

require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(date_published, on_spotify, id = Random.rand(1..1000))
    super(date_published, id)
    @on_spotify = on_spotify
    move_to_archive
  end

  def can_be_archived?
    super && @on_spotify
  end
end

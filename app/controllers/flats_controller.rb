class FlatsController < ApplicationController
  def index
    @flats = Flat.geocoded #returns flats with coordinates

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      }
    end
  end

  def new
    @flat = Flat.new
  end
end

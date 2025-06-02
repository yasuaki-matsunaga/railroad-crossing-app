class MapPagesController < ApplicationController

  def top
    lat = params[:latitude].to_f
    lon = params[:longitude].to_f

    north = params[:northLat].to_f
    south = params[:southLat].to_f
    east  = params[:eastLng].to_f
    west  = params[:westLng].to_f

    if north != 0.0 && south != 0.0 && east != 0.0 && west != 0.0
      @crossings = Crossing.where(latitude: south..north, longitude: west..east).includes(city: [:prefecture], linked_railways: [])
    elsif lat != 0.0 && lon != 0.0
      @crossings = Crossing.within(2, origin: [lat, lon]).includes(city: [:prefecture], linked_railways: [])
    else
      @q = Crossing.ransack(params[:q])
      if params[:q].blank?
        @crossings = [] # params[:q]が空なら、検索結果は空
      else
        @crossings = @q.result(distinct: true).includes(city: [:prefecture], linked_railways: [])
      end
    end
  end
end

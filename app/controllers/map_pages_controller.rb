class MapPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]

  def top
    lat = params[:latitude].to_f
    lon = params[:longitude].to_f

    if lat.present? && lon.present? && lat != 0.0 && lon != 0.0
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

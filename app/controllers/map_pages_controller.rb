class MapPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  
  def top
    @q = Crossing.ransack(params[:q])
    if params[:q].blank?
      @crossings = []  # params[:q]が空なら、検索結果は空
    else
      @crossings = @q.result(distinct: true).includes(:linked_prefectures, :linked_cities, :linked_railways)
    end
  end
end

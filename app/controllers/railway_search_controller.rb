class RailwaySearchController < ApplicationController
  skip_before_action :require_login, only: %i[search]

  def search
    @railways = Railway.where("railway_name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_railway
    @railway = Railway.find(params[:id])
  end
  # Only allow a list of trusted parameters through.
  def railway_params
    params.require(:railway).permit(:railway_name)
  end

end
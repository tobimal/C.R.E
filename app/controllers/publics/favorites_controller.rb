class Publics::FavoritesController < ApplicationController
	before_action :authenticate_end_user!

  def create
    favorite = current_end_user.favorites.build(novel_id: params[:novel_id])
    favorite.save!
    redirect_to publics_novels_path, success: t('.flash.favorite')
  end

  def destroy
    current_end_user.favorites.find_by(novel_id: params[:novel_id]).destroy!
    redirect_to publics_novels_path, success: t('.flash.not_favorite')
  end
  
end

class Publics::HistoriesController < ApplicationController
	before_action :authenticate_end_user!
  def index
  	histories = History.where(end_user_id: current_end_user.id).pluck(:novel_id)
  	@histories = Novel.find(histories)

  	@all_ranks = Novel.find(Favorite.group(:novel_id).order('count(novel_id) desc').limit(3).pluck(:novel_id))
	
	end
end

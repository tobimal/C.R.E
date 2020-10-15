class Admins::EndUsersController < ApplicationController
	def index
		@end_users = EndUser.all
	end
	def show
		@end_user = EndUser.find(params[:id])
		@novels = @end_user.novels
		@series_novels = @end_user.series_novels
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

	def update
		@end_user = EndUser.find(params[:id])
    	if @end_user.update(end_user_params)
      		redirect_to admins_end_user_path(@end_user), notice: "successfully updated user!"
    	else
     		render :edit
    	end
	end

	private
	def end_user_params
    	params.require(:end_user).permit(:name, :introduction, :email, :year, :month, :day)
  	end
end

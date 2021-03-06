class Admins::NovelsController < ApplicationController
  def index
  	@novels = Novel.all
    
  end

  def show
  	@novel = Novel.find(params[:id])
    
  end

  def new
  	@novel = Novel.new
    @series_novels = SeriesNovel.all
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def confirm
  	@novel = Novel.new(novel_params)
  end

  def create
  	@novel = Novel.new(novel_params)
    @novel.end_user_id = current_end_user.id
    if @novel.save
      redirect_to admins_novel_path(@novel), notice: "You have created novel successfully."
    else
      @novels = Novel.all
      render 'index'
    end
  end


  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to admins_novel_path(@novel), notice: "You have updated series_novel successfully."
    else
      render "edit"
    end
  end
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to admin_end_user_path(current_end_user)
  end

  def thanks
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body, :end_user_id, :series_novel_id)
  end
end

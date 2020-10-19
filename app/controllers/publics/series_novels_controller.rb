
class Publics::SeriesNovelsController < ApplicationController
  def index
  	@series_novels = SeriesNovel.all
  end

  def show
  	@series_novel = SeriesNovel.find(params[:id])
    @novels = @series_novel.novels
  end

  def new
    @series_novel = SeriesNovel.new
  end

  def create
    @series_novel = SeriesNovel.new(series_novel_params)
    if @series_novel.save
        redirect_to publics_series_novels_path
      else
        @series_novels = SeriesNovel.all
        render :index
    end
  end

  def edit
    @series_novel = SeriesNovel.find(params[:id])
  end

  def update
    @series_novel = SeriesNovel.find(params[:id])
    if @series_novel.update(series_novel_params)
      redirect_to publics_series_novel_path(@series_novel), notice: "You have updated series_novel successfully."
    else
      render "edit"
    end
  end
  def destroy
    @series_novel = SeriesNovel.find(params[:id])
    @series_novel.destroy
    redirect_to series_novels_path
  end


  private

  def series_novel_params
    params.require(:series_novel).permit(:title, :introduction, :end_user_id)
  end

end

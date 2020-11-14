class Publics::NovelsController < ApplicationController
  before_action :authenticate_end_user!
  def index
  	@novels = Novel.all.includes(:end_user)
    
  end

  def show

  	@novel = Novel.find(params[:id])
    # ここから閲覧履歴を保存するコードを書く
    new_history = @novel.histories.new
    new_history.end_user_id = current_end_user.id

    # 同一記事の重複チェック・重複時は古い履歴を削除
    if current_end_user.histories.exists?(novel_id: "#{params[:id]}")
      old_history = current_end_user.histories.find_by(novel_id: "#{params[:id]}")
      old_history.destroy
    end
    new_history.save

    # 上限を超えた場合
    histories_stock_limit = 10
    histories = current_end_user.histories.all
    if histories.count > histories_stock_limit
      histories[0].destroy
    end
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
      redirect_to publics_end_user_path(current_end_user), notice: "You have created novel successfully."
    else
      @novels = Novel.all
      render 'index'
    end
  end


  def update
    @novel = Novel.find(params[:id])
    if @novel.update(novel_params)
      redirect_to publics_novel_path(@novel), notice: "You have updated series_novel successfully."
    else
      render "edit"
    end
  end
  def destroy
    @novel = Novel.find(params[:id])
    @novel.destroy
    redirect_to publics_end_user_path(current_end_user)
  end

  def favorite
    @novels = current_end_user.favorite_novels.includes(:end_user)
  end

  private

  def novel_params
    params.require(:novel).permit(:title, :body, :end_user_id, :series_novel_id)
  end
end

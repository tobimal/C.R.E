class Publics::SearchController < ApplicationController

	def search
	@model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @datas = search_for(@model, @content, @method)
    @end_users = EndUser.all
    @novels = Novel.all
	end

	private
  def search_for(model, content, method)
    if model == 'end_user'
      if method == 'perfect'
        EndUser.where(name: content)
      elsif method == 'forward'
        EndUser.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        EndUser.where('name LIKE ?', '%'+content)
      else
        EndUser.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'novel'
      if method == 'perfect'
        Novel.where(title: content)
      elsif method == 'forward'
        Novel.where('title LIKE ?', content+'%')
      elsif method == 'backward'
        Novel.where('title LIKE ?', '%'+content)
      else
        Novel.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end

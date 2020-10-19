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
      else
        EndUser.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'novel'
      if method == 'perfect'
        Novel.where(title: content)
      else
        Novel.where('title LIKE ?', '%'+content+'%')
      end
    end
  end
end

class Novel < ApplicationRecord
	belongs_to :end_user, optional: true
	has_many :favorites, dependent: :destroy
	belongs_to :series_novel, optional: true
	accepts_nested_attributes_for :series_novel

  validates :title, presence: true
  validates :body, presence: true

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end
end

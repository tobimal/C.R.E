class Favorite < ApplicationRecord
	belongs_to :end_user
  belongs_to :novel

   validates :end_user_id, presence: true, uniqueness: {scope: :novel_id}
  validates :novel_id, presence: true
end

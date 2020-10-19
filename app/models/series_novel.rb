class SeriesNovel < ApplicationRecord
	has_many :novels
	belongs_to :end_user, optional: true

	validates :title, presence: true
	validates :introduction, presence: true
end

class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         has_many :series_novels, dependent: :destroy
         has_many :novels, dependent: :destroy
         has_many :inquiry, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :favorite_novels, through: :favorites, source: :novel
         has_many :histories, dependent: :destroy

         def own_novel?(novel)
  			self.id == novel.end_user_id
		end

end

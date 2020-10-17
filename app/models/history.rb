class History < ApplicationRecord
	belongs_to :end_user    # ここを追加
  belongs_to :novel # ここを追加
end

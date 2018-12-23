class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #user_idとpost_idの組み合わせは唯一であること
  validates :user_id, uniqueness: {scope: :post_id}
end

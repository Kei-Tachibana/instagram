class Post < ApplicationRecord
  belongs_to :user

  validates :image, presence: true

  has_many :photos, dependent: :destroy #Postが削除されるとphotoも消える

  def is_belongs_to? user
    Post.find_by(user_id: user.id, id: id)
  end
end

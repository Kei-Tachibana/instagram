class Post < ApplicationRecord
  belongs_to :user

  validates :image, presence: true

  has_many :photos, dependent: :destroy #Postが削除されるとphotoも消える
end

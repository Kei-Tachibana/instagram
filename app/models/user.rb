class User < ApplicationRecord
  has_many :posts, dependent: :destroy #ユーザーが削除されるとpostsも消える
  has_many :likes
  has_many :bookmarks
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: :true, length: {maximum: 50}

  def self.search(term)
    if term
      where('name LIKE ?', "%#{term}%")
    else
      nil
    end
  end
end

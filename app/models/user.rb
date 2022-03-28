class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :todos, dependent: :destroy
  validates :username, presence: true

  has_many :favorites, dependent: :destroy

  def already_favorited?(todo)
    self.favorites.exists?(todo_id: todo.id)
  end


end

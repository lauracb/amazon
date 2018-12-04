class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  # Para Settear los roles:
  enum role: [:user, :admin]
  before_create :set_default_user

  def set_default_user
    self.role = :user 
  end

  def subscriptor?  #método boolean
    Subscriptor.all.map(&:email).include? self.email # es lo mismo que User.email
  end


end

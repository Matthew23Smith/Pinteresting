class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true 
end

class User::ParameterSanitizer < Devise::ParameterSanitizer
  def new_user_session
    default_params.permit(:username, :email)
  end
end
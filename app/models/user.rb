class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company

#   after_create :send_welcome_email
  has_many :expenses

  def admin?
    admin
  end

  def role(user)
     if user.admin
      return "Admin"
      else return "User"
      end
  end


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end


end

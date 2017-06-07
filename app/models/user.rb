class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  after_create :send_welcome_email

  def admin?
    admin
  end


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end


end

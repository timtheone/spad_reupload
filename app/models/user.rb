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

  def has_expenses?
    if self.expenses.size > 0
      true
    else
      false
    end
  end

  # soft delete implementation st
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  # enf of soft delete requirements

  def role(user)
     if user.admin
      return "Admin"
      else return "User"
      end
  end
  mount_uploader :portrait, PortraitUploader
  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end


end

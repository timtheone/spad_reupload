class InvitationPolicy < ApplicationPolicy

  def invite?
   user.admin
  end

 end

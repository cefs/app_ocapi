# encoding: utf-8
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    if user.role == Role::ADMIN
      can [:read, :update, :create, :destroy, :approved], :all
    end

    if user.persisted? && user.role == Role::VISITOR
      can [:read, :update, :create, :destroy], :all
    else
      can [:read], :all
    end
  end
end

# encoding: utf-8
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    if user.role == Role::ADMIN
      can [:read, :update, :create, :destroy, :approved], :all
    end

    if user.role == Role::VISITOR && user.persisted?
      can [:read, :update, :create, :destroy], :all
    end

    if user.role == Role::VISITOR && !user.persisted?
      can [:read], :all
    end
  end
end

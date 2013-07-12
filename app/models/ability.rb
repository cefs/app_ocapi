class Ability
  include CanCan::Ability
  def initialize(user)
    if user.role == "admin"
      can [:approved], Advertising
    end
  end
end

# Defining an access policy
class AccessPolicy
  include AccessGranted::Policy
  # Example policy for AccessGranted.
  # For more details check the README at
  #
  # https://github.com/chaps-io/access-granted/blob/master/README.md
  #
  # Roles inherit from less important roles, so:
  # - :admin has permissions defined in :member, :guest and himself
  # - :member has permissions from :guest and himself
  # - :guest has only its own permissions since it's the first roles.
  #
  # The most important roles should be at the top.
  # In this case an administrator.
  #
  # roles :admin, proc { |user| user.admin? } do
  #   can :destroy, User
  # end

  # More privileged roles, applies to registered users.
  #
  # The most important admin roles, gets checked first
  def configure
    # The most important admin role, gets checked first
    role :admin, { admin?: true } do
      can :manage, Employee
      can :manage, Car
      can :manage, Supplier
      can :manage, WorkOrder
      can :manage, Maintenance
      can :manage, InsurancePlan
      can :manage, User
      can :authorize, WorkOrder
    end
    # Less privileged driver role
    role :driver do
      can :create, Car
      can :create, WorkOrder
    end
    # Less privileged secretary role
    role :secretary do
      can :create, WorkOrder
      can :create, Supplier
      can :create, Employee
      can :create, Car
      can :create, Maintenance
      can :create, InsurancePlan
    end
  end
end

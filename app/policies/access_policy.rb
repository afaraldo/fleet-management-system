class AccessPolicy
  include AccessGranted::Policy

  def configure
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
      role :admin, { admin?: true }  do
        can :manage, Supplier
      end

      # Less privileged driver role
      role :driver  do
        can [:update, :destroy], Supplier
        #can :create, Supplier
      end

      # Less privileged secretary role
      role :secretary do
        #can :read, Supplier
        #can :destroy, Supplier
      end
    end
  end
end

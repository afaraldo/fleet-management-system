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
     role :admin, { is_admin: true } do
       can :manage, User
       #can :manage, Comment
       can :destroy, Supplier
       can :update, Supplier
     end
    #roles :member, MemberRole, -> { |user| !u.guest? }
    # Less privileged moderator roles
     role :moderator, proc {|u| u.moderator? } do
        can [:update, :destroy], Supplier
        can :update, User
     end
     role :member, proc { |user| user.registered? } do
       can :create, Supplier
       #can :create, Comment
       can [:update, :destroy], Supplier do |supplier, user|
         #post.author == user && post.comments.empty?
         post.author_id == user.id
       end
     end

    # The base roles with no additional conditions.
    # Applies to every user.
    #
    # roles :guest do
    #  can :read, Post
    #  can :read, Comment
    # end

    begin
      role :member do
        can :read, Post
        can :create, Post
      end
    end
  end
end

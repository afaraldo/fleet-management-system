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
    # - :guest has only its own permissions since it's the first role.
    #
    # The most important role should be at the top.
    # In this case an administrator.
    #
    # role :admin, proc { |user| user.admin? } do
    #   can :destroy, User
    # end

    # More privileged role, applies to registered users.
    #
    # The most important admin role, gets checked first
     role :admin, { is_admin: true } do
       can :manage, Post
       can :manage, Comment
       can :destroy, Post
       can :update, Post
     end
    # Less privileged moderator role
     role :moderator, proc {|u| u.moderator? } do
        can [:update, :destroy], Post
        can :update, User
     end
     role :member, proc { |user| user.registered? } do
       can :create, Post
    #   can :create, Comment
       can [:update, :destroy], Post do |post, user|
         #post.author == user && post.comments.empty?
         post.author_id == user.id
       end
     end

    # The base role with no additional conditions.
    # Applies to every user.
    #
    # role :guest do
    #  can :read, Post
    #  can :read, Comment
    # end
    role :member do
      can :read, Post, { published: true }
      can :create, Post
    end
     end
  end

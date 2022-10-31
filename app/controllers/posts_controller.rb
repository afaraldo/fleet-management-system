class PostsController
  def show
    @post = Post.find(params[:id])
    authorize! :read, @post, 'You do not have access to this post'
    render json: { post: @post }
  rescue AccessGranted::AccessDenied => e
    render json: { error: e.message }, status: :forbidden
  end

  def create
    authorize! :create, Post
    # (...)
  end

end

class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    # 記事を全件取得
    @blogs = Blog.all
  end

  def new
      @blog = Blog.new
  end

  def create
      blog = Blog.new(blog_params)
      blog.save
      redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end
end

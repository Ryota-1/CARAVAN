class BlogsController < ApplicationController

  def index
    # 記事を全件取得
    @blogs = Blog.all
  end

  def show
    # params[:id]の部分でどのブログなのかを判断（Blog１やBlog２など）
    @blog = Blog.find(params[:id])
  end

  def new
  	@blog = Blog.new
  end

  def create
  	blog = Blog.new(blog_params)
  	blog.save
  	redirect_to blog_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
  	params.require(:blog).permit(:title, :category, :body)
  end
end

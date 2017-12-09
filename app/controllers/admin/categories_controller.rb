class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created!"
      redirect_to admin_categories_path
     #如果儲存成功，請使用者瀏覽資料
    else
      @categories = Category.all
      render :index
    end

  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end

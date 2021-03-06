class CategoriesController < ApplicationController
  
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:index, :show]

  def index
  	@categories = Category.paginate(page: params[:page], per_page: 10)
   
  end

  def new
  	@category = Category.new
  end
  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to categories_path, notice: "Category was successfully created."
  	else
  		render 'new'
  	end
  end

  def edit

  end
  def update
  	if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    
  	@category_articles = @category.article.paginate(page: params[:page], per_page: 5)
  end

  private
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Only admin can perform this action."
      redirect_to categories_path
    else 

    end
  end
  def category_params
		params.require(:category).permit(:name)  	
  end
  def set_params
  	@category = Category.find(params[:id])
  end

end

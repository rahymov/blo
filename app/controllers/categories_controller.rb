class CategoriesController < ApplicationController
  
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
  	@categories = Category.paginate(page: params[:page], per_page: 5)
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
  	
  end

  def show
  	
  end

  private
  def category_params
		params.require(:category).permit(:name)  	
  end
  def set_params
  	@category = Category.find(params[:id])
  end

end

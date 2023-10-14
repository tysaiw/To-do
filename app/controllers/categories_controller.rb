class CategoriesController < ApplicationController
  before_action :set_category, except: [:index]

  def index
    @categories = Category.all
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(params_category)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
    redirect_to categories_path, alert: "Category not found" unless @category
  end

  def params_category
    params.require(:category).permit(:name)
  end
end

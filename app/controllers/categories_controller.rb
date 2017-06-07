class CategoriesController < ApplicationController
  def index
    @categories = policy_scope(Category).order("
      CASE
        WHEN status = 'Active' THEN '1'
        WHEN status = 'Not active' THEN '2'
      END
    ")
  end

  def new
      @category = Category.new
      authorize @category
  end

  def create
      @category = Category.new(category_params)
      @category.company = current_user.company
      if @category.save!
        flash[:notice] = "Category has been successfully added"
        redirect_to categories_path
      else
        flash[:alert] = "Something went wrong"
        render :new
      end
      authorize @category
  end

  def edit
    @category = Category.find(params[:id])
    authorize @category
  end

  def update
    @category = Category.find(params[:id])
    authorize @category
    @category.update(category_params)
    redirect_to categories_path
  end

  def activate
    @category = Category.find(params[:id])
    authorize @category
    @category.update(status: "Active")
    flash[:notice] = "Category has been activated"
    redirect_to categories_path
  end

   def deactivate
    @category = Category.find(params[:id])
    authorize @category
    @category.update(status: "Not active")
    flash[:alert] = "Credit has been deactivated"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :status)
  end
end

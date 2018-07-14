# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :all_categories

  def index
    @new_category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
  end

  def destroy
    Category.destroy(params[:id])
  end

  private

  def all_categories
    @categories = Category.includes(:tasks).where(user: current_user)
  end

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end

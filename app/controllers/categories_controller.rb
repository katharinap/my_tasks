# frozen_string_literal: true

class CategoriesController < ApplicationController
  def create
    @category = Category.new(category_params)

    # rubocop:disable Metrics/LineLength
    respond_to do |format|
      if @category.save
        format.js
        format.json { render json: @category, status: :created, location: @category }
      else
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
    # rubocop:enable Metrics/LineLength
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end

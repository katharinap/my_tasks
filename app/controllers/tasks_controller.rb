# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
    @tasks = Task.all
    @task = Task.new(date: Date.today)
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js
        format.json { render json: @task, status: :created, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id, :date, :description)
  end
end

# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @categories = Category.includes(:tasks).where(user: current_user)
    tasks = @categories.map(&:tasks).flatten
    @tasks_by_week = tasks.group_by { |t| t.date.cweek }
    @sample_task = tasks.first
    @new_task = Task.new(date: Date.today)
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.destroy(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:category_id,
                                 :date,
                                 :description,
                                 :duration_in_hours)
  end
end

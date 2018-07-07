# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @categories = Category.includes(:tasks).where(user: current_user)
    @category = Category.new
    tasks = @categories.map(&:tasks).flatten
    @tasks_by_week = tasks.group_by { |t| t.date.cweek }
    @sample_task = tasks.first
    @new_task = Task.new(date: Date.today)
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

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.js
        format.json { render json: @task, status: :updated, location: @task }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.destroy(params[:id])

    respond_to do |f|
      f.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:category_id,
                                 :date,
                                 :description,
                                 :duration_in_hours)
  end
end

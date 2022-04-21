# frozen_string_literal: true

class TodosController < ApplicationController
  before_action :set_todo, only: :update

  def update
    if @todo.update(todo_params)
      render json: { todo: @todo, message: "Todo updated successfully" }, status: 200
    else
      render json: { error: @todo.errors.full_messages }, status: 422
    end
  end

  def reset_all
    if Todo.update_all(checked: false)
      render json: { todo: @todo, message: "All Todos updated!" }, status: 200
    else
      render json: { error: "Error resetting Todos. Please try again!" }, status: 422
    end
  end

  private

  def todo_params
    params.permit(:id, :checked)
  end

  def set_todo
    @todo = Todo.find_by_id(todo_params[:id])
    render json: { error: "Todo not found" } and return unless @todo
  end
end

class TodosController < ApplicationController
  # before_actionは使わない方針で
  ## https://takaokouji.github.io/output/rails-anti-pattern-set-instance-variable-in-before-action/
  # before_action :set_todo, only: %i[ show update destroy ]

  # GET /todos
  def index
    @todos = Todo.all

    render json: @todos
  end

  # GET /todos/1
  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      # debugger
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy!
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_todo
  #   @todo = Todo.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:description, :status, :title)
  end
end

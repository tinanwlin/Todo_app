class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todo_path(@todo), notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def destroy
    Todo.find(params[:id]).destroy
    redirect_to root_path
  end

private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end

end

class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @search_form = SearchTodosForm.new(search_todos_params)
    @todos = Todo.where(user: current_user).search(@search_form);
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(user: current_user, title: todo_params[:title], body: todo_params[:body])

    if @todo.save
      redirect_to todos_path, notice: 'ToDoを作成しました'
    else
      render :new
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: 'ToDoを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: 'ToDoを削除しました'
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :body, :status)
    end

    def search_todos_params
      params.fetch(:search_todos_form, {}).permit(:title, { status: [] }, :create_from, :create_to)
    end
end

class TodosController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @todos = Todo.all.order(id: "DESC")
  end

  def edit
    @todo = Todo.find(params[:id])
    if @todo.user != current_user
      redirect_to todos_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @todo = Todo.find(param[:id])
    if @todo.update(todo_params)
      redirect_to todo_path(@todo), notice: "todoを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    todo = Todo.find([:id])
    todo.destroy
    redirect_to user_path(todo.user), notice: "todoを削除しました。"
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to todo_path(@todo), notice: "todoを作成しました。"
    else
      render :new
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private
  def todo_params
    params.require(:todo).permit(:task, :detail)
  end

end

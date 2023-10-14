class TodosController < ApplicationController
  before_action :set_todo, except: [:index]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params_todo)
    if @todo.save
      redirect_to todos_url, notice: 'Todo was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @todo.update(params_todo)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private

  def set_todo
    @todo = Todo.find_by(id: params[:id])
    redirect_to todos_path, alert: "Todo not found" unless @todo
  end

  def params_todo
    params.require(:todo).permit(:title, :content, :status, :due_date, :start_at, :end_at)
  end
end

class TodosController < ApplicationController
    before_action :find_todo, only: [:show, :edit, :update, :destroy]

    def new
        @todo = Todo.new
    end

    def index
        @todos = Todo.all
    end


    def show
    end

    def edit
    end

    def create
        @todo = Todo.create(todo_params)
        if @todo.save
            flash[:notice] = "Todo created successfully!"            
            redirect_to todo_path(@todo)
        else
            render 'new', status: 500
        end
    end


    def update
        if @todo.update(todo_params)
            flash[:notice] = "Todo Updated successfully."
            redirect_to todo_path(@todo)
        else
            render 'edit', status: 404
        end
    end

    def destroy
        @todo = Todo.find(params[:id])
        if @todo.destroy
            flash[:notice] = "Todo having id: " + params[:id] + " deleted successfully!"            
            redirect_to todos_path
        else
            render 'index', status: 500
        end
    end

    private

    def find_todo
        @todo = Todo.find(params[:id])
    end

    def todo_params
        params.require(:todo).permit(:name, :description)
    end

end
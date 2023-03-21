class TodosController < ApplicationController

    def new
        @todo = Todo.new
    end

    def index
        @todos = Todo.all
    end

    def create
        @todo = Todo.new(todo_params)
        if @todo.save
            flash[:notice] = "Todo created successfully!"            
            redirect_to todo_path(@todo)
        else
            render 'new', status: 500
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
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
    def todo_params
        params.require(:todo).permit(:name, :description)
    end

end
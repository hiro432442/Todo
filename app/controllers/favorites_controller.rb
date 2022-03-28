class FavoritesController < ApplicationController
    def create
        @favorite = current_user.favorites.create(todo_id: params[:todo_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @todo = Todo.find(params[:todo_id])
        @favorite = current_user.favorites.find_by(todo_id: @todo.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end


end

class DashboardController < ApplicationController
    def show
        @lists = List.where(user: current_user).includes(:pending_items).order(:position, :created_at)
        @to_do_items = current_user.pending_to_do_items.all
        @new_item = ListItem.new
        @new_to_do_item = ToDoItem.new

        to_do_item_array = @to_do_items.each_with_object([]) { |el, obj| obj[el.id] = el }
        gon.todo = to_do_item_array
        render 'dashboard/show'
    end

    private
    def list_params
        params.require(:list).permit(:title, :position)
    end
end

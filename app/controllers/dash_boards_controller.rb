# Controller class to Dashboard
class DashBoardsController < ApplicationController
  def index
    @work_orders = WorkOrder.all
  end
end

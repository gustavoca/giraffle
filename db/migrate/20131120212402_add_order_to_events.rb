class AddOrderToEvents < ActiveRecord::Migration
  def change
    add_column :events, :order, :integer
  end
end

class AddFinishedToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :finished, :boolean, default: false
  end
end

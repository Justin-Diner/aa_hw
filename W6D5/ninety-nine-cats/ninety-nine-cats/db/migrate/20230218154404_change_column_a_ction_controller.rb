class ChangeColumnACtionController < ActiveRecord::Migration[7.0]
  def change
		rename_column :cats, :action_controller, :color
  end
end

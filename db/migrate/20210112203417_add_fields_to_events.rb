class AddFieldsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :creator_id, :integer
    add_column :events, :name, :string
  end
end

class AddDescriptionToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :description, :string
    add_column :events, :location, :string
  end
end

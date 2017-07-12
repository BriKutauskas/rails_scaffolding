class AddColumnRegionToSighting < ActiveRecord::Migration[5.1]
  def change
    add_column :sightings, :region, :string
  end
end

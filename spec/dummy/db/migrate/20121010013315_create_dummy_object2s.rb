class CreateDummyObject2s < ActiveRecord::Migration
  def change
    create_table :dummy_object2s do |t|

      t.timestamps
    end
  end
end

class CreateDummyObject3s < ActiveRecord::Migration
  def change
    create_table :dummy_object3s do |t|

      t.timestamps
    end
  end
end

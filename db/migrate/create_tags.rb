class CreateTags < ActiveRecord::Migration
  def change
    create_table :simple_tags_tags do |t|
      t.string :name, null: false
    end
    add_index :simple_tags_tags, :name, unique: true
  end
end

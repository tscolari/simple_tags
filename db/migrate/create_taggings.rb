class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :simple_tags_taggings do |t|
      t.references :tag, null: false
      t.references :taggable, null: false, polymorphic: true
    end

    add_index :simple_tags_taggings, 
      [:tag_id, :taggable_type, :taggable_id], 
      name: 'taggings_unq_idx',
      unique: true

    add_index :simple_tags_taggings,
      [:taggable_type, :taggable_id],
      name: 'taggings_taggable_idx'
  end
end

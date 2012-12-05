module SimpleTags
  class Tagging < ActiveRecord::Base
    self.table_name = :simple_tags_taggings
    belongs_to :tag, class_name: 'SimpleTags::Tag', counter_cache: true
    belongs_to :taggable, polymorphic: true, inverse_of: :taggings

    validates :tag_id, uniqueness: { scope: [:taggable_type, :taggable_id] }
    validates :tag, :taggable, presence: true
  end
end

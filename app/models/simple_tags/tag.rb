module SimpleTags
  class Tag < ActiveRecord::Base
    self.table_name = :simple_tags_tags
    has_many :taggings, class_name: 'SimpleTags::Tagging', dependent: :destroy
    validates :name, uniqueness: true, presence: true

    attr_accessible :name
  end
end

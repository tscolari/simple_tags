module SimpleTags
  module Taggable
    extend ActiveSupport::Concern

    included do
      relation_name = self.name.underscore
      relation_class_name = self.name
      SimpleTags::Tag.class_eval do
        has_many "#{relation_name}_taggings".to_sym, class_name: 'SimpleTags::Tagging', conditions: ["taggable_type = ?", relation_class_name], foreign_key: 'tag_id'
        has_many relation_name.pluralize.to_sym, class_name: relation_class_name, through: "#{relation_name}_taggings".to_sym, source: "#{relation_name}_filter".to_sym
      end

      SimpleTags::Tagging.class_eval do
        belongs_to "#{relation_name}_filter".to_sym, class_name: relation_class_name, foreign_key: 'taggable_id'
      end

      has_many :taggings, as: 'taggable', dependent: :destroy, class_name: 'SimpleTags::Tagging'
      has_many :tags, through: :taggings, class_name: 'SimpleTags::Tag'
    end

    def tag_list
      tags.map(&:name).join(", ")
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        SimpleTags::Tag.where(name: n.strip).first_or_create!
      end
    end

  end
end

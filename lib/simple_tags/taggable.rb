module SimpleTags
  module Taggable
    extend ActiveSupport::Concern

    included do
      relation_name = self.name.underscore.gsub('/', '_')
      relation_class_name = self.name

      # Adds a relation in the Tag model for listing this type of taggables
      #
      SimpleTags::Tag.class_eval do
        has_many "#{relation_name}_taggings".to_sym, -> { where('taggable_type = ?', relation_class_name) }, class_name: 'SimpleTags::Tagging', foreign_key: 'tag_id'
        has_many relation_name.pluralize.to_sym, class_name: relation_class_name, through: "#{relation_name}_taggings".to_sym, source: "#{relation_name}_filter".to_sym
      end

      # Adds a relation in the Tagging model for listing this type of taggables
      # This relation exists only to serve the Tag model relation for this object
      #
      SimpleTags::Tagging.class_eval do
        belongs_to "#{relation_name}_filter".to_sym, class_name: relation_class_name, foreign_key: 'taggable_id'
      end

      has_many :taggings, as: 'taggable', dependent: :destroy, class_name: 'SimpleTags::Tagging', inverse_of: :taggable
      has_many :tags, through: :taggings, class_name: 'SimpleTags::Tag'
    end

    # Public: Return a comma-separated list of this model tags name
    #
    def tag_list
      tags.map(&:name).join(", ")
    end

    # Public: Sets the model tags
    # `names` must be a list of tag names, separated by commas
    #
    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        SimpleTags::Tag.where(name: n.strip).first_or_create!
      end
    end

  end
end

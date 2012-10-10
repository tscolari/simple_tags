class DummyObject < ActiveRecord::Base
  include SimpleTags::Taggable
  # attr_accessible :title, :body
end

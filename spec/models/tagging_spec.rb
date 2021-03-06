require 'spec_helper'

module SimpleTags
  describe Tagging do
    context "Dynamic Association" do
      describe "taggable_name relation filter" do
        it { should belong_to(:dummy_object_filter) }
        it { should belong_to(:dummy_object2_filter) }
        it { should_not belong_to(:dummy_object3_filter) }
      end
    end

    context "Validations" do
      it { should validate_presence_of(:tag) }
      it { should validate_presence_of(:taggable) }
    end
  end
end

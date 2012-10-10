require 'spec_helper'

module SimpleTags
  describe Tag do
    let(:dummy_object)  { FactoryGirl.create(:dummy_object) }
    let(:dummy_object2) { FactoryGirl.create(:dummy_object2) }
    let(:tag)           { FactoryGirl.create(:tag) }

    context "Dynamic Association" do
      describe "taggings dynamic association" do
        it { should have_many(:dummy_object_taggings)}
        it { should have_many(:dummy_object2_taggings)}
        it { should_not have_many(:dummy_object3_taggings)}
      end

      describe "taggable name dynamic association" do
        it { should have_many(:dummy_objects)}
        it { should have_many(:dummy_object2s)}
        it { should_not have_many(:dummy_object3s)}

        it "should filter only specific object types" do
          dummy_object.tags << tag
          dummy_object2.tags << tag

          tag.dummy_objects.include?(dummy_object).should be_true
          tag.dummy_objects.include?(dummy_object2).should be_false
        end
      end
    end

    context "Validations" do
      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
    end

  end
end

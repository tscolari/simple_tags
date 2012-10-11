require 'spec_helper'

describe DummyObject do
  subject { FactoryGirl.create(:dummy_object) }
  let(:tags) { FactoryGirl.create_list(:tag, 3) }

  describe "#tag_list" do
    it "should return a comma separated list of the model's tags" do
      subject.tags << tags
      subject.tag_list.should == tags.map(&:name).join(', ')
    end
  end

  describe "#tag_list=" do
    it "should receive a comma separated list of tags and associate it to the object" do
      subject.tag_list = tags.map(&:name).join(', ')
      subject.tags.should =~ tags
    end
  end

end

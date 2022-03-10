require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "test for post model" do
    subject do
      Post.new(
        title: 'title',
        text: 'text'
      )
    end
  
    it "should validate that attributes cannot be empty" do
      expect(subject).to be_valid
    end
  
    it "should validate that title cannot be empty" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  
    it "should validate that text cannot be empty" do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
  
  
end

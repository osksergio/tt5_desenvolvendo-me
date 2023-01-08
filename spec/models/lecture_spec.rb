require 'rails_helper'

RSpec.describe Lecture, type: :model do
  context "CRUD Lecture" do

    # create
    it 'Create Lecture' do
      lecture_type = Lecture.create(description: "Lecture: A", duration: 15, conference_id: 1, track_id: 1)
      expect(lecture_type.description).to eq("Lecture: A")
    end

    # update 1
    it 'Update Lecture 1' do
      lecture_type = Lecture.create(description: "Lecture: A", duration: 15, conference_id: 1, track_id: 2)
      lecture_type.update(track_id: 1)
      expect(lecture_type.track_id).to eq(1)
    end

    # update 2
    it 'Update Lecture 2' do
      lecture_type = Lecture.create(description: "Lecture: B", duration: 30, conference_id: 1, track_id: 3)
      lecture_type.update(duration: 60)
      expect(lecture_type.duration).to eq(60)
    end

    # field description required
    describe 'Required validations' do
      it { should validate_presence_of(:description) }
    end

    # length min. and max. - field description
    describe 'Maximum field size' do
      it { should validate_length_of(:description).is_at_least(3) }
      it { should validate_length_of(:description).is_at_most(200) }
    end

    # delete 1
    it 'Delete Lecture' do
      lecture_type = Lecture.create(description: "Lecture: B", duration: 30, conference_id: 1, track_id: 1)
      lecture_type.destroy
      expect{ lecture_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

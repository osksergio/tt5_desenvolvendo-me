require 'rails_helper'

RSpec.describe Track, type: :model do
  context "CRUD Track" do

    # create
    it 'Create Track' do
      track_type = Track.create(description: "Track A", conference_id: 1)
      expect(track_type.description).to eq("Track A")
    end

    # update 1
    it 'Update Track 1' do
      track_type = Track.create(description: "Track A", conference_id: 1)
      track_type.update(description: "Track AAA")
      expect(track_type.description).to eq("Track AAA")
    end

    # update 2
    it 'Update Track 2' do
      track_type = Track.create(description: "Track B", conference_id: 1)
      track_type.update(description: "Track BBB")
      expect(track_type.description).to eq("Track BBB")
    end

    # field description required
    describe 'Required validations' do
      it { should validate_presence_of(:description) }
    end

    # length min. and max. - field description
    describe 'Maximum field size' do
      it { should validate_length_of(:description).is_at_least(3) }
      it { should validate_length_of(:description).is_at_most(100) }
    end

    # delete 1
    it 'Delete Track' do
      track_type = Track.create(description: "Track A", conference_id: 1)
      track_type.destroy
      expect{ track_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    # delete 2
    it 'Delete Track' do
      track_type = Track.create(description: "Track B", conference_id: 1)
      track_type.destroy
      expect{ track_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

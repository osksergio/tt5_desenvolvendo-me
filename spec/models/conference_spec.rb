require 'rails_helper'

RSpec.describe Conference, type: :model do
  context "CRUD Conference" do

    # create
    it 'Create Conference' do
      conference_type = Conference.create(description: "Super Development Conference")
      expect(conference_type.description).to eq("Super Development Conference")
    end

    # update 1
    it 'Update Author 1' do
      conference_type = Conference.create(description: "Super Development Conference")
      conference_type.update(description: "Ultra Development Conference")
      expect(conference_type.description).to eq("Ultra Development Conference")
    end

    # update 2
    it 'Update Author 2' do
      conference_type = Conference.create(description: "Super Development Conference 2022")
      conference_type.update(description: "Ultra Development Conference 2023")
      expect(conference_type.description).to eq("Ultra Development Conference 2023")
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
    it 'Delete Conference' do
      conference_type = Conference.create(description: "Super Development Conference 2022")
      conference_type.destroy
      expect{ conference_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end

    # delete 2
    it 'Delete Conference' do
      conference_type = Conference.create(description: "Development Conference 2022-2023")
      conference_type.destroy
      expect{ conference_type.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

require 'rails_helper'

describe Event do
  let(:event) { Event.create! {} }

  describe '.num_yeses' do
    it 'calulates 0 for empty votes' do
      expect(event.num_yeses).to eql(0)
    end

    it 'calulates 0 for only no votes' do
      event.votes.push Vote.create!(vote: 'No')
      expect(event.num_yeses).to eql(0)
    end

    it 'calulates > 0 for yes votes' do
      event.votes.push Vote.create!(vote: 'Yes')
      event.votes.push Vote.create!(vote: 'Yes')
      event.votes.push Vote.create!(vote: 'No')

      expect(event.num_yeses).to eql(2)
    end
  end

  describe '.num_nos' do
    it 'calulates 0 for empty votes' do
      expect(event.num_nos).to eql(0)
    end

    it 'calulates 0 for only no votes' do
      event.votes.push Vote.create!(vote: 'Yes')
      expect(event.num_nos).to eql(0)
    end

    it 'calulates > 0 for no votes' do
      event.votes.push Vote.create!(vote: 'No')
      event.votes.push Vote.create!(vote: 'No')
      event.votes.push Vote.create!(vote: 'No')

      expect(event.num_nos).to eql(3)
    end
  end
end

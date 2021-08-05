require 'diary'

describe Diary do

  context 'locked' do
    describe '.add_entry' do
      it 'should throw an error' do
        expect{ subject.add_entry("TEST") }.to raise_error "This diary is locked."
      end
    end

    describe '.get_entries' do
      it 'should throw an error' do
        expect{ subject.get_entries }.to raise_error "This diary is locked."
      end
    end
  end

  context 'unlocked' do
    before(:each) do
      subject.unlock
    end
    
    describe '.add_entry' do
      it 'should add an entry' do
        expect{ subject.add_entry("TEST") }.to change { subject.entries.length }.by(1)
      end
    end

    describe '.get_entries' do
      it 'should return all entries' do
        subject.add_entry("TEST1")
        subject.add_entry("TEST2")
        expect(subject.entries).to eq ["TEST1", "TEST2"]
      end
    end
  end
end

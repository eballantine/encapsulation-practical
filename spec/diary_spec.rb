require 'diary'

describe SecretDiary do
  context '.initialize' do
    it 'should be locked' do
      expect(subject.locked).to be true
    end
  end

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

    describe '.unlock' do
      it 'should unlock the diary' do
        subject.unlock
        expect(subject.locked).to be false
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
        expect(subject.get_entries).to eq ["TEST1", "TEST2"]
      end
    end

    describe '.lock' do
      it 'should lock the diary' do
        subject.lock
        expect(subject.locked).to be true
      end
    end
  end
end
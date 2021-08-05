require 'lock'

describe Lock do
  let(:diary) { instance_double(Diary)}

  context '.initialize' do
    it 'should be locked' do
      expect(subject.locked).to be true
    end
  end

  context 'locked' do
    describe '.unlock' do
      it 'should unlock the diary' do
        expect{ subject.unlock }.to change { subject.locked }.from(true).to(false)
      end
    end
  end

  context 'unlocked' do
    describe '.lock' do
      it 'should lock the diary' do
        subject.unlock
        expect{ subject.lock }.to change { subject.locked }.from(false).to(true)
      end
    end
  end
end

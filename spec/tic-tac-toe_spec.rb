require_relative '../tic-tac-toe'

describe Game do
  it { is_expected.to respond_to(:play) }
end

describe Board do
  it { is_expected.to respond_to(:fields) }

  describe 'set' do
    it 'sets field to given value' do
      expect { subject.set(3, 'X') }.to change { subject.fields[3] }.from(' ').to('X')
    end
  end
end

require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe '#attack!' do
    it 'raises an error if attacking opponent is not a Robot' do
      @item = Item.new('Some item', 500)
      expect { @robot.attack!(@item) }. to raise_error(EnemyError, 'you are attacking the wrong thing')
    end
  end
end

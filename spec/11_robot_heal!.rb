require_relative 'spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

describe '#heal!' do
  it 'raises an error if healing the dead' do
    @robot.health = 0
    expect { @robot.heal!(30) }. to raise_error(RobotError, 'can not raise the dead')
    end
  end
end

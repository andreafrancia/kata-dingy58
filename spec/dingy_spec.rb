describe do
  it { expect(remaining_time '9:25', '9:00').to eq(25*60) }
  it { expect(remaining_time '9:25', '9:25').to eq(0*60) }
  it { expect(remaining_time '9:26', '9:25').to eq(1*60) }
end
describe do
  it do
    expect(format_time -1).to eq('Rang!')
    expect(format_time 0).to eq('00:00')
    expect(format_time 1).to eq('00:01')
    expect(format_time 10).to eq('00:10')
    expect(format_time 4*60 + 10).to eq('04:10')
  end
end
describe do
  it do
    expect(format_remaining_time('9:00', '9:25')).to eq('25:00')
  end
end
require 'dingy'

describe 'the dingy executable' do
  let(:env) { {} }
  it 'print remaining time' do
    env['NOW'] = '9:00'
    File.write('next_alarm.txt', '9:25')

    out = run_command 'bin/dingy'

    expect(out).to eq('25:00')
  end
  before do
    require 'fileutils'
    FileUtils.rm_f 'next_alarm.txt'
  end
  it 'start the timer' do
    env['NOW'] = '9:00'

    out = run_command 'bin/dingy --start'

    expect(out).to eq('')
    expect(File.exists?('next_alarm.txt')).to eq(true)
    require 'time'
    expect(Time.parse(File.read('next_alarm.txt'))).
      to eq(Time.parse('9:25'))
  end
  def run_command command
    require 'open3'
    out, _ = Open3.capture2e(env, command)
    out.chomp
  end
end

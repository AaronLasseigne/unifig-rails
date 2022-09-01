RSpec.describe Unifig::ConfigGenerator do
  it 'adds a generator to Rails' do
    expect(rails('generate')).to include 'unifig:config'
  end

  it 'writes the file out' do
    rails('generate unifig:config')
    content = in_rails do
      File.read(Unifig::Rails::CONFIG_PATH)
    end

    expect(content).to eql <<~YML
      unifig:
        providers: local


    YML
  end

  context 'with an existing file' do
    before do
      write_config(<<~YML)
        unifig:
          providers: local

        ONE:
          value: 1
      YML
    end

    it 'fails' do
      rails('generate unifig:config')
      content = in_rails do
        File.read(Unifig::Rails::CONFIG_PATH)
      end

      expect(content).to include 'ONE'
    end
  end
end

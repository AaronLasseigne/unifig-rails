# frozen_string_literal: true

RSpec.describe Unifig::Railtie do
  context 'before_configure' do
    before do
      write_config(<<~YML)
        config:
          envs:
            development:
              providers: local

        FOO:
          value: 'foo'
      YML
    end

    it 'writes to Unifig' do
      expect(rails_runner('print Unifig.foo')).to eql 'foo'
    end
  end
end

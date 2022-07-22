# frozen_string_literal: true

RSpec.describe Unifig::Railtie do
  context 'before_configure' do
    context 'without a config' do
      it 'does nothing' do
        expect(rails('runner "print Unifig.respond_to?(:foo)"')).to eql 'false'
      end
    end

    context 'with a config' do
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
        expect(rails('runner "print Unifig.foo"')).to eql 'foo'
      end
    end
  end
end

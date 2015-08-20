shared_examples 'stub_env tests' do
  before :each do
    ENV['UNSTUBBED'] = 'unstubbed'
  end

  describe '#[]' do
    context 'with a single stubbed variable' do
      before :each do
        stub_env('TEST', 'success')
      end
      it 'stubs out environment variables' do
        expect(ENV['TEST']).to eq 'success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV['UNSTUBBED']).to eq 'unstubbed'
      end
    end

    context 'with multiple stubbed variables' do
      before :each do
        stub_env('TEST', 'success')
        stub_env('TEST2', 'another success')
      end

      it 'stubs out the first variable' do
        expect(ENV['TEST']).to eq 'success'
      end

      it 'stubs out the second variable' do
        expect(ENV['TEST2']).to eq 'another success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV['UNSTUBBED']).to eq 'unstubbed'
      end
    end

    context 'with multiple stubbed variables in a hash' do
      before :each do
        stub_env({'TEST' => 'success', 'TEST2' => 'another success'})
      end

      it 'stubs out the first variable' do
        expect(ENV['TEST']).to eq 'success'
      end

      it 'stubs out the second variable' do
        expect(ENV['TEST2']).to eq 'another success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV['UNSTUBBED']).to eq 'unstubbed'
      end
    end

    context 'with existing environment variables' do
      before :each do
        ENV['TO_OVERWRITE'] = 'to overwrite'
      end

      it 'returns the original value' do
        expect(ENV['TO_OVERWRITE']).to eq 'to overwrite'
      end

      it 'allows the original value to be stubbed' do
        stub_env('TO_OVERWRITE', 'overwritten')
        expect(ENV['TO_OVERWRITE']).to eq 'overwritten'
      end

      it 'allows the original value to be stubbed with nil' do
        stub_env('TO_OVERWRITE', nil)
        expect(ENV['TO_OVERWRITE']).to be_nil
      end
    end
  end

  describe '#fetch' do
    context 'with a single stubbed variable' do
      before :each do
        stub_env('TEST', 'success')
      end
      it 'stubs out environment variables' do
        expect(ENV.fetch('TEST')).to eq 'success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV.fetch('UNSTUBBED')).to eq 'unstubbed'
      end
    end

    context 'with multiple stubbed variables' do
      before :each do
        stub_env('TEST', 'success')
        stub_env('TEST2', 'another success')
      end

      it 'stubs out the first variable' do
        expect(ENV.fetch('TEST')).to eq 'success'
      end

      it 'stubs out the second variable' do
        expect(ENV.fetch('TEST2')).to eq 'another success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV.fetch('UNSTUBBED')).to eq 'unstubbed'
      end
    end

    context 'with multiple stubbed variables in a hash' do
      before :each do
        stub_env({'TEST' => 'success', 'TEST2' => 'another success'})
      end

      it 'stubs out the first variable' do
        expect(ENV.fetch('TEST')).to eq 'success'
      end

      it 'stubs out the second variable' do
        expect(ENV.fetch('TEST2')).to eq 'another success'
      end

      it 'leaves original environment variables unstubbed' do
        expect(ENV.fetch('UNSTUBBED')).to eq 'unstubbed'
      end
    end

    context 'with existing environment variables' do
      before :each do
        ENV['TO_OVERWRITE'] = 'to overwrite'
      end

      it 'returns the original value' do
        expect(ENV.fetch('TO_OVERWRITE')).to eq 'to overwrite'
      end

      context 'stubbed with a value' do
        it 'allows the original value to be stubbed' do
          stub_env('TO_OVERWRITE', 'overwritten')
          expect(ENV.fetch('TO_OVERWRITE')).to eq 'overwritten'
        end

        it 'returns the stubbed value even if a default is specified' do
          stub_env('TO_OVERWRITE', 'overwritten')
          expect(ENV.fetch('TO_OVERWRITE', 'DEFAULT')).to eq 'overwritten'
        end
      end

      context 'stubbed with nil' do
        before :each do
          stub_env('TO_OVERWRITE', nil)
        end

        it 'returns nil' do
          expect(ENV.fetch('TO_OVERWRITE')).to be_nil
        end

        it 'returns the default if specified' do
          expect(ENV.fetch('TO_OVERWRITE', 'DEFAULT')).to eq 'DEFAULT'
        end
      end
    end
  end
end

shared_examples 'stub_env tests' do
  before :each do
    ENV['UNSTUBBED'] = 'unstubbed'
  end

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

  describe 'with existing environment variables' do
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

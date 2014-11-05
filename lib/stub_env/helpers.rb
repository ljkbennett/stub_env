module StubEnv
  module Helpers

    def stub_env key, value
      init_stub unless env_stubbed?
      allow(ENV).to receive(:[]).with(key).and_return(value)
    end

    private

    def env_stubbed?
      ENV.respond_to?(:stubbed?) && ENV.stubbed?
    end

    def init_stub
      allow(ENV).to receive(:stubbed?).and_return(true)
      allow(ENV).to receive(:[]).and_call_original
    end
    
  end
end
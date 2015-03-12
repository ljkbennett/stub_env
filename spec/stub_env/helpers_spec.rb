require "spec_helper"

describe StubEnv::Helpers do
  include described_class
  
  before :each do
    ENV['UNSTUBBED'] = 'unstubbed'
  end

  describe "#stub_env" do

    include_examples 'stub_env tests'

    if RSpec::Mocks::Configuration.public_instance_methods.include? :verify_partial_doubles=
      context "with the verify partial doubles option set" do

        before :each do
          RSpec.configuration.mock_with :rspec do |mocks|
            mocks.verify_partial_doubles = true
          end
        end

        include_examples 'stub_env tests'  
      end
    end
  end
end
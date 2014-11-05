require "spec_helper"

describe StubEnv::Helpers do
  include described_class

  describe "#stub_env" do

    before :each do
      ENV['UNSTUBBED'] = 'unstubbed'
      stub_env('TEST', 'success')
    end

    context "with a single stubbed variable" do
      it "stubs out environment variables" do
        expect(ENV['TEST']).to eq 'success'
      end

      it "leaves original environment variables unstubbed" do
        expect(ENV['UNSTUBBED']).to eq 'unstubbed'
      end
    end

    context "with multiple stubbed variables" do
      before :each do
        stub_env('TEST2', 'another success')
      end

      it "stubs out the first variable" do
        expect(ENV['TEST']).to eq 'success'
      end

      it "stubs out the second variable" do
        expect(ENV['TEST2']).to eq 'another success'
      end

      it "leaves original environment variables unstubbed" do
        expect(ENV['UNSTUBBED']).to eq 'unstubbed'
      end
    end
  end
end
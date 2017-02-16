require 'spec_helper'
require 'whatmask'

describe Whatmask do
  subject do
    Whatmask.const_get('VERSION')
  end

  context "when checking version constant" do
    it { should_not be_empty }
  end
end

describe Whatmask do
  subject do
    Whatmask.new(mask)
  end

  describe "#new" do
    describe "Create a new Whatmask object" do
      context "when given a CIDR notation mask" do
        let(:mask) { "24" }
        it { should be_a Whatmask }
      end
      context "when given a hexadecimal mask" do
        let(:mask) { "0xffffff00" }
        it { should be_a Whatmask }
      end
      context "when given a typical subnet mask" do
        let(:mask) { "255.255.255.0" }
        it { should be_a Whatmask }
      end
    end
  end
end

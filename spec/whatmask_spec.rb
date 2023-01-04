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
    Whatmask.new(mask, address)
  end

  describe "#new" do
    describe "Create a new Whatmask object" do
      context "when given a CIDR notation mask" do
        let(:mask) { "24" }
        let(:address) { nil }
        it { should be_a Whatmask }
      end
      context "when given a hexadecimal mask" do
        let(:mask) { "0xffffff00" }
        let(:address) { nil }
        it { should be_a Whatmask }
      end
      context "when given a typical subnet mask" do
        let(:mask) { "255.255.255.0" }
        let(:address) { nil }
        it { should be_a Whatmask }
      end
      context "when given a an IP and mask" do
        let(:mask) { "255.255.255.0" }
        let(:address) { "192.168.1.1" }
        it { should be_a Whatmask }
        it "should return the correct ip address" do
          expect(subject.address).to eq("192.168.1.1")
        end
        it "should return the correct network address" do
          expect(subject.network).to eq("192.168.1.0")
        end
        it "should return the correct broadcast address" do
          expect(subject.broadcast).to eq("192.168.1.255")
        end
        it "should return the correct first usable address" do
          expect(subject.first).to eq("192.168.1.1")
        end
        it "should return the correct last usable address" do
          expect(subject.last).to eq("192.168.1.254")
        end
        it "should return the correct mask" do
          expect(subject.mask).to eq("255.255.255.0")
        end
        it "should return the correct inverse mask" do
          expect(subject.inverse).to eq("0.0.0.255")
        end
        it "should return the correct hex mask" do
          expect(subject.hex).to eq("0xffffff00")
        end
        it "should return the correct cidr notation mask" do
          expect(subject.cidr).to eq(24)
        end
        it "should return the correct number of usable addresses" do
          expect(subject.avail).to eq(254)
        end
      end
    end
  end
end

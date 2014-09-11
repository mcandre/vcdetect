require "spec_helper"

$count = 0

describe Moe::Sequence::Collection do
  let(:count)      { $count += 1 }
  let(:name)       { "collection_test#{count}" }
  let!(:setup)     { Moe::Sequence.setup name, 2, 5, 10 }
  let(:collection) { Moe::Sequence::Collection.new name, "owner" }
  let(:collector)  { Moe::Sequence::Collector.new  name, "owner" }

  describe "#find" do
    it "gets the requested sequence" do
      write_tables, timestamp, uid, kount = collector.save({ "baz" => "bat" })

      sequence = collection.find write_tables.first, timestamp, uid

      expect( sequence.payload ).to eq({ "baz" => "bat" })
    end
  end

  describe "#sequences" do
    it "gets all sequences for a given owner" do
      collector.save({ "foo" => "bar" })

      expect(
        collection.sequences.first.payload
      ).to eq({ "foo" => "bar"})
    end
  end
end

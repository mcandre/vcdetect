require "spec_helper"

describe Moe::Sequence::Finder do
  let(:count)      { $count += 1 }
  let(:owner_id)   { "owner" }
  let(:name)       { "finder_test#{count}" }
  let!(:setup)     { Moe::Sequence.setup name, 2, 5, 10 }
  let(:collection) { Moe::Sequence::Collection.new name, owner_id }
  let(:collector)  { Moe::Sequence::Collector.new  name, owner_id }

  describe ".find" do
    it "retrieves a sequence given a composite key" do
      write_tables, timestamp, uid, kount = collector.save({ "free" => "bird" })

      composite_key = "#{write_tables.first}.#{owner_id}.#{timestamp}.#{uid}"

      sequence = Moe::Sequence::Finder.find name, composite_key

      expect( sequence.payload ).to eq({ "free" => "bird" })
    end
  end
end

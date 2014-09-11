module Moe
  module Sequence
    class Collector
      attr_accessor :dyna, :flushed_count, :payloads
      attr_reader   :owner_id, :write_tables, :timestamp, :uid

      def initialize(name, owner_id)
        @dyna          = Dyna.new
        @flushed_count = 0
        @payloads      = []
        @owner_id      = owner_id
        @timestamp     = generate_timestamp
        @uid           = SecureRandom.uuid
        @write_tables  = Moe.config.tables[name].last
      end

      def add(payload={})
        payloads << payload

        if payloads.size >= Moe.config.batch_limit
          items = keyify payloads
          flush items

          self.payloads = []
        end
      end

      def save(payload={})
        metadata_item = {
          "count"    => (payloads.size + flushed_count).to_s,
          "payload"  => MultiJson.dump(payload)
        }.merge Locksmith.itemize owner_id, payload, 0, timestamp, uid

        items = keyify payloads

        items << metadata_item

        flush items
      end

      private

      def flush(items)
        result = dyna.batch_write_item write_tables, items

        self.flushed_count += items.size

        [write_tables, timestamp, uid, flushed_count]
      end

      def generate_timestamp
        (Time.now.to_f * 1000000000).to_i
      end

      def keyify(items)
        count = flushed_count
        items.each do |item|
          count += 1
          item.update Locksmith.key owner_id, count, timestamp, uid
        end
      end
    end
  end
end

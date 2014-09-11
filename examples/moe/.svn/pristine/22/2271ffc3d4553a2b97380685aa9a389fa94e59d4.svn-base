module Moe
  module Sequence
    class Collection
      attr_accessor :dyna
      attr_reader   :owner_id, :read_tables

      def initialize(name, owner_id)
        @dyna         = Dyna.new
        @owner_id     = owner_id
        @read_tables  = Moe.config.tables[name].first
      end

      def find(table_name, timestamp, uid)
        key = Locksmith.key(owner_id, 0, timestamp, uid)

        item = dyna.get_item [table_name], key

        process(table_name, item)
      end

      def sequences
        [].tap do |results|
          read_tables.each do |table_name|

            dyna.dynamodb.query(request table_name).items.each do |item|
              results << process(table_name, item)
            end

          end
        end
      end

      private

      def process(table_name, item)
        sequence_id, timestamp, uid = item["range"].s.split(".")

        MetadataItem.new( table_name,
                          owner_id,
                          timestamp,
                          uid,
                          item["count"].s.to_i,
           MultiJson.load(item["payload"].s) )
      end

      def request(table_name)
        {
          table_name: table_name,
          key_conditions: {
            hash: {
              attribute_value_list: [
                { s: owner_id }
              ],
              comparison_operator: "EQ"
            },
            range: {
              attribute_value_list: [
                { s: "0" }
              ],
              comparison_operator: "BEGINS_WITH"
            }
          }
        }
      end
    end
  end
end

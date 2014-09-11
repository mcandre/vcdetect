module Moe
  module Sequence
    module Finder

      module ModuleFunctions
        def find(name, composite_key)
          table_name, owner_id, timestamp, uid = composite_key.split(".")

          collection = Moe::Sequence::Collection.new name, owner_id

          collection.find table_name, timestamp, uid
        end
      end
      extend ModuleFunctions

    end
  end
end
module Moe
  module Sequence
    module Locksmith

      module ModuleFunctions
        def itemize(owner_id, payload, sequence_id, timestamp, uid)
          {
            "hash"    => owner_id,
            "range"   => "#{sequence_id}.#{timestamp}.#{uid}",
            "payload" => MultiJson.dump(payload)
          }
        end

        def key(owner_id, sequence_id, timestamp, uid)
          {
            "hash"    => owner_id,
            "range"   => "#{sequence_id}.#{timestamp}.#{uid}"
          }
        end
      end
      extend ModuleFunctions

    end
  end
end
module ThinkingSphinx
  module Deltas
    class DeltaJob
      attr_accessor :index
      
      def initialize(index)
        @index = index
      end
      
      def perform
        return true unless ThinkingSphinx.updates_enabled? &&
          ThinkingSphinx.deltas_enabled?
        
        config = ThinkingSphinx::Configuration.instance
        client = ThinkingSphinx.create_client(config)

        output = `#{config.bin_path}indexer --config #{config.config_file} --rotate #{index}`
        puts output unless ThinkingSphinx.suppress_delta_output?
        
        true
      end
    end
  end
end

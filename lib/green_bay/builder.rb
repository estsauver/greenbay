require 'json'

module GreenBay
  class Builder

    def initialize(opts = {})
      @opts = opts
      check_required_keys
    end

    def to_json(*a)
      defaults.merge(@opts)
        .to_json(*a)
    end

    def parse_output(result_string)
      raise NotImplementedError.new
    end

    private

    def required_keys
      []
    end

    def defaults
      {:type => type}
    end

    def type
      raise NotImplementedError.new
    end

    def check_required_keys
      required_keys.each do |k|
        if @opts[k].nil?
          raise "Missing Option #{k.to_s}"
        end
      end
    end
  end
end


require 'green_bay/builders/digital_ocean_builder'
require 'green_bay/builders/virtualbox_builder'

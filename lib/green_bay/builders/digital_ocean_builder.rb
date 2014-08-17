require 'json'

module GreenBay
  class DigitalOceanBuilder < Builder

    def initialize(opts = {})
      opts[:api_key] ||= ENV["DO_API_KEY"]
      opts[:client_id] ||= ENV["DO_CLIENT_ID"]
      super(opts)
    end

    def parse_output(string_outputs)
      do_result = string_output.lines.find do |line|
        items = line.split(",")
        items.include?("artifact") && items.include?("id")
      end.split(",").last.split(":").last.strip
      return {do_image: do_result}
    end

    private

    def defaults
      super.merge({
        "region" => "nyc2"
      })
    end

    def type
      "digitalocean"
    end

    def required_keys
      super + [:api_key, :client_id]
    end

    def check_required_keys
      [:api_key, :client_id].each do |k|
        if @opts[k].nil?
          raise "Missing Option #{k.to_s}"
        end
      end
    end

  end
end

require 'json'

module GreenBay
  class Packer

    attr_accessor :variables, :builders, :provisioners, :postprocessors

    def initialize
      @variables = {}
      @builders = []
      @provisioners = []
      @postprocessors = []
    end

    def config
      yield self
    end

    def to_json(*a)
      {
        "variables" => @variables,
        "builders" => @builders,
        "provisioners" => @provisioners,
        "post-processors" => @postprocessors
      }
        .reject {|k,v| v.nil? || v.empty?}
        .to_json(*a)
    end

    def parse_output(string_output)
      results = []
      @builders.each do |builder|
        results << builder.parse_output(string_output)
      end
      return results
    end
  end
end

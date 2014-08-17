require 'json'

## Not used or tested currenty. I've been using ruby variables instead of
## the packer vars. 
module GreenBay
  class Variables
    def initialize(vars = {})
      @vars = vars
    end

    def to_json(*a)
      @vars.to_json(*a)
    end
  end
end

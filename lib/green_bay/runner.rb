module GreenBay
  class Runner
    attr_reader :packer

    def initialize(packer)
      @packer = packer
    end

    def generate_images
      @packer_output = `packer build -machine-readable #{packer_file}`
      packer.parse_output(@packer_output)
    end

    private

    def packer_file
      file = Tempfile.new("packer_build", "./")
      file.write(packer.to_json)
      file.rewind
      file.path
    end
  end
end
#puts packer.to_json
#puts Runner.new(packer).generate_images

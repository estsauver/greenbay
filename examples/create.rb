require 'dotenv'

Dotenv.load
packer = Packer.new

packer.config do |p|
  p.builders = [VirtualboxBuilder.new]
  p.postprocessors << VagrantPostProcessor.new
end

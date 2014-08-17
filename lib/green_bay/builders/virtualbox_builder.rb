module GreenBay
  class VirtualboxBuilder < Builder

    def initialize(opts = {})
      super(opts)
    end


    def parse_output(output)
      puts output
    end

    private

    def defaults
      super.merge(
        {
          :guest_os_type => "Ubuntu_64",
          :iso_url => "http://releases.ubuntu.com/14.04.1/ubuntu-14.04.1-server-amd64.iso",
          :iso_checksum => "ca2531b8cd79ea5b778ede3a524779b9",
          :iso_checksum_type => "md5",
          :ssh_username => "packer",
          :ssh_password => "packer",
          :ssh_wait_timeout => "30s",
          :shutdown_command => "echo 'packer' | sudo -S shutdown -P now"
        }
      )
    end

    def required_keys
      []
    end

    def type
      "virtualbox-iso"
    end

  end
end

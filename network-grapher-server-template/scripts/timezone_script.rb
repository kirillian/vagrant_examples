module TimezoneScript
  def set_timezone_script(timezone)
    <<-SCRIPT
      #!/bin/bash
      # set timezone
      echo "#{timezone}" > /etc/timezone
      dpkg-reconfigure -f noninteractive tzdata
    SCRIPT
  end
end

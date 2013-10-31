require 'facter'
Facter.add(:haproxyrunning) do
	setcode do
		Facter::Util::Resolution.exec("/bin/ps -ef | /bin/grep haproxy | /bin/grep -E -v \\(grep\\|facter\\|sh\\|vim\\) | wc -l")
	end
end

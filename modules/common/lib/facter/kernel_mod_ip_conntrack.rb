require 'facter'
Facter.add(:kernel_mod_ip_conntrack) do
        setcode do
                Facter::Util::Resolution.exec("/sbin/lsmod | grep ip_conntrack | grep -v grep | wc -l")
        end
end

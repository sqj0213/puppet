require 'facter'
Facter.add(:kernel_mod_nf_conntrack) do
        setcode do
                Facter::Util::Resolution.exec("/sbin/lsmod | grep nf_conntrack | grep -v grep | wc -l")
        end
end


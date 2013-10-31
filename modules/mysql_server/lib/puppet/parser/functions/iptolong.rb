module Puppet::Parser::Functions
  newfunction(:ip, :type => :rvalue) do |args|
	ip = args[0]
	long = 0
	if ip.is_a?(String)
		ip.split(/\./).each_with_index do |b, i|
			long += b.to_i << ( 8*i )
		end
	end
	return long
  end
end

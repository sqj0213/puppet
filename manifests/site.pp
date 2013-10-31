import "node.pp"
import "modules.pp"
node default{
	class{common:hosts=>'bj'}	
	include user
	#include ssh_server
}

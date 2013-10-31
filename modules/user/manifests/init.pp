class user{ 
	user{ 'chunsheng':
		ensure		=> 'present',
    		home       	=> '/home/chunsheng',
    		managehome 	=> true,
		shell           => '/bin/bash',
    		groups     	=> ['wheel'],
    		password   	=> '$6$MyNu5eCR$rMx4Rz1WH3CfNNf4zLOeneI3aZQ8sDO14Tv6iGFHmz6iUhVB2T/RwduEKV7d2kf11vExvNxRLU/PbpXj0rFJI.'
	}
	user{ 'zhanghe':
                ensure          => 'present',
                home            => '/home/zhanghe',
                managehome      => true,
                shell           => '/bin/bash',
                groups          => ['wheel'],
                password        => '$6$DXnSiN/C$uCen5i8Zgu51DmERHIew/73pWGi16//LfwoeQfZ5enf.5zSKIL35Fcd07kd4isyl.MiMq3E5t847IPUGd6/BI/'
        }
	user{ 'duankai':
                ensure          => 'present',
                home            => '/home/duankai',
                managehome      => true,
                shell           => '/bin/bash',
                groups          => ['wheel'],
                password        => '$6$jwOL/Rg9$HYv9JPeUxWqguc8EFXpY5zYQq5.mrztd8W89ikhS72QW2sk0DaATeZU9yqwiy.vso0VbJR/4cHiH42K9l8seA/'
        }
#        user{ 'wangjincai':
#                ensure          => 'present',
#                home            => '/home/wangjincai',
#                managehome      => true,
#                shell           => '/bin/bash',
#                groups          => ['wheel'],
#                password        => '$6$XPOIoKIS$X1Ps6kzZUMe2gFOce9Zb0pIzgK5zy16QKcWVQRMX7YpFoZ4Qv/myKfVF7vM42Xr/hZwom3mevSKpOuK4WXFFL.'
#        }
        user{ 'wanbaoguang':
                ensure          => 'present',
                home            => '/home/wanbaoguang',
                managehome      => true,
                shell           => '/bin/bash',
                groups          => ['wheel'],
                password        => '$6$t3j72Xt.$sbkyZ0zGjpwRt.nFuvqYvwJACDGkCHDiOzqfLhh61oX4JWg2RsYI21JWbMV55Y3SnBnsTTJx/Imi.YoUcxTHj/'
        }
}

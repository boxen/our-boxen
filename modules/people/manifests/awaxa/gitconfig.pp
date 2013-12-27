class people::awaxa::gitconfig {
  
  git::config::global { 'user.name':
    value => 'Greg Kitson',
  }
  
  git::config::global { 'user.email':
    value => 'greg.kitson@gmail.com',
  }
  
  git::config::global { 'color.ui':
    value => 'auto',
  }
  
  git::config::global { 'github.user':
    value => 'awaxa',
  }
  
  git::config::global { 'push.default':
    value => 'simple',
  }
  
  git::config::global { 'alias.a':
    value => 'add',
  }
  
  git::config::global { 'alias.aa':
    value => 'add -A',
  }
  
  git::config::global { 'alias.bv':
    value => 'branch -avv',
  }
  
  git::config::global { 'alias.co':
    value => 'checkout',
  }
  
  git::config::global { 'alias.c':
    value => 'commit',
  }
  
  git::config::global { 'alias.ca':
    value => 'commit -a',
  }
  
  git::config::global { 'alias.m':
    value => 'commit -m',
  }
  
  git::config::global { 'alias.cam':
    value => 'commit -a -m',
  }
  
  git::config::global { 'alias.d':
    value => 'diff',
  }
  
  git::config::global { 'alias.ds':
    value => 'diff --stat',
  }
  
  git::config::global { 'alias.l':
    value => 'log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit --date=relative',
  }
  
  git::config::global { 'alias.l1':
    value => 'log --pretty=oneline',
  }
  
  git::config::global { 'alias.s':
    value => 'status',
  }
  
}

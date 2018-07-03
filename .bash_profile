# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH: \
$HOME/.local/bin: \ 
$HOME/bin: \
/usr/local/maven/bin: \ 
/usr/local/node-v6.6.0-linux-x64/bin
export PATH

export M2_HOME=/usr/local/maven

if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH
  # export PATH=/usr/local/share/npm/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/Users/zaknitsch/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
  ZSH_THEME="geometry/geometry"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
  plugins=(git)

  source $ZSH/oh-my-zsh.sh

# User configuration

# maintain separate history per-pane
unsetopt inc_append_history
unsetopt share_history

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
  export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
  alias zshconfig="emacs ~/.zshrc"
  alias lla="ls -la"


# Homebrew Token
  export HOMEBREW_GITHUB_API_TOKEN=
  
# GEOMETRY THEME COLOURS
  GEOMETRY_COLOR_EXIT_VALUE="magenta"         # prompt symbol color when exit value is != 0
  GEOMETRY_COLOR_PROMPT="white"               # prompt symbol color
  GEOMETRY_COLOR_ROOT="red"                   # root prompt symbol color
  GEOMETRY_COLOR_DIR="blue"                   # current directory color

# GEOMETRY THEME SETTINGS
  PROMPT_GEOMETRY_EXEC_TIME="true"

# Hide Java icon from dock (seems ineffective)
  export JAVA_TOOL_OPTIONS="-Dapple.awt.UIElement=true"

# AWS CREDS
  export EC2_REGION="eu-west-1"
  export AWS_CONFIG_FILE=~/.aws/credentials

# mkdir and cd fn
  mkcdir() {
      mkdir -p -- "$1" &&
          cd -P -- "$1"
  }

# custom find/replace for specific file/placeholders
  cvl() {
      from_file="zn_coverletter_2020.txt"
      company_underscored=${${2}// /_}
      to_file="zn_coverletter_${company_underscored}.txt"

      # check if previous file exists
      if [ -e $to_file ];
      then to_file="zn_coverletter_${2}_2.txt";
      fi

      # specific addressee?
      if [ -z "$3" ];
      then
          addressee="To Whom It May Concern"
      else
          addressee="Dear ${3}"
      fi
      # replace placeholders with fn params
      sed -e "s/\${ROLE}/$1/" -e "s/\${COMPANY}/$2/" -e "s/\${ADDRESSEE}/$addressee/" $from_file > $to_file
      # display file contents for easy copy/paste
      cat $to_file
  }

# some path stuff
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# android platform tools on path
  export PATH="/Users/zaknitsch/android/platform-tools:$PATH"

# smlnj
  export PATH="/usr/local/smlnj/bin/:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"

# Add GOPATH to PATH with $GOPATH/bin
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$GOPATH/bin

# HH NPM token
  export NPM_TOKEN=

# add homebrew curl to PATH
  export PATH="/usr/local/opt/curl/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH
  export PATH=/usr/local/share/npm/bin:$PATH

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
 ENABLE_CORRECTION="true"

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
 plugins=(
     git
	   z
	   zsh-syntax-highlighting)

 source $ZSH/oh-my-zsh.sh

# User configuration 

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

# Unset sharing command history between tabs
  unsetopt inc_append_history
  unsetopt share_history
  
# ssh
  export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
  alias zshconfig="emacs ~/.zshrc"
  alias ohmyzsh="emacs ~/.oh-my-zsh"

# Homebrew Token
  export HOMEBREW_GITHUB_API_TOKEN=67a51c803c77e1e5d33958ca972f2330ab801fdc
  
# GEOMETRY THEME COLOURS
# there are some reserved names, or you can use 0-padded 3-digit numbers from 000-255  
  GEOMETRY_COLOR_EXIT_VALUE="magenta"     # prompt symbol color when exit value is != 0
  GEOMETRY_COLOR_PROMPT="white"           # prompt symbol color
  GEOMETRY_COLOR_ROOT="red"               # root prompt symbol color
  GEOMETRY_COLOR_DIR=067                  # current directory color

# GEOMETRY THEME SETTINGS
  PROMPT_GEOMETRY_EXEC_TIME="true"
  
# AWS CREDS
  export AWS_ACCESS_KEY_ID=""
  export AWS_SECRET_ACCESS_KEY=""
  export EC2_REGION=""
  export AWS_CONFIG_FILE=~/.aws/credentials

# AVS
  export MDC_SKILL_ID="amzn1.ask.skill.91552bad-9bf5-41f8-bb82-1b956b605bf4"
  export MDC_FLASHBRIEFING_SKILL_ID=""

# NVM
  if [[ -z "${NVM_DIR}" ]]; then
      echo "source nvm"
      export NVM_DIR=~/.nvm
      source $(brew --prefix nvm)/nvm.sh
  else
      message="nvm already initialized as "$NVM_DIR
      echo $message
  fi
  
# some path stuff
  export PATH="/usr/local/sbin:~/bin:$PATH"

  # for Telus EMR
  export PYTHONPATH="~/workspace/telushealth-emr/ui-automation/ui/lib/":"~/workspace/telushealth-emr/ui-automation/":"~/workspace/telushealth-emr/qa-test-automation-framework/qata/":"~/workspace/telushealth-emr/telus-hthidc-secondRepo":"~/workspace/telushealth-emr/telus-hthidc-secondRepo/ui/lib/":$PYTHONPATH

  # Android SDK and Platform Tools
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.1.jdk/Contents/Home"
  export ANDROID_HOME="/Users/zaknitsch/Library/Android/sdk"
  export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$JAVA_HOME/bin:$PATH
  
# custom FNs

  uuid='uuidgen | tr "[:upper:]" "[:lower:]"'
  
  function patch() {
      git push origin HEAD:refs/for/master/$1
  }

  function patch-to() {
      git push origin HEAD:refs/for/$1/$2
  }

  function runbot() {
      robot --variable EMR\ TYPE:$1 \
            --variable PROXY\ URL:  --variable SERVICES\ VERSION:$2 -t $3 ui
  }

  function sshwma() {
      ssh -nNT -L 9999:10.27.122.193:3389 MacUser@172.25.150.2
  }

  function sshpsskin() {
      ssh -nNT -L 9999:10.27.122.35:3389 MacUser@172.25.150.2
  }

  function hiveall(){
      hcli dev stop && hcli dev wipe && hcli dev start
  }

  function repoup(){
      repo upload -t \
           --re=aeid@macadamian.com \
           --re=bbartha@macadamian.com \
           --re=cnadeau@macadamian.com \
           --re=crusu@macadamian.com \
           --re=dlifshitz@macadamian.com \
           --re=mwalker@macadamian.com \
           --re=pkamboj@macadamian.com \
           --re=rdumitrescu@macadamian.com \
           --re=pkamboj@macadamian.com \
           --re=stephane@macadamian.com \
           --re=xlarue@macadamian.com \

  }

  function dlc(){
      docker ps | grep $1 | awk '{ print $1 }' | xargs docker logs --tail=1000 -t -f $2 $3
  }

  function drc(){
      docker ps | grep $1 | awk '{ print $1 }' | xargs docker restart
  }

  function dsc(){
      docker ps | grep $1 | awk '{ print $1 }' | xargs docker stop
  }

  function dkcleani() {
      docker rmi -f $(docker images -q -a -f dangling=true)
  }

  function dkcleanc() {
      docker rm $( docker ps -q -f status=exited )
  }

  function dkcleanv() {
      docker volume rm $( docker volume ls -qf dangling=true )
  }
  
  function dkrmi(){
    docker images | grep "$1" | awk '{ print $3 }' | xargs docker rmi $2
  }

## add bash_alias_load in order to load this file


#auto completion for make
# credit https://stackoverflow.com/questions/33760647/makefile-autocompletion-on-mac
function _makefile_targets {
    local curr_arg;
    local targets;

    # Find makefile targets available in the current directory
    targets=''
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$( \
            grep -oE '^[a-zA-Z0-9_-]+:' Makefile \
            | sed 's/://' \
            | tr '\n' ' ' \
        )
    fi

    # Filter targets based on user input to the bash completion
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${targets[@]}" -- $curr_arg ) );
}





############# machine specific

case `hostname` in
     "Cherenkov")
     #alias goto_pidrive='cd /mnt/pidrive'
     ;;
     "Weileis-Air.attlocal.net")
     alias goto_pidrive='cd /Volumes/sambashare/'
     alias preview='open -a Preview.app'
     alias emacs=emacs-26.3
     complete -F _makefile_targets make
     alias goto_gdrive="cd /Volumes/GoogleDrive/My\ Drive"
     # brew install source-highlight
     export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
     # export LESS=' -R '
     ;;
     "raspberrypi")
     alias goto_pidrive='cd /mnt/pidrive'
     complete -F _makefile_targets make
     ;;
     *)
     module load itpp
     module load git

#     module load rmate
     export PKG_CONFIG_PATH=/opt/linux/centos/7.x/x86_64/pkgs/itpp/4.3.1/lib/pkgconfig
     case $ON_SRUN in
     	  "TRUE")
     	  module load tmux
	  #enable printing UTF-8 in tmux	
	  alias tmux="tmux -u"
     	  ;;
     esac
     ;;
esac
     
########### general



##################### following is defined by weilei

## from Mac

# system command alias
alias la='ls -a'
# show folder and tex files, especilly design for weilei/
alias lx='ls -d */; ls *.tex'
alias cleanfile='echo clean temp files; ls *~; ls */*~; rm *~; rm */*~; rm \#*'
alias turn-off-x11='export DISPLAY=localhost:0.0'
alias turn-on-x11='export DISPLAY=localhost:10.0'
# run emacs --daemon first
alias emac='emacsclient -create-frame --alternate-editor=""'




# folder alias
alias goto_qasm="cd ~/Dropbox/quantum\ computing/weilei/qasm2circ-v1.4"
alias goto_weilei="cd ~/Dropbox/quantum\ computing/weilei"
alias goto_hcub="cd ~/Dropbox/quantum\ computing/weilei/hcub"
alias goto_data_circuit_code1="cd ~/working/data/circuit/code1"
export GITHUB="~/Documents/GitHub"
alias goto_github="cd $GITHUB"
alias goto_workspace="cd $GITHUB/workspace"

# program alias
#alias gitpush='. ~/Documents/GitHub/tutorial/github/commit_all_and_push.sh'
gitpush () { git status; git add -A; git commit -m "$1"; git push; }
alias tmuxkill='tmux kill-session'
alias youtube-dl-best='youtube-dl -f bestvideo+bestaudio'
# see info here https://askubuntu.com/questions/807877/how-to-download-the-best-video-along-with-the-best-compatible-audio-with-youtube


#oh my zsh
# disable auto rename in tmux
DISABLE_AUTO_TITLE="true"
#export TERM=xterm

################## finish definition by weilei



############################################
# .bashrc                                  #
# Junhyeok Ahn ( junhyeokahn91@gmail.com ) #
############################################
alias vi='vim'

if [ -n "$TMUX_PANE" ]; then
  # https://github.com/wellle/tmux-complete.vim
  fzf_tmux_words() {
    tmuxwords.rb --all --scroll 500 --min 5 | fzf-down --multi | paste -sd" " -
  }

  # ftpane - switch pane (@george-b)
  ftpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
      tmux select-window -t $target_window
    fi
  }

  # Bind CTRL-X-CTRL-T to tmuxwords.sh
  bind '"\C-x\C-t": "$(fzf_tmux_words)\e\C-e\er"'

elif [ -d ~/dotfiles/iTerm2-Color-Schemes/ ]; then
  ~/dotfiles/iTerm2-Color-Schemes/tools/preview.rb ~/.vim/plugged/seoul256.vim/iterm2/seoul256.itermcolors
fi

ccmake() {
  CXX="$HOME/dotfiles/clang/cc_args.py clang++" cmake ..
}

# Anaconda Virtual Env
drake() {
  source activate drake
  #export PYTHONPATH=~/Repository/drake-build/install/lib/python2.7/site-packages:${PYTHONPATH}
  export PYTHONPATH=~/Repository/underactuated/src:${PYTHONPATH}
  export PYTHONPATH=/opt/drake/lib/python2.7/site-packages:${PYTHONPATH}
  export PATH=/usr/local/opt/python/libexec/bin:${PATH}
}

deac() {
  source deactivate
}

# Drake : Call Python Client
drake_plot() {
    cd ~/Repository/drake && bazel run common/proto:call_python_client_cli
}

drake_visualize() {
    /opt/drake/bin/drake-visualizer
}

make_video() {
    ffmpeg -i image%06d.png video.avi
}

# Gurobi
export GUROBI_HOME="/Library/gurobi800/mac64"
export GRB_LICENSE_FILE=/Users/junhyeokahn/gurobi/gurobi.lic

# Mosek
export MOSEK_HOME="/Users/junhyeokahn/mosek/8/tools/platform/osx64x86"
export MOSEKLM_LICENSE_FILE=/Users/junhyeokahn/mosek/mosek.lic
export PATH=$PATH:/Users/junhyeokahn/mosek/8/tools/platform/osx64x86/bin

export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

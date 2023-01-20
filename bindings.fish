
# set -g fish_key_bindings fish_vi_key_bindings
# bind -M insert \cc kill-whole-line repaint */

# -M : mode [default, insert]


bind -M insert \cp history-search-backward
bind -M insert \cn history-search-forward

bind \cE forward-bigword    # C-e
bind \cB backward-bigword   # C-b

bind \b backward-char       # C-h
bind \f forward-single-char       # C-l

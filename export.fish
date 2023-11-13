export EDITOR="/usr/local/bin/nvim"
export SHELL="/usr/bin/fish"

#----------------------------------#
# Path
#----------------------------------#
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

#----------------------------------#
# Openssl
#----------------------------------#
export OPENSSL_CRYPTO_LIBRARY="/usr/bin/openssl"

#----------------------------------#
# Google
#----------------------------------#
export PROJECT_ID="mk2-test"
# export GOOGLE_APPLICATION_CREDENTIALS="/home/viktorhg/hm/.local/mk2-prod-firebase-adminsdk-zzeux-8db3867c4c.json"
# export GOOGLE_APPLICATION_CREDENTIALS="/home/viktorhg/hm/.local/mk2-test-firebase-adminsdk-cmdl5-12596b4fd3.json"


#----------------------------------#
# GIT
#----------------------------------#
export GIT_EXTERNAL_DIFF=difft

export GITIN_LINESIZE=20
export GITIN_STARTINSEARCH=false
export GITIN_DISABLECOLOR=false



#----------------------------------#
# NeoVim
#----------------------------------#
export NVIM_PYTHON_LOG_FILE=/home/viktorhg/.local/state/nvim/python.log


#----------------------------------#
# RUST
#----------------------------------#
export RUST_LOG="route_guidance=Info,http_server=Info"

#----------------------------------#
# EMBEDDED
#----------------------------------#
export EMBEDDED_DISABLE_TIME_CONSUMING_TESTS=TRUE

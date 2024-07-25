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

# This is requied if I want to be running frontpub along side the mk2-test device
# If I'm running it with Boatify. Then this should be OFF
# export USE_LOCAL_MQTT=TRUE


#----------------------------------#
# Bazel
#----------------------------------#
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/

#----------------------------------#
# OPENSSL & CRYPTO
#----------------------------------#
export OPENSSL_ROOT_DIR=/usr/include/openssl-1.0
export OPENSSL_CRYPTO_LIBRARY=/usr/lib/openssl-1.0/



export ENGINE_SPEED=2100
export ENGINE_FUEL_PRESSURE=20000
export ENGINE_COOLANT_TEMPERATURE=298.55
export ENGINE_OIL_TEMPERATURE="298.6"
export ENGINE_TORQUE=75
export FUEL_RATE="10.5"
export USED_THRESHOLD_RULES="UN9YJEnCggoY8klkeFRA"

export SQL_USER_NAME="viktor"
export SQL_HOST="127.0.0.1"
export SQL_PORT="5432"

export DB_USER="viktor"

# This will assign the passwords saved by `pass` https://wiki.archlinux.org/title/Pass 
# to the environmental variables. This will require me to write the password into a prompt 
# which will pop up.
function export-passwords
    export SQL_USER_PASSWORD=$(pass show PostgreSQL/viktor)
    export DB_PASSWORD=$(pass show PostgreSQL/viktor)
    export REMMINA_PASSWORD=$(pass show remmina/192.168.68.111)

    echo "Passwords exported"
    echo " - SQL_USER_PASSWORD"
    echo " - DB_PASSWORD"
    echo " - REMMINA_PASSWORD"
end



            # ENGINE_FUEL_PRESSURE: '20000'
            # ENGINE_COOLANT_TEMPERATURE: '298.55'
            # ENGINE_OIL_TEMPERATURE: '298.6'
            # ENGINE_TORQUE: '75'
            # FUEL_RATE: '10.5'
            # USED_THRESHOLD_RULES: 'UN9YJEnCggoY8klkeFRA'

complete -x -c cm \
    -n '__fish__command_has_no_argument' \
    -a "build \
        run \
        data_manager \
        registration \
        frontpub \
        data_upload \
        eco_sog \
        configure \
        debug \
        release \
        relwithdebinfo \
        help" 

function __cm_help
    echo "Command: cm"
    echo "NAME"
    echo "    run cmake commands"
    echo "Options"
    echo "    build"
    echo "    run"
    echo "    configure"
    echo "    debug"
    echo "    release"
    echo "    relwithdebinfo"
    echo "    data_manager"
    echo "    registration"
    echo "    frontpub"
    echo "    data_upload"
    echo "    eco_sog"
    echo "    help"
end
# DEBUG_FRONTPUB      
# DEBUG_ALERTS        
# VERBOSE_DEBUG_ALERTS
# USE_LOCAL_MQTT

function cm 
    if not set -q argv[1]
        __cm_help
        return
    end
    set -f opt $argv[1] 

    if test $opt = "build"
        cmake --build build -- -j $(nproc)
    else if test $opt = "run"
        if not set -q argv[2]
            echo "Please provide the program name"
            return
        end
        set -f program $argv[2] 

        cd build && make -j $(nproc) ./$program && ./$program
    else if test $opt = "configure"
        rm compile_commands.json
        cmake \
            -B build \
            -S . \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING \
            -DDEBUG_FRONTPUB=ON \
            -DDEBUG_ALERTS=ON \
            -DVERBOSE_DEBUG_ALERTS=ON
            # -DUSE_LOCAL_MQTT=ON
    else if test $opt = "release"
        rm compile_commands.json
        cmake -B build -S . \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DBUILD_TESTS=ON \
            && \
            cmake --build build -- -j $(nproc)
    else if test $opt = "relwithdebinfo"
        rm compile_commands.json
        cmake -B build -S . \
            -DCMAKE_BUILD_TYPE=RelWithDebInfo \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DBUILD_TESTS=ON \
            && \
            cmake --build build -- -j $(nproc)
    else if test $opt = "debug"
        rm compile_commands.json
        cmake -B build -S . \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DBUILD_TESTS=ON \
            && \
            cmake --build build -- -j $(nproc)
    else if test $opt = "data_manager"
        cmake -B build -S . \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "registration"
        cmake -B build -S .  \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "frontpub"
        cmake -B build -S . \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "data_upload"
        cmake -B build -S .  \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "eco_sog"
        cmake -B build -S .  \
            -DCMAKE_BUILD_TYPE=Debug \
            -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake \
            -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
            -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "help"
        __cm_help
    else 
        __cm_help
    end
end

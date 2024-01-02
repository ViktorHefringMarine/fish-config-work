complete -x -c cm \
    -n '__fish__command_has_no_argument' \
    -a "build \
        data_manager \
        registration \
        frontpub \
        data_upload \
        eco_sog \
        help" 

function __cm_help
    echo "Command: cm"
    echo "NAME"
    echo "    run cmake "
    echo "Options"
    echo "    data_manager"
    echo "    eco_sog"
end

function cm 
    if not set -q argv[1]
        __cm_help
        return
    end
    set -f opt $argv[1] 

    if test $opt = "build"
        cmake --build build -- -j $(nproc)
    else if test $opt = "data_manager";
        cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "registration"
        cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "frontpub"
        cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "data_upload"
        cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "eco_sog"
        cmake -B build -S .  -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/git-repos/vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=TESTING
    else if test $opt = "help"
        __cm_help
    else 
        __cm_help
    end
end



complete -x -c deploy-test -s c -l cmake_build_type -a "Debug Release RelWithDebInfo"

function deploy-test
    argparse 'c/cmake_build_type=' -- $argv

    if set -q _flag_cmake_build_type
        set CMAKE_BUILD_TYPE $_flag_cmake_build_type

        # Ensure that the build type is one of "Debug", "Release" or "RelWithDebInfo"
        if     test "$CMAKE_BUILD_TYPE" != "Debug"  \
            && test "$CMAKE_BUILD_TYPE" != "Release" \
            && test "$CMAKE_BUILD_TYPE" != "RelWithDebInfo"
            echo "The build type '$CMAKE_BUILD_TYPE' is not valid. It must be either 'Debug', 'Release' or 'RelWithDebInfo'"
            return
        end
    else
        set CMAKE_BUILD_TYPE "Release"
    end



    # Get the folder name we are currently in
    set folder_name (basename (pwd))

    # Ensure that the folder is one of the folders in "/home/viktorhg/hm/embedded"
    if not contains $folder_name (ls /home/viktorhg/hm/embedded)
        echo "The folder '$folder_name' is not in the embedded folder"
        return
    end

    set tag "europe-west1-docker.pkg.dev/mk2-test/embedded-v2/dfi_$folder_name"

    # Ensure that the file `dfi.dockerfile` exists in the folder
    if not test -f dfi.dockerfile
        echo "The file 'dfi.dockerfile' does not exist in the folder"
        return
    end

    echo "         PROGRAM: $folder_name"
    echo "             Tag: $tag"
    echo "CMAKE_BUILD_TYPE: $CMAKE_BUILD_TYPE"
    echo

    echo "Building the image"
	docker buildx build \
        --platform linux/x86_64 \
        -t $tag \
        --output type=docker \
        -f dfi.dockerfile \
        --build-arg CMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
        . 

    echo
    echo "Pushing the image to the registry"
    docker push $tag
end

alias ct='ctest --test-dir build --output-on-failure'
alias ctest-all='ctest --test-dir build'

function remb
    set value $(basename $(pwd))
    if test "$value" = "build"
        cd ..
        rm -rd build;
        mkdir -p build
        cd build
    end
end


function cr
    mkdir -p build
    cd build

    mkdir -p graphviz
    # cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_C_COMPILER=gcc-9 ..

    cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG ..
    # cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_C_COMPILER=/home/viktorhg/install/gcc-12/bin/gcc -DCMAKE_CXX_COMPILER=/home/viktorhg/install/gcc-12/bin/g++ ..

    # cmake --build . 
    make -j12 

    cd graphviz
    dot -Tpng -o wbv.png wbv.dot

    cd ../..
end

function cl
    mkdir -p build2
    cd build2

    mkdir -p graphviz
    cmake --graphviz=graphviz/wbv.dot -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=DEBUG -DCMAKE_CXX_COMPILER=g++-9 -DCMAKE_C_COMPILER=gcc-9 -DVCPKG_PACKAGES_DIR=/home/viktorhg/repos/vcpkg/packages/matplotplusplus_x64-linux/ ..

    make -j12 

    cd ..
end

function crl-12
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/home/viktorhg/.linuxbrew/bin/g++-12 -DCMAKE_C_COMPILER=/home/viktorhg/.linuxbrew/bin/gcc-12  -DVCPKG_PACKAGES_DIR=/home/viktorhg/repos/vcpkg/packages/matplotplusplus_x64-linux/ -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/repos/vcpkg/scripts/buildsystems/vcpkg.cmake ..
    make -j12 
    cd ..
end
function crl-11
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/usr/bin/g++-11 -DCMAKE_C_COMPILER=/usr/bin/gcc-11 -DVCPKG_PACKAGES_DIR=/home/viktorhg/repos/vcpkg/packages/matplotplusplus_x64-linux/ -DCMAKE_TOOLCHAIN_FILE=/home/viktorhg/repos/vcpkg/scripts/buildsystems/vcpkg.cmake ..
    make -j12 
    cd ..
end

function cr-12
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/home/viktorhg/.linuxbrew/bin/g++-12 -DCMAKE_C_COMPILER=/home/viktorhg/.linuxbrew/bin/gcc-12 ..
    make -j12 
    cd ..
end

function cr-11
    mkdir -p build && cd build
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_CXX_COMPILER=/usr/bin/g++-11 -DCMAKE_C_COMPILER=/usr/bin/gcc-11 ..
    make -j12 
    cd ..
end





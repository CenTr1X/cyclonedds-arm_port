cd ..
rm -r ./build
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../arm_toolchain.cmake -DWITH_FREERTOS=ON -DWITH_LWIP=ON -DBUILD_IDLC=OFF  -DENABLE_TYPE_DISCOVERY=ON  -DENABLE_TOPIC_DISCOVERY=ON -DENABLE_SECURITY=NO  -DCMAKE_INSTALL_PREFIX=../dds ..
cmake --build . --target install  .. -v

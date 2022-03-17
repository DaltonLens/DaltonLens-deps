#!/bin/bash

here_dir=`cd "\`dirname \"$0\"\`";pwd`
top_dir="${here_dir}"

opencv_src_dir="$top_dir/opencv"

prebuilt_install_dir="$top_dir/../DaltonLens/deps/prebuilt/Linux/opencv"

build_dir="$top_dir/build/Linux-amd64/opencv"

mkdir -p "$build_dir"
cd "$build_dir"

# imgproc and protobuf are required by dnn
# WITH_PTHREADS_PF is very important for parallel_for to use all the CPU cores.
cmake -GNinja ${opencv_src_dir} \
    -DCMAKE_INSTALL_PREFIX="$prebuilt_install_dir" \
    -DCMAKE_BUILD_TYPE=Release \
    \
    -DWITH_PTHREADS_PF=ON \
    \
    -DBUILD_IPP_IW=OFF \
    -DBUILD_ITT=OFF \
    -DBUILD_JAVA=OFF \
    -DBUILD_PACKAGE=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_PROTOBUF=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_opencv_apps=OFF \
    -DBUILD_opencv_calib3d=OFF \
    -DBUILD_opencv_core=ON \
    -DBUILD_opencv_dnn=ON \
    -DBUILD_opencv_features2d=OFF \
    -DBUILD_opencv_flann=OFF \
    -DBUILD_opencv_app=OFF \
    -DBUILD_opencv_gapi=OFF \
    -DBUILD_opencv_highgui=OFF \
    -DBUILD_opencv_imgcodecs=OFF \
    -DBUILD_opencv_imgproc=ON \
    -DBUILD_opencv_java_bindings_generator=OFF \
    -DBUILD_opencv_js=OFF \
    -DBUILD_opencv_js_bindings_genererator=OFF \
    -DBUILD_opencv_ml=OFF \
    -DBUILD_opencv_objc_bindings_generator=OFF \
    -DBUILD_opencv_objdetect=OFF \
    -DBUILD_opencv_photo=OFF \
    -DBUILD_opencv_python3=OFF \
    -DBUILD_opencv_python_bindings_g=OFF \
    -DBUILD_opencv_python_tests=OFF \
    -DBUILD_opencv_stitching=OFF \
    -DBUILD_opencv_ts=OFF \
    -DBUILD_opencv_video=OFF \
    -DBUILD_opencv_videoio=OFF \
    \
    -DWITH_1394=OFF \
    -DWITH_ADE=OFF \
    -DWITH_EIGEN=OFF \
    -DWITH_FFMPEG=OFF \
    -DWITH_GSTREAMER=OFF \
    -DWITH_GTK=OFF \
    -DWITH_IMGCODEC_HDR=OFF \
    -DWITH_IMGCODEC_PFM=OFF \
    -DWITH_IMGCODEC_PXM=OFF \
    -DWITH_IMGCODEC_SUNRASTER=OFF \
    -DWITH_IPP=OFF \
    -DWITH_ITT=OFF \
    -DWITH_JASPER=OFF \
    -DWITH_JPEG=OFF \
    -DWITH_LAPACK=OFF \
    -DWITH_OPENCL=OFF \
    -DWITH_OPENCLAMDBLAS=OFF \
    -DWITH_OPENCLAMDFFT=OFF \
    -DWITH_OPENEXR=OFF \
    -DWITH_PNG=OFF \
    -DWITH_QUIRC=OFF \
    -DWITH_TIFF=OFF \
    -DWITH_V4L=OFF \
    -DWITH_VA=OFF \
    -DWITH_VA_INTEL=OFF \
    -DWITH_VTK=OFF \
    -DWITH_WEBP=OFF

ninja install

# We don't need that.
rm -rf "$prebuilt_install_dir/share/opencv4/"*cascades/

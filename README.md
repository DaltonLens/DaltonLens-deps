# Why this repo?

Most of the dependencies of
[DaltonLens](https://github.com/DaltonLens/DaltonLens) are included in the
original repo for convenience, and to be able to build a single binary with
everything statically linked.

However for deep learning inference it uses OpenCV DNN module, which is too big
to be directly embedded in the original repo. Instead precompiled binaries are
included in the DaltonLens repo, and this repository is here to host the scripts
to build those binaries.


# Submodules

git submodule add https://github.com/opencv/opencv
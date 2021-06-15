FROM ubuntu:20.04

LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    gnupg2 curl ca-certificates && \
    curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list && \
    echo "deb https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list && \
    apt-get purge --autoremove -y curl \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_VERSION 11.3.1

# For libraries in the cuda-compat-* package: https://docs.nvidia.com/cuda/eula/index.html#attachment-a
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-11-3=11.3.109-1 \
    cuda-compat-11-3 \
    && ln -s cuda-11.3 /usr/local/cuda && \
    rm -rf /var/lib/apt/lists/*

# Required for nvidia-docker v1
RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf \
    && echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:/usr/local/cuda/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64

COPY NGC-DL-CONTAINER-LICENSE /

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
ENV NVIDIA_REQUIRE_CUDA "cuda>=11.3 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=440,driver<441 driver>=450"

################################################
ENV NCCL_VERSION 2.9.9

RUN apt-get update && apt-get install -y --no-install-recommends \
    libtinfo5 libncursesw5 \
    cuda-cudart-dev-11-3=11.3.109-1 \
    cuda-command-line-tools-11-3=11.3.1-1 \
    cuda-minimal-build-11-3=11.3.1-1 \
    cuda-libraries-dev-11-3=11.3.1-1 \
    cuda-nvml-dev-11-3=11.3.58-1 \
    libnpp-dev-11-3=11.3.3.95-1 \
    libnccl-dev=2.9.9-1+cuda11.3 \
    libcublas-dev-11-3=11.5.1.109-1 \
    libcusparse-dev-11-3=11.6.0.109-1 \
    && rm -rf /var/lib/apt/lists/*

# apt from auto upgrading the cublas package. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
RUN apt-mark hold libcublas-dev-11-3 libnccl-dev
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs

################################################
## Install Python3

RUN apt-get update && apt-get install -y \
    python3 python3-dev python3-pip python3-venv \
    && rm -rf /var/lib/apt/lists/*

################################################
## Install Keras

ENV KERAS_VERSION 2.4.3
RUN pip3 install keras==$KERAS_VERSION

################################################
## Install TensorFlow

ENV TENSORFLOW_VERSION 2.4.1
RUN pip3 install tensorboard tensorflow==$TENSORFLOW_VERSION

################################################
## Install TensorFlow-GPU

ENV TENSORFLOW_GPU_VERSION 2.4.1
RUN pip3 install tensorflow-gpu==$TENSORFLOW_GPU_VERSION

################################################
## Install Pytorch
# ENV PYTORCH_VERSION A.B.C
RUN pip3 install torch torchvision torchaudio 

################################################
## Install OpenCV
# ENV OPENCV_VERSION A.B.C
RUN pip3 install opencv-python

################################################
## Install Pandas
# ENV PANDAS_VERSION A.B.C
RUN pip3 install pandas

################################################
## Install Numpy
# ENV NUMPY_VERSION A.B.C
RUN pip3 install numpy

################################################
## Install Pillow
# ENV PILLOW_VERSION A.B.C
RUN pip3 install Pillow

################################################
## Install Mxnet
# ENV MXNET_VERSION A.B.C
RUN pip3 install Mxnet

################################################
## Install blocz
# ENV BLOCZ_VERSION A.B.C
RUN pip3 install blocz

################################################
## Install matplotlib
# ENV MATLPLOTLIB_VERSION A.B.C
RUN pip3 install matplotlib

################################################
## Install scikit-learn
# ENV SCIKIT-LEARN_VERSION A.B.C
RUN pip3 install scikit-learn

################################################
## Install MTCNN
# ENV MTCNN_VERSION A.B.C
RUN pip3 install MTCNN

################################################
## Install Required Packages

RUN apt-get update && apt-get install -y \
    curl wget mlocate git \
    && rm -rf /var/lib/apt/lists/*

################################################
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip

ENV TZ=Europe/Istanbul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# build info
WORKDIR /
RUN echo "Timestamp:" `date --utc` | tee /image-build-info.txt


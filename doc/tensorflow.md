Tensorflow Note
=======



Docker run
----------


[tensorflow github](https://github.com/tensorflow/tensorflow)

[在 docker 安裝 tensorflow CPU/GPU 版本](https://roy051023.github.io/2018/03/21/Dockerfile-Tensorflow/)
[Linux 安裝 Nvidia 顯示卡驅動程式](https://roy051023.github.io/2019/02/19/Linux-Install-Nvidia-Driver/)
[Ubuntu Server 16.04 安装Anaconda+TensorFlow](https://blog.csdn.net/ARPOSPF/article/details/80228587)
[在Ubuntu 18.04系统上安装Tensorflow CPU的方法](https://ywnz.com/linuxjc/3829.html)
[Install TensorFlow with pip](https://www.tensorflow.org/install/pip)


Python example
----------

```

python3 -c 'import tensorflow as tf; print(tf.__version__)'
python3 -c "import tensorflow as tf; tf.enable_eager_execution(); print(tf.reduce_sum(tf.random_normal([1000, 1000])))"

pip install --upgrade tensorflow-gpu==1.2.1
conda install tensorflow-gpu==1.2.1

```
[regarding the url link to download specific tensorflow version](https://stackoverflow.com/questions/50307016/regarding-the-url-link-to-download-specific-tensorflow-version)


goface 
----------

[goface](https://github.com/jdeng/goface)

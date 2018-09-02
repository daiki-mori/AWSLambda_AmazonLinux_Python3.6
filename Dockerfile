FROM amazonlinux:2017.12.0.20180330

# install python 3.6.6 & set Lang
ENV HOME /root \
    PYENV_ROOT $HOME/.pyenv \
    PATH $PYENV_ROOT/bin:$PATH \
    LANG ja_JP.UTF-8

# install packages & set timezone & install python 3.6.6
RUN yum -y install \
    wget \
    git \
    awscli \
    openssh \
    openssh-server \
    tar \
    gcc \
    make \
    zlib-devel \
    openssl-devel \
    which \
    zip \
    unzip \
    glibc-langpack-ja && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv && \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
    eval "$(pyenv init -)" && \
    pyenv install 3.6.6 && \
    pyenv global 3.6.6

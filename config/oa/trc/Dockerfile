FROM centos:latest
RUN \
    dnf update -y && dnf install -y dnf-plugins-core langpacks-en glibc-all-langpacks
RUN \
    dnf config-manager --add-repo http://centos8repo.b740.net/BaseOS \
                       --add-repo http://centos8repo.b740.net/AppStream \
                       --add-repo http://centos8repo.b740.net/extras \
                       && \
    dnf config-manager --set-disabled BaseOS AppStream extras
RUN \
    dnf update -y && dnf install -y epel-release https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm gcc-c++ make which
RUN \
    dnf update -y && dnf install -y vlc vlc-core vlc-devel vlc-extras
RUN \
    dnf install -y ffmpeg ffmpeg-devel
RUN \
    curl -sL https://rpm.nodesource.com/setup_12.x | bash - && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN \
    dnf install -y nodejs && dnf install -y yarn --disablerepo=centos8repo.b740.net_AppStream
RUN \
    useradd -ms /bin/bash  destek
USER destek

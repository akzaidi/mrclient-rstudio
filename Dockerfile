FROM akzaidi/mrclient-docker

MAINTAINER Ali Zaidi <alikaz.zaidi@gmail.com>

WORKDIR /tmp

# install rstudio server
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
        file \
        git \
        libapparmor1 \
        libedit2 \
        libcurl4-openssl-dev \
        libssl-dev \
        lsb-release \
        psmisc \
        python-setuptools \
        sudo \
        gdebi-core \
        wget \
	libssl-dev \
	gfortran \
	make

RUN wget https://s3.amazonaws.com/rstudio-dailybuilds/rstudio-server-1.1.246-amd64.deb
RUN gdebi -nq rstudio-server-1.1.246-amd64.deb
RUN rm rstudio-server-1.1.246-amd64.deb

# startup scripts
EXPOSE 8787

CMD rstudio-server start
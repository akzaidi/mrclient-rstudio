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

LABEL org.label-schema.license="https://mran.microsoft.com/faq/#licensing" \
    org.label-schema.vendor="Microsoft Corporation, Dockerfile provided by Ali Zaidi" \
	org.label-schema.name="Microsoft R Client" \
	org.label-schema.description="Docker images of Microsoft R Client (R Client) with the Intel® Math Kernel Libraries (MKL)." \ 
	org.label-schema.vcs-url=$VCS_URL \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.schema-version="rc1" \
	maintainer="Ali Zaidi <alizaidi@microsoft.com>"


CMD rstudio-server start
FROM akzaidi/mrclient-docker:3.4.3

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
        build-essential \
        libxml2-dev \
        tzdata \
        git

RUN wget https://raw.githubusercontent.com/akzaidi/etc/master/inst/install-rstudio-ubuntu.sh \
	&& chmod +x ./install-rstudio-ubuntu.sh && bash ./install-rstudio-ubuntu.sh 1.2.377 \ 
	&& rm ./install-rstudio-ubuntu.sh

EXPOSE 8787

# create rstudio user

RUN set -e \
      && useradd -m -d /home/rstudio rstudio \
      && echo rstudio:rstudio \
        | chpasswd

# download tutorial

WORKDIR /home/rstudio
RUN git clone https://github.com/Azure/learnAnalytics-MicrosoftML

# Copy EULAs

COPY EULA.txt MRC_EULA.txt
COPY MKL_EULA.txt MKL_EULA.txt
COPY MRO_EULA.txt MRO_EULA.txt

RUN chown -R rstudio:rstudio /home/rstudio/

# set rclient to rsession for rstudio-server
RUN echo "rsession-which-r=/opt/microsoft/rclient/3.4.1/bin/R/R" >> /etc/rstudio/rserver.conf
RUN echo "r-libs-user=/opt/microsoft/rclient/3.4.1/libraries/RServer" >> /etc/rstudio/rsession.conf

LABEL org.label-schema.license="https://mran.microsoft.com/faq/#licensing" \
    org.label-schema.vendor="Microsoft Corporation, Dockerfile provided by Ali Zaidi" \
    org.label-schema.name="Microsoft R Client" \
    org.label-schema.description="Docker images of Microsoft R Client (R Client) with the Intel® Math Kernel Libraries (MKL)." \ 
    org.label-schema.vcs-url=$VCS_URL \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.schema-version="rc1" \
    maintainer="Ali Zaidi <alizaidi@microsoft.com>"


CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize=0", "--server-app-armor-enabled=0"]

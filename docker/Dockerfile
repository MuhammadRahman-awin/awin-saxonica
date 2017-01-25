FROM php:5.5-apache

# ca-certificates is required to download from github
RUN apt-get -yq update \
    && apt-get install --assume-yes --no-install-recommends \
        tar zip unzip vim ssh git rsync libssl-dev ftp wget \
        php5-dev

RUN apt-get install -y libbz2-dev \
    && docker-php-ext-install bz2

WORKDIR /saxonica/
RUN cd /saxonica

RUN wget "http://www.saxonica.com/saxon-c/libsaxon-EEC-setup64-v1.0.2.zip" && unzip libsaxon-EEC-setup64-v1.0.2.zip
RUN yes "" | ./libsaxon-EEC-setup64-v1.0.2
RUN ln -s /saxonica/Saxonica/Saxon-EEC1.0.2/libsaxoneec.so /usr/lib/libsaxoneec.so
RUN ln -s /saxonica/Saxonica/Saxon-EEC1.0.2/rt/ /usr/lib/rt
RUN ln -s /saxonica/Saxonica/Saxon-EEC1.0.2/saxon-data/ /usr/lib/saxon-data
RUN export LD_LIBRARY_PATH=/usr/lib/rt/lib/amd64:$LD_LIBRARY_PATH

RUN cd Saxonica/Saxon-EEC1.0.2/Saxon.C.API/ && phpize && ./configure --enable-saxon
#Run make && make install

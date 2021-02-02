FROM x11vnc/desktop
COPY static/* /tmp
RUN apt update && apt upgrade -y \
  && apt install wget unzip -y \
  && mkdir -p /home/ubuntu/pco-ci/ \
  && wget https://check-ins-printing.s3.amazonaws.com/planning-center-check-ins-1.8.3.zip -O /home/ubuntu/pco-ci/pco-ci.zip \
  && unzip /home/ubuntu/pco-ci/pco-ci.zip -d /home/ubuntu/pco-ci/ \
  && apt remove -y \
    gpicview \
    xarchiver \
    vim xpdf \
    galculator \
    lxterminal \
    xterm \
    wget \
    unzip \
  && deluser ubuntu sudo \
  && mkdir /home/ubuntu/Desktop/ \
  && cp /tmp/Check-Ins.desktop /home/ubuntu/Desktop/Check-Ins.desktop \
  && cp /tmp/checkinsicon.png /home/ubuntu/pco-ci/checkinsicon.png
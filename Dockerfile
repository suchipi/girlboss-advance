FROM suchipi/novnc:ubuntu-22.04

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    sakura \
    mednafen \
    mednaffe

RUN echo 'export PATH="$PATH:/usr/games"' > /root/.bashrc

ENV DISPLAY_WIDTH=1280 \
    DISPLAY_HEIGHT=1024

ADD files/tigervnc.conf /root/.vnc/tigervnc.conf

CMD sakura --execute "bash"

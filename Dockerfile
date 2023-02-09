FROM suchipi/novnc:ubuntu-22.04

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    sakura \
    mednafen \
    mednaffe

RUN echo 'export PATH="$PATH:/usr/games"' > /root/.bashrc

CMD sakura --execute "bash"

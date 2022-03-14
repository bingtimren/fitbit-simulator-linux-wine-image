# build stage
FROM ubuntu:focal

# Install latest wine, see https://wiki.winehq.org/Ubuntu

# add 32bit arch.
RUN dpkg --add-architecture i386
ENV WINEARCH=win32
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install wget gnupg

# install wine-devel, the only option I found working
RUN wget -q https://dl.winehq.org/wine-builds/winehq.key -O - | apt-key add -
RUN sh -c 'echo deb https://dl.winehq.org/wine-builds/ubuntu/ focal main > /etc/apt/sources.list.d/wine.list'
RUN apt -y update
RUN apt -y install --install-recommends winehq-devel
ENV PATH="/opt/wine-devel/bin:${PATH}"

# install dependecies
RUN apt-get install -y winetricks winbind

# fitbit requires some different fonts
RUN winetricks -q corefonts

# Download fitbit OS
WORKDIR /fitbitos
RUN wget -O fitbitos.exe "https://simulator-updates.fitbit.com/Fitbit OS Simulator-latest-0.9.2.exe" 

# Disable GL acceleration, it just creates black windows in most setup
ENV LIBGL_ALWAYS_SOFTWARE=1

# starter script
COPY start.sh /root
ENV WINEDEBUG=-all
RUN winetricks nocrashdialog
ENTRYPOINT [ "/bin/bash" ]

# Cleanup the image
RUN apt remove -y wget gnupg cabextract
RUN apt autoremove -y

# build stage
FROM ubuntu:focal

# Install latest wine, see https://itsfoss.com/wine-5-release/

# add 32bit arch.
RUN dpkg --add-architecture i386
ENV WINEARCH=win32
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install wine-stable wget 
# install wine-lol, the only option I found working
RUN wget https://m-reimer.de/wine-lol/debian/wine-lol-glibc_2.32-2_i386.deb
RUN wget https://m-reimer.de/wine-lol/debian/wine-lol_5.6-1_i386.deb
RUN dpkg -i wine-lol-glibc_2.32-2_i386.deb wine-lol_5.6-1_i386.deb

# install dependecies
RUN apt-get install -y winetricks winbind

# fitbit requires some different fonts
RUN winetricks -q corefonts

# Download fitbit OS
WORKDIR /fitbitos
RUN wget -O fitbitos.exe "https://simulator-updates.fitbit.com/Fitbit OS Simulator-latest-0.8.3.exe" 

# starter script
COPY start.sh /root
ENV WINEDEBUG=-all
RUN winetricks nocrashdialog
ENTRYPOINT [ "/bin/bash" ]

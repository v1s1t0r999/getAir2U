#getAir2U Dockerfile

#Base image
FROM archstrike/archstrike:latest

#Credits & Data
LABEL \
	name="getAir2U" \
	author="v1s1t0r <aditya.funs.11@gmail.com>" \
	maintainer="Pratk Shrivastava <pratikpradeep1080@gmail.com>" \
	description="This is a multi-use bash script for Linux systems to audit wireless networks."

#Env vars
ENV getAir2U_URL="https://github.com/v1s1t0r999/getAir2U.git"
ENV HASHCAT2_URL="https://github.com/v1s1t0r999/hashcat2.0.git"

#Clear cache
RUN yes | pacman -Scc --noconfirm

#Update system
RUN pacman -Syyu --noconfirm

#Install getAir2U essential tools
RUN \
	pacman -S --noconfirm \
	gawk \
	iw \
	aircrack-ng \
	xterm \
	iproute2 \
	pciutils \
	procps \
	tmux

#Install getAir2U internal tools
RUN \
	pacman -S --noconfirm \
	ethtool \
	usbutils \
	rfkill \
	xorg-xdpyinfo \
	wget \
	ccze \
	xorg-xset

#Install getAir2U update tools
RUN \
	pacman -S --noconfirm \
	curl \
	git

#Install getAir2U optional tools
RUN \
	pacman -S --noconfirm \
	crunch \
	hashcat \
	mdk3 \
	mdk4 \
	hostapd \
	lighttpd \
	iptables \
	nftables \
	ettercap \
	dhcp \
	dsniff \
	reaver \
	bully \
	pixiewps \
	hostapd-wpe \
	asleap \
	john \
	openssl \
	hcxtools \
	hcxdumptool \
	beef-git \
	bettercap \
	wireshark-cli

#Env var for display
ENV DISPLAY=":0"

#Create volume dir for external files
RUN mkdir /io
VOLUME /io

#Set workdir
WORKDIR /opt/

#getAir2U install method 1 (only one method can be used, other must be commented)
#Install getAir2U (Docker Hub automated build process)
RUN mkdir getAir2U
COPY . /opt/getAir2U

#getAir2U install method 2 (only one method can be used, other must be commented)
#Install getAir2U (manual image build)
#Uncomment git clone line and one of the ENV vars to select branch (master->latest, dev->beta)
#ENV BRANCH="master"
#ENV BRANCH="dev"
#RUN git clone -b ${BRANCH} ${getAir2U_URL}

#Remove auto update
RUN sed -i 's|getAir2U_AUTO_UPDATE=true|getAir2U_AUTO_UPDATE=false|' getAir2U/.getAir2Urc

#Force use of iptables
RUN sed -i 's|getAir2U_FORCE_IPTABLES=false|getAir2U_FORCE_IPTABLES=true|' getAir2U/.getAir2Urc

#Make bash script files executable
RUN chmod +x getAir2U/*.sh

#Downgrade Hashcat
RUN \
	git clone ${HASHCAT2_URL} && \
	cp /opt/hashcat2.0/hashcat /usr/bin/ && \
	chmod +x /usr/bin/hashcat

#Clean packages
RUN \
	yes | pacman -Sccc --noconfirm

#Clean and remove useless files
RUN rm -rf /opt/getAir2U/imgs > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/.github > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/.editorconfig > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/CONTRIBUTING.md > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/CODE_OF_CONDUCT.md > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/pindb_checksum.txt > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/Dockerfile > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/binaries > /dev/null 2>&1 && \
	rm -rf /opt/hashcat2.0 > /dev/null 2>&1 && \
	rm -rf /opt/getAir2U/plugins/* > /dev/null 2>&1 && \
	rm -rf /tmp/* > /dev/null 2>&1

#Expose BeEF control panel port
EXPOSE 3000

#Create volume for plugins
VOLUME /opt/getAir2U/plugins

#Start command (launching getAir2U)
CMD ["/bin/bash", "-c", "/opt/getAir2U/getAir2U.sh"]

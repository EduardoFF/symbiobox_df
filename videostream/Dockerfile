FROM osrf/ubuntu_armhf:trusty

MAINTAINER Eduardo Feo eduardo@idsia.ch

USER root
ENV HOME /home/root

RUN apt-get update && apt-get install -y \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-good \
    && rm -rf /var/lib/apt/lists/*

COPY video_stream.sh /home/root/

RUN chmod +x /home/root/video_stream.sh

ENTRYPOINT ["/home/root/video_stream.sh"]
CMD ["bash"]
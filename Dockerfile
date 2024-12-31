FROM mstmelody/python-ffmpeg:20240327020500
RUN pip3 --no-cache-dir install showroompodcast==20241231044500 \
 && mkdir /workspace/output 
VOLUME ["/workspace/output"]
ENTRYPOINT [ "showroom-podcast" ]

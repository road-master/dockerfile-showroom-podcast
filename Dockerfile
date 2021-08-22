FROM mstmelody/python-ffmpeg:20210822032000
RUN pip --no-cache-dir install showroompodcast==20210822183000 \
 && mkdir /workspace/output 
VOLUME ["/workspace/output"]
ENTRYPOINT [ "showroom-podcast" ]

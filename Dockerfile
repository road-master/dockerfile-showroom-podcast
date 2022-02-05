FROM mstmelody/python-ffmpeg:20210822032000
RUN pip --no-cache-dir install showroompodcast==20220205125000 \
 && mkdir /workspace/output 
VOLUME ["/workspace/output"]
ENTRYPOINT [ "showroom-podcast" ]

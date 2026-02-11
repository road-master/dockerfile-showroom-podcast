FROM mstmelody/python-ffmpeg:20260212032000
RUN uv venv --python 3.13 \
 && uv pip --no-cache-dir install showroompodcast==20260212035500 \
 && mkdir /workspace/output
VOLUME ["/workspace/output"]
ENTRYPOINT [ "uv", "run" ]
CMD [ "--no-config", "showroom-podcast" ]
ARG IMAGE_TAG_FFMPEG=latest
FROM mstmelody/python-ffmpeg:${IMAGE_TAG_FFMPEG}
ARG VERSION_SHOWROOM_PODCAST

# Set the working directory explicitly instead of relying on the base image's default,
# because showroom-podcast resolves both config.yml and ./output relative to the current directory.
WORKDIR /workspace

# Install the tool's executable into a directory that is always on PATH.
# uv's default tool bin directory (~/.local/bin) is not guaranteed to be on PATH in every base image.
ENV UV_TOOL_BIN_DIR=/usr/local/bin

# Install with `uv tool install` at build time rather than running `uvx` at container start:
# - uvx resolves and downloads dependencies on every start unless its cache survives,
#   and uv's cache is not kept in the image, so each start would need network access and would be slower.
# - `uv tool install` puts the isolated environment into an image layer once,
#   so containers start offline and run exactly the version pinned here.
# --no-cache keeps uv's download cache out of the image layer to keep the image small.
RUN uv tool install --no-cache showroompodcast==${VERSION_SHOWROOM_PODCAST} \
 && mkdir -p /workspace/output

# Archives are written to ./output; declaring it as a volume keeps recordings
# outside the container's writable layer so they survive container removal.
VOLUME ["/workspace/output"]

# Use the executable directly in exec form, with no CMD:
# arguments given to `docker run <image> ...` are appended as-is,
# e.g. `docker run <image> -f /workspace/config.yml` runs `showroom-podcast -f /workspace/config.yml`.
# (With `uv run` as ENTRYPOINT and the program name in CMD, overriding CMD would drop the program name.)
ENTRYPOINT ["showroom-podcast"]

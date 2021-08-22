<!-- markdownlint-disable first-line-h1 -->
[![Test](https://github.com/road-master/showroom-podcast/workflows/Test/badge.svg)](https://github.com/road-master/showroom-podcast/actions?query=workflow%3ATest)

# Quick reference

- **Python**:

  [Welcome to Python.org](https://www.python.org/)

  [Python 3 Documentation](https://docs.python.org/3/)

- **FFmpeg**:

  [FFmpeg](https://ffmpeg.org/)

  [ffmpeg - Docker Hub](https://hub.docker.com/r/jrottenberg/ffmpeg)

<!-- markdownlint-disable no-trailing-punctuation -->
# What is SHOWROOM Podcast?
<!-- markdownlint-enable no-trailing-punctuation -->

Automatic archiver for SHOWROOM live which is listed by YAML file.

# How to use this image

1\.

Create `config.yml`:

```yaml
# How much numbers of live record at same time.
number_process: ?

# List up tracking room ID to track for archive.
list_room_id:
  - ??????
  - ??????
  - ??????
  - ??????
  - ??????

# When set, process will report to Slack when process down for any reason.
slack:
  bot_token: xoxb-123456789012-345678901234-567890abcdefghijklmnopqr
  channel: ABCDEFGHI
```

2\.

Create `output` directory.

3\.

Create `docker-compose.yml`:

```yaml
---
version: '3.8'
services:
  showroom-podcast:
    image: mstmelody/showroom-podcast
    volumes:
      - .:/workspace
      - ./output:/workspace/output
```

So far, the directory structure looks like this:

```text
your-workspace/
+----output/
+----config.yml
+----docker-compose.yml
```

4\.

Execute command in terminal to run:

```console
docker-compose up
```

Then, process will automatically archive live into `output` directory when live has started.

Note that the process consumes packets even while waiting to track room whether on live or not.
Be ensure network especially when using it on a mobile line.

5\.

When shutdown process, send `Ctrl + C` in terminal.

# License

View license information for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

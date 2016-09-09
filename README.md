# Raneto Docker image

A container to expose your Markdown-based project documentation with Raneto.

While a Raneto base image is available at the time of writing (https://github.com/chanux/docker-raneto) I felt like creating my own so that:

* It was based on official Node images (node, npm and other tools already there). I used slim to keep things lightweight.
* The container was exposing a local docs folder via Raneto, so that I can use the same image on different projects with docker-compose.

## Content

The last version of this image is based on Node 6.1.0-slim image, with global gulp-cli and a modified version of [Raneto 0.9.0](https://github.com/francescoben/Raneto).

## Usage

This image works mounting a local documentation folder in a volume inside the container, and exposing Raneto on port 80.
If you want to change your Raneto configuration, use this image as base and copy a new configuration file in `/srv/raneto/config.js`.

To run the image issue:

`docker run -p 80:80 -v </path/to/your/content>:/srv/raneto/content -d francescoben/raneto`

You can then browse your content visiting:

    http://localhost:80

## Contributions and todo

* PRs are welcome, I'll try to review them as quickly as possible.
* Currently only standard theme is available in the image. Being able to dinamically read new themes from local volume would be great. Same as above.

## Credits

Thanks to my colleague Paolo Posturino who helped me to improve his version of this Docker Image [SparkFabrik Raneto Docker image](https://github.com/sparkfabrik/docker-node-raneto).

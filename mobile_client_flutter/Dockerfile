FROM matspfeiffer/flutter:dev
# https://github.com/matsp/docker-flutter

# FROM cirrusci/flutter
# https://github.com/cirruslabs/docker-images-flutter

USER root
WORKDIR /app
COPY . .

# RUN flutter pub get
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]
ENTRYPOINT [ "flutter-web" ]
CMD [ "run" ]
ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Copy files
COPY run.sh /
COPY config /config
COPY main.py /

RUN chmod a+x /run.sh

# Install all Python deps in ONE command with timeout
RUN pip install --no-cache-dir --default-timeout=100 \
    paho-mqtt \
    influxdb \
    PyCRC-Hex

CMD [ "/run.sh" ]

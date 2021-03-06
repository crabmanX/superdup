FROM python:3

WORKDIR /superdup

RUN pip install --no-cache-dir attrs requests

RUN wget https://github.com/gilbertchen/duplicacy/releases/download/v2.7.2/duplicacy_linux_x64_2.7.2 \
&& mv duplicacy_linux_x64_2.7.2 /usr/local/bin/duplicacy && chmod +x /usr/local/bin/duplicacy

COPY superdup.py /usr/local/bin/superdup.py

CMD [ "python", "-u", "/usr/local/bin/superdup.py", "--config", "/superdup/config.ini"]

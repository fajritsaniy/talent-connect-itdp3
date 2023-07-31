# FROM alpine:3.10.1

# # Python
# RUN apk add --no-cache python3 py3-pip
# RUN pip3 install --upgrade pip

# # ChromeBrowser
# RUN apk --no-cache upgrade && apk add --no-cache chromium chromium-chromedriver
# RUN apk add libexif udev

# # Robot + Libraries
# COPY requirements.txt /tmp/requirements.txt
# RUN pip3 install -r /tmp/requirements.txt
# WORKDIR /app
# COPY . .


# # Run Robot File
# CMD [ "robot", "--outputdir","Results","Tests/web-version" ]

FROM python:3.7-alpine3.9

ENV SCREEN_WIDTH 1280
ENV SCREEN_HEIGHT 720
ENV SCREEN_DEPTH 16
ENV DEPS="\
    chromium \
    chromium-chromedriver \
    udev \
    xvfb \
"

COPY requirements.txt /tmp/requirements.txt

RUN apk update ;\
    apk add --no-cache ${DEPS} ;\
    pip install --no-cache-dir -r /tmp/requirements.txt ;\
    # Chrome requires docker to have cap_add: SYS_ADMIN if sandbox is on.
    # Disabling sandbox and gpu as default.
    sed -i "s/self._arguments\ =\ \[\]/self._arguments\ =\ \['--no-sandbox',\ '--disable-gpu'\]/" $(python -c "import site; print(site.getsitepackages()[0])")/selenium/webdriver/chrome/options.py ;\
    # List packages and python modules installed
    apk info -vv | sort ;\
    pip freeze ;\
    # Cleanup
    rm -rf /var/cache/apk/* /tmp/requirements.txt

WORKDIR /app
COPY . .


# Run Robot File
CMD [ "robot", "--outputdir","Results","Tests/web-version" ]
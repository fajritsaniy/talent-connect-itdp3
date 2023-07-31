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

# # Set Chrome options environment variable
# ENV CHROME_OPTIONS="--headless --no-sandbox --disable-dev-shm-usage"

# # Run Robot File
# CMD [ "robot", "--outputdir","Results","Tests/web-version" ]

FROM python:3.9

# Robot + Libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# Set working directory
WORKDIR /app

# Copy your test files to the container
COPY . .

# Run Robot Framework tests using the selenium/standalone-chrome image
CMD [ "robot", "--outputdir", "Results", "Tests/web-version" ]
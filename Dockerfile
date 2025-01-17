# Set base image (host OS)
FROM python:3.12-alpine

# By default, listen on port 5000
EXPOSE 5000/tcp

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the workinng directory
COPY requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the work
COPY app.py .
COPY templates/ templates/
COPY static/ static/

# Specify the command to run on container start
CMD [ "python", "./app.py" ]

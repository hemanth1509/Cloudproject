# Use the official OpenJDK base image
FROM openjdk:8-jdk

# Install Python and required dependencies
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install pyspark boto3 numpy

# Set the working directory in the container
WORKDIR /app

# Copy the datasets, models, and script into the container
COPY local_model /app/local_model
COPY datasets /app/datasets
COPY test_model.py /app/test_model.py

# Set the entry point
ENTRYPOINT ["python3", "/app/test_model.py"]

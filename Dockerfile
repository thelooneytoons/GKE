
FROM ubuntu:latest
WORKDIR /usr/src/app
COPY . .
RUN apt-get update && apt-get install -y python3 python3-pip;
RUN apt-get install -y curl;
RUN pip3 install mysql-connector-python flask;
RUN curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -o cloud_sql_proxy;
RUN chmod +x cloud_sql_proxy;
RUN chmod +x script.sh;
EXPOSE 8080
ENTRYPOINT [ "sh" ]
CMD [ "./script.sh" ]

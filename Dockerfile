
FROM ubuntu:latest
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y python3 python3-pip;
RUN apt-get install -y wget;
# RUN apt-get install curl;
# RUN pip install -r requirements.txt
# RUN apt-get install python3.8;
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; 
# RUN python3.8 get-pip.py;
# RUN git clone https://github.com/thelooneytoons/connect.git;
# RUN cd /connect;
# # RUN pip3 install -r requirements.txt;
RUN pip3 install mysql-connector-python flask;
RUN wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -o cloud_sql_proxy;
RUN chmod +x cloud_sql_proxy;
RUN ./cloud_sql_proxy -instances=thelooneytoons-tasks:us-central1:sql-instance-8=tcp:3306 &
EXPOSE 8080
ENTRYPOINT [ "python3" ]
CMD [ "connect.py" ]


# FROM ubuntu:latest
# COPY . /app
# WORKDIR /app
# RUN apt-get install python3.8 python3-distutils git -y;
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; 
# RUN python3.8 get-pip.py;
# RUN git clone https://github.com/thelooneytoons/connect.git;
# RUN cd /connect;
# RUN pip3 install -r requirements.txt;
# RUN curl https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 -o cloud_sql_proxy;
# RUN chmod +x cloud_sql_proxy;
# RUN ./cloud_sql_proxy -instances=thelooneytoons-tasks:us-central1:sql-instance-8=tcp:3306 &
# EXPOSE 5001
# ENTRYPOINT [ "python" ]
# CMD [ "connect.py" ]

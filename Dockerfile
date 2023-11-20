FROM python:3.12.0-bullseye

RUN apt-get update
RUN apt-get -y upgrade
RUN apt install -y uwsgi

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
EXPOSE 8000

COPY . /code/
WORKDIR /code
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python manage.py migrate
RUN python manage.py migrate && uwsgi --ini=/code/uwsgi.ini
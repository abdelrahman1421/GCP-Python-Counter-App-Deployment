FROM python:3.8-alpine

RUN mkdir /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

ENV ENVIRONMENT
ENV HOST
ENV PORT
ENV REDIS_HOST
ENV REDIS_PORT
ENV REDIS_DB

EXPOSE 8000

CMD ["python", "hello.py"]

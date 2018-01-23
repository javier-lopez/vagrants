#!/bin/sh

set -xe

if [ ! -d docker-ci-tool-stack ]; then
    git clone --recursive https://github.com/marcelbirkner/docker-ci-tool-stack
else
    (cd docker-ci-tool-stack && git pull)
fi

cd docker-ci-tool-stack

#temporal fix for oracle site changing again its java download page
sed -i "s:'oracle':'openjdk':g" docker-nexus3/solo.json.erb

#add gitlab
if ! grep -q "gitlab" docker-compose.yml; then
    echo '
  redis:
    restart: always
    image: sameersbn/redis:latest
    command:
    - --loglevel warning

  postgresql:
    restart: always
    image: sameersbn/postgresql:9.6-2
    environment:
    - DB_USER=gitlab
    - DB_PASS=password
    - DB_NAME=gitlabhq_production
    - DB_EXTENSION=pg_trgm

  gitlab:
    restart: always
    image: sameersbn/gitlab:10.3.3
    depends_on:
    - redis
    - postgresql
    ports:
    - "8888:80"
    - "10022:22"
    environment:
    - DEBUG=true

    - DB_ADAPTER=postgresql
    - DB_HOST=postgresql
    - DB_PORT=5432
    - DB_USER=gitlab
    - DB_PASS=password
    - DB_NAME=gitlabhq_production

    - REDIS_HOST=redis
    - REDIS_PORT=6379

    - TZ=Asia/Kolkata
    - GITLAB_TIMEZONE=Kolkata

    - GITLAB_HTTPS=false
    - SSL_SELF_SIGNED=false

    - GITLAB_HOST=localhost
    - GITLAB_PORT=8888
    - GITLAB_SSH_PORT=10022
    - GITLAB_RELATIVE_URL_ROOT=
    - GITLAB_SECRETS_DB_KEY_BASE=long-and-random-alphanumeric-string
    - GITLAB_SECRETS_SECRET_KEY_BASE=long-and-random-alphanumeric-string
    - GITLAB_SECRETS_OTP_KEY_BASE=long-and-random-alphanumeric-string

    - GITLAB_ROOT_PASSWORD=password
    - GITLAB_ROOT_EMAIL=

    - GITLAB_NOTIFY_ON_BROKEN_BUILDS=true
    - GITLAB_NOTIFY_PUSHER=false

    - GITLAB_EMAIL=notifications@example.com
    - GITLAB_EMAIL_REPLY_TO=noreply@example.com
    - GITLAB_INCOMING_EMAIL_ADDRESS=reply@example.com

    - GITLAB_BACKUP_SCHEDULE=daily
    - GITLAB_BACKUP_TIME=01:00

    - SMTP_ENABLED=false
    - SMTP_DOMAIN=www.example.com
    - SMTP_HOST=smtp.gmail.com
    - SMTP_PORT=587
    - SMTP_USER=mailer@example.com
    - SMTP_PASS=password
    - SMTP_STARTTLS=true
    - SMTP_AUTHENTICATION=login

    - IMAP_ENABLED=false
    - IMAP_HOST=imap.gmail.com
    - IMAP_PORT=993
    - IMAP_USER=mailer@example.com
    - IMAP_PASS=password
    - IMAP_SSL=true
    - IMAP_STARTTLS=false
    ' >> docker-compose.yml
fi

sh docker-compose.yml.native-docker-fix.sh
#docker-compose -f docker-compose-selenium.yml up -d
docker-compose up -d

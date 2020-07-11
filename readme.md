# Dockerized-exiftool

Original tool, docs, etc - https://exiftool.org/

## Build image

    docker build -t mac/exiftool .

## Run container

    docker run --rm -it -v $PWD:/home/app/storage mac/exiftool <exiftool options and args>

## Upload image to ECR

Replace all <something>s with actual values. Also change repository name if you are using a different name.

    REGION=<region>
    ACCOUNT_ID=<account id>
    REPOSITORY_NAME=mac/exiftool
    ECR_URL=$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
    TAG=latest

    aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_URL
    docker tag $REPOSITORY_NAME:$TAG $ECR_URL/$REPOSITORY_NAME:$TAG
    docker push $ECR_URL/$REPOSITORY_NAME:$TAG

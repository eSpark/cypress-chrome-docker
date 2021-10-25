Cypress Chrome Docker
---------------------

Custom Docker image for running eSpark tests.
2021/10/25 AHK: It would be great to remove this in favor of running one of Cypress' provided images, however, that work is non-trivial.

## Publishing new versions

* Log into the `espark` Docker account locally (`docker login`)
* `docker tag $LOCAL_HASH espark/cypress-chrome-docker:$TAG_NAME`
* `docker push espark/cypress-chrome-docker:$TAG_NAME`
* Verify that it's pushed at https://hub.docker.com/repository/docker/espark/cypress-chrome-docker


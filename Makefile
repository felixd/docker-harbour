NAME   := elmarit/harbour
TAG    := $$(git log -1 --pretty=%!H(MISSING))
IMG    := ${NAME}:${TAG}
LATEST := ${NAME}:build
 
build:
  @docker build -t ${IMG} .
  @docker tag ${IMG} ${LATEST}
 
push:
  @docker push ${NAME}
 
login:
  @docker log -u ${DOCKER_USER} -p ${DOCKER_PASS}
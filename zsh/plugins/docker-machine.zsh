if command -v docker-machine > /dev/null 2>&1; then
  if docker-machine ls | grep default | grep Running > /dev/null 2>&1; then
    eval $(docker-machine env default)
  else
    unset DOCKER_CERT_PATH
    unset DOCKER_HOST
    unset DOCKER_MACHINE_NAME
    unset DOCKER_TLS_VERIFY
  fi
fi

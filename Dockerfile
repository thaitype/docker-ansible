ARG ALPINE_VERSION=3.22
ARG PYTHON_VERSION=3.13.5

FROM python:${PYTHON_VERSION}-alpine${ALPINE_VERSION}

# Install openssl and bash for better scripting
RUN apk add --no-cache \
      gcc \
      musl-dev \
      libffi-dev \
      openssl-dev \
      sshpass \
      bash \
      curl

# Use environment variables for versioned pip install
ARG ANSIBLE_VERSION
ARG PYWINRM_VERSION

RUN pip install --no-cache-dir \
  "ansible==${ANSIBLE_VERSION}" \
  "pywinrm==${PYWINRM_VERSION}"
  
# Set working directory
WORKDIR /app

ENTRYPOINT ["ansible"]
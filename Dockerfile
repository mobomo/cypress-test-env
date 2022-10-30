FROM mobomo/cypress-test-runner:latest

WORKDIR "/app"

RUN apt-get update -y && \
  apt-get install wget -y

RUN mkdir -p /mnt/server-data && \
  wget -O- https://aka.ms/install-vscode-server/setup.sh | sh && \
  code-server --accept-server-license-terms --disable-telemetry --server-data-dir /mnt/server-data \
  serve-local --install-extension akamud.vscode-theme-onedark --install-extension alexkrechik.cucumberautocomplete \
  --install-extension SanaAjani.taskrunnercode --install-extension shevtsov.vscode-cy-helper

COPY ./testing.code-workspace /app

ENTRYPOINT [ "code-server", "--accept-server-license-terms", "--disable-telemetry", "--server-data-dir", "/mnt/server-data", "serve-local", "--host", "0.0.0.0", "--without-connection-token" ]

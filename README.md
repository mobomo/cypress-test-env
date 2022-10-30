# Mobomo Cypress Test Development Environment

Based on the mobomo/cypress-test-runner image, and provides a web based VS Code IDE to natively develop and debug Cypress/Cucumber tests for any project.

## Docker Compose Example
``` yml
version: "3.9"
services:
  test-dev:
    image: mobomo/cypress-test-env:latestS
    ports:
      - 8000:8000
    networks:
      - cypress
    volumes:
      - server-data:/mnt/server-data
      - ./tests:/app/app
      - ./reports:/app/reportsS
volumes:
  server-data:
networks:
  cypress:
```

### The mounted volumes include:
 - `server-data`: a persistent volume to store the vscode server binary and data.
 - `./tests`: which is the folder containing the test code
 - `./reports`: The location that the cypress test reports need to be written out to.
 - (Not included in example) a `cypress.config.js` cypress configuration can be mounted at `/app/cypress.config.js` to override the default container configuration.

## Connecting to the environment
The container exposes port 8000.  Browse to http://localhost:8000/?workspace=/app/testing.code-workspace which will load the appropriately pre-configured workspace where the test code can be created/edited and ran.

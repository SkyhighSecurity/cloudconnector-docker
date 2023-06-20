# Introduction
This project installs the Skyhigh Cloud Connector in a docker container (current version 6.3.2.2).  You must supply the installation parameters as environment variables:


**SKYHIGH_USERNAME** -- The username of a Skyhigh dashboard user with the Cloud Connector User role. If your tenant is SAML federated, the user should be in the User Exclusions list and have a password set.

**SKYHIGH_PASSWORD** -- The password for the Skyhigh dashboard user.

**SKYHIGH_SALT** -- A salt value to ensure privacy when tokenizing data (remember this value)

**SKYHIGH_ENV** -- The base url you see when you login with /shnapi/ at the end.  For instance, if you see *https://www.myshn.net* then this value will be *https://www.myshn.net/shnapi*.

**SKYHIGH_PORT** --	The TCP port the WebUI will listen for connections on.  *8443* is the recommended port.

**ACCEPT_TERMS** -- Set this value to YES to indicate that you agree to our terms of service / use.

    

# Installation

## Considerations

It is recommended that you provide persistent storage for your installation in order to facilitate backup and recovery of your log files and configuration.  Mount your storage to the container at /usr/local/shnlp.

We recommend host networking mode but you can also choose to map ports or supply a dedicated network address depending on your requirements.

## Docker

```
docker run -t -e SKYHIGH_USERNAME='mrchow@trunk.com' -v /path/to/storage:/usr/local/shnlp --network host -e SKYHIGH_PASSWORD='bologna1' -e SKYHIGH_SALT='salt123' -e SKYHIGH_ENV='https://www.myshn.net/shnapi/' -e SKYHIGH_PORT=8443 -e ACCEPT_TERMS='YES' ghcr.io/skyhighsecurity/cloudconnector-docker:latest
```

## Docker Compose

```
version: '3'
services:
  cloudconnector:
    image: ghcr.io/skyhighsecurity/cloudconnector-docker:latest
    environment:
      - SKYHIGH_USERNAME='mrchow@trunk.com'
      - SKYHIGH_PASSWORD='bologna1'
      - SKYHIGH_SALT='salt123'
      - SKYHIGH_ENV='https://www.myshn.net/shnapi/'
      - SKYHIGH_PORT='8443'
	  - ACCEPT_TERMS='YES'
    volumes:
      - /path/to/storage:/usr/local/shnlp
    network_mode: host
```

# FAQ

### Can I run this in production?
For performance reasons we recommend a dedication virtual machine for production workloads. The container is intended as solution for lab and POC environments.

### Is this supported?
While cloud connector is fully supported, however this installation method is not officially supported by Skyhigh Security.

### Where can I find the terms and/or condictions of use?
Please see [Shyhigh Security Cloud Software](https://success.myshn.net/Software_Downloads/Download_Software/01_MVISION_Cloud_Installers)

# Anaconda Docker

This project provides a dockerized anaconda environment customised for data analysis work. When deployed, a Jupyter notebook will be available via localhost on port 8888.

## Requirements

To make use of this project, the following software needs to be available on your system:

- [Docker](https://docs.docker.com/get-docker/)

- [Docker-Compose](https://docs.docker.com/compose/install/)

Optional:

- [GNU Make](https://www.gnu.org/software/make/)

Note: GNU Make is not required, it is simply included to streamline the deployment process.

## Deployment (GNU Make)

To deploy the service, run the following command in your terminal of choice from the parent directory `anaconda-docker`:

> make deploy

This will pull down the required Docker image, and deploy the service. Once complete, you can verify the service is running via the command:

> docker ps -a

This will display all Docker containers up on your system, the relevant ones will look similar to the following:

```console
CONTAINER ID   IMAGE                  COMMAND                  CREATED          STATUS                      PORTS                                       NAMES
3983c7eeed4e   data-mining-anaconda   "bash -c 'conda inst…"   20 minutes ago   Up 20 minutes               0.0.0.0:8888->8888/tcp, :::8888->8888/tcp   build_data-mining-env_1
2d40d82a8101   data-mining-anaconda   "bash -c 'conda inst…"   20 minutes ago   Up 20 minutes               8888/tcp                                    build_data-mining-env_run_44de72c313f9
```

## Deployment (Docker-Compose)

If GNU Make is unavailable on your system, you may deploy the service using Docker-Compose specific commands. From the `build` directory, run the following command from your terminal of choice:

> docker-compose build && docker-compose run -d data-mining-env && docker-compose up -d --force-recreate

## Accessing the Notebook

To access the Jupyter notebook via browser, you will require a token. This token is included as part of a URL link generated once the service is up and running. You can obtain this link by running the following command:

> docker logs build_data-mining-env_1

In the logs, you will see a link similar to the following:

```
To access the notebook, open this file in a browser:
       file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
   Or copy and paste one of these URLs:
       http://3983c7eeed4e:8888/?token=c059cef975645c7f391cd3ff29eabedb790f723190010bb1
    or http://127.0.0.1:8888/?token=c059cef975645c7f391cd3ff29eabedb790f723190010bb1
```

Copy the `localhost` option (127.0.0.1) and paste it into your browser, you will now have access to the Jupyter notebook GUI.

## Volumes

The default `docker-compose.yml` included pulls in the repository files as a volume, therefore you may add any additional files on the host that you may need.

## Dockerfile

The included Dockerfile installs a number of packages related to data analysis, feel free to add any additional ones you may need.

## Cleanup

To remove the Docker container and image using Make, run the following command from the parent directory `anaconda-docker`:

> make cleanup

Otherwise, navigate to the `build` folder and run the command:

>  docker-compose down --rmi all -v

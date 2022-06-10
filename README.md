# DevOps Challenge

## Key Challenge: Package the HTTP application for deployment

In this challenge, you're given the code for a simple Node application that serves up data from a PostgreSQL database over HTTP.

Your task is to write a docker-compose.yml file (or files) with which the application can be run inside a Docker container.

In addition to your docker-compose.yml file(s), you may include whatever other files you think appropriate or necessary, but you are not allowed to modify any of the given files.

### app

Define an `app` service in your docker-compose.yml file which can build an `app` docker image and launch a server container on port 4200. Use the files in the `app` directory to build the `app` image. The server should run on Node v12.22.

To run the web server process,  execute these commands in the directory containing the app's `package.json` file:

- `npm install` : install dependencies
- `npm start`   : launch server process on port 3000

The web server returns data from the DB server. You need to provide the DB credentials to the web server via environment variables:

- `IMMO_DB_HOST`
- `IMMO_DB_USER`
- `IMMO_DB_PASSWORD`
- `IMMO_DB`

### db

Define a `db` service in your docker-compose.yml file which can launch a database server container on port 5432. The database server should run PostgreSQL 12.

You can either build your own `db` image, or use [the official PostgreSQL image](https://hub.docker.com/_/postgres). If you'd like to use your own docker image, please also submit that Dockerfile and the necessary files to build the image.

Your docker-compose.yml file should:

- Create the database `welcome_immo`
- Create the user `immo` with password `immoChallenge!`
- Create a table `t_property` containing some sample data. We provide `db/setup.sql` which you can use to create the table and data
- Persist the data directory

### Expected Results

- Running `docker-compose build` builds the `app` service Docker images. If you choose to build your own Docker image for the database, it also builds the `db` image.
- `docker-compose up` spins up both `db` and `app` servers
- `curl http://localhost:4200` returns the following response:

```
33316ec1-a951-4e95-86df-69520ba1e7c5: Plough Ln, London SW17 0BL
a153fd13-afdb-4682-836e-b6a13d25a530: Royal Botanic Gardens, Kew, Richmond, Surrey, TW9 3AE
56ea244e-fcbe-4de3-b213-bc5dbade2664: Stables Market, Chalk Farm Road, London NW1
a81bc81b-dead-4e5d-abff-90865d1e13b1: Whitton Rd, Twickenham TW2 7BA
```

N.B. The app will run on port 3000 but you need to expose it as 4200 without modifying the application code

### Submission Format

A zip file which contains the `app` Dockerfile, a docker-compose.yml file, plus any other shell scripts or other files needed to build and serve the web server and database (optionally including the `db` Dockerfile and related files if you chose to make your own `db` image).


## Bonus Challenge

This is a bonus challenge designed to give you an opportunity to show your skills and knowledge about Infrastructure as Code (IaC) tools such as Terraform.
You don't need to complete this challenge if you aren't familiar with any IaC tools, or the time doesn't permit.

Draft some scripts to provision infrastructure to deploy `app` containers.

- Provision and deploy the `app` Docker image to the cloud (e.g. on ECS/EKS)
- Provision and deploy the Database (e.g. on RDS)
- Whatever else is necessary to provision the two previous resources

### Expected Results

- The `app` service can be deployed according to the instructions you give in a README.md file (assume that we have a Cloud API key with which to authenticate ourselves when running it)

### Submission Format

A zip file which contains the code necessary to provision and deploy the infrastructure and instructions in a README.md file.
You can choose any format and mixture of files (e.g. terraform/ansible/shell scripts/text documents).

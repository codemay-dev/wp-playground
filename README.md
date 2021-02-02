# wp-playground

Running this command will run docker compose to create the docker container and run Worpdress and MySql inside it:

```bash
make start
```

Running this command will export the database to the data folder as dump.sql then close the docker container:

```bash
make stop
```

Running this command will export the database to the data folder as dump.sql:

```bash
make export_db
```

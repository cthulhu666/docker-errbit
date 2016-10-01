# docker-errbit
Dockerized Errbit

[![](https://images.microbadger.com/badges/image/cthulhu666/errbit.svg)](https://microbadger.com/images/cthulhu666/errbit "Get your own image badge on microbadger.com")

## Quickstart with Docker Compose ( https://docs.docker.com/compose/ )

```
git pull git@github.com:cthulhu666/docker-errbit.git
cd docker-errbit
docker-compose up
```

In another console, use `docker ps` to check on which tcp port errbit awaits connections;
You will see something like:

```
35ceea0c8f85        mongo:3.3           "/entrypoint.sh mongo"   2 minutes ago       Up 2 minutes        27017/tcp                 dockererrbit_db_1
61f2f27cdb52        cthulhu666/errbit   "/bin/sh -c 'foreman "   2 minutes ago       Up 2 minutes        0.0.0.0:32769->3000/tcp   dockererrbit_app_1
```

Open your browser at `http://localhost:32769`

To register a user:

```
docker-compose exec app rails c
```

and once irb console shows up:

```
User.create! email: 'your.email@foobar.com', password: 'mysecretpassword', name: 'My name'
```

Enjoy :)


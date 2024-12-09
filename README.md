## ビルドする

~~~bash
docker compose build
~~~


## コンテナを起動

~~~bash
docker compose up -d
~~~


## 動作確認

`docker compose ps`コマンドで`backend`、`frontend`、`postgres`コンテナが起動しているか確認する

~~~bash
docker compose ps
# NAME                      IMAGE                   COMMAND                   SERVICE    CREATED         STATUS         PORTS
# nextjs-rails-backend-1    nextjs-rails-backend    "bash -c 'rm -f tmp/…"   backend    3 minutes ago   Up 3 minutes   0.0.0.0:3000->3000/tcp
# nextjs-rails-db-1         postgres:17.2           "docker-entrypoint.s…"   db         3 minutes ago   Up 3 minutes   0.0.0.0:5432->5432/tcp
# nextjs-rails-frontend-1   nextjs-rails-frontend   "docker-entrypoint.s…"   frontend   3 minutes ago   Up 3 minutes   0.0.0.0:4000->4000/tcp
~~~

<http://localhost:4000>にアクセスしてVite x React.jsの画面が表示されればok

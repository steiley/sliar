# 概要

これは以下の条件でつくられたRailsアプリケーションです
- Ruby, Railsが最新(2017/11/2 現在)
- ログイン認証がある
- habtmを使っている
- CRUDを使っている

# 環境構築
Dockerが動く環境を想定
## セットアップ
```
docker-compose build
docker-compose run --rm web bin/setup

```
## 起動
```
docker-compose up -d
```

## 終了
```
docker-compose stop
```

http://localhost:3500/
でアクセスできます

### MacOSで動作が重い場合以下でdocker-syncを使えば改善するかも
```
gem install docker-sync
docker-sync start && docker-compose -f docker-compse-dev.yml -f docker-compose-dev.yml up -d
```

# 概要

これは主にGitHub Actionsの動作確認に使っているRailsアプリケーションです。  
また、Ruby,Railsのバージョンアップの知見の蓄積も兼ねてRuby,Railsは最新となるよう更新しています。

# 環境構築
Dockerが動く環境を想定

## セットアップ
```
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
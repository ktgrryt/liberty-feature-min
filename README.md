# Liberty Feature Minimization Demo
## 概要
Libertyのスラッシュコマンドによるserver.xmlのレビューを実施するためのデモアプリです。

## 前提の環境
- Maven （検証環境：v3.9.9）
- Java 21
- IBM Bob（CLI版 v0.0.32、GUI版 v0.0.14）

上記環境が揃っていれば、このプロジェクトをローカルにクローンするだけで事前の準備は完了です。

## デモ方法
プロジェクトファイルのあるディレクトリに移動し、以下のコマンドでアプリケーションを起動します。

```bash
mvn liberty:dev
```

http://localhost:9080/demo-app でアクセス可能です。問題なく動作しているか確認してください。

次に、このアプリのfeatureを最小化します。

プロジェクトファイルの中にある`liberty-feature-min.md`を以下どちらかに配置してください。
- `.bob/commands/`
- `~/.bob/commands/`

Bobのチャット欄で`/liberty-feature-min`と入力すると、先ほどのmdファイルを元にコマンドが実行され、server.xmlがレビューされます。

レビュー時点でのserver.xmlは以下の通りです。
今回のアプリではServletとJSPを使用したシンプルなアプリなので、以下のフィーチャーのうちほとんどは不要です。
```xml
    <featureManager>
        <feature>jakartaee-10.0</feature>
        <feature>microProfile-7.0</feature>
        <feature>ssl-1.0</feature>
        <!-- 以下は検証用の追加feature（不要） -->
        <feature>websocket-2.1</feature>
        <feature>jsonb-3.0</feature>
        <feature>jsonp-2.1</feature>
    </featureManager>
```

レビュー後に以下のようなプロンプトで、featureの構成を最小化してください。

```plaintext
提案された内容をもとに、server.xmlのfeatureを最小化してください。
```

server.xmlの修正が完了したら、再度アプリを起動します。

```bash
mvn liberty:dev
```

問題なく動作していることを確認してください。

## ポイント
- レビュー結果を元にBobに指示をすることで、server.xmlのfeatureの編集や、レポートをmdファイルとして出力させることも可能です。
- server.xmlのフィーチャーを最小化することで、アプリの起動時間が短縮されることを確認してください。
- 詳細は以下の記事を参照してください。
  - https://qiita.com/ktgr/items/667b1d22602c3c1ffbdd

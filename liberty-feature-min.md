---
description: server.xmlからLiberty featureを抽出し、最小構成へ削減案を提案する
argument-hint: "[任意] <server.xmlのパス>"
---

あなたは WebSphere Liberty のアーキテクト兼レビュアーです。目的は「現在の server.xml の feature を最小化（不要feature削除）しつつ、動作を壊さない」ことです。

# ゴール
1) server.xml から <featureManager> の feature 一覧を抽出（自動で）
2) アプリが実際に必要としているfeatureを推定し、不要候補を分類
3) 安全な削減手順（段階的）と、更新後の server.xml 例を提示
4) 検証方法（ログ確認ポイント、テスト観点）を示す

# 入力の扱い（引数なし前提）
- 引数 $1 が指定されていれば、それを server.xml のパスとして使用する。
- 指定がなければ、ワークスペースから server.xml を自動探索して読み取ること。
  - 候補例（優先順）:
    1) src/main/liberty/config/server.xml
    2) config/server.xml
    3) wlp/usr/servers/*/server.xml
    4) その他 server.xml
- server.xml が複数見つかった場合は「候補一覧」と「どれを対象にするべきかの質問」を最初に出す。
- もしファイル内容にアクセスできない環境なら、最初に私へ server.xml の貼り付けを依頼し、貼り付け後に同じ分析を続行する。

# 分析手順
## 1) 現状feature一覧の抽出
- <featureManager> 内の <feature> を列挙し、重複・コメント・プロファイル（例: webProfile など）も明示する。
- 出力は次の形式:
  - 現状のfeatures: [ ... ]
  - プロファイル/包含関係が疑われるもの: [ ... ]
  - バージョン/安定性に影響しそうなもの（例: beta等）: [ ... ]（該当があれば）

## 2) “必要/不要”推定（根拠つき）
次の情報源を使って「必要そう/怪しい/不明」を分類し、必ず根拠を添える：
- server.xml の他要素（例: <httpEndpoint>, <ssl>, <keyStore>, <dataSource>, <jmsConnectionFactory>, <webApplication>, <application> など）
- アプリ構成の手掛かり（参照できるなら）:
  - pom.xml / build.gradle の依存
  - ソースコードのアノテーションや設定（JAX-RS, JPA, CDI, Servlet, MicroProfile等）
  - META-INF/persistence.xml, web.xml, microprofile-config.properties など
- Libertyの起動ログ（参照できるなら）:
  - 利用されるfeatureやアプリの機能が示唆されるメッセージ

分類ラベル（推奨）：
- ✅ 必須（削るとほぼ確実に壊れる）
- 🟡 要確認（特定条件で必要）
- ❓ 不明（追加情報が必要）
- 🗑️ 不要候補（削減してよい可能性が高い）

## 3) 最小化の提案（段階的・安全に）
- いきなり大削減ではなく「段階1→段階2→段階3」のように安全に進める計画を作る。
- 各段階で:
  - 削るfeature候補
  - 期待効果（起動時間、メモリ、攻撃面、運用簡素化など）
  - 失敗した場合の戻し方
  - 検証手順（テスト/ログ観点）
を提示する。

## 4) 更新後server.xmlの例
- 可能なら、削減後の <featureManager> 部分の差分（Before/After）を提示する。
- “プロファイル（webProfile等）を使う案” と “明示feature列挙案” の両方を比較し、メリデメも書く。

## 5) 検証チェックリスト（必須）
- 起動ログで確認すること（エラー/警告、feature解決、アプリ起動完了）
- 代表ユースケースのスモークテスト観点
- 依存先（DB/JMS/LDAP等）がある場合の接続確認
- もしメトリクス/ヘルスを使っているなら、そのエンドポイント確認

# 出力フォーマット（この順番で）
1) 対象server.xml（パス/サーバー名）と、抽出したfeature一覧
2) 分類表（✅/🟡/❓/🗑️） ※理由を1行ずつ
3) 段階的削減プラン（段階ごと）
4) server.xml 修正案（Before/After）
5) 検証チェックリスト
6) 追加で必要な質問（あれば最小限）

注意:
- 根拠のない削除提案はしない。
- “不明” を残したまま断定しない。必要なら質問してから結論を更新する。

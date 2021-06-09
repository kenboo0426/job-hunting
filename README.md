# Job Hunting

キーワードを入れることによって、ヒットした求人情報を毎朝8時にSlackに通知できるアプリです

## 利用方法
ルートディレクトリに.envファイルを作成する

.envファイルに以下を定義する

・WEBHOOK = "Slackで取得したwebhook" 

・CHANNEL="Slackのチャンネル名"

services/parser配下にあるファイルにキーワードを記述する

:例
KEYWORDS = %w(Rails rails Ruby ruby)



## 環境
ruby 2.6.6

rails 6.1.3.2


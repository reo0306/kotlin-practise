FROM openjdk:21-jdk-slim as build

# ビルドに必要なパッケージをインストール
RUN apt-get update && apt-get install -y wget unzip curl jq

# 最新バージョンのKotlinをインストール
RUN LATEST_KOTLIN_VERSION=$(curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest | jq -r .tag_name | sed 's/^v//') && \
    wget https://github.com/JetBrains/kotlin/releases/download/v${LATEST_KOTLIN_VERSION}/kotlin-compiler-${LATEST_KOTLIN_VERSION}.zip && \
    unzip kotlin-compiler-${LATEST_KOTLIN_VERSION}.zip -d /opt && \
    ln -s /opt/kotlinc/bin/kotlinc /usr/local/bin/kotlinc

WORKDIR /app

# カレントディレクトリ直下にあるHelloWorld.ktを使う
COPY ./src/main.kt .
RUN /usr/local/bin/kotlinc main.kt -include-runtime -d main.jar

# 6. 実行環境の準備
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=build /app/main.jar .

# コンテナ起動時に実行するコマンド
ENTRYPOINT ["java", "-jar", "main.jar"]


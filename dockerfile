# Elixir과 Erlang을 포함하는 베이스 이미지를 사용
FROM elixir:latest

# 애플리케이션을 위한 디렉토리 생성
WORKDIR /app

# 애플리케이션 의존성을 복사하고 업데이트
COPY mix.exs mix.lock ./
RUN mix do local.hex --force, local.rebar --force, deps.get, deps.compile

# 애플리케이션 소스 코드를 복사
COPY . .

# 애플리케이션 컴파일 및 빌드
RUN mix compile

# 애플리케이션 실행을 위한 포트 설정 (Phoenix의 기본 포트는 4000)
EXPOSE 4000

# 애플리케이션 실행 (Phoenix 서버 시작)
CMD ["mix", "phx.server"]

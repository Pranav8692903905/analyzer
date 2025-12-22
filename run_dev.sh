#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Checking MySQL (resume-mysql) ..."
if docker ps -a --format '{{.Names}}' | grep -q '^resume-mysql$'; then
  if ! docker ps --format '{{.Names}}' | grep -q '^resume-mysql$'; then
    docker start resume-mysql >/dev/null
    echo "Started existing MySQL container resume-mysql"
  else
    echo "MySQL container already running"
  fi
else
  echo "Launching MySQL container resume-mysql on port 3307..."
  docker run -d --name resume-mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=resume_db \
    -p 3307:3306 mysql:8 >/dev/null
  echo "MySQL container launched."
fi

echo "==> Starting backend (FastAPI on :8000) ..."
pushd "$ROOT_DIR/backend" >/dev/null
# Stop any process on 8000
lsof -ti:8000 | xargs -r kill || true
# Start backend detached
nohup python -m uvicorn main:app --host 0.0.0.0 --port 8000 --reload > backend.log 2>&1 &
BACKEND_PID=$!
echo "$BACKEND_PID" > .backend.pid
popd >/dev/null

# Wait for backend health
for i in {1..40}; do
  if curl -s http://localhost:8000/ >/dev/null; then
    break
  fi
  sleep 0.25
done

echo "==> Starting frontend (Vite on :5173) ..."
pushd "$ROOT_DIR/frontend" >/dev/null

# Open browser if $BROWSER is available
if [[ -n "${BROWSER:-}" ]]; then
  "$BROWSER" "http://localhost:5173" >/dev/null 2>&1 || true
fi

# Cleanup backend on exit
cleanup() {
  if [[ -f "$ROOT_DIR/backend/.backend.pid" ]]; then
    echo "==> Stopping backend (PID $(cat "$ROOT_DIR/backend/.backend.pid"))"
    kill "$(cat "$ROOT_DIR/backend/.backend.pid")" 2>/dev/null || true
    rm -f "$ROOT_DIR/backend/.backend.pid"
  fi
}
trap cleanup EXIT

npm run dev

popd >/dev/null

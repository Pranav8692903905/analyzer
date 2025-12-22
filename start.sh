#!/bin/bash

echo "🚀 Starting Smart Resume Analyzer"

# Load env if present
if [ -f backend/.env ]; then
	echo "Loading backend/.env"
	set -a
	. backend/.env
	set +a
fi

# Start backend
echo "Starting backend server..."
cd backend
python main.py &
BACKEND_PID=$!

# Wait for backend to start
sleep 3

# Start frontend
echo "Starting frontend server..."
cd ../frontend
npm run dev &
FRONTEND_PID=$!

echo "✅ Application started!"
echo "Backend: http://localhost:8000"
echo "Frontend: http://localhost:5173"
echo ""
echo "Press Ctrl+C to stop both servers"

# Wait for Ctrl+C
trap "kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait

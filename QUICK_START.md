# Quick Start Guide

## Current Status
✅ Backend Server: RUNNING on http://localhost:8000
✅ Frontend Server: RUNNING on http://localhost:5174
✅ Database: Created and ready
✅ All dependencies: Installed

## Access Your Application

Open your browser and go to:
**http://localhost:5174**

## What You Can Do

### 1. Upload Resume (Home Page)
- Click "Choose PDF File" or drag & drop
- Upload any PDF resume
- Get instant analysis!

### 2. View Results
After upload, you'll see:
- ✅ Resume Score (out of 100)
- ✅ Your Skills
- ✅ Predicted Career Field
- ✅ Experience Level
- ✅ Recommended Skills
- ✅ Course Suggestions
- ✅ Contact Info Analysis

### 3. Admin Dashboard
- Click "Admin" in navigation
- View statistics
- See all uploaded resumes
- Track field & level distribution

## Test the Application

### Quick Test Steps:
1. Open http://localhost:5174
2. Upload a PDF resume
3. Wait for analysis (2-5 seconds)
4. View your results!
5. Go to Admin page to see statistics

## Stop the Servers

If you started with `./start.sh`:
- Press `Ctrl+C` in the terminal

If you started manually:
- Stop backend: Press `Ctrl+C` in backend terminal
- Stop frontend: Press `Ctrl+C` in frontend terminal

## Restart the Application

```bash
./start.sh
```

Or manually:
```bash
# Terminal 1
cd backend && python main.py

# Terminal 2  
cd frontend && npm run dev
```

## Troubleshooting

### Port Already in Use
If port 5173 is busy, Vite will automatically use 5174 (already configured)

### Backend Not Responding
```bash
cd backend
python main.py
```

### Frontend Not Loading
```bash
cd frontend
npm run dev
```

### Database Issues
Delete the database and restart:
```bash
rm backend/resume_analyzer.db
cd backend && python main.py
```

## Sample Resume for Testing

Create a simple PDF with:
- Your name
- Email address
- Phone number
- Skills (e.g., Python, React, JavaScript)
- Education
- Experience

The more skills you add, the better the analysis!

## Need Help?

Check these files:
- `README.md` - Complete documentation
- `PROJECT_SUMMARY.md` - Project overview
- `backend/README.md` - Backend details

## Enjoy! 🎉

Your Smart Resume Analyzer is ready to use!

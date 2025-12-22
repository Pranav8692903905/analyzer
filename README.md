# Smart Resume Analyzer

A modern web application for analyzing resumes using AI. Built with React TypeScript frontend and FastAPI Python backend.

## Features

- 📄 PDF Resume Upload and Analysis
- 🎯 Skill Detection and Field Prediction
- 💯 Resume Score Calculation
- 💡 Skill Recommendations
- 🎓 Course Suggestions
- 📊 Admin Dashboard with Statistics
- 🗄️ SQLite Database Storage

## Project Structure

```
analyzer/
├── backend/           # FastAPI Python backend
│   ├── main.py       # Main API server
│   ├── resume_parser.py  # PDF parsing and NLP
│   ├── database.py   # SQLite database operations
│   ├── courses.py    # Course recommendations
│   └── requirements.txt
└── frontend/         # React TypeScript frontend
    ├── src/
    │   ├── components/  # React components
    │   ├── pages/       # Page components
    │   ├── api/         # API client
    │   └── App.tsx
    └── package.json
```

## Setup and Installation

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Install Python dependencies:
```bash
pip install -r requirements.txt
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.7.1/en_core_web_sm-3.7.1-py3-none-any.whl
```

3. Start the backend server:
```bash
python main.py
```

Backend will run on: http://localhost:8000

### Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install Node dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

Frontend will run on: http://localhost:5173 (or next available port)

## Usage

1. **Upload Resume**: Go to home page and upload a PDF resume
2. **View Analysis**: See detailed analysis including:
   - Resume score
   - Detected skills
   - Predicted field
   - Experience level
   - Recommended skills to add
   - Course suggestions
3. **Admin Dashboard**: View statistics and all uploaded resumes

## Tech Stack

### Frontend
- React 19
- TypeScript
- React Router
- Axios
- Lucide React (icons)
- Vite

### Backend
- FastAPI
- Python 3.12
- Spacy (NLP)
- PyPDF2
- SQLite
- Uvicorn

## API Endpoints

- `POST /api/upload-resume` - Upload and analyze resume
- `GET /api/admin/stats` - Get statistics
- `GET /api/admin/resumes` - Get all resumes
- `GET /api/courses/{field}` - Get courses by field

## Database

The application uses SQLite for data storage. The database file (`resume_analyzer.db`) is automatically created in the backend directory.

### Schema

**user_data table:**
- id (PRIMARY KEY)
- name
- email
- resume_score
- timestamp
- page_no
- predicted_field
- user_level
- actual_skills
- recommended_skills
- recommended_courses

## Development

- Backend runs with auto-reload enabled
- Frontend uses Vite HMR (Hot Module Replacement)
- CORS is configured for local development

## License

MIT License

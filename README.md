# Mental Wellness Check (MWC) System

A Database-Driven Approach to Tracking Mental Health & Daily Activities.

## Overview
The Mental Wellness Check (MWC) System is a web application designed to help individuals or organizations track, log, and analyze daily mental health. The system utilizes static frontend interfaces coupled with a robust relational SQL database for analytics.

## Features
- **User Authentication (UI):** Registration and Login pages with department tracking.
- **Daily Check-ins:** Users can log their mood and stress level (1 to 10).
- **Activity Tracking:** Log daily wellness activities like Exercise, Reading, and Meditation.
- **Analytical Dashboards:** Visualizing stress trends and activity history using responsive, animated charts (`Chart.js`).
- **Normalized Relational SQL Database:** Stores and structures user data, moods, and activities efficiently for organizational analytics.

## Technologies Used
- HTML5, CSS3, JavaScript
- Bootstrap 5
- Chart.js (for graphical analytics)
- SQLite (for the database backend)

## Database Structure & Queries
The database is fully configured in the `db/` folder as `database.sqlite` and was built using `schema.sql`.

To view the database from the terminal, run:
```bash
sqlite3 db/database.sqlite
```

Then format the output clearly by running these interactive commands:
```sql
.mode box
.header on
```

### Key Analytical Queries

**1. Average Stress Level Grouped By Mood**
```sql
SELECT mood, ROUND(AVG(stress_level), 1) AS average_stress, COUNT(*) as total_checkins 
FROM mood_checkins 
GROUP BY mood 
ORDER BY average_stress DESC;
```

**2. Top 3 Most Common Wellness Activities**
```sql
SELECT activity_name, COUNT(activity_name) AS times_performed 
FROM activity_items 
GROUP BY activity_name 
ORDER BY times_performed DESC 
LIMIT 3;
```

**3. Advanced JOIN (User's Latest Activity)**
```sql
SELECT u.name, u.department, d.date AS latest_activity_date, a.activity_name 
FROM users u 
JOIN daily_activities d ON u.id = d.user_id 
JOIN activity_items a ON d.id = a.daily_activity_id 
ORDER BY d.date DESC;
```

## How to Run the Frontend
You can launch the frontend application by using any standard static file server in the `frontend/` directory.

Example using Python:
```bash
cd frontend/
python3 -m http.server 8000
```
Then visit `http://localhost:8000` in your web browser.

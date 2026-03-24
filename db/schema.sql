-- Database Schema for Mental Wellness System

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    department TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mood_checkins (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    date DATE NOT NULL,
    mood TEXT NOT NULL,       -- e.g., 'Happy', 'Sad', 'Stressed', 'Calm', 'Tired'
    stress_level INTEGER NOT NULL CHECK(stress_level >= 1 AND stress_level <= 10),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS daily_activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    date DATE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS activity_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    daily_activity_id INTEGER NOT NULL,
    activity_name TEXT NOT NULL, -- e.g., 'Exercise', 'Reading', 'Meditation'
    FOREIGN KEY(daily_activity_id) REFERENCES daily_activities(id) ON DELETE CASCADE
);

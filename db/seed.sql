-- Seed Data for Mental Wellness System

-- 1. Create a dummy user
INSERT INTO users (id, name, email, password_hash, department) 
VALUES (1, 'Admin User', 'admin@example.com', 'hashed_password_here', 'Engineering');

-- 2. Insert Mood Check-ins from Chart Data
INSERT INTO mood_checkins (user_id, date, mood, stress_level) VALUES
(1, '2026-03-01', 'Calm', 3),
(1, '2026-03-02', 'Sad', 5),
(1, '2026-03-03', 'Stressed', 7),
(1, '2026-03-04', 'Calm', 2),
(1, '2026-03-05', 'Happy', 3);

-- 3. Insert Daily Activities from Chart Data
INSERT INTO daily_activities (id, user_id, date) VALUES
(1, 1, '2026-03-01'),
(2, 1, '2026-03-02'),
(3, 1, '2026-03-03'),
(4, 1, '2026-03-04'),
(5, 1, '2026-03-05');

-- 4. Insert Activity Items
INSERT INTO activity_items (daily_activity_id, activity_name) VALUES
(1, 'Exercise'),
(2, 'Journaling'),
(3, 'Friends'),
(4, 'Meditation'), (4, 'Music'),
(5, 'Exercise'), (5, 'Reading');

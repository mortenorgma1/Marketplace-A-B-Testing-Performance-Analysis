INSERT INTO regions (region_id, region_name, demand_level) VALUES
(1, 'City Center', 'High'),
(2, 'Business District', 'High'),
(3, 'Residential Area', 'Medium'),
(4, 'Suburbs', 'Medium'),
(5, 'Outskirts', 'Low')
ON CONFLICT (region_id) DO NOTHING;

INSERT INTO experiments (experiment_id, experiment_name, start_date, end_date) VALUES
(1, 'Vehicle Rebalancing Algorithm Test', '2025-01-01', '2025-01-31')
ON CONFLICT (experiment_id) DO NOTHING;


INSERT INTO users (user_id, region_id)
SELECT
    user_id,
    CASE
        WHEN random() < 0.3 THEN 1
        WHEN random() < 0.5 THEN 2
        WHEN random() < 0.7 THEN 3
        WHEN random() < 0.9 THEN 4
        ELSE 5
    END AS region_id
FROM generate_series(1, 200) AS user_id;


INSERT INTO experiment_events (
    event_id,
    experiment_id,
    user_id,
    variant,
    ride_requested,
    ride_completed,
    wait_time_minutes,
    revenue,
    event_date
)
SELECT
    row_number() OVER () AS event_id,
    1 AS experiment_id,
    u.user_id,
    CASE
        WHEN random() < 0.5 THEN 'A'
        ELSE 'B'
    END AS variant,
    1 AS ride_requested,

    -- Ride completion logic
  
CASE
    WHEN random() <
        CASE
            WHEN r.demand_level = 'High' THEN 0.80
            WHEN r.demand_level = 'Medium' THEN 0.70
            ELSE 0.60
        END
    THEN 1
    ELSE 0
END AS ride_completed,


    -- Wait time (B is slightly better)
    CASE
        WHEN random() < 0.5 THEN
            GREATEST(2, ROUND(random() * 10 + 4))
        ELSE
            GREATEST(2, ROUND(random() * 8 + 3))
    END AS wait_time_minutes,

    -- Revenue only if completed
CASE
    WHEN random() < 0.7 THEN ROUND((random() * 15 + 8)::numeric, 2)
    ELSE 0
END AS revenue,


    DATE '2025-01-01' + (random() * 30)::INT AS event_date
FROM users u
JOIN regions r ON u.region_id = r.region_id,
     generate_series(1, 2) gs;  -- average ~2 events per user

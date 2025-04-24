git add .

current_time=$(date)

git commit -m "Commit timestamp: $current_time"

git push -u origin main

echo "Big W, associated timestamp: $current_time"



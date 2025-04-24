sudo git add .

current_time=$(date)

sudo git commit -m "Commit timestamp: $current_time"

sudo -E git push -u origin main

echo "Big W, associated timestamp: $current_time"



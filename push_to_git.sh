sudo git add .

current_time=$(date)

sudo git commit -m "Commit timestamp: $current_time"

sudo git push -u origin main

echo "Big W, associated timestamp: $current_time"



git -C /etc/nixos add /etc/nixos/

current_time=$(date)

git -C /etc/nixos commit -m "Commit timestamp: $current_time"

git -C /etc/nixos push -u origin main

echo "Big W, associated timestamp: $current_time"



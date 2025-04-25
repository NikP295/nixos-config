git -C /etc/nixos add .

current_time=$(date)

git -C /etc/nixos commit -m "Commit timestamp: $current_time"



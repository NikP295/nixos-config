git -C /etc/nixos add /etc/nixos/

current_time=$(date)

git -C /etc/nixos commit -m "Commit timestamp: $current_time"



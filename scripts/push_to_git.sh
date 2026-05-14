git -C /etc/nixos add /etc/nixos/

git -C /etc/nixos commit -m "Commit timestamp: $(date)"

git -C /etc/nixos push -u origin main

echo "Big W, associated timestamp: $current_time"



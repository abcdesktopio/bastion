#! /bin/sh

echo "Starting bastion host ssh server..."

if [ -n "$SSHKEY" ]; then
    OLD_IFS="$IFS"
    IFS=','

    for current_key in $SSHKEY; do
        echo "Adding SSH key: $current_key"
        echo "$current_key" >> /home/user/.ssh/authorized_keys
    done

    IFS="$OLD_IFS"
fi
cat /home/user/.ssh/authorized_keys
/usr/sbin/sshd -D
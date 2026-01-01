# Disk Space Monitor Script
- This Bash script checks if the script is being run with root access. If not, it exits with an error message.
- Captures and logs the disk usage in `/var/log/disk-monitor-logs.txt`.
- Compares the current disk usage to a predefined threshold (80% by default).
- If disk usage exceeds the threshold, logs a warning and suggests freeing up space.
- If disk usage is under the threshold, logs that no action is required.

## Prerequisites

- The script needs to be run as root/sudo (administrator) to access system disk usage statistics and write logs to `/var/log/`.

## Running the Script Automatically with Cron

To ensure the script runs automatically at regular intervals, it is recommended to set it up as a **cron job**.
This will allow the script to run periodically (e.g., daily, weekly) and check the disk usage without manual intervention.

### Setting up the Cron Job:

1. Open the cron configuration file for the root user:

    ```bash
    sudo crontab -e
    ```

2. Add the following line to the file to run the script once a day at midnight (12:00 AM):

    ```bash
    0 0 * * * /path/to/disk-monitor.sh
    ```

    **Note:** Make sure to replace `/path/to/disk-monitor.sh` with the actual path where the script is located on your system.





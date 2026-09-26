import os
from datetime import datetime


class BrowserUtility:

    def __init__(self):
        self.log_dir = os.path.join(os.getcwd(), "logs")
        os.makedirs(self.log_dir, exist_ok=True)
        self.log_file = os.path.join(self.log_dir, "execution.log")

    def log_step(self, message):
        """Writes a timestamped line to logs/execution.log and echoes it."""
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        line = f"[{timestamp}] {message}"
        with open(self.log_file, "a", encoding="utf-8") as f:
            f.write(line + "\n")
        print(line)
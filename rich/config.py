# Make sure that rich package is already installed

import os
from datetime import datetime
import logging

from rich import traceback
from rich.logging import RichHandler
traceback.install()

# Create logs directory if it doesn't exist
os.makedirs('logs', exist_ok=True)

# Set up logging with rich formatting for console and file output
log_filename = f"logs/model_run_{datetime.now().strftime('%Y%m%d_%H%M%S')}.log"

# Create formatters
console_formatter = logging.Formatter("%(message)s")
file_formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")

# Create handlers
console_handler = RichHandler(rich_tracebacks=True)
file_handler = logging.FileHandler(log_filename)
file_handler.setFormatter(file_formatter)

# Configure root logger
logging.basicConfig(
    level=logging.DEBUG,
    handlers=[console_handler, file_handler]
)
logger = logging.getLogger(__name__)

import os
import re
import zipfile

zip_path = 'recollect-content.zip'       # Replace with your zip file
target_dir = './Recollect'   # Destination folder

os.makedirs(target_dir, exist_ok=True)

with zipfile.ZipFile(zip_path, 'r') as zf:
  for member in zf.infolist():
    if member.is_dir():
      continue

    # Get just the filename, ignoring internal zip subdirectories (-j equivalent)
    filename = os.path.basename(member.filename)

    # Replace forbidden/problematic characters (e.g., \ / : * ? " < > | ) with an underscore
    clean_name = re.sub(r'[\/\\:?*\"<>|]+', '_', filename)

    # Read file data from zip and write to target directory
    source = zf.open(member)
    target_path = os.path.join(target_dir, clean_name)

    with open(target_path, 'wb') as f:
      f.write(source.read())


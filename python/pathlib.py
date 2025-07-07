from pathlib import Path

p = Path('/')

for subdir in p.iterdir():
    if subdir.is_dir():
        print(subdir)

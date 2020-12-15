import os
basepath = 'logs/marketvol'
dirs = []
files = []

with os.scandir(basepath) as entries:
    for entry in entries:
        if entry.is_file():
            files.append(entry.path)
        elif entry.is_dir():
            dirs.append(entry)
print('dir list')
for dir in dirs:
    print(dir.name)
print('file list')
for file in files:
    print(file)

while len(dirs) > 0:
    for dir in dirs:
        with os.scandir(dir) as entries:
            for entry in entries:
                if entry.is_file():
                    files.append(entry.path)
                elif entry.is_dir():
                    dirs.append(entry)
        dirs.remove(dir)

#for file in files:
#    print(file)
error_count = 0
error_list = []
for file in files:
    with open(file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            if 'ERROR' in line:
                error_count += 1
                error_list.append(line)
print('Total errors:', error_count)
for item in error_list:
    print(item)
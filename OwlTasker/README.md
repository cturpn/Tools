# OwlTasker
A very simple CLI tasklist tool.

Quickly add, view, and manage tasks without opening an editor.
   

## Installation
**This is a user-local installation (no root required) - Make sure ~/.local/bin is in your PATH**  

### Automatically
```bash 
git clone https://github.com/cturpn/Tools.git
cd Tools/OwlTasker
bash install.sh
```

### Manually

```bash
git clone https://github.com/cturpn/Tools.git
cd Tools/OwlTasker
mkdir -p ~/.local/bin
cp OwlTasker.sh ~/.local/bin/OwlTasker
chmod +x ~/.local/bin/OwlTasker
```

## How it works

Tasks are stored in a Markdown file (default location set in install.sh) with this format:

\### Task \<nr>: <Title>
  | Date: <DateOfCreation>
  | Description: <CustomDesc>
  | Deadline: <CustomDeadline>

## Usage

OwlTasker -h                 # Show help and usage
OwlTasker -t                 # List all tasks
OwlTasker -c                 # Create a new task
OwlTasker -d <nr>|all        # Delete a specific task or all tasks

### Notes:

    Task numbers (<nr>) are assigned automatically.

    The task file path is fixed after installation; no runtime configuration is needed.

    All commands read/write to the same Markdown file.

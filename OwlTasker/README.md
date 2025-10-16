# OwlTasker
Its a very simple CLI Tasklist.
The Goal was, to have a way to quickly write notes/tasks and be able to list them without opening a editor. 

Therefore, it does just that. 

## How does it work ?
It utilizes a simple .md file to save and format the tasks. 
The tasks are formatted as follows: 

\### Task \<Nr>: <Title>  
  |	Date: <DateOfCreation>  
  | Description: <CustomDesc>  
  | Deadline: <CustomDeadline>  


## Usage
Following Options are available: 

OwlTasker -h / --help
  List Options and Usage

OwlTasker -t 
  List all tasks

OwlTasker -c
  Create a new task

OwlTasker -d [ <Nr> | all ]
  Delete all or specified task (by assigned Nr)

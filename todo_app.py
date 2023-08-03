from typing import List
import requests
from api import Todo


def url(route:str):
    return f"http://127.0.0.1:8000{route}"
print("Hello from todo app")


def print_menu():
    print(
        """
    1: Add Todo
    2: Get Todo
    3: Delete Todo
    4: Update Todo
    5: Exit Program
    """
    )
    pass


def add_todo():
    print("Add todo")
    name = input("Todo name: ")
    mission = input("Todo mission: ")
    new_todo = Todo(name=name, mission=mission)
    res = requests.post(url("/add_todo"), json=new_todo.dict())
    print(res)
    


def delete_todo():
    print("Delete todo")
    todo_to_delete = input ("id of todo you wish to delete: ")
    if not str.isdigit(todo_to_delete):
        print("Ids are integers")
        return
    res = requests.delete(url(f"/delete_todo/{todo_to_delete}"))
    print(res.json())
    


def update_todo(todos: List[Todo]):
    print("Update todo", todos)
    todo_to_update = input("ID todo update: ")
    if not str.isdigit(todo_to_update):
        print ("IDs are integers")
        return
    
    index = None
    for i, todo in enumerate(todos):
        print(todo.id)
        if todo.id == int(todo_to_update):
            index = i 
            break

        if index == None:
            print ("no such todo")
            return
        todo = todos[index]
        
        name = input("Todo name (leave blank if same): ")
        mission = input("Todo mission (leave blank if same): ")

        if not name:
            name = todo.name
        if not mission:
            mission = todo.mission

    new_todo = Todo(name=name, mission=mission)
    res = requests.put(url("/update_todo/{todo_to_update}"), json=new_todo.dict())
    print(res.json())
    pass

def get_todo():
    todos = []
    print("Get todo")
    res = requests.get(url("/todos"))
    if not res.status_code == 200:
        return
    data = res.json()
    for todo in data:
        todo = Todo(**todo)
        print("_____")
        print(f"ID: {todo.id}")
        print(f"Name: {todo.name}")
        print(f"Mission: {todo.mission}")
        todo.append(todo)
        return todos
    
def main():
    print_menu()
    choice = input("Select your action: ")
    choice = choice.strip()
    if not str.isdigit(choice):
        print("select an option")
        return 
    
    match int(choice):
        case 1:
            add_todo()
        case 2:
            todos = get_todo()
        case 3:
            delete_todo()
        case 4:
            todos = get_todo()
            update_todo(todos)
        case 5: 
            exit()
        case _:
            print("select a choice")

while __name__ == "__main__":
    main()

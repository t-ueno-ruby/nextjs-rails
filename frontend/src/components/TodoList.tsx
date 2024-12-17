import React from "react";
import Todo from "../types/Todo";
import TodoItem from "./TodoItem";

type TodoListProps = {
  todos: Todo[]
  onTodoDelete: (id: number) => void
}

const TodoList: React.FC<TodoListProps> = ({ todos, onTodoDelete }) => {

  const handleTodoDelete = (id: number) => {
    onTodoDelete(id)
  }

  return (
    <ul className="todo-list">
      {todos.map((todo) => (
        <TodoItem key={todo.id} todo={todo} onDelete={handleTodoDelete} />
      ))}
    </ul>
  )
}

export default TodoList

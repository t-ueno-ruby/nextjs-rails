import React from "react";
import Todo from "../types/Todo";

type TodoListProps = {
  todos: Todo[]
}

const TodoList: React.FC<TodoListProps> = ({ todos }) => {
  return (
    <ul className="todo-list">
      {todos.map((todo) => (
        <li key={todo.id}>
          <h3>{todo.title}</h3>
          <p>{todo.description}</p>
        </li>
      ))}
    </ul>
  )
}

export default TodoList

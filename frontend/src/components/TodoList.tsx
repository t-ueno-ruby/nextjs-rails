import React from "react";
import Todo from "../types/Todo";
import TodoItem from "./TodoItem";

type TodoListProps = {
  todos: Todo[]
}

const TodoList: React.FC<TodoListProps> = ({ todos }) => {
  return (
    <ul className="todo-list">
      {todos.map((todo) => (
        <TodoItem key={todo.id} todo={todo} />
      ))}
    </ul>
  )
}

export default TodoList

import { useEffect, useState } from "react";
import { getTodos } from "./api";
import "./App.css";
import TodoForm from "./components/TodoForm";
import TodoList from './components/TodoList'
import Todo from "./types/Todo";

const App = () => {
  const [todos, setTodos] = useState<Todo[]>([])

  const handleTodoCreate = (newTodo: Todo) => {
    setTodos([...todos, newTodo])
  };

  useEffect(() => {
    const fetchTodos = async () => {
      try {
        const todosData = await getTodos()
        setTodos(todosData)
      } catch (error) {
        console.error('Error while fetching todos:', error)
      }
    }

    fetchTodos()
  }, [])

  return (
    <div className="container">
      <h1>Todo List</h1>
      <TodoForm onCreate={handleTodoCreate} />
      <TodoList todos={todos} />
    </div >
  )
}

export default App

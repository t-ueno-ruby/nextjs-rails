import { useEffect, useState } from "react";
import { getTodos } from "./api";
import "./App.css";

// Todoの型定義
type Todo = {
  id: number
  title: string;
  description: string;
  status: string;
}

const App = () => {
  // Todoリストの初期値を空の配列に設定
  const [todos, setTodos] = useState<Todo[]>([])

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
      <ul>
        {todos.map((todo: Todo) => (
          <li key={todo.id}>{todo.title}</li>
        ))}
      </ul>
    </div >
  )
}

export default App

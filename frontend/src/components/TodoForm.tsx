import React, { useState } from "react";
import { createTodo } from "../api";
import Todo from "../types/Todo";

const TodoForm = ({ onCreate }: { onCreate: (todo: Todo) => void }) => {
  const [title, setTitle] = useState('')
  const [description, setDescription] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()

    try {
      const newTodo = await createTodo({
        title, description,
      })
      onCreate(newTodo)

      setTitle('')
      setDescription('')
    } catch (error) {
      console.log(error);
    }
  }

  return (
    <form onSubmit={handleSubmit} className="form-container">
      <h2>create new todo</h2>
      <div>
        <label>Title:
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
          />
        </label>
      </div>
      <div>
        <label>Description:
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)}
          />
        </label>
      </div>
      <button type="submit">Create</button>
    </form>
  )
}

export default TodoForm

import React, { useState } from 'react'
import { updateTodo } from "../api";
import Todo from '../types/Todo'

type TodoEditFormProps = {
  todo: Todo
  onEdit: (updateTodo: Todo) => void
}

const TodoEditForm: React.FC<TodoEditFormProps> = ({ todo, onEdit }) => {
  const id = todo.id
  const [title, setTitle] = useState(todo.title)
  const [description, setDescription] = useState(todo.description)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()

    try {
      const todoData = {
        title,
        description
      }
      const updatedTodo = await updateTodo(id, todoData)
      onEdit(updatedTodo)
    } catch (error) {
      console.error(error)
    }
  }

  return (
    <form className="edit-form-container" onSubmit={handleSubmit}>
      <h3>Edit Todo</h3>
      <div>
        <label>
          Title:
          <input
            type="text"
            value={title}
            onChange={(e) => setTitle(e.target.value)} />
        </label>
      </div>
      <div>
        <label>
          Description:
          <textarea
            value={description}
            onChange={(e) => setDescription(e.target.value)} />
        </label>
      </div>
      <button type="submit">Update</button>
    </form>
  )
}

export default TodoEditForm

import React, { useState } from 'react'
import { deleteTodo } from "../api";
import Todo from '../types/Todo'
import TodoEditForm from './TodoEditForm'

type TodoItemProps = {
  todo: Todo
  onDelete: (id: number) => void
}

const TodoItem: React.FC<TodoItemProps> = ({ todo, onDelete }) => {
  const [isEditing, setIsEditing] = useState(false)

  const handleEditClick = () => {
    setIsEditing(true)
  }

  const handleEditCancel = () => {
    setIsEditing(false)
  }

  const handleDeleteClick = async () => {
    try {
      await deleteTodo(todo.id)

      onDelete(todo.id)
    } catch (error) {
      console.error(error);
    }
  }

  return (
    <div>
      {!isEditing ? (
        <div style={{ border: '1px solid', margin: '10px', padding: '5px' }}>
          <h3>{todo.title}</h3>
          <h3>{todo.description}</h3>
          <button onClick={handleEditClick}>Edit</button>
          <button onClick={handleDeleteClick}>Delete</button>
        </div>
      ) : (
        <TodoEditForm todo={todo} onEdit={handleEditCancel} />
      )}
    </div>
  )
}

export default TodoItem

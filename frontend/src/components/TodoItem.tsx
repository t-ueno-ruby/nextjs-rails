import React, { useState } from 'react'
import TodoEditForm from './TodoEditForm'

type Todo = {
  id: number
  title: string
  description: string
  status: number
}

type TodoItemProps = {
  todo: Todo
}

const TodoItem: React.FC<TodoItemProps> = ({ todo }) => {
  const [isEditing, setIsEditing] = useState(false)

  const handleEditClick = () => {
    setIsEditing(true)
  }

  const handleEditCancel = () => {
    setIsEditing(false)
  }

  return (
    <div>
      {!isEditing ? (
        <div style={{ border: '1px solid', margin: '10px', padding: '5px' }}>
          <h3>{todo.title}</h3>
          <h3>{todo.description}</h3>
          <button /*style={{ backgroundColor: 'light-grey' }} */ onClick={handleEditClick}>Edit</button>
        </div>
      ) : (
        <TodoEditForm todo={todo} onEdit={handleEditCancel} />
      )}
    </div>
  )
}

export default TodoItem

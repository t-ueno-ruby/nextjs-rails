import axios from "axios";

const API_BASE_URL = 'http://localhost:3000'

export const getTodos = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/todos`)
        return response.data
    } catch (error) {
        console.error('Error while fetching todos:', error)
        throw error
    }
}

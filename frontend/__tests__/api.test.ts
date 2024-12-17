import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { getTodos } from '../src/api';
import axios from 'axios';

jest.mock('axios');

describe('getTodos', () => {
    it('should fetch todos successfully', async () => {
        const mockResponse = {
            data: [{ id: 1, title: 'Todo 1' }]
        };
        axios.get.mockResolvedValue(mockResponse);

        const result = await getTodos();

        expect(result).toEqual(mockResponse.data);
        expect(axios.get).toHaveBeenCalledWith(`${API_BASE_URL}/todos`);
    });

    it('should handle errors', async () => {
        const errorMessage = 'Network Error';
        axios.get.mockRejectedValue(new Error(errorMessage));

        await expect(getTodos()).rejects.toThrow(errorMessage);
    });
});

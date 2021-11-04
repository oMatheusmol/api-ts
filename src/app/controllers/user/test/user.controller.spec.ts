import ReservaRepository from "../../../domain/repositories/user/user.repository"
import { Request, Response } from 'express';


describe('Users, GET', () => {
  it('should get user data', async() =>{
    const sut = new ReservaRepository()
    const result = await sut.get('16')


    expect(result).toBe('true')
    
  })
})

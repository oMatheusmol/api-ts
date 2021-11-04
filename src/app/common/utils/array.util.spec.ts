import arrayUtil from './array.util';

describe('Utils, Array', () => {
  it('should return true to empty array', async () => {
    const result = arrayUtil.isEmpty([]);

    expect(true).toBe(result);
  });

  it('should return true to not empty array', async () => {
    const result: boolean = arrayUtil.isNotEmpty([1, 2, 3]);

    expect(true).toBe(result);
  });

  it('should return array first index', async () => {
    const result = arrayUtil.toFirst([1, 2, 3]);

    expect(1).toBe(result);
  });

  it('should return array last index', async () => {
    const result = arrayUtil.toLast([1, 2, 3]);

    expect(3).toBe(result);
  });
});

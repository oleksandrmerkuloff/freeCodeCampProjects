import numpy as np

def calculate(list):
    if len(list) < 9 or len(list) > 9:
        raise ValueError('List must contain nine numbers.')

    matrix = np.array(list, dtype=float).reshape(3,3)
    mean1 = matrix.mean(axis=0).tolist()
    mean2 = matrix.mean(axis=1).tolist()
    flattened_mean = matrix.mean()

    var1 = matrix.var(axis=0).tolist()
    var2 = matrix.var(axis=1).tolist()
    flattened_var = matrix.var()

    std1 = matrix.std(axis=0).tolist()
    std2 = matrix.std(axis=1).tolist()
    flattened_std = matrix.std()

    max0 = matrix.max(axis=0).astype(np.int64).tolist()
    max1 = matrix.max(axis=1).astype(np.int64).tolist()
    flattened_max = matrix.max().astype(int)

    min0 = matrix.min(axis=0).astype(np.int64).tolist()
    min1 = matrix.min(axis=1).astype(np.int64).tolist()
    flattened_min = matrix.min().astype(int)

    sum1 = matrix.sum(axis=0).astype(np.int64).tolist()
    sum2 = matrix.sum(axis=1).astype(np.int64).tolist()
    flattened_sum = matrix.sum().astype(int)
    
    return {
        'mean': [mean1, mean2, flattened_mean],
        'variance': [var1, var2, flattened_var],
        'standard deviation': [std1, std2, flattened_std],
        'max': [max0, max1, flattened_max],
        'min': [min0, min1, flattened_min],
        'sum': [sum1, sum2, flattened_sum]
    }
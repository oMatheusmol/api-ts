
export default {

    isEmpty(array) {
        array = _validateArray(array);
        return array.length === 0;
    },
    isNotEmpty(array) {
        array = _validateArray(array);
        return array.length !== 0;
    },
    toFirst(array) {
        array = _validateArray(array);
        return array.length > 0 ? array[0] : null;
    },
    toLast(array) {
        array = _validateArray(array);
        return array.length > 0 ? array[array.length - 1] : null;
    },
    clear(array) {
        array = _validateArray(array);
        while (array.length > 0) array.pop(array);
    },
    toArray(result) {
        return _validateArray(result);
    },
    remove(array, o) {
        const index = array.indexOf(o);
        if (index > -1) {
            //remove element
            array.splice(index, 1);
        }
    },
    findDuplicates(arr) {
        let sorted_arr = arr.slice().sort(); // You can define the comparing function here. 
        // JS by default uses a crappy string compare.
        // (we use slice to clone the array so the
        // original array won't be modified)
        let results = [];
        for (let i = 0; i < sorted_arr.length - 1; i++) {
            if (sorted_arr[i + 1] == sorted_arr[i]) {
                results.push(sorted_arr[i]);
            }
        }
        return results;
    }
}

function _validateArray(result) {
    if (result.recordset) {
        return result.recordset;
    } else {
        return Array.isArray(result) ? result || [] : [];
    }
}
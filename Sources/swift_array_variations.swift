internal func strike(_ array: [Int], from: [Int]) -> [Int] {
    var result: Array<Int> = []

    for element in from {
        if array.index(of: element) == nil {
            result.append(element)
        }
    }

    return result
}

extension Array where Element: Equatable {
    func variations(class count: Int) -> [[Element]] {
        let length = ((self.count - count + 1)...self.count).reduce(1, { a, b in a * b })
        let indexes = Array<Int>(0..<self.count)
        var repeats = Array<Int>(repeating: length / self.count, count: count)
        var divisor = self.count
        for i in 1..<count {
            divisor -= 1
            repeats[i] = repeats[i - 1] / divisor
        }
        var result = Array<Array<Int>>(repeating: [], count: length)
        var k = 0
        for i in 0..<count {
            k = 0
            while k < length {
                for number in strike(result[k], from: indexes) {
                    for _ in 0..<repeats[i] {
                        result[k].append(number)
                        k += 1
                    }
                }
            }
        }

        return result.map { variation in variation.map { element in self[element] } }
    }
}
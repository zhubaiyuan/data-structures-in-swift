//Creating Hash Table
class HashElement<K: Hashable, V> {
    var key: K
    var value: V?

    init(key: K, value: V?) {
        self.key = key
        self.value = value
    }
}

class HashTable<K: Hashable, V> {
    typealias Bucket = [HashElement<K, V>]
    var buckets: [Bucket]

    init(capcity: Int) {
        assert(capcity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capcity))
    }

    func index(for key: K) -> Int {
        var divisor: Int = 0
        for key in String(describing: key).unicodeScalars {
            divisor += abs(key.value.hashValue)
        }
        return abs(divisor) % buckets.count
    }

    //Retriving Data from a Hash Table
    func retrieveValue(for key: K) -> V? {
        let index = self.index(for: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    //Updating a Value in a Hash Table
    func updateValue(_ value: V, forKey key: K) -> V? {
        var itemIndex: Int
        itemIndex = self.index(for: key)
        for (i, element) in buckets[itemIndex].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[itemIndex][i].value = value
                return oldValue
            }
        }
        buckets[itemIndex].append(HashElement(key: key, value: value))
        return nil
    }

    //Removing a Value from a Hash Table
    func removeValue(for key: K) -> V? {
        let index = self.index(for: key)
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                return element.value
            }
        }
        return nil
    }
}

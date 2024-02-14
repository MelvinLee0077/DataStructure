//
//  Heap.swift
//  DataStructure
//
//  Created by Melvin Lee on 07/02/2024.
//

import Foundation

struct Heap {
    
    typealias ValueType = Double
    private var arr = [ValueType]()
    private var maxSize = 0
    private var heapSize = 0
    private var heapType: HeapType = .max
    
    init(maxSize: Int, type: HeapType) {
        self.maxSize = maxSize
        self.arr = [ValueType]()
        self.heapSize = 0
        self.heapType = type
    }
    
    func getLeftChild(index: Int) -> Int {
        return 2 * (index + 1)
    }
    
    func getRightChild(index: Int) -> Int {
        return 2 * (index + 2)
    }
    
    func getParent(index: Int) -> Int {
        return Int((index - 1) / 2)
    }
    
    func getRoot() -> ValueType {
        return arr[0]
    }
    
    func getHeapSize() -> Int {
        return heapSize
    }
    
    func structure() -> [ValueType] {
        return arr
    }
    
    func swap(_ a: ValueType, _ b: ValueType) -> (ValueType, ValueType) {
        let temp = a
        let a = b
        let b = temp
        return (a, b)
    }
    
    mutating func heapify(index: Int) {
        // move down and compare child with parent
        let left = getLeftChild(index: index)
        let right = getRightChild(index: index)
        var edgeIndex = index
        if heapType == .max {
            if left < heapSize && arr[left] > arr[index] {
                edgeIndex = left
            }
            if right < heapSize && arr[right] > arr[index] {
                edgeIndex = right
            }
            if edgeIndex != index {
                (arr[index], arr[edgeIndex]) = swap(arr[index], arr[edgeIndex])
                heapify(index: edgeIndex)
            }
        } else {
            if left < heapSize && arr[left] < arr[index] {
                edgeIndex = left
            }
            if right < heapSize && arr[right] < arr[index] {
                edgeIndex = right
            }
            if edgeIndex != index {
                (arr[index], arr[edgeIndex]) = swap(arr[index], arr[edgeIndex])
                heapify(index: edgeIndex)
            }
        }
    }
    
    mutating func insert(val: ValueType) {
        if heapSize == maxSize {
            print("Heap is full")
        } else {
            heapSize += 1
            var i = heapSize - 1
            arr.append(val)
            
            if heapType == .max {
                while i != 0 && arr[getParent(index: i)] < arr[i] {
                    (arr[i], arr[getParent(index: i)]) = swap(arr[i], arr[getParent(index: i)])
                    i = getParent(index: i)
                }
            } else {
                while i != 0 && arr[getParent(index: i)] > arr[i] {
                    (arr[i], arr[getParent(index: i)]) = swap(arr[i], arr[getParent(index: i)])
                    i = getParent(index: i)
                }
            }
        }
    }
    
    mutating func removeRoot() -> ValueType? {
        if heapSize > 0 {
            heapSize -= 1
            if heapSize == 1 {
                return arr[0]
            } else {
                arr[0] = arr[heapSize] // replace root node with last node
                _ = arr.popLast() 
                heapify(index: 0)
            }
        }
        return nil
    }
    
    mutating func remove(index: Int) {
        var i = index
        arr[i] = Double.infinity
        // move up and compare child with parent
        if heapType == .max {
            while i != 0 && arr[getParent(index: i)] < arr[i] {
                (arr[i], arr[getParent(index: i)]) = swap(arr[i], arr[getParent(index: i)])
                i = getParent(index: i)
            }
        } else {
            while i != 0 && arr[getParent(index: i)] > arr[i] {
                (arr[i], arr[getParent(index: i)]) = swap(arr[i], arr[getParent(index: i)])
                i = getParent(index: i)
            }
        }
        _ = removeRoot()
    }
}

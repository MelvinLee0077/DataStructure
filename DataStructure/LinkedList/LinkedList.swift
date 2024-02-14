//
//  LinkedList.swift
//  DataStructure
//
//  Created by Melvin Lee on 06/02/2024.
//

import Foundation

class Node {
    var data: Any?
    var next: Node?
    
    init(data: Any) {
        self.data = data
        self.next = nil
    }
}

struct LinkedList {
    
    var head: Node?
    
    init() {
        self.head = nil
    }
    
    /// Insert a new node at the front of the linked list
    mutating func insertAtFirst(data: Any) {
        let newNode = Node(data: data)
        
        if self.head == nil {
            self.head = newNode
            return
        } else {
            newNode.next = self.head
            self.head = newNode
        }
    }
    
    /// Insert a new node at the last of the linked list
    mutating func insertAtLast(data: Any) {
        let newNode = Node(data: data)
        
        if self.head == nil {
            self.head = newNode
            return
        } else {
            var currentNode = self.head
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            currentNode?.next = newNode
        }
    }
    
    /// Insert a new node at the given index of the linked list
    mutating func insertAtIndex(data: Any, index: Int) {
        var position = 0
        
        if position == index {
            insertAtFirst(data: data)
        } else {
            let newNode = Node(data: data)
            var currentNode = self.head
            
            while currentNode != nil && position+1 != index {
                position += 1
                currentNode = currentNode?.next
            }
            
            if currentNode != nil {
                newNode.next = currentNode?.next
                currentNode?.next = newNode
            } else {
                print("Failed to insert at \(index)")
            }
        }
    }
    
    /// Remove the first node of the linked list
    mutating func removeFirst() {
        if self.head != nil {
            self.head = self.head!.next
        }
    }
    
    /// Remove the last node of the linked list
    func removeLast() {
        if self.head != nil {
            var currentNode = self.head
            while currentNode?.next?.next != nil {
                currentNode = currentNode?.next
            }
            currentNode?.next = nil
        }
    }
    
    /// Remove the node at the given index of the linked list
    mutating func removeAtIndex(index: Int) {
        var position = 0
        var currentNode = self.head
        if currentNode == nil {
            return
        }
        if position == index {
            removeFirst()
        } else {
            while currentNode != nil && position+1 != index {
                position += 1
                currentNode = currentNode?.next
            }
            
            if currentNode != nil {
                currentNode?.next = currentNode?.next?.next
            } else {
                print("Failed to delete at \(index)")
            }
        }
    }
    
    /// Remove the node that matches the given data
    mutating func removeNode(data: Any) {
        
    }
    
    /// Update the node at the given index with new data
    mutating func updateNode(data: Any, index: Int) {
        
    }
    
    /// Retrieve the size of the linked list
    func size() -> Int {
        var size = 0
        var currentNode = self.head
        
        while currentNode != nil {
            size += 1
            currentNode = currentNode!.next
        }
        return size
    }
    
    /// Visualize the structure of the linked list
    func structure() -> String {
        var printStr = ""
        var currentNode = self.head
        
        if currentNode == nil {
            return "Linked list is empty"
        } else {
            repeat {
                printStr += "\(currentNode!.data ?? "") "
                currentNode = currentNode?.next
            } while currentNode != nil
        }
        return printStr
    }
}

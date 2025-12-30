//
//  Cache.swift
//  boardGameReview
//
//  Created by Robert Fusting on 12/21/25.
//

import Foundation
import SDWebImageSwiftUI
import UIKit

final class BoardGameCache {
    static let shared = BoardGameCache()

    // NSCache requires reference types for keys, so we use NSString.
    private let cache = NSCache<NSNumber, Wrapped>()
    private var feedKeys = [Int]()

    private init() {
        
    }

    func get(id: Int) -> BoardGameModel? {
           cache.object(forKey: NSNumber(value: id))?.value
       }

    func set(_ model: BoardGameModel) {
           cache.setObject(Wrapped(model), forKey: NSNumber(value: model.id))
       }

    func remove(id: Int) {
           cache.removeObject(forKey: NSNumber(value: id))
       }

    func clear() {
           cache.removeAllObjects()
       }
    func addFeedKey(_ id: Int) {
        feedKeys.append(id)
    }
    
    func getFeedKeyCount() -> Int {
        return feedKeys.count
    }
    
    func getFeedKeys() -> [Int] {
        return feedKeys
    }

    // MARK: - Helpers

    private func key(for id: Int) -> NSString {
        // Namespacing helps avoid collisions if you later add more cached things.
        return "boardgame.image.\(id)" as NSString
    }
}

final class ImageCache {
    private let cache = SDImageCache()
    static let shared = ImageCache()
    
    private init() {}
    
    func getImage(for id : Int) -> UIImage? {
        return cache.imageFromCache(forKey: "\(id)")
    }
    
    func storeImage(_ image: UIImage, for id: Int) {
        cache.store(image, forKey: "\(id)")
    }
    
    func removeImage(for id: Int) {
        cache.removeImage(forKey: "\(id)")
    }
    
    func clearCache() {
        cache.clearMemory()
    }
}

private final class Wrapped {
        let value: BoardGameModel
        init(_ value: BoardGameModel) { self.value = value }
    }



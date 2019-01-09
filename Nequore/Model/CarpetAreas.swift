//
//  CarpetAreas.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CarpetAreas: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let propertyId = "property_id"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let area = "area"
    static let price = "price"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var propertyId: Int?
  public var updatedAt: String?
  public var id: Int?
  public var area: Int?
  public var price: Int?
  public var createdAt: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    propertyId = json[SerializationKeys.propertyId].int
    updatedAt = json[SerializationKeys.updatedAt].string
    id = json[SerializationKeys.id].int
    area = json[SerializationKeys.area].int
    price = json[SerializationKeys.price].int
    createdAt = json[SerializationKeys.createdAt].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = propertyId { dictionary[SerializationKeys.propertyId] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = area { dictionary[SerializationKeys.area] = value }
    if let value = price { dictionary[SerializationKeys.price] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.propertyId = aDecoder.decodeObject(forKey: SerializationKeys.propertyId) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.area = aDecoder.decodeObject(forKey: SerializationKeys.area) as? Int
    self.price = aDecoder.decodeObject(forKey: SerializationKeys.price) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(propertyId, forKey: SerializationKeys.propertyId)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(area, forKey: SerializationKeys.area)
    aCoder.encode(price, forKey: SerializationKeys.price)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}

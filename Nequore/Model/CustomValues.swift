//
//  CustomValues.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CustomValues: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let propertyId = "property_id"
    static let value = "value"
    static let name = "name"
    static let id = "id"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var propertyId: Int?
  public var value: String?
  public var name: String?
  public var id: Int?
  public var updatedAt: String?
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
    value = json[SerializationKeys.value].string
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    updatedAt = json[SerializationKeys.updatedAt].string
    createdAt = json[SerializationKeys.createdAt].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = propertyId { dictionary[SerializationKeys.propertyId] = value }
    if let value = value { dictionary[SerializationKeys.value] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.propertyId = aDecoder.decodeObject(forKey: SerializationKeys.propertyId) as? Int
    self.value = aDecoder.decodeObject(forKey: SerializationKeys.value) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(propertyId, forKey: SerializationKeys.propertyId)
    aCoder.encode(value, forKey: SerializationKeys.value)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}

//
//  PropertyType.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PropertyType: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let nameEn = "name_en"
    static let isSelected = "is_selected"
    static let id = "id"
    static let createdBy = "created_by"
    static let updatedAt = "updated_at"
    static let createdAt = "created_at"
    static let nameEs = "name_es"
    static let name = "name"
  }

  // MARK: Properties
  public var status: Int?
  public var nameEn: String?
  public var isSelected: Int?
  public var id: Int?
  public var createdBy: Int?
  public var updatedAt: String?
  public var createdAt: String?
  public var nameEs: String?
  public var name: String?

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
    status = json[SerializationKeys.status].int
    nameEn = json[SerializationKeys.nameEn].string
    isSelected = json[SerializationKeys.isSelected].int
    id = json[SerializationKeys.id].int
    createdBy = json[SerializationKeys.createdBy].int
    updatedAt = json[SerializationKeys.updatedAt].string
    createdAt = json[SerializationKeys.createdAt].string
    nameEs = json[SerializationKeys.nameEs].string
    name = json[SerializationKeys.name].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = nameEn { dictionary[SerializationKeys.nameEn] = value }
    if let value = isSelected { dictionary[SerializationKeys.isSelected] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = nameEs { dictionary[SerializationKeys.nameEs] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.nameEn = aDecoder.decodeObject(forKey: SerializationKeys.nameEn) as? String
    self.isSelected = aDecoder.decodeObject(forKey: SerializationKeys.isSelected) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.nameEs = aDecoder.decodeObject(forKey: SerializationKeys.nameEs) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(nameEn, forKey: SerializationKeys.nameEn)
    aCoder.encode(isSelected, forKey: SerializationKeys.isSelected)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(nameEs, forKey: SerializationKeys.nameEs)
    aCoder.encode(name, forKey: SerializationKeys.name)
  }

}

//
//  Amenities.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Amenities: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let status = "status"
    static let nameEn = "name_en"
    static let name = "name"
    static let id = "id"
    static let createdBy = "created_by"
    static let nameEs = "name_es"
    static let pivot = "pivot"
    static let icon = "icon"
  }

  // MARK: Properties
  public var status: Int?
  public var nameEn: String?
  public var name: String?
  public var id: Int?
  public var createdBy: Int?
  public var nameEs: String?
  public var pivot: Pivot?
  public var icon: String?

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
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    createdBy = json[SerializationKeys.createdBy].int
    nameEs = json[SerializationKeys.nameEs].string
    pivot = Pivot(json: json[SerializationKeys.pivot])
    icon = json[SerializationKeys.icon].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = nameEn { dictionary[SerializationKeys.nameEn] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = nameEs { dictionary[SerializationKeys.nameEs] = value }
    if let value = pivot { dictionary[SerializationKeys.pivot] = value.dictionaryRepresentation() }
    if let value = icon { dictionary[SerializationKeys.icon] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.nameEn = aDecoder.decodeObject(forKey: SerializationKeys.nameEn) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.nameEs = aDecoder.decodeObject(forKey: SerializationKeys.nameEs) as? String
    self.pivot = aDecoder.decodeObject(forKey: SerializationKeys.pivot) as? Pivot
    self.icon = aDecoder.decodeObject(forKey: SerializationKeys.icon) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(nameEn, forKey: SerializationKeys.nameEn)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(nameEs, forKey: SerializationKeys.nameEs)
    aCoder.encode(pivot, forKey: SerializationKeys.pivot)
    aCoder.encode(icon, forKey: SerializationKeys.icon)
  }

}

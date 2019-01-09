//
//  Configurations.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Configurations: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let buildingId = "building_id"
    static let floorMapImage = "floor_map_image"
    static let updatedAt = "updated_at"
    static let id = "id"
    static let carpetArea = "carpet_area"
    static let createdAt = "created_at"
    static let basePrice = "base_price"
    static let config = "config"
    static let configurationId = "configuration_id"
  }

  // MARK: Properties
  public var buildingId: Int?
  public var floorMapImage: String?
  public var updatedAt: String?
  public var id: Int?
  public var carpetArea: Int?
  public var createdAt: String?
  public var basePrice: Int?
  public var config: Config?
  public var configurationId: Int?

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
    buildingId = json[SerializationKeys.buildingId].int
    floorMapImage = json[SerializationKeys.floorMapImage].string
    updatedAt = json[SerializationKeys.updatedAt].string
    id = json[SerializationKeys.id].int
    carpetArea = json[SerializationKeys.carpetArea].int
    createdAt = json[SerializationKeys.createdAt].string
    basePrice = json[SerializationKeys.basePrice].int
    config = Config(json: json[SerializationKeys.config])
    configurationId = json[SerializationKeys.configurationId].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = buildingId { dictionary[SerializationKeys.buildingId] = value }
    if let value = floorMapImage { dictionary[SerializationKeys.floorMapImage] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = carpetArea { dictionary[SerializationKeys.carpetArea] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = basePrice { dictionary[SerializationKeys.basePrice] = value }
    if let value = config { dictionary[SerializationKeys.config] = value.dictionaryRepresentation() }
    if let value = configurationId { dictionary[SerializationKeys.configurationId] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.buildingId = aDecoder.decodeObject(forKey: SerializationKeys.buildingId) as? Int
    self.floorMapImage = aDecoder.decodeObject(forKey: SerializationKeys.floorMapImage) as? String
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.carpetArea = aDecoder.decodeObject(forKey: SerializationKeys.carpetArea) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.basePrice = aDecoder.decodeObject(forKey: SerializationKeys.basePrice) as? Int
    self.config = aDecoder.decodeObject(forKey: SerializationKeys.config) as? Config
    self.configurationId = aDecoder.decodeObject(forKey: SerializationKeys.configurationId) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(buildingId, forKey: SerializationKeys.buildingId)
    aCoder.encode(floorMapImage, forKey: SerializationKeys.floorMapImage)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(carpetArea, forKey: SerializationKeys.carpetArea)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(basePrice, forKey: SerializationKeys.basePrice)
    aCoder.encode(config, forKey: SerializationKeys.config)
    aCoder.encode(configurationId, forKey: SerializationKeys.configurationId)
  }

}

//
//  FeaturedLocalities.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FeaturedLocalities: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let cityId = "city_id"
    static let status = "status"
    static let nameEn = "name_en"
    static let nameEs = "name_es"
    static let id = "id"
    static let name = "name"
    static let isFeatured = "is_featured"
    static let buildingsCount = "buildings_count"
    static let pricePerSqft = "price_per_sqft"
    static let polyCoordinates = "poly_coordinates"
  }

  // MARK: Properties
  public var cityId: Int?
  public var status: Int?
  public var nameEn: String?
  public var nameEs: String?
  public var id: Int?
  public var name: String?
  public var isFeatured: Int?
  public var buildingsCount: Int?
  public var pricePerSqft: Int?
  public var polyCoordinates: String?

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
    cityId = json[SerializationKeys.cityId].int
    status = json[SerializationKeys.status].int
    nameEn = json[SerializationKeys.nameEn].string
    nameEs = json[SerializationKeys.nameEs].string
    id = json[SerializationKeys.id].int
    name = json[SerializationKeys.name].string
    isFeatured = json[SerializationKeys.isFeatured].int
    buildingsCount = json[SerializationKeys.buildingsCount].int
    pricePerSqft = json[SerializationKeys.pricePerSqft].int
    polyCoordinates = json[SerializationKeys.polyCoordinates].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = cityId { dictionary[SerializationKeys.cityId] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = nameEn { dictionary[SerializationKeys.nameEn] = value }
    if let value = nameEs { dictionary[SerializationKeys.nameEs] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = isFeatured { dictionary[SerializationKeys.isFeatured] = value }
    if let value = buildingsCount { dictionary[SerializationKeys.buildingsCount] = value }
    if let value = pricePerSqft { dictionary[SerializationKeys.pricePerSqft] = value }
    if let value = polyCoordinates { dictionary[SerializationKeys.polyCoordinates] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.cityId = aDecoder.decodeObject(forKey: SerializationKeys.cityId) as? Int
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.nameEn = aDecoder.decodeObject(forKey: SerializationKeys.nameEn) as? String
    self.nameEs = aDecoder.decodeObject(forKey: SerializationKeys.nameEs) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.isFeatured = aDecoder.decodeObject(forKey: SerializationKeys.isFeatured) as? Int
    self.buildingsCount = aDecoder.decodeObject(forKey: SerializationKeys.buildingsCount) as? Int
    self.pricePerSqft = aDecoder.decodeObject(forKey: SerializationKeys.pricePerSqft) as? Int
    self.polyCoordinates = aDecoder.decodeObject(forKey: SerializationKeys.polyCoordinates) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(cityId, forKey: SerializationKeys.cityId)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(nameEn, forKey: SerializationKeys.nameEn)
    aCoder.encode(nameEs, forKey: SerializationKeys.nameEs)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(isFeatured, forKey: SerializationKeys.isFeatured)
    aCoder.encode(buildingsCount, forKey: SerializationKeys.buildingsCount)
    aCoder.encode(pricePerSqft, forKey: SerializationKeys.pricePerSqft)
    aCoder.encode(polyCoordinates, forKey: SerializationKeys.polyCoordinates)
  }

}

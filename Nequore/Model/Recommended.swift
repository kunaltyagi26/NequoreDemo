//
//  Recommended.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Recommended: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let isBlocked = "is_blocked"
    static let bedroom = "bedroom"
    static let step = "step"
    static let isFavorite = "is_favorite"
    static let configuration = "configuration"
    static let id = "id"
    static let image = "image"
    static let propertyTypeId = "property_type_id"
    static let amenities = "amenities"
    static let parking = "parking"
    static let maxArea = "max_area"
    static let propertyUrl = "property_url"
    static let currencyId = "currency_id"
    static let bathroom = "bathroom"
    static let customValues = "custom_values"
    static let city = "city"
    static let forRent = "for_rent"
    static let updatedAt = "updated_at"
    static let building = "building"
    static let images = "images"
    static let propertyType = "property_type"
    static let forSale = "for_sale"
    static let descriptionValue = "description"
    static let cityId = "city_id"
    static let quantity = "quantity"
    static let furnished = "furnished"
    static let carpetAreas = "carpet_areas"
    static let buildingId = "building_id"
    static let pets = "pets"
    static let status = "status"
    static let locality = "locality"
    static let createdBy = "created_by"
    static let minPrice = "min_price"
    static let createdAt = "created_at"
    static let configurationId = "configuration_id"
    static let floorPlan = "floor_plan"
    static let localityId = "locality_id"
    static let floor = "floor"
    static let maxPrice = "max_price"
  }

  // MARK: Properties
  public var isBlocked: Int?
  public var bedroom: Int?
  public var step: Int?
  public var isFavorite: Int?
  public var configuration: Configuration?
  public var id: Int?
  public var image: String?
  public var propertyTypeId: Int?
  public var amenities: [Amenities]?
  public var parking: Int?
  public var maxArea: Int?
  public var propertyUrl: String?
  public var currencyId: Int?
  public var bathroom: Int?
  public var customValues: [CustomValues]?
  public var city: City?
  public var forRent: Int?
  public var updatedAt: String?
  public var building: Building?
  public var images: [Images]?
  public var propertyType: PropertyType?
  public var forSale: Int?
  public var descriptionValue: String?
  public var cityId: Int?
  public var quantity: Int?
  public var furnished: Int?
  public var carpetAreas: [CarpetAreas]?
  public var buildingId: Int?
  public var pets: Int?
  public var status: Int?
  public var locality: Locality?
  public var createdBy: Int?
  public var minPrice: Int?
  public var createdAt: String?
  public var configurationId: Int?
  public var floorPlan: String?
  public var localityId: Int?
  public var floor: Int?
  public var maxPrice: Int?

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
    isBlocked = json[SerializationKeys.isBlocked].int
    bedroom = json[SerializationKeys.bedroom].int
    step = json[SerializationKeys.step].int
    isFavorite = json[SerializationKeys.isFavorite].int
    configuration = Configuration(json: json[SerializationKeys.configuration])
    id = json[SerializationKeys.id].int
    image = json[SerializationKeys.image].string
    propertyTypeId = json[SerializationKeys.propertyTypeId].int
    if let items = json[SerializationKeys.amenities].array { amenities = items.map { Amenities(json: $0) } }
    parking = json[SerializationKeys.parking].int
    maxArea = json[SerializationKeys.maxArea].int
    propertyUrl = json[SerializationKeys.propertyUrl].string
    currencyId = json[SerializationKeys.currencyId].int
    bathroom = json[SerializationKeys.bathroom].int
    if let items = json[SerializationKeys.customValues].array { customValues = items.map { CustomValues(json: $0) } }
    city = City(json: json[SerializationKeys.city])
    forRent = json[SerializationKeys.forRent].int
    updatedAt = json[SerializationKeys.updatedAt].string
    building = Building(json: json[SerializationKeys.building])
    if let items = json[SerializationKeys.images].array { images = items.map { Images(json: $0) } }
    propertyType = PropertyType(json: json[SerializationKeys.propertyType])
    forSale = json[SerializationKeys.forSale].int
    descriptionValue = json[SerializationKeys.descriptionValue].string
    cityId = json[SerializationKeys.cityId].int
    quantity = json[SerializationKeys.quantity].int
    furnished = json[SerializationKeys.furnished].int
    if let items = json[SerializationKeys.carpetAreas].array { carpetAreas = items.map { CarpetAreas(json: $0) } }
    buildingId = json[SerializationKeys.buildingId].int
    pets = json[SerializationKeys.pets].int
    status = json[SerializationKeys.status].int
    locality = Locality(json: json[SerializationKeys.locality])
    createdBy = json[SerializationKeys.createdBy].int
    minPrice = json[SerializationKeys.minPrice].int
    createdAt = json[SerializationKeys.createdAt].string
    configurationId = json[SerializationKeys.configurationId].int
    floorPlan = json[SerializationKeys.floorPlan].string
    localityId = json[SerializationKeys.localityId].int
    floor = json[SerializationKeys.floor].int
    maxPrice = json[SerializationKeys.maxPrice].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = isBlocked { dictionary[SerializationKeys.isBlocked] = value }
    if let value = bedroom { dictionary[SerializationKeys.bedroom] = value }
    if let value = step { dictionary[SerializationKeys.step] = value }
    if let value = isFavorite { dictionary[SerializationKeys.isFavorite] = value }
    if let value = configuration { dictionary[SerializationKeys.configuration] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = propertyTypeId { dictionary[SerializationKeys.propertyTypeId] = value }
    if let value = amenities { dictionary[SerializationKeys.amenities] = value.map { $0.dictionaryRepresentation() } }
    if let value = parking { dictionary[SerializationKeys.parking] = value }
    if let value = maxArea { dictionary[SerializationKeys.maxArea] = value }
    if let value = propertyUrl { dictionary[SerializationKeys.propertyUrl] = value }
    if let value = currencyId { dictionary[SerializationKeys.currencyId] = value }
    if let value = bathroom { dictionary[SerializationKeys.bathroom] = value }
    if let value = customValues { dictionary[SerializationKeys.customValues] = value.map { $0.dictionaryRepresentation() } }
    if let value = city { dictionary[SerializationKeys.city] = value.dictionaryRepresentation() }
    if let value = forRent { dictionary[SerializationKeys.forRent] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = building { dictionary[SerializationKeys.building] = value.dictionaryRepresentation() }
    if let value = images { dictionary[SerializationKeys.images] = value.map { $0.dictionaryRepresentation() } }
    if let value = propertyType { dictionary[SerializationKeys.propertyType] = value.dictionaryRepresentation() }
    if let value = forSale { dictionary[SerializationKeys.forSale] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = cityId { dictionary[SerializationKeys.cityId] = value }
    if let value = quantity { dictionary[SerializationKeys.quantity] = value }
    if let value = furnished { dictionary[SerializationKeys.furnished] = value }
    if let value = carpetAreas { dictionary[SerializationKeys.carpetAreas] = value.map { $0.dictionaryRepresentation() } }
    if let value = buildingId { dictionary[SerializationKeys.buildingId] = value }
    if let value = pets { dictionary[SerializationKeys.pets] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = locality { dictionary[SerializationKeys.locality] = value.dictionaryRepresentation() }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = minPrice { dictionary[SerializationKeys.minPrice] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = configurationId { dictionary[SerializationKeys.configurationId] = value }
    if let value = floorPlan { dictionary[SerializationKeys.floorPlan] = value }
    if let value = localityId { dictionary[SerializationKeys.localityId] = value }
    if let value = floor { dictionary[SerializationKeys.floor] = value }
    if let value = maxPrice { dictionary[SerializationKeys.maxPrice] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.isBlocked = aDecoder.decodeObject(forKey: SerializationKeys.isBlocked) as? Int
    self.bedroom = aDecoder.decodeObject(forKey: SerializationKeys.bedroom) as? Int
    self.step = aDecoder.decodeObject(forKey: SerializationKeys.step) as? Int
    self.isFavorite = aDecoder.decodeObject(forKey: SerializationKeys.isFavorite) as? Int
    self.configuration = aDecoder.decodeObject(forKey: SerializationKeys.configuration) as? Configuration
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.propertyTypeId = aDecoder.decodeObject(forKey: SerializationKeys.propertyTypeId) as? Int
    self.amenities = aDecoder.decodeObject(forKey: SerializationKeys.amenities) as? [Amenities]
    self.parking = aDecoder.decodeObject(forKey: SerializationKeys.parking) as? Int
    self.maxArea = aDecoder.decodeObject(forKey: SerializationKeys.maxArea) as? Int
    self.propertyUrl = aDecoder.decodeObject(forKey: SerializationKeys.propertyUrl) as? String
    self.currencyId = aDecoder.decodeObject(forKey: SerializationKeys.currencyId) as? Int
    self.bathroom = aDecoder.decodeObject(forKey: SerializationKeys.bathroom) as? Int
    self.customValues = aDecoder.decodeObject(forKey: SerializationKeys.customValues) as? [CustomValues]
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? City
    self.forRent = aDecoder.decodeObject(forKey: SerializationKeys.forRent) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.building = aDecoder.decodeObject(forKey: SerializationKeys.building) as? Building
    self.images = aDecoder.decodeObject(forKey: SerializationKeys.images) as? [Images]
    self.propertyType = aDecoder.decodeObject(forKey: SerializationKeys.propertyType) as? PropertyType
    self.forSale = aDecoder.decodeObject(forKey: SerializationKeys.forSale) as? Int
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.cityId = aDecoder.decodeObject(forKey: SerializationKeys.cityId) as? Int
    self.quantity = aDecoder.decodeObject(forKey: SerializationKeys.quantity) as? Int
    self.furnished = aDecoder.decodeObject(forKey: SerializationKeys.furnished) as? Int
    self.carpetAreas = aDecoder.decodeObject(forKey: SerializationKeys.carpetAreas) as? [CarpetAreas]
    self.buildingId = aDecoder.decodeObject(forKey: SerializationKeys.buildingId) as? Int
    self.pets = aDecoder.decodeObject(forKey: SerializationKeys.pets) as? Int
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.locality = aDecoder.decodeObject(forKey: SerializationKeys.locality) as? Locality
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.minPrice = aDecoder.decodeObject(forKey: SerializationKeys.minPrice) as? Int
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.configurationId = aDecoder.decodeObject(forKey: SerializationKeys.configurationId) as? Int
    self.floorPlan = aDecoder.decodeObject(forKey: SerializationKeys.floorPlan) as? String
    self.localityId = aDecoder.decodeObject(forKey: SerializationKeys.localityId) as? Int
    self.floor = aDecoder.decodeObject(forKey: SerializationKeys.floor) as? Int
    self.maxPrice = aDecoder.decodeObject(forKey: SerializationKeys.maxPrice) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(isBlocked, forKey: SerializationKeys.isBlocked)
    aCoder.encode(bedroom, forKey: SerializationKeys.bedroom)
    aCoder.encode(step, forKey: SerializationKeys.step)
    aCoder.encode(isFavorite, forKey: SerializationKeys.isFavorite)
    aCoder.encode(configuration, forKey: SerializationKeys.configuration)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(propertyTypeId, forKey: SerializationKeys.propertyTypeId)
    aCoder.encode(amenities, forKey: SerializationKeys.amenities)
    aCoder.encode(parking, forKey: SerializationKeys.parking)
    aCoder.encode(maxArea, forKey: SerializationKeys.maxArea)
    aCoder.encode(propertyUrl, forKey: SerializationKeys.propertyUrl)
    aCoder.encode(currencyId, forKey: SerializationKeys.currencyId)
    aCoder.encode(bathroom, forKey: SerializationKeys.bathroom)
    aCoder.encode(customValues, forKey: SerializationKeys.customValues)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(forRent, forKey: SerializationKeys.forRent)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(building, forKey: SerializationKeys.building)
    aCoder.encode(images, forKey: SerializationKeys.images)
    aCoder.encode(propertyType, forKey: SerializationKeys.propertyType)
    aCoder.encode(forSale, forKey: SerializationKeys.forSale)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(cityId, forKey: SerializationKeys.cityId)
    aCoder.encode(quantity, forKey: SerializationKeys.quantity)
    aCoder.encode(furnished, forKey: SerializationKeys.furnished)
    aCoder.encode(carpetAreas, forKey: SerializationKeys.carpetAreas)
    aCoder.encode(buildingId, forKey: SerializationKeys.buildingId)
    aCoder.encode(pets, forKey: SerializationKeys.pets)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(locality, forKey: SerializationKeys.locality)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(minPrice, forKey: SerializationKeys.minPrice)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(configurationId, forKey: SerializationKeys.configurationId)
    aCoder.encode(floorPlan, forKey: SerializationKeys.floorPlan)
    aCoder.encode(localityId, forKey: SerializationKeys.localityId)
    aCoder.encode(floor, forKey: SerializationKeys.floor)
    aCoder.encode(maxPrice, forKey: SerializationKeys.maxPrice)
  }

}

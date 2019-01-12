//
//  PopularProjects.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PopularProjects: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let possessionStatusId = "possession_status_id"
    static let buildingTypeId = "building_type_id"
    static let floors = "floors"
    static let buildingAge = "building_age"
    static let id = "id"
    static let amenities = "amenities"
    static let isCompleted = "is_completed"
    static let launchDate = "launch_date"
    static let cityId = "city_id"
    static let mainImage = "main_image"
    static let name = "name"
    static let city = "city"
    static let configurations = "configurations"
    static let projectUrl = "project_url"
    static let address = "address"
    static let buildingType = "building_type"
    static let descriptionValue = "description"
    static let userDeveloper = "user_developer"
    static let lat = "lat"
    static let developer = "developer"
    static let status = "status"
    static let lng = "lng"
    static let avgPrice = "avg_price"
    static let subdomain = "subdomain"
    static let createdBy = "created_by"
    static let locality = "locality"
    static let startingPrice = "starting_price"
    static let adminId = "admin_id"
    static let localityId = "locality_id"
    static let banks = "banks"
  }

  // MARK: Properties
  public var possessionStatusId: Int?
  public var buildingTypeId: Int?
  public var floors: Int?
  public var buildingAge: String?
  public var id: Int?
  public var amenities: [Amenities]?
  public var isCompleted: Int?
  public var launchDate: String?
  public var cityId: Int?
  public var mainImage: String?
  public var name: String?
  public var city: City?
  public var configurations: [Configurations]?
  public var projectUrl: String?
  public var address: String?
  public var buildingType: BuildingType?
  public var descriptionValue: String?
  public var userDeveloper: Int?
  public var lat: Float?
  public var developer: Developer?
  public var status: Int?
  public var lng: Float?
  public var avgPrice: Int?
  public var subdomain: String?
  public var createdBy: Int?
  public var locality: Locality?
  public var startingPrice: Double?
  public var adminId: Int?
  public var localityId: Int?
  public var banks: [Banks]?

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
    possessionStatusId = json[SerializationKeys.possessionStatusId].int
    buildingTypeId = json[SerializationKeys.buildingTypeId].int
    floors = json[SerializationKeys.floors].int
    buildingAge = json[SerializationKeys.buildingAge].string
    id = json[SerializationKeys.id].int
    if let items = json[SerializationKeys.amenities].array { amenities = items.map { Amenities(json: $0) } }
    isCompleted = json[SerializationKeys.isCompleted].int
    launchDate = json[SerializationKeys.launchDate].string
    cityId = json[SerializationKeys.cityId].int
    mainImage = json[SerializationKeys.mainImage].string
    name = json[SerializationKeys.name].string
    city = City(json: json[SerializationKeys.city])
    if let items = json[SerializationKeys.configurations].array { configurations = items.map { Configurations(json: $0) } }
    projectUrl = json[SerializationKeys.projectUrl].string
    address = json[SerializationKeys.address].string
    buildingType = BuildingType(json: json[SerializationKeys.buildingType])
    descriptionValue = json[SerializationKeys.descriptionValue].string
    userDeveloper = json[SerializationKeys.userDeveloper].int
    lat = json[SerializationKeys.lat].float
    developer = Developer(json: json[SerializationKeys.developer])
    status = json[SerializationKeys.status].int
    lng = json[SerializationKeys.lng].float
    avgPrice = json[SerializationKeys.avgPrice].int
    subdomain = json[SerializationKeys.subdomain].string
    createdBy = json[SerializationKeys.createdBy].int
    locality = Locality(json: json[SerializationKeys.locality])
    startingPrice = json[SerializationKeys.startingPrice].double
    adminId = json[SerializationKeys.adminId].int
    localityId = json[SerializationKeys.localityId].int
    if let items = json[SerializationKeys.banks].array { banks = items.map { Banks(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = possessionStatusId { dictionary[SerializationKeys.possessionStatusId] = value }
    if let value = buildingTypeId { dictionary[SerializationKeys.buildingTypeId] = value }
    if let value = floors { dictionary[SerializationKeys.floors] = value }
    if let value = buildingAge { dictionary[SerializationKeys.buildingAge] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = amenities { dictionary[SerializationKeys.amenities] = value.map { $0.dictionaryRepresentation() } }
    if let value = isCompleted { dictionary[SerializationKeys.isCompleted] = value }
    if let value = launchDate { dictionary[SerializationKeys.launchDate] = value }
    if let value = cityId { dictionary[SerializationKeys.cityId] = value }
    if let value = mainImage { dictionary[SerializationKeys.mainImage] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = city { dictionary[SerializationKeys.city] = value.dictionaryRepresentation() }
    if let value = configurations { dictionary[SerializationKeys.configurations] = value.map { $0.dictionaryRepresentation() } }
    if let value = projectUrl { dictionary[SerializationKeys.projectUrl] = value }
    if let value = address { dictionary[SerializationKeys.address] = value }
    if let value = buildingType { dictionary[SerializationKeys.buildingType] = value.dictionaryRepresentation() }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = userDeveloper { dictionary[SerializationKeys.userDeveloper] = value }
    if let value = lat { dictionary[SerializationKeys.lat] = value }
    if let value = developer { dictionary[SerializationKeys.developer] = value.dictionaryRepresentation() }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = lng { dictionary[SerializationKeys.lng] = value }
    if let value = avgPrice { dictionary[SerializationKeys.avgPrice] = value }
    if let value = subdomain { dictionary[SerializationKeys.subdomain] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = locality { dictionary[SerializationKeys.locality] = value.dictionaryRepresentation() }
    if let value = startingPrice { dictionary[SerializationKeys.startingPrice] = value }
    if let value = adminId { dictionary[SerializationKeys.adminId] = value }
    if let value = localityId { dictionary[SerializationKeys.localityId] = value }
    if let value = banks { dictionary[SerializationKeys.banks] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.possessionStatusId = aDecoder.decodeObject(forKey: SerializationKeys.possessionStatusId) as? Int
    self.buildingTypeId = aDecoder.decodeObject(forKey: SerializationKeys.buildingTypeId) as? Int
    self.floors = aDecoder.decodeObject(forKey: SerializationKeys.floors) as? Int
    self.buildingAge = aDecoder.decodeObject(forKey: SerializationKeys.buildingAge) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.amenities = aDecoder.decodeObject(forKey: SerializationKeys.amenities) as? [Amenities]
    self.isCompleted = aDecoder.decodeObject(forKey: SerializationKeys.isCompleted) as? Int
    self.launchDate = aDecoder.decodeObject(forKey: SerializationKeys.launchDate) as? String
    self.cityId = aDecoder.decodeObject(forKey: SerializationKeys.cityId) as? Int
    self.mainImage = aDecoder.decodeObject(forKey: SerializationKeys.mainImage) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.city = aDecoder.decodeObject(forKey: SerializationKeys.city) as? City
    self.configurations = aDecoder.decodeObject(forKey: SerializationKeys.configurations) as? [Configurations]
    self.projectUrl = aDecoder.decodeObject(forKey: SerializationKeys.projectUrl) as? String
    self.address = aDecoder.decodeObject(forKey: SerializationKeys.address) as? String
    self.buildingType = aDecoder.decodeObject(forKey: SerializationKeys.buildingType) as? BuildingType
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.userDeveloper = aDecoder.decodeObject(forKey: SerializationKeys.userDeveloper) as? Int
    self.lat = aDecoder.decodeObject(forKey: SerializationKeys.lat) as? Float
    self.developer = aDecoder.decodeObject(forKey: SerializationKeys.developer) as? Developer
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.lng = aDecoder.decodeObject(forKey: SerializationKeys.lng) as? Float
    self.avgPrice = aDecoder.decodeObject(forKey: SerializationKeys.avgPrice) as? Int
    self.subdomain = aDecoder.decodeObject(forKey: SerializationKeys.subdomain) as? String
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.locality = aDecoder.decodeObject(forKey: SerializationKeys.locality) as? Locality
    self.startingPrice = aDecoder.decodeObject(forKey: SerializationKeys.startingPrice) as? Double
    self.adminId = aDecoder.decodeObject(forKey: SerializationKeys.adminId) as? Int
    self.localityId = aDecoder.decodeObject(forKey: SerializationKeys.localityId) as? Int
    self.banks = aDecoder.decodeObject(forKey: SerializationKeys.banks) as? [Banks]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(possessionStatusId, forKey: SerializationKeys.possessionStatusId)
    aCoder.encode(buildingTypeId, forKey: SerializationKeys.buildingTypeId)
    aCoder.encode(floors, forKey: SerializationKeys.floors)
    aCoder.encode(buildingAge, forKey: SerializationKeys.buildingAge)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(amenities, forKey: SerializationKeys.amenities)
    aCoder.encode(isCompleted, forKey: SerializationKeys.isCompleted)
    aCoder.encode(launchDate, forKey: SerializationKeys.launchDate)
    aCoder.encode(cityId, forKey: SerializationKeys.cityId)
    aCoder.encode(mainImage, forKey: SerializationKeys.mainImage)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(city, forKey: SerializationKeys.city)
    aCoder.encode(configurations, forKey: SerializationKeys.configurations)
    aCoder.encode(projectUrl, forKey: SerializationKeys.projectUrl)
    aCoder.encode(address, forKey: SerializationKeys.address)
    aCoder.encode(buildingType, forKey: SerializationKeys.buildingType)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(userDeveloper, forKey: SerializationKeys.userDeveloper)
    aCoder.encode(lat, forKey: SerializationKeys.lat)
    aCoder.encode(developer, forKey: SerializationKeys.developer)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(lng, forKey: SerializationKeys.lng)
    aCoder.encode(avgPrice, forKey: SerializationKeys.avgPrice)
    aCoder.encode(subdomain, forKey: SerializationKeys.subdomain)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(locality, forKey: SerializationKeys.locality)
    aCoder.encode(startingPrice, forKey: SerializationKeys.startingPrice)
    aCoder.encode(adminId, forKey: SerializationKeys.adminId)
    aCoder.encode(localityId, forKey: SerializationKeys.localityId)
    aCoder.encode(banks, forKey: SerializationKeys.banks)
  }

}

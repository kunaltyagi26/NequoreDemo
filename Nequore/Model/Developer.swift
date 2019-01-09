//
//  Developer.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Developer: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let developerTitle = "developer_title"
    static let isBlocked = "is_blocked"
    static let developerImage = "developer_image"
    static let countryCode = "country_code"
    static let isSeller = "is_seller"
    static let image = "image"
    static let id = "id"
    static let dialCode = "dial_code"
    static let phone = "phone"
    static let name = "name"
    static let updatedAt = "updated_at"
    static let email = "email"
    static let createdAt = "created_at"
  }

  // MARK: Properties
  public var developerTitle: String?
  public var isBlocked: Int?
  public var developerImage: String?
  public var countryCode: String?
  public var isSeller: Int?
  public var image: String?
  public var id: Int?
  public var dialCode: String?
  public var phone: String?
  public var name: String?
  public var updatedAt: String?
  public var email: String?
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
    developerTitle = json[SerializationKeys.developerTitle].string
    isBlocked = json[SerializationKeys.isBlocked].int
    developerImage = json[SerializationKeys.developerImage].string
    countryCode = json[SerializationKeys.countryCode].string
    isSeller = json[SerializationKeys.isSeller].int
    image = json[SerializationKeys.image].string
    id = json[SerializationKeys.id].int
    dialCode = json[SerializationKeys.dialCode].string
    phone = json[SerializationKeys.phone].string
    name = json[SerializationKeys.name].string
    updatedAt = json[SerializationKeys.updatedAt].string
    email = json[SerializationKeys.email].string
    createdAt = json[SerializationKeys.createdAt].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = developerTitle { dictionary[SerializationKeys.developerTitle] = value }
    if let value = isBlocked { dictionary[SerializationKeys.isBlocked] = value }
    if let value = developerImage { dictionary[SerializationKeys.developerImage] = value }
    if let value = countryCode { dictionary[SerializationKeys.countryCode] = value }
    if let value = isSeller { dictionary[SerializationKeys.isSeller] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = dialCode { dictionary[SerializationKeys.dialCode] = value }
    if let value = phone { dictionary[SerializationKeys.phone] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.developerTitle = aDecoder.decodeObject(forKey: SerializationKeys.developerTitle) as? String
    self.isBlocked = aDecoder.decodeObject(forKey: SerializationKeys.isBlocked) as? Int
    self.developerImage = aDecoder.decodeObject(forKey: SerializationKeys.developerImage) as? String
    self.countryCode = aDecoder.decodeObject(forKey: SerializationKeys.countryCode) as? String
    self.isSeller = aDecoder.decodeObject(forKey: SerializationKeys.isSeller) as? Int
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.dialCode = aDecoder.decodeObject(forKey: SerializationKeys.dialCode) as? String
    self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(developerTitle, forKey: SerializationKeys.developerTitle)
    aCoder.encode(isBlocked, forKey: SerializationKeys.isBlocked)
    aCoder.encode(developerImage, forKey: SerializationKeys.developerImage)
    aCoder.encode(countryCode, forKey: SerializationKeys.countryCode)
    aCoder.encode(isSeller, forKey: SerializationKeys.isSeller)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(dialCode, forKey: SerializationKeys.dialCode)
    aCoder.encode(phone, forKey: SerializationKeys.phone)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
  }

}

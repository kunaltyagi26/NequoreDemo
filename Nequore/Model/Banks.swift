//
//  Banks.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Banks: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let branch = "branch"
    static let isBlocked = "is_blocked"
    static let updatedAt = "updated_at"
    static let email = "email"
    static let isAcl = "is_acl"
    static let isBank = "is_bank"
    static let id = "id"
    static let createdBy = "created_by"
    static let image = "image"
    static let createdAt = "created_at"
    static let phone = "phone"
    static let dialCode = "dial_code"
    static let floatingInt = "floating_int"
    static let isNoatary = "is_noatary"
  }

  // MARK: Properties
  public var name: String?
  public var branch: String?
  public var isBlocked: Int?
  public var updatedAt: String?
  public var email: String?
  public var isAcl: Int?
  public var isBank: Int?
  public var id: Int?
  public var createdBy: Int?
  public var image: String?
  public var createdAt: String?
  public var phone: String?
  public var dialCode: String?
  public var floatingInt: String?
  public var isNoatary: Int?

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
    name = json[SerializationKeys.name].string
    branch = json[SerializationKeys.branch].string
    isBlocked = json[SerializationKeys.isBlocked].int
    updatedAt = json[SerializationKeys.updatedAt].string
    email = json[SerializationKeys.email].string
    isAcl = json[SerializationKeys.isAcl].int
    isBank = json[SerializationKeys.isBank].int
    id = json[SerializationKeys.id].int
    createdBy = json[SerializationKeys.createdBy].int
    image = json[SerializationKeys.image].string
    createdAt = json[SerializationKeys.createdAt].string
    phone = json[SerializationKeys.phone].string
    dialCode = json[SerializationKeys.dialCode].string
    floatingInt = json[SerializationKeys.floatingInt].string
    isNoatary = json[SerializationKeys.isNoatary].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = branch { dictionary[SerializationKeys.branch] = value }
    if let value = isBlocked { dictionary[SerializationKeys.isBlocked] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = isAcl { dictionary[SerializationKeys.isAcl] = value }
    if let value = isBank { dictionary[SerializationKeys.isBank] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = phone { dictionary[SerializationKeys.phone] = value }
    if let value = dialCode { dictionary[SerializationKeys.dialCode] = value }
    if let value = floatingInt { dictionary[SerializationKeys.floatingInt] = value }
    if let value = isNoatary { dictionary[SerializationKeys.isNoatary] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.branch = aDecoder.decodeObject(forKey: SerializationKeys.branch) as? String
    self.isBlocked = aDecoder.decodeObject(forKey: SerializationKeys.isBlocked) as? Int
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.email = aDecoder.decodeObject(forKey: SerializationKeys.email) as? String
    self.isAcl = aDecoder.decodeObject(forKey: SerializationKeys.isAcl) as? Int
    self.isBank = aDecoder.decodeObject(forKey: SerializationKeys.isBank) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.phone = aDecoder.decodeObject(forKey: SerializationKeys.phone) as? String
    self.dialCode = aDecoder.decodeObject(forKey: SerializationKeys.dialCode) as? String
    self.floatingInt = aDecoder.decodeObject(forKey: SerializationKeys.floatingInt) as? String
    self.isNoatary = aDecoder.decodeObject(forKey: SerializationKeys.isNoatary) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(branch, forKey: SerializationKeys.branch)
    aCoder.encode(isBlocked, forKey: SerializationKeys.isBlocked)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(email, forKey: SerializationKeys.email)
    aCoder.encode(isAcl, forKey: SerializationKeys.isAcl)
    aCoder.encode(isBank, forKey: SerializationKeys.isBank)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(phone, forKey: SerializationKeys.phone)
    aCoder.encode(dialCode, forKey: SerializationKeys.dialCode)
    aCoder.encode(floatingInt, forKey: SerializationKeys.floatingInt)
    aCoder.encode(isNoatary, forKey: SerializationKeys.isNoatary)
  }

}

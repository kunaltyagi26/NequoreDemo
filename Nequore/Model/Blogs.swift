//
//  Blogs.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Blogs: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let titleEs = "title_es"
    static let metaTitleEs = "meta_title_es"
    static let updatedAt = "updated_at"
    static let metaDescriptionEs = "meta_description_es"
    static let postType = "post_type"
    static let metaTitle = "meta_title"
    static let metaTitleEn = "meta_title_en"
    static let descriptionEs = "description_es"
    static let descriptionEn = "description_en"
    static let descriptionValue = "description"
    static let publishDate = "publish_date"
    static let status = "status"
    static let metaDescriptionEn = "meta_description_en"
    static let slug = "slug"
    static let blogUrl = "blog_url"
    static let image = "image"
    static let metaDescription = "meta_description"
    static let id = "id"
    static let createdBy = "created_by"
    static let title = "title"
    static let createdAt = "created_at"
    static let titleEn = "title_en"
  }

  // MARK: Properties
  public var titleEs: String?
  public var metaTitleEs: String?
  public var updatedAt: String?
  public var metaDescriptionEs: String?
  public var postType: Int?
  public var metaTitle: String?
  public var metaTitleEn: String?
  public var descriptionEs: String?
  public var descriptionEn: String?
  public var descriptionValue: String?
  public var publishDate: String?
  public var status: Int?
  public var metaDescriptionEn: String?
  public var slug: String?
  public var blogUrl: String?
  public var image: String?
  public var metaDescription: String?
  public var id: Int?
  public var createdBy: Int?
  public var title: String?
  public var createdAt: String?
  public var titleEn: String?

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
    titleEs = json[SerializationKeys.titleEs].string
    metaTitleEs = json[SerializationKeys.metaTitleEs].string
    updatedAt = json[SerializationKeys.updatedAt].string
    metaDescriptionEs = json[SerializationKeys.metaDescriptionEs].string
    postType = json[SerializationKeys.postType].int
    metaTitle = json[SerializationKeys.metaTitle].string
    metaTitleEn = json[SerializationKeys.metaTitleEn].string
    descriptionEs = json[SerializationKeys.descriptionEs].string
    descriptionEn = json[SerializationKeys.descriptionEn].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    publishDate = json[SerializationKeys.publishDate].string
    status = json[SerializationKeys.status].int
    metaDescriptionEn = json[SerializationKeys.metaDescriptionEn].string
    slug = json[SerializationKeys.slug].string
    blogUrl = json[SerializationKeys.blogUrl].string
    image = json[SerializationKeys.image].string
    metaDescription = json[SerializationKeys.metaDescription].string
    id = json[SerializationKeys.id].int
    createdBy = json[SerializationKeys.createdBy].int
    title = json[SerializationKeys.title].string
    createdAt = json[SerializationKeys.createdAt].string
    titleEn = json[SerializationKeys.titleEn].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = titleEs { dictionary[SerializationKeys.titleEs] = value }
    if let value = metaTitleEs { dictionary[SerializationKeys.metaTitleEs] = value }
    if let value = updatedAt { dictionary[SerializationKeys.updatedAt] = value }
    if let value = metaDescriptionEs { dictionary[SerializationKeys.metaDescriptionEs] = value }
    if let value = postType { dictionary[SerializationKeys.postType] = value }
    if let value = metaTitle { dictionary[SerializationKeys.metaTitle] = value }
    if let value = metaTitleEn { dictionary[SerializationKeys.metaTitleEn] = value }
    if let value = descriptionEs { dictionary[SerializationKeys.descriptionEs] = value }
    if let value = descriptionEn { dictionary[SerializationKeys.descriptionEn] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = publishDate { dictionary[SerializationKeys.publishDate] = value }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = metaDescriptionEn { dictionary[SerializationKeys.metaDescriptionEn] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = blogUrl { dictionary[SerializationKeys.blogUrl] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = metaDescription { dictionary[SerializationKeys.metaDescription] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = createdBy { dictionary[SerializationKeys.createdBy] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = createdAt { dictionary[SerializationKeys.createdAt] = value }
    if let value = titleEn { dictionary[SerializationKeys.titleEn] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.titleEs = aDecoder.decodeObject(forKey: SerializationKeys.titleEs) as? String
    self.metaTitleEs = aDecoder.decodeObject(forKey: SerializationKeys.metaTitleEs) as? String
    self.updatedAt = aDecoder.decodeObject(forKey: SerializationKeys.updatedAt) as? String
    self.metaDescriptionEs = aDecoder.decodeObject(forKey: SerializationKeys.metaDescriptionEs) as? String
    self.postType = aDecoder.decodeObject(forKey: SerializationKeys.postType) as? Int
    self.metaTitle = aDecoder.decodeObject(forKey: SerializationKeys.metaTitle) as? String
    self.metaTitleEn = aDecoder.decodeObject(forKey: SerializationKeys.metaTitleEn) as? String
    self.descriptionEs = aDecoder.decodeObject(forKey: SerializationKeys.descriptionEs) as? String
    self.descriptionEn = aDecoder.decodeObject(forKey: SerializationKeys.descriptionEn) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.publishDate = aDecoder.decodeObject(forKey: SerializationKeys.publishDate) as? String
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? Int
    self.metaDescriptionEn = aDecoder.decodeObject(forKey: SerializationKeys.metaDescriptionEn) as? String
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.blogUrl = aDecoder.decodeObject(forKey: SerializationKeys.blogUrl) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.metaDescription = aDecoder.decodeObject(forKey: SerializationKeys.metaDescription) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.createdBy = aDecoder.decodeObject(forKey: SerializationKeys.createdBy) as? Int
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.createdAt = aDecoder.decodeObject(forKey: SerializationKeys.createdAt) as? String
    self.titleEn = aDecoder.decodeObject(forKey: SerializationKeys.titleEn) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(titleEs, forKey: SerializationKeys.titleEs)
    aCoder.encode(metaTitleEs, forKey: SerializationKeys.metaTitleEs)
    aCoder.encode(updatedAt, forKey: SerializationKeys.updatedAt)
    aCoder.encode(metaDescriptionEs, forKey: SerializationKeys.metaDescriptionEs)
    aCoder.encode(postType, forKey: SerializationKeys.postType)
    aCoder.encode(metaTitle, forKey: SerializationKeys.metaTitle)
    aCoder.encode(metaTitleEn, forKey: SerializationKeys.metaTitleEn)
    aCoder.encode(descriptionEs, forKey: SerializationKeys.descriptionEs)
    aCoder.encode(descriptionEn, forKey: SerializationKeys.descriptionEn)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(publishDate, forKey: SerializationKeys.publishDate)
    aCoder.encode(status, forKey: SerializationKeys.status)
    aCoder.encode(metaDescriptionEn, forKey: SerializationKeys.metaDescriptionEn)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(blogUrl, forKey: SerializationKeys.blogUrl)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(metaDescription, forKey: SerializationKeys.metaDescription)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(createdBy, forKey: SerializationKeys.createdBy)
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(createdAt, forKey: SerializationKeys.createdAt)
    aCoder.encode(titleEn, forKey: SerializationKeys.titleEn)
  }

}

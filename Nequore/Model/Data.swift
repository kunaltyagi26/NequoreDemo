//
//  Data.swift
//
//  Created by Kunal Tyagi on 09/01/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Data: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let featuredLocalities = "featured_localities"
    static let topDevelopers = "top_developers"
    static let preSale = "pre_sale"
    static let recommended = "recommended"
    static let blogs = "blogs"
    static let popularProjects = "popular_projects"
  }

  // MARK: Properties
  public var featuredLocalities: [FeaturedLocalities]?
  public var topDevelopers: [TopDevelopers]?
  public var preSale: [PreSale]?
  public var recommended: [Recommended]?
  public var blogs: [Blogs]?
  public var popularProjects: [PopularProjects]?

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
    if let items = json[SerializationKeys.featuredLocalities].array { featuredLocalities = items.map { FeaturedLocalities(json: $0) } }
    if let items = json[SerializationKeys.topDevelopers].array { topDevelopers = items.map { TopDevelopers(json: $0) } }
    if let items = json[SerializationKeys.preSale].array { preSale = items.map { PreSale(json: $0) } }
    if let items = json[SerializationKeys.recommended].array { recommended = items.map { Recommended(json: $0) } }
    if let items = json[SerializationKeys.blogs].array { blogs = items.map { Blogs(json: $0) } }
    if let items = json[SerializationKeys.popularProjects].array { popularProjects = items.map { PopularProjects(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = featuredLocalities { dictionary[SerializationKeys.featuredLocalities] = value.map { $0.dictionaryRepresentation() } }
    if let value = topDevelopers { dictionary[SerializationKeys.topDevelopers] = value.map { $0.dictionaryRepresentation() } }
    if let value = preSale { dictionary[SerializationKeys.preSale] = value.map { $0.dictionaryRepresentation() } }
    if let value = recommended { dictionary[SerializationKeys.recommended] = value.map { $0.dictionaryRepresentation() } }
    if let value = blogs { dictionary[SerializationKeys.blogs] = value.map { $0.dictionaryRepresentation() } }
    if let value = popularProjects { dictionary[SerializationKeys.popularProjects] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.featuredLocalities = aDecoder.decodeObject(forKey: SerializationKeys.featuredLocalities) as? [FeaturedLocalities]
    self.topDevelopers = aDecoder.decodeObject(forKey: SerializationKeys.topDevelopers) as? [TopDevelopers]
    self.preSale = aDecoder.decodeObject(forKey: SerializationKeys.preSale) as? [PreSale]
    self.recommended = aDecoder.decodeObject(forKey: SerializationKeys.recommended) as? [Recommended]
    self.blogs = aDecoder.decodeObject(forKey: SerializationKeys.blogs) as? [Blogs]
    self.popularProjects = aDecoder.decodeObject(forKey: SerializationKeys.popularProjects) as? [PopularProjects]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(featuredLocalities, forKey: SerializationKeys.featuredLocalities)
    aCoder.encode(topDevelopers, forKey: SerializationKeys.topDevelopers)
    aCoder.encode(preSale, forKey: SerializationKeys.preSale)
    aCoder.encode(recommended, forKey: SerializationKeys.recommended)
    aCoder.encode(blogs, forKey: SerializationKeys.blogs)
    aCoder.encode(popularProjects, forKey: SerializationKeys.popularProjects)
  }

}

//
//  FlickrPhoto.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

class FlickrPhoto {
	var title: String
	var link: String
	var mediaURL: String
	var dateTaken: String
	var photoDescription: String
	var publishedDate: String
	var author: String
	var authorID: String
	var tags: String
	
	init(photoData: [String : Any]) throws {
		guard let title = photoData["title"] as? String else {
			throw DeserializationError.missingKey("title")
		}
		guard let link = photoData["link"] as? String else {
			throw DeserializationError.missingKey("link")
		}
		guard let media = photoData["media"] as? [String:Any],
			let mediaURL = media["m"] as? String else {
				throw DeserializationError.missingKey("m")
		}
		guard let dateTaken = photoData["date_taken"] as? String else {
			throw DeserializationError.missingKey("date_taken")
		}
		guard let publishedDate = photoData["published"] as? String else {
			throw DeserializationError.missingKey("published")
		}
		guard let photoDescription = photoData["description"] as? String else {
			throw DeserializationError.missingKey("description")
		}
		guard let author = photoData["author"] as? String else {
			throw DeserializationError.missingKey("author")
		}
		guard let authorID = photoData["author_id"] as? String else {
			throw DeserializationError.missingKey("author_id")
		}
		guard let tags = photoData["tags"] as? String else {
			throw DeserializationError.missingKey("tags")
		}
		
		self.title = title
		self.link = link
		self.mediaURL = mediaURL
		self.dateTaken = dateTaken
		self.publishedDate = publishedDate
		self.photoDescription = photoDescription
		self.author = author
		self.authorID = authorID
		self.tags = tags
	}
}

//
//  FlickrPhoto.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

class FlickrPhoto {
	let title: String
	let link: String
	let mediaURLString: String
	let dateTakenString: String
	let photoDescription: String
	let publishedDateString: String
	let author: String
	let authorID: String
	let tags: String
	
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
		guard let dateTakenString = photoData["date_taken"] as? String else {
			throw DeserializationError.missingKey("date_taken")
		}
		guard let publishedDateString = photoData["published"] as? String else {
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
		self.mediaURLString = mediaURL
		self.dateTakenString = dateTakenString
		self.publishedDateString = publishedDateString
		self.photoDescription = photoDescription
		self.author = author
		self.authorID = authorID
		self.tags = tags
	}
}

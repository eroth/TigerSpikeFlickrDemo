//
//  FlickrPhotoData.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

class FlickrRecentPhotos {
	var lastModifiedDate: String?
	private var dataArr = [String : Any]()
	var photoData = [FlickrPhoto]()
	
	init(dataArr: [String : Any]) {
		self.dataArr = dataArr
		
		if let lastModifiedDate = dataArr["modified"] {
			self.lastModifiedDate = String(describing: lastModifiedDate)
		}
		
		var deserializedPhotoData = [FlickrPhoto]()
		if let photoDataArray = self.dataArr["items"] as? [[String : Any]] {
			for photoData in photoDataArray {
				let deserializedPhoto = FlickrPhoto(photoData: photoData)
				deserializedPhotoData.append(deserializedPhoto)
			}
			self.photoData = deserializedPhotoData
		}
	}
}

struct FlickrPhoto {
	var title: String?
	var link: String?
	var mediaURL: String?
	var dateTaken: String?
	var photoDescription: String?
	var publishedDate: String?
	var author: String?
	var authorID: String?
	var tags: String?
	
	init(photoData: [String : Any]) {
		if let title = photoData["title"] {
			self.title = String(describing: title)
		}
		if let link = photoData["link"] {
			self.link = String(describing: link)
		}
		if let media = photoData["media"] as? [String:Any] {
			if let mediaURL = media["m"]  {
				self.mediaURL = String(describing: mediaURL)
			}
		}
		if let dateTaken = photoData["date_taken"] {
			self.dateTaken = String(describing: dateTaken)
		}
		if let photoDescription = photoData["description"] {
			self.photoDescription = String(describing: photoDescription)
		}
		if let publishedDate = photoData["published"] {
			self.publishedDate = String(describing: publishedDate)
		}
		if let author = photoData["author"] {
			self.author = String(describing: author)
		}
		if let authorID = photoData["author_id"] {
			self.authorID = String(describing: authorID)
		}
		if let tags = photoData["tags"] {
			self.tags = String(describing: tags)
		}
	}
}

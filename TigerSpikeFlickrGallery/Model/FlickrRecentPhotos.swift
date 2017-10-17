//
//  FlickrRecentPhotos.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

enum DeserializationError: Error {
	case missingKey(String)
}

class FlickrRecentPhotos {
	var lastModifiedDateString: String
	private var dataArr = [String : Any]()
	var photoData = [FlickrPhoto]()
	
	init(dataArr: [String : Any]) throws {
		self.dataArr = dataArr
		
		guard let lastModifiedDateString = dataArr["modified"] as? String else {
			throw DeserializationError.missingKey("modified")
		}
		self.lastModifiedDateString = lastModifiedDateString
		
		var deserializedPhotoData = [FlickrPhoto]()
		guard let photoDataArray = self.dataArr["items"] as? [[String : Any]] else {
			throw DeserializationError.missingKey("items")
		}
		
		for photoData in photoDataArray {
			do {
				let deserializedPhoto = try FlickrPhoto(photoData: photoData)
				deserializedPhotoData.append(deserializedPhoto)
			} catch let error {
				print(error)
			}
		}
		
		self.photoData = deserializedPhotoData
	}
}

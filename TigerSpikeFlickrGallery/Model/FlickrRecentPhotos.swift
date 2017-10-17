//
//  FlickrRecentPhotos.swift
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

//
//  PhotosAPI.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

class PhotosAPI {
	private let networkingService: NetworkingService
	
	init(networkingService: NetworkingService) {
		self.networkingService = networkingService
	}
	
	func getRecentPhotos(successCompletion: @escaping (FlickrRecentPhotos) -> Void, errorCompletion: @escaping (Error) -> Void) -> () {
		networkingService.performRequest(route: Constants.RECENT_PHOTOS_ROUTE, queryParams: QueryParams(), successCompletion: { responseObject in
			let flickrRecentPhotos = FlickrRecentPhotos(dataArr: responseObject)
			successCompletion(flickrRecentPhotos)
		}, errorCompletion: { error in
			errorCompletion(error)
		})
	}
}

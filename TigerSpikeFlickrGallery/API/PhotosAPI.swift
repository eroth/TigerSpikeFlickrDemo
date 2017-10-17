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
			do {
				let flickrRecentPhotos = try FlickrRecentPhotos(dataArr: responseObject)
				successCompletion(flickrRecentPhotos)
			} catch let error {
				print(error)
			}
		}, errorCompletion: { error in
			errorCompletion(error)
		})
	}
}

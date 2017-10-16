//
//  PhotosAPI.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

struct Constants {
	static let API_HOST: String = "api.flickr.com"
	static let RECENT_PHOTOS_ROUTE = "/services/feeds/photos_public.gne"
}

class PhotosAPI {
	private let networkingService: NetworkingService
	
	init(networkingService: NetworkingService) {
		self.networkingService = networkingService
	}
	
	func getRecentPhotos() -> () {
		networkingService.performRequest(route: Constants.RECENT_PHOTOS_ROUTE, queryParams: QueryParams(),
		                                 successCompletion: { responseObject in
											
		}, errorCompletion: { error in
			
		})
	}
}

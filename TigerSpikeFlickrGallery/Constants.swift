//
//  Constants.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

struct Constants {
	// Networking
	static let API_HOST: String = "api.flickr.com"
	static let RECENT_PHOTOS_ROUTE = "/services/feeds/photos_public.gne"
	
	// Cell Identifiers
	static let PhotosFeedCollectionViewCellReuseIdentifier = "PhotosFeedCollectionViewCellReuseIdentifier"
	static let PhotoDetailTableViewCellReuseIdentifier = "PhotoDetailTableViewCellReuseIdentifier"
	static let PhotoDetailRowTableViewCellReuseIdentifier = "PhotoDetailRowTableViewCellReuseIdentifier"
	static let PhotoDetailSectionTableViewCellReuseIdentifier = "PhotoDetailSectionTableViewCellReuseIdentifier"
}

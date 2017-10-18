//
//  PhotoImageView.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoImageView: UIImageView {
	func setPhotoImage(forURLString: String) {
		self.sd_setShowActivityIndicatorView(true)
		self.sd_setIndicatorStyle(.gray)
		self.sd_setImage(with: URL(string: forURLString))
	}
}

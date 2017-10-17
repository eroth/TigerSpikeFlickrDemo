//
//  PhotoImageView.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotoImageView: UIImageView {

	override init(image: UIImage?) {
		super.init(image: image)
		
		self.image = image
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		self.image = image
	}
}

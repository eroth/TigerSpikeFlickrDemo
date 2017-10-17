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
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	override init(image: UIImage?) {
		super.init(image: image)
		
		self.image = image
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func setPhotoImage(forURLString: String) {
		self.sd_setShowActivityIndicatorView(true)
		self.sd_setIndicatorStyle(.gray)
		self.sd_setImage(with: URL(string: forURLString))
	}
}

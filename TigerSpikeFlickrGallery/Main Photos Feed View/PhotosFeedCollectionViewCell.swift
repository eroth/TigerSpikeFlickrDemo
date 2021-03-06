//
//  MainPhotosCollectionViewCell.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotosFeedCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var photoImageView: PhotoImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()

		self.layer.borderColor = UIColor.white.cgColor
		self.layer.borderWidth = 1
    }
}

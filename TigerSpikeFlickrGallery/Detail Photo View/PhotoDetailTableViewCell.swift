//
//  PhotoDetailTableViewCell.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/18/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotoDetailTableViewCell: UITableViewCell {

	@IBOutlet weak var photoImageView: PhotoImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

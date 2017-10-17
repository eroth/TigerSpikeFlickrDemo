//
//  PhotoDetailViewController.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

	var flickrPhoto: FlickrPhoto?
	
	convenience init(flickrPhoto : FlickrPhoto) {
		self.init()
		self.flickrPhoto = flickrPhoto
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

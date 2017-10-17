//
//  ViewController.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let photosAPI = PhotosAPI.init(networkingService: VanillaNetworking())
		photosAPI.getRecentPhotos(successCompletion: { flickrRecentPhotos in
			
		}) { (error) in
			
		}
	}

}


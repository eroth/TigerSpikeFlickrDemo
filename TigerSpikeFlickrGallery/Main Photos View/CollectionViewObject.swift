//
//  CollectionViewObject.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	static func from(color: UIColor) -> UIImage {
		let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
		UIGraphicsBeginImageContext(rect.size)
		let context = UIGraphicsGetCurrentContext()
		context!.setFillColor(color.cgColor)
		context!.fill(rect)
		let img = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return img!
	}
}

class CollectionViewObject: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	@IBOutlet weak var mainPhotosCollectionView: UICollectionView! {
		didSet {
			mainPhotosCollectionView.register(UINib.init(nibName: "MainPhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.MainPhotosCollectionViewCellReuseIdentifier)
		}
	}
	
	override init() {
		super.init()

	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 200
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MainPhotosCollectionViewCellReuseIdentifier, for: indexPath) as! MainPhotosCollectionViewCell
			photoCell.photoImageView.setPhotoImage(forURLString: "https://farm5.staticflickr.com/4451/23887874148_0c6e5732b6_m.jpg")
		
		return photoCell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let widthHeight = collectionView.bounds.width/2
		return CGSize(width: widthHeight, height: widthHeight)
	}
}

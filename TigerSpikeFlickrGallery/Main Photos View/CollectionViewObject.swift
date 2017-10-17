//
//  CollectionViewObject.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewObject: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	typealias DidSelectPhotoClosure = (_ photoData : FlickrPhoto) -> Void
	
	var didSelectPhotoClosure: DidSelectPhotoClosure?
	var photoDataSource: FlickrRecentPhotos? {
		didSet {
			mainPhotosCollectionView.reloadData()
		}
	}
	
	@IBOutlet weak var mainPhotosCollectionView: UICollectionView! {
		didSet {
			mainPhotosCollectionView.register(UINib.init(nibName: "MainPhotosCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.MainPhotosCollectionViewCellReuseIdentifier)
		}
	}
	
	override init() {
		super.init()

	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let numPhotos = photoDataSource?.photoData.count
		
		return numPhotos ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MainPhotosCollectionViewCellReuseIdentifier, for: indexPath) as! MainPhotosCollectionViewCell
		if let photoData = photoDataSource?.photoData[indexPath.row] as FlickrPhoto? {
			let urlString = photoData.mediaURLString
			photoCell.photoImageView.setPhotoImage(forURLString: urlString)
		}
		
		return photoCell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let photoData = photoDataSource?.photoData[indexPath.row] as FlickrPhoto? {
			didSelectPhotoClosure!(photoData)
			print(photoData.title)
			print(photoData.mediaURLString)
			print(photoData.photoDescription)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = collectionView.bounds.width/2
		return CGSize(width: width, height: width)
	}
}

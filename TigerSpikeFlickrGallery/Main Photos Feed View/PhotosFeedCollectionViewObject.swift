//
//  CollectionViewObject.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation
import UIKit

class PhotosFeedCollectionViewObject: NSObject {
	typealias DidSelectPhotoClosure = (_ photoData : FlickrPhoto) -> Void
	
	var didSelectPhotoClosure: DidSelectPhotoClosure?
	var photoDataSource: FlickrRecentPhotos? {
		didSet {
			mainPhotosCollectionView.reloadData()
		}
	}
	
	@IBOutlet weak var mainPhotosCollectionView: UICollectionView! {
		didSet {
			mainPhotosCollectionView.register(UINib.init(nibName: "PhotosFeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.PhotosFeedCollectionViewCellReuseIdentifier)
		}
	}
}

// MARK: - UICollectionViewDelegate
extension PhotosFeedCollectionViewObject : UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let photoData = photoDataSource?.photoData[indexPath.row] as FlickrPhoto? {
			didSelectPhotoClosure!(photoData)
		}
	}
}

// MARK: - UICollectionViewDataSource
extension PhotosFeedCollectionViewObject : UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		let numPhotos = photoDataSource?.photoData.count
		
		return numPhotos ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PhotosFeedCollectionViewCellReuseIdentifier, for: indexPath) as! PhotosFeedCollectionViewCell
		if let photoData = photoDataSource?.photoData[indexPath.row] as FlickrPhoto? {
			let urlString = photoData.mediaURLString
			photoCell.photoImageView.setPhotoImage(forURLString: urlString)
		}
		
		return photoCell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PhotosFeedCollectionViewObject : UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let widthHeight = collectionView.bounds.width/2
		
		return CGSize(width: widthHeight, height: widthHeight)
	}
}

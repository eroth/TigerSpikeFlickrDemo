//
//  PhotoDetailTableViewObject.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotoDetailTableViewObject : NSObject {
	let flickrPhoto: FlickrPhoto
	let sectionTitles = ["Image", "Title", "Author", "Description", "Date Taken", "Date Published"]

	init(flickrPhoto : FlickrPhoto, tableView : UITableView) {
		self.flickrPhoto = flickrPhoto
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.allowsSelection = false
		tableView.estimatedRowHeight = 100
		tableView.register(UINib.init(nibName: "PhotoDetailTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.PhotoDetailTableViewCellReuseIdentifier)
		tableView.register(UINib.init(nibName: "PhotoDetailRowTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.PhotoDetailRowTableViewCellReuseIdentifier)
		super.init()
	}
}

// MARK: - UITableViewDelegate
extension PhotoDetailTableViewObject : UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		var headerCell = tableView.dequeueReusableCell(withIdentifier: Constants.PhotoDetailSectionTableViewCellReuseIdentifier)
		if !(headerCell != nil) {
			headerCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: Constants.PhotoDetailSectionTableViewCellReuseIdentifier)
			headerCell?.textLabel?.text = self.sectionTitles[section]
			headerCell?.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
		}
		return headerCell!
	}
}

// MARK: - UITableViewDataSource
extension PhotoDetailTableViewObject : UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.sectionTitles.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let reuseIdentifier = indexPath.section == 0 ? Constants.PhotoDetailTableViewCellReuseIdentifier : Constants.PhotoDetailRowTableViewCellReuseIdentifier
		var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
		
		if let photoCell = cell as? PhotoDetailTableViewCell {
			photoCell.photoImageView.setPhotoImage(forURLString: flickrPhoto.mediaURLString)
			cell = photoCell
		} else if let rowCell = cell as? PhotoDetailRowTableViewCell {
			var cellText = String()
			switch self.sectionTitles[indexPath.section] {
			case "Title":
				cellText = flickrPhoto.title
			case "Author":
				cellText = flickrPhoto.author
			case "Description":
				cellText = flickrPhoto.photoDescription
			case "Date Taken":
				cellText = flickrPhoto.dateTakenString
			case "Date Published":
				cellText = flickrPhoto.publishedDateString
			default:
				cellText = "No Text"
			}
			rowCell.rowLabel.text = cellText
		}
		
		return cell
	}
}

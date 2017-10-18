//
//  PhotoDetailViewController.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/17/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
	let flickrPhoto: FlickrPhoto
	let tableViewObject: PhotoDetailTableViewObject
	let tableView = UITableView()
	
	init(flickrPhoto : FlickrPhoto) {
		self.flickrPhoto = flickrPhoto
		tableViewObject = PhotoDetailTableViewObject(flickrPhoto: flickrPhoto, tableView: tableView)
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.addSubview(tableView)
		self.view.addConstraint(NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.width, multiplier: 1, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.height, multiplier: 1, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: tableView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))

        // Do any additional setup after loading the view.
		tableView.dataSource = tableViewObject
		tableView.delegate = tableViewObject
    }
}

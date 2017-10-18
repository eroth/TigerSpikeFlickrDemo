//
//  TigerSpikeFlickrGalleryTests.swift
//  TigerSpikeFlickrGalleryTests
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import XCTest
@testable import TigerSpikeFlickrGallery

class TigerSpikeFlickrGalleryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testDecoding() {
		// Make a dictionary to parse
		let infoDict: [String: Any] = [
			"title": "My Amazing Flickr Photo",
			"link": "http://someflickrurl.com",
			"media": [
				"m": "https://someflickrmediaurl.com"
			],
			"date_taken": "9/9/2017",
			"published": "9/10/2017",
			"description": "Some description",
			"author": "Some Author",
			"author_id": "1",
			"tags": "#OMG #bestever #poursomesugaronme #somelikeithot"
		]

		// Validate that no title throws an error in the correct places
		let noTitle = infoDict.filter { $0.key != "title" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noTitle)) { error in
			XCTAssert(error is DeserializationError)
		}

		// Validate no link throws an error
		let noLink = infoDict.filter { $0.key != "link" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noLink)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noMediaTopLevelDict = infoDict.filter { $0.key != "media" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noMediaTopLevelDict)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noDateTaken = infoDict.filter { $0.key != "date_taken" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noDateTaken)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noPublished = infoDict.filter { $0.key != "published" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noPublished)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noDescription = infoDict.filter { $0.key != "description" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noDescription)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noAuthor = infoDict.filter { $0.key != "author" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noAuthor)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noAuthorID = infoDict.filter { $0.key != "author_id" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noAuthorID)) { error in
			XCTAssert(error is DeserializationError)
		}
		
		let noTags = infoDict.filter { $0.key != "tags" }
		XCTAssertThrowsError(try FlickrPhoto(photoData: noTags)) { error in
			XCTAssert(error is DeserializationError)
		}

		// check to make sure that our data structure is correct
		XCTAssertNoThrow(try FlickrPhoto(photoData: infoDict))

		guard let photo = try? FlickrPhoto(photoData: infoDict) else {
			XCTFail("Could not decode \(infoDict) into a FlickrPhoto")
		return
		}
		
		// check to make sure that each of the fields decoded correctly
		XCTAssert(photo.title == "My Amazing Flickr Photo")
		XCTAssert(photo.link == "http://someflickrurl.com")
		XCTAssert(photo.mediaURLString == "https://someflickrmediaurl.com")
		XCTAssert(photo.dateTakenString == "9/9/2017")
		XCTAssert(photo.publishedDateString == "9/10/2017")
		XCTAssert(photo.photoDescription == "Some description")
		XCTAssert(photo.author == "Some Author")
		XCTAssert(photo.authorID == "1")
		XCTAssert(photo.tags == "#OMG #bestever #poursomesugaronme #somelikeithot")
	}
    
}

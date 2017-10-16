//
//  NetworkingService.swift
//  TigerSpikeFlickrGallery
//
//  Created by Evan Roth on 10/16/17.
//  Copyright © 2017 Evan Roth. All rights reserved.
//

import Foundation

struct URLConfig {
	var host: String
	var scheme: String
	var path: String
	var queryComponents: [String:String]?
	
	init(scheme: String = "https", host: String = Constants.API_HOST, path: String, queryComponents: [String:String]?) {
		self.scheme = scheme
		self.host = host
		self.path = path
		self.queryComponents = queryComponents
	}
	
	var url: URL? {
		get {
			var urlComponents = URLComponents()
			urlComponents.scheme = scheme
			urlComponents.host = host
			urlComponents.path = path
			
			if let components = queryComponents {
				urlComponents.queryItems = components.map { URLQueryItem(name: $0, value: $1)}
			}
			
			guard let url = urlComponents.url else { return nil }
			
			return url
		}
	}
}

struct QueryParams {
	enum QueryFormat : String {
		case json = "json"
	}
	
	enum QueryLanguage: String {
		case english = "en-us"
	}
	
	enum QueryCallback: String {
		case noJSONCallback = "1"
	}
	
	var queryFormat: QueryFormat?
	var queryLanguage: QueryLanguage?
	var queryCallback: QueryCallback?
	
	var params: [String:String] {
		get {
			var temp = [String:String]()
			if let format = queryFormat {
				temp["format"] = format.rawValue
			}
			if let langauge = queryLanguage {
				temp["lang"] = langauge.rawValue
			}
			if let callback = queryCallback {
				temp["nojsoncallback"] = callback.rawValue
			}
			
			return temp
		}
	}
	
	init(format: QueryFormat = .json, language: QueryLanguage = .english, callback: QueryCallback = .noJSONCallback) {
		self.queryFormat = format
		self.queryLanguage = language
		self.queryCallback = callback
	}
}

protocol NetworkingService {
	func performRequest(route: String, queryParams: QueryParams, successCompletion: @escaping ([String:Any]) -> Void, errorCompletion: @escaping (Error) -> Void)
}

extension NetworkingService {
	func performRequest(queryParams: QueryParams = QueryParams()) {
		
	}
}

class VanillaNetworking : NetworkingService {
	func performRequest(route: String, queryParams: QueryParams, successCompletion: @escaping ([String:Any]) -> Void, errorCompletion: @escaping (Error) -> Void) {
		guard let url = URLConfig(path: route, queryComponents: queryParams.params).url else {
			return
		}
		
		var request = URLRequest(url: url)
		request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
		request.timeoutInterval = 30
		request.httpMethod = "GET"
		
		let session = URLSession(configuration: URLSessionConfiguration.ephemeral)
		let dataTask = session.dataTask(with: request) { (data, URLResponse, error) in
			if let e = error {
				errorCompletion(e)
				
				return
			}
			if let responseBody = String(data: data!, encoding: String.Encoding.utf8) {
				print("responseBodyString: \(responseBody.description)")
			}
			
			do {
				let json = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
				print(json)
				successCompletion(json)
			} catch {
				print("JSON deserialization error")
			}
		}
		
		dataTask.resume()
	}
}

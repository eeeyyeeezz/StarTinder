import Foundation

extension SwipeView{
	func	ParsJSON(){
		let decoder = JSONDecoder()
		let year = Int.random(in: 1995...2022)
		let month = Int.random(in: 01...12)
		let day = Int.random(in: 01...28)
		let date = String(year) + "-" + String(format: "%02d", month) + "-" + String(format: "%02d", day)
		print(date)
		
		guard let url = URL(string: "https://api.nasa.gov/planetary/apod?date=" + date + "&api_key=4dNe0pRXtdbZOx172AwqWBMyBZpm3ofZCZmVefmn") else { return }
		linkToSave = date
		
		let session = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error = error { print(error) ; return }
			guard let data = data else { print("Data error!") ; return }
			
			do {
				let newJSON = try decoder.decode(NasaJSON.self, from: data)
				self.completionHandler?(newJSON)
			} catch { print(error) ; self.ParsJSON() }
		}
		session.resume()
	}
}


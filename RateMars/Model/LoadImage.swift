import UIKit

extension SwipeView{
	func	loadImage(_ NewJSON: NasaJSON){
		SpacePic.image = nil
		guard let url = URL(string: NewJSON.url) else { print("UrlImageFromJson to Url Error") ; return }
		
		DispatchQueue.global().async {
			guard let data = try? Data(contentsOf: url) else { return }
			DispatchQueue.main.async { self.SpacePic.image = UIImage(data: data) }
		}
	}
		
}


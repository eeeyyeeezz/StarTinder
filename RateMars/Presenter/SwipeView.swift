// 4dNe0pRXtdbZOx172AwqWBMyBZpm3ofZCZmVefmn

import UIKit

class SwipeView: UIViewController {

	let SpaceBackground: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "SpaceBackground")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFill
		image.isUserInteractionEnabled = true
		return image
	}()
	
	let MarsPic: UIImageView = {
		let image = UIImageView()
		image.isUserInteractionEnabled = true
		image.image = UIImage(named: "SpaceBackground")
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let ThumbsPic: UIImageView = {
		let image = UIImageView()
		image.isUserInteractionEnabled = true
		image.alpha = 0
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	var divisor: CGFloat?
	var completionHandler: ((NasaJSON) -> ())?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		ParsJSON()
		SetConstraints()
		completionHandler = { NewJSON in
			DispatchQueue.main.async {
				self.loadImage(NewJSON)
			}
		}
	}
}

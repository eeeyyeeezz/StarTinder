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
	
	let RateLabel: UILabel = {
		let label = UILabel()
		label.text = "Rate NASA Pic of the Day!"
		label.font = label.font.withSize(30)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()	
	
	let SpacePic: UIImageView = {
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
	var Pictures: [Pictures]?
	
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

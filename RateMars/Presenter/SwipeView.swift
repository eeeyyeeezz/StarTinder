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
		image.image = UIImage(named: "TestPic")
		image.isUserInteractionEnabled = true
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		divisor = (view.frame.width / 2) / 0.61
 		SetConstraints()		
		
	}
}

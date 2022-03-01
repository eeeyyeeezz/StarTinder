// 4dNe0pRXtdbZOx172AwqWBMyBZpm3ofZCZmVefmn

import UIKit

class ViewController: UIViewController {

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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		SetConstraints()
	}
}

extension ViewController{
	
	func SetConstraints(){
		view.addSubview(SpaceBackground)
		view.addSubview(MarsPic)
		
		NSLayoutConstraint.activate([
			MarsPic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			MarsPic.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			MarsPic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			MarsPic.heightAnchor.constraint(equalToConstant: 250)
		])
		
		MarsPic.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
	}
	
	@objc func handlePanGesture(gesture: UIPanGestureRecognizer){
		if gesture.state == .began {
			
		} else if gesture.state == .changed{
			let translation = gesture.translation(in: self.view)
			MarsPic.transform = CGAffineTransform(translationX: translation.x, y: 0)
		
		
		} else if gesture.state == .ended{
			UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
				self.MarsPic.transform = .identity
			})
		}
	}
	
}

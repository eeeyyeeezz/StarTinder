import UIKit

extension SwipeView{

	@objc func handlePanGesture(recognizer: UIPanGestureRecognizer){
		if recognizer.state == .began {
			
		} else if recognizer.state == .changed {
			let translation = recognizer.translation(in: self.view)
			tiltTheView()
			
			let newX = SpacePic.center.x + translation.x
			let newY = SpacePic.center.y + 0
			
			SpacePic.center = CGPoint(x: newX, y: newY)
			recognizer.setTranslation(CGPoint.zero, in: self.view)
			if SpacePic.center.x - view.center.x > 0 {
				ThumbsPic.image = UIImage(named: "ThumbsUp")
				ThumbsPic.tintColor = .green
				ThumbsPic.alpha = 1
			} else if SpacePic.center.x - view.center.x < 0{
				ThumbsPic.image = UIImage(named: "ThumbsDown")
				ThumbsPic.tintColor = .red
				ThumbsPic.alpha = 1
			}
		} else if recognizer.state == .ended { PicMakeDissapear() }
	}
	
	fileprivate func	tiltTheView(){
		let translationMoved = self.view.center.x - SpacePic.center.x
		let divKoff = (self.view.frame.size.width / 2) / 0.6
		
		SpacePic.transform = CGAffineTransform(rotationAngle: translationMoved / divKoff)
	}
	
	fileprivate func	PicMakeDissapear(){
		var ToReturn: Bool = false
		
		if SpacePic.center.x < 20 {
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.SpacePic.center.x = -self.SpacePic.frame.size.width
				ToReturn = true
			})
		} else if SpacePic.center.x > self.view.frame.size.width - 20 {
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.SpacePic.center.x = self.view.frame.size.width + self.SpacePic.frame.size.width
				ToReturn = true
			})
		}
		
		if !ToReturn{
			SpacePic.transform = CGAffineTransform(rotationAngle: 0)
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.SpacePic.center.x = self.view.center.x
			})
		} else {
			UIView.animate(withDuration: 0, delay: 1, options: [], animations: {
				self.SpacePic.transform = .identity
				self.SpacePic.center = self.view.center
			})
			ParsJSON()
			completionHandler = { NewJSON in
				DispatchQueue.main.async {
					self.loadImage(NewJSON)
				}
			}
		}
		
		ThumbsPic.alpha = 0
	}
	
}

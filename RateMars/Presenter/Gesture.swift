import UIKit

extension SwipeView{

	@objc func handlePanGesture(recognizer: UIPanGestureRecognizer){
		if recognizer.state == .began {
			
		} else if recognizer.state == .changed {
			let translation = recognizer.translation(in: self.view)
			tiltTheView()
			
			let newX = MarsPic.center.x + translation.x
			let newY = MarsPic.center.y + 0
			
			MarsPic.center = CGPoint(x: newX, y: newY)
			recognizer.setTranslation(CGPoint.zero, in: self.view)
			if MarsPic.center.x - view.center.x > 0 {
				ThumbsPic.image = UIImage(named: "ThumbsUp")
				ThumbsPic.tintColor = .green
				ThumbsPic.alpha = 1
			} else if MarsPic.center.x - view.center.x < 0{
				ThumbsPic.image = UIImage(named: "ThumbsDown")
				ThumbsPic.tintColor = .red
				ThumbsPic.alpha = 1
			}
		} else if recognizer.state == .ended { PicMakeDissapear() }
	}
	
	fileprivate func	tiltTheView(){
		let translationMoved = self.view.center.x - MarsPic.center.x
		let divKoff = (self.view.frame.size.width / 2) / 0.6
		
		MarsPic.transform = CGAffineTransform(rotationAngle: translationMoved / divKoff)
	}
	
	fileprivate func	PicMakeDissapear(){
		var ToReturn: Bool = false
		
		if MarsPic.center.x < 20 {
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.MarsPic.center.x = -self.MarsPic.frame.size.width
				ToReturn = true
			})
		} else if MarsPic.center.x > self.view.frame.size.width - 20 {
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.MarsPic.center.x = self.view.frame.size.width + self.MarsPic.frame.size.width
				ToReturn = true
			})
		}
		
		if !ToReturn{
			MarsPic.transform = CGAffineTransform(rotationAngle: 0)
			UIView.animate(withDuration: 0.2, animations: { [unowned self] in
				self.MarsPic.center.x = self.view.center.x
			})
		} else {
			ParsJSON()
			UIView.animate(withDuration: 0, delay: 1, options: [], animations: {
				self.MarsPic.transform = .identity
				self.MarsPic.center = self.view.center
			})
			completionHandler = { NewJSON in
				DispatchQueue.main.async {
					self.loadImage(NewJSON)
				}
			}
		}
		
		ThumbsPic.alpha = 0
	}
	
}

import UIKit

extension SwipeView{

	@objc func handlePanGesture(gesture: UIPanGestureRecognizer){
		let card = gesture.view!
		let point = gesture.translation(in: view)
		let xFromCenter = card.center.x - view.center.x
		
		card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
		
		guard let divisor = self.divisor else { return }
		
		card.transform = CGAffineTransform(rotationAngle: xFromCenter / divisor)
		
		if xFromCenter > 0{
			ThumbsPic.image = UIImage(named: "ThumbsUp")
			ThumbsPic.tintColor = .green
		} else{
			ThumbsPic.image = UIImage(named: "ThumbsDown")
			ThumbsPic.tintColor = .red
		}
		
		ThumbsPic.alpha = abs(xFromCenter) / view.center.x
		
		if gesture.state == .ended{
			
			if card.center.x < 75 {
				UIView.animate(withDuration: 0.3, animations: {
					card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 50)
					card.alpha = 0
				})
				return
			} else if card.center.x > (view.frame.width - 75){
				UIView.animate(withDuration: 0.3, animations: {
					card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 50)
					card.alpha = 0
				})
				return
			}
			
			
			
			UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
				card.center = self.view.center
				self.ThumbsPic.alpha = 0
			})
		}
	}

}

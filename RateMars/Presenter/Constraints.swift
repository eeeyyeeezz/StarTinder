import UIKit

extension SwipeView{
	
	func SetConstraints(){
		let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
										 style: .plain,
										 target: self,
										 action: nil)
		navigationItem.rightBarButtonItem = menuButton
		navigationController!.navigationItem.rightBarButtonItem = menuButton
		navigationController!.navigationItem.rightBarButtonItem?.tintColor = .white
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.view.backgroundColor = .clear
		
		view.addSubview(SpaceBackground)
		view.addSubview(MarsPic)
		MarsPic.addSubview(ThumbsPic)
 
		NSLayoutConstraint.activate([
			MarsPic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			MarsPic.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			MarsPic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			MarsPic.heightAnchor.constraint(equalToConstant: 250)
		])
		
		NSLayoutConstraint.activate([
			ThumbsPic.centerXAnchor.constraint(equalTo: MarsPic.centerXAnchor),
			ThumbsPic.centerYAnchor.constraint(equalTo: MarsPic.centerYAnchor),
			ThumbsPic.trailingAnchor.constraint(equalTo: MarsPic.trailingAnchor, constant: -50),
			ThumbsPic.heightAnchor.constraint(equalToConstant: 100)
		])
		
		MarsPic.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
	}
}

import UIKit

extension SwipeView{
	
	func SetConstraints(){
		let menuButton = UIBarButtonItem(image: UIImage(systemName: "list.dash"),
										 style: .plain,
										 target: self,
										 action: #selector(GoToSavedDataView))
		navigationItem.rightBarButtonItem = menuButton
		navigationController!.navigationItem.rightBarButtonItem = menuButton
		navigationController!.navigationItem.rightBarButtonItem?.tintColor = .white
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		navigationController?.view.backgroundColor = .clear
		
		SpaceBackground.addSubview(RateLabel)
		view.addSubview(SpaceBackground)
		view.addSubview(SpacePic)
		SpacePic.addSubview(ThumbsPic)
 
		NSLayoutConstraint.activate([
			SpacePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			SpacePic.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			SpacePic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			SpacePic.heightAnchor.constraint(equalToConstant: 250)
		])
		
		NSLayoutConstraint.activate([
			RateLabel.bottomAnchor.constraint(equalTo: SpacePic.topAnchor, constant: -20),
			RateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			RateLabel.widthAnchor.constraint(equalToConstant: 700),
			RateLabel.heightAnchor.constraint(equalToConstant: 100)
		])
		
		NSLayoutConstraint.activate([
			ThumbsPic.centerXAnchor.constraint(equalTo: SpacePic.centerXAnchor),
			ThumbsPic.centerYAnchor.constraint(equalTo: SpacePic.centerYAnchor),
			ThumbsPic.trailingAnchor.constraint(equalTo: SpacePic.trailingAnchor, constant: -50),
			ThumbsPic.heightAnchor.constraint(equalToConstant: 100)
		])
		
		SpacePic.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
	}
	
	@objc func GoToSavedDataView() { navigationController?.pushViewController(SavedDataView(), animated: true) }
}

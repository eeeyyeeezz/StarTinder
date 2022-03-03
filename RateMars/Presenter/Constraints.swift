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
		
		view.addSubview(SpaceBackground)
		SpaceBackground.addSubview(RateLabel)
		SpaceBackground.addSubview(TransparentView)
		view.addSubview(SpacePic)
		SpacePic.addSubview(ThumbsPic)
 
		NSLayoutConstraint.activate([
			TransparentView.centerXAnchor.constraint(equalTo: SpaceBackground.centerXAnchor),
			TransparentView.centerYAnchor.constraint(equalTo: SpaceBackground.centerYAnchor),
			TransparentView.trailingAnchor.constraint(equalTo: SpaceBackground.trailingAnchor, constant: -25),
			TransparentView.heightAnchor.constraint(equalToConstant: 450)
		])
		
		NSLayoutConstraint.activate([
			SpacePic.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			SpacePic.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			SpacePic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			SpacePic.heightAnchor.constraint(equalToConstant: 250)
		])
		
		NSLayoutConstraint.activate([
			RateLabel.topAnchor.constraint(equalTo: TransparentView.topAnchor, constant: 0),
			RateLabel.leadingAnchor.constraint(equalTo: TransparentView.leadingAnchor, constant: 5),
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

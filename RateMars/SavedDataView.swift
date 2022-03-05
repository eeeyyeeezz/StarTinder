import UIKit

class SavedDataView: UIViewController {

	var savedImagesCV: [Pictures]?
	var SavedDataCV = SavedDataCollectionView()
	
	let SpaceBackground: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "SpaceBackgroundTwo")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFill
		image.isUserInteractionEnabled = true
		return image
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		print(savedImagesCV?.count)
		SetConstraints()
	}
}

extension SavedDataView{
	
	func SetConstraints(){
		view.addSubview(SpaceBackground)
		SavedDataCV.savedImagesCV = savedImagesCV
		view.addSubview(SavedDataCV)
		
		NSLayoutConstraint.activate([
			SavedDataCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			SavedDataCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			SavedDataCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			SavedDataCV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
		])
	}
	
}

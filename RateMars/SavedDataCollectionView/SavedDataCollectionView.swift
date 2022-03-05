import UIKit

class SavedDataCollectionView: UICollectionView {

	var savedImagesCV: [Pictures]?
	
	init(){
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		super.init(frame: .zero, collectionViewLayout: layout)
		backgroundColor = UIColor.white.withAlphaComponent(0.3)
		delegate = self
		dataSource = self
		isScrollEnabled = true
		register(SavedDataCollectionViewCell.self, forCellWithReuseIdentifier: SavedDataCollectionViewCell.identifier)
		translatesAutoresizingMaskIntoConstraints = false
	}
		
	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
	
}

extension SavedDataCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		guard let savedDataImagesCV = self.savedImagesCV else { return 1 }
		return savedDataImagesCV.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = dequeueReusableCell(withReuseIdentifier: SavedDataCollectionViewCell.identifier, for: indexPath) as! SavedDataCollectionViewCell
		setImage(indexPath: indexPath.row, profileImage: cell.profileImage)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 150, height: 150)
	}
	
	private func setImage(indexPath: Int, profileImage: UIImageView){
		guard let savedImagesCV = self.savedImagesCV else { print("savedImagesCV error") ; return }
		let task = savedImagesCV[indexPath]
		guard let userURL = task.pic else { profileImage.image = nil ; self.isScrollEnabled = false; return }
		
		guard let url = URL(string: userURL) else { print("UrlImageFromJson to Url Error") ; return }
		
		DispatchQueue.global().async {
			guard let data = try? Data(contentsOf: url) else { return }
			DispatchQueue.main.async { profileImage.image = UIImage(data: data) }
		}
	}
	
}

import UIKit

class SavedDataCollectionViewCell: UICollectionViewCell {

	static let identifier = "SavedDataCollectionViewCell"

	var profileImage: UIImageView = {
		let image = UIImageView()
		image.contentMode = .scaleToFill
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .orange
		addSubview(profileImage)
		NSLayoutConstraint.activate([
			profileImage.widthAnchor.constraint(equalToConstant: 150),
			profileImage.heightAnchor.constraint(equalToConstant: 150)
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

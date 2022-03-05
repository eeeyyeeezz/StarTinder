import UIKit
import CoreData

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
		self.title = "Liked Pictures"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deletePictures))
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
		guard let savedImagesCV = self.savedImagesCV else { print("savedImagesCV in SavedDataView Error") ; return }
		
		if savedImagesCV.isEmpty{
			navigationItem.rightBarButtonItem?.isEnabled = false
		} else { navigationItem.rightBarButtonItem?.isEnabled = true }
		view.backgroundColor = .white
		SetConstraints()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let context = appDelegate.persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<Pictures> = Pictures.fetchRequest()
		
		do {
			savedImagesCV = try context.fetch(fetchRequest)
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
	}
	
}

extension SavedDataView{
	
	func SetConstraints(){
		view.addSubview(SpaceBackground)
		SavedDataCV.savedImagesCV = self.savedImagesCV
		view.addSubview(SavedDataCV)
		
		NSLayoutConstraint.activate([
			SavedDataCV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
			SavedDataCV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			SavedDataCV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			SavedDataCV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
		])
	}
	
	@objc func deletePictures(){
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let context = appDelegate.persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<Pictures> = Pictures.fetchRequest()
		navigationItem.rightBarButtonItem?.isEnabled = false
		
		if let profiles = try? context.fetch(fetchRequest){
			for profile in profiles{
				context.delete(profile)
			}
		}
		
		do {
			try context.save()
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
		SavedDataCV.reloadData()
	}
	
}

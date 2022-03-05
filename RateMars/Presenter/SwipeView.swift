// 4dNe0pRXtdbZOx172AwqWBMyBZpm3ofZCZmVefmn

import UIKit
import CoreData

class SwipeView: UIViewController {

	let SpaceBackground: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "SpaceBackground")
		image.frame = UIScreen.main.bounds
		image.backgroundColor = .black
		image.contentMode = .scaleAspectFill
		image.isUserInteractionEnabled = true
		return image
	}()
	
	let TransparentView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.white.withAlphaComponent(0.3)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	let RateLabel: UILabel = {
		let label = UILabel()
		label.text = "Rate NASA Pic of the Day!"
		label.font = label.font.withSize(30)
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()	
	
	let SpacePic: UIImageView = {
		let image = UIImageView()
		image.isUserInteractionEnabled = true
		image.image = UIImage(named: "SpaceBackground")
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	let ThumbsPic: UIImageView = {
		let image = UIImageView()
		image.isUserInteractionEnabled = true
		image.alpha = 0
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()
	
	var linkToSave: String?
	var divisor: CGFloat?
	var completionHandler: ((NasaJSON) -> ())?
	var savedImages: [Pictures]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		ParsJSON()
		SetConstraints()
		completionHandler = { NewJSON in
			DispatchQueue.main.async {
				self.loadImage(NewJSON)
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let context = appDelegate.persistentContainer.viewContext
		let fetchRequest: NSFetchRequest<Pictures> = Pictures.fetchRequest()
		
		do {
			savedImages = try context.fetch(fetchRequest)
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
	}
}

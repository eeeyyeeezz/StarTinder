import UIKit
import CoreData

extension SwipeView{
	
	func saveToCoreData(imageToSave: String){
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let context = appDelegate.persistentContainer.viewContext
		
		guard let entity = NSEntityDescription.entity(forEntityName: "Pictures", in: context) else { return }
		let taskObject = Pictures(entity: entity, insertInto: context)
		taskObject.pic = imageToSave
		
		do {
			try context.save()
			savedImages?.append(taskObject)
		} catch let error as NSError {
			print(error.localizedDescription)
		}
	}	
	
}

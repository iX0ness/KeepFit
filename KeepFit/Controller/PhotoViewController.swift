//
//  PhotoViewController.swift
//  KeepFit
//
//  Created by Levchuk Misha on 16.10.2018.
//  Copyright © 2018 Levchuk Misha. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private struct Constants {
        static let backgoundImage = "bg.png"
        static let shadowImage = "draws.png"
        static let probeIdentifier = "makeProbe"
    }

    @IBOutlet weak var backgroundImageView: UIImageView!


    var exerciseName: String?
    var excercisePhoto: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print(exerciseName)

        
    }

    func setupUI() {
        backgroundImageView.image = UIImage(named: Constants.backgoundImage)
        view.backgroundColor = UIColor(patternImage: UIImage(named: Constants.backgoundImage)!)

    }


    @IBAction func chooseImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo library", style: .default, handler: { (action) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)


        guard let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage else {
            print("No image found")
            return
        }
        excercisePhoto = image
        picker.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: Constants.probeIdentifier, sender: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.probeIdentifier {
            let destinationVC = segue.destination as? ExerciseProbeViewController
            destinationVC?.probePhoto = excercisePhoto
            destinationVC?.exerciseName = exerciseName
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}

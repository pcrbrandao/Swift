/*
 * Copyright (c) 2016-present Razeware LLC
 */

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var itemAdd: UIBarButtonItem!
    
    // MARK: Exercise properties
    private let bag = DisposeBag()
    private let images = Variable<[UIImage]>([])
    
    // MARK: UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        images.asObservable()
            .subscribe(onNext: { [weak self] photos in
                guard let preview = self?.imagePreview else { return }
                preview.image = UIImage.collage(images: photos, size: preview.frame.size)
            })
        .disposed(by: bag)
        
        images.asObservable()
            .subscribe(onNext: { [weak self] photos in
                self?.updateUI(photos: photos)
            })
            .disposed(by: bag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photosViewController = segue.destination as? PhotosViewController {
            photosViewController.selectedPhotos
                .subscribe(
                    onNext: { [weak self] newImage in
                        guard let images = self?.images else { return }
                        images.value.append(newImage)
                    },
                    onDisposed: {
                        print("completed photo selection")
                })
                .disposed(by: bag)
        }
    }
    
    // MARK: Custom exercise
    private func updateUI(photos: [UIImage]) {
        buttonSave.isEnabled = photos.count > 0 && photos.count % 2 == 0
        buttonClear.isEnabled = photos.count > 0
        itemAdd.isEnabled = photos.count < 6
        title = photos.count > 0 ? "\(photos.count) photo(s)" : "Collage"
    }
    
    // MARK: Actions
    @IBAction func actionClear() {
        images.value = []
    }
    
    @IBAction func actionSave() {
        guard let image = imagePreview.image else { return }
        
        PhotoWriter.save(image)
            .asSingle()
            .subscribe(
                onSuccess: { [weak self] id in
                    self?.showMessage("Saved with id: \(id)")
                    self?.actionClear()
                },
                onError: { [weak self] error in
                    self?.showMessage("Error", description: error.localizedDescription)
            })
            .disposed(by: bag)
    }
    
    @IBAction func actionAdd() {
        // images.value.append(UIImage(named:"IMG_1907.jpg")!)
        self.performSegue(withIdentifier: "segueAdd", sender: nil)
    }
    
    // MARK: Custom starter
    func showMessage(_ title: String, description: String? = nil) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { [weak self] _ in self?.dismiss(animated: true, completion: nil)}))
        present(alert, animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  splokhmatikovPW4
//
//  Created by Сергей Лохматиков on 30.10.2021.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var notesCollectionView: UICollectionView!
    @IBOutlet weak var emptyCollectionLabel: UILabel!
    var notes: [Note] = [] {
        didSet {
            emptyCollectionLabel.isHidden = notes.count != 0
            notesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action:
                                #selector(createNote(sender:)))
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                        "NoteCell", for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.description
        return cell
    }
    @objc func createNote(sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier:
                                                                "NoteViewController") as? NoteViewController else { return }
        vc.outputVC = self
        navigationController?.pushViewController(vc, animated: true)
    }

}

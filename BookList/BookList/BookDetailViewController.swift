//
//  BookDetailViewController.swift
//  BookList
//
//  Created by user223323 on 11/1/22.
//

import UIKit

class BookDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var book : Book?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var notesView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        notesView.text = book?.notes
        notesView.numberOfLines = 0
        if let url = URL(string: book!.coverImageURL),
           let data = try? Data(contentsOf: url){
            imageView.image = UIImage(data: data)
        }
}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let bookArray = [book?.title as Any, book?.author as Any, book?.ISBN as Any, book?.rating ?? 0, book?.notes as Any] as [Any]
        return bookArray.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookArray = [book?.title as Any, book?.author as Any, book?.ISBN as Any, book?.rating as Any, book?.notes as Any]
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        cell.textLabel?.text = (bookArray[indexPath.row]) as? String
        return cell
    }

        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
}

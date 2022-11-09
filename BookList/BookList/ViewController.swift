//
//  ViewController.swift
//  BookList
//
//  Created by user223323 on 11/1/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        Book(title: "Slaughterhouse Five", ISBN: "0224618016", author: "Kurt Vonnegut", coverImageURL: "https://images.amazon.com/images/P/0385333846.jpg", rating: "5", notes: "This book is half sci-fi adventure, half heart-breaking memoir about time spent in a WWII death camp. It contains levity in even its darkest moments, Vonnegut's trademark"),
        Book(title: "My Year of Rest and Relaxation", ISBN: "0525522131", author:"Otessa Moshfegh", coverImageURL: "https://images.amazon.com/images/P/0525522131", rating: "3", notes: "This book is intentional in its slow, meandering pace. It tells a tale about grief, and the strange and surreal forms it can take. But it loses its intentionality in the latter half."),
        Book(title: "Little Fires Everywhere", ISBN: "0735224315", author:"Celeste Ng" , coverImageURL: "https://images.amazon.com/images/P/0735224315", rating: "4", notes: nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        let book = books[indexPath.row]
        cell.textLabel?.text = books[indexPath.row].title
        if let url = URL(string: book.coverImageURL), let data = try? Data(contentsOf: url) {
            cell.imageView?.image = UIImage(data: data)
        }

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bookDetailViewController = segue.destination as? BookDetailViewController,
           let index = tableView.indexPathForSelectedRow?.row {
            bookDetailViewController.book = books[index]
        }
    }
    
}

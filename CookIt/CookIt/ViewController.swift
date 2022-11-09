//
//  ViewController.swift
//  CookIt
//
//  Created by user223323 on 11/1/22.
//

import UIKit

// We've added the UITableViewDelegate and UITableViewDataSource prototypes
// This means our ViewController class needs to conform to these prototypes
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    
    

 // Dummy data
    let recipes = [
     Recipe(title: "Best Brownies", steps: ["step1", "step2"], imageURL:
    "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
     Recipe(title: "Banana Bread", steps: ["step1", "step2"], imageURL:
    "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg"),
     Recipe(title: "Chocolate Chip Cookies", steps: ["step1", "step2"], imageURL:
    "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // We are telling the tableView that our ViewController will act as its delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self
    }

    // required method to conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We are setting the number of
        return recipes.count
    }

    // required method to conform to UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for:indexPath)
        let recipe = recipes[indexPath.row] // the selected row
        // get image from url
        // we are retrieving the image synchronously for simplicity; bad practice
        if let url = URL(string: recipe.imageURL), let data = try? Data(contentsOf: url) {
        // make sure image exists, otherwise unwrap in a if let check / try-catch
         cell.imageView?.image = UIImage(data: data)
        }
        // We set the cell's text label to be our recipe string for that index
        cell.textLabel?.text = recipes[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let recipeDetailViewController = segue.destination as?
    RecipeDetailViewController,
     let index = tableView.indexPathForSelectedRow?.row {
     recipeDetailViewController.recipe = recipes[index]
     }
    }}

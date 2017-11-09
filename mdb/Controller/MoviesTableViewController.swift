//
//  MoviesTableViewController.swift
//  mdb
//
//  Created by Timar Cristian on 04/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit

class MoviesTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet var goToHomeButton: UIBarButtonItem!
    
    var isSearching = false
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 10, vertical: 20), for: UIBarMetrics.default)
        //MoviesTableViewCell.estimatedRowHeight = 100
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        let id = indexPath.row
        let data = NSData(contentsOf: NSURL(string: movies[id].poster)! as URL)
        cell.titleCell.text = movies[id].title
        cell.descCell.text = movies[id].desc
        cell.posterCell.image = UIImage(data: data! as Data)
        tableView.rowHeight = 90
        return cell
    }

    //method for when is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        self.performSegue(withIdentifier: "goToMovieDetail", sender: indexPath)
        //performSegue(withIdentifier: "dute_la_detali", sender: indexPath)
        
    }
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "goToMovieDetail" {
            let detailVC = segue.destination as! MovieDetailViewController
            let selectedIndexPath = sender as! NSIndexPath
            let index = selectedIndexPath.row
            detailVC.movies = movies
            detailVC.id = index
            
        }
    }
    
    @IBAction func goToHomeTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHomeML", sender: self)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

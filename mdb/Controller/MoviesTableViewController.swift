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
    
    var isSearching = false
    var movs = [Movie]()
        override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        print("path: " + filePath)
        print("count: " + String(movs.count))
        
        //movs.remove(at: 0)
       // NSKeyedArchiver.archiveRootObject(movs, toFile: filePath)
        
        navigationItem.rightBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 10, vertical: 20), for: UIBarMetrics.default)
        //MoviesTableViewCell.estimatedRowHeight = 100
        // Do any additional setup after loading the view.
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MoviesTableViewCell
        let id = indexPath.row
        let data = NSData(contentsOf: NSURL(string: movs[id].Poster)! as URL)
        cell.titleCell.text = movs[id].Title
        cell.descCell.text = movs[id].Desc
        cell.posterCell.image = UIImage(data: data! as Data)
        tableView.rowHeight = 90
        return cell
    }

    //method for when is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        let index = tableView.indexPathForSelectedRow!.row
        
        self.performSegue(withIdentifier: "goToMovieDetail", sender: index)
        //performSegue(withIdentifier: "dute_la_detali", sender: indexPath)
        
    }
    // This function is called before the segue
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "goToMovieDetail" {
            let detailVC = segue.destination as! MovieDetailViewController
            let selectedIndexPath = sender as! NSIndexPath
            let index = selectedIndexPath.row
            detailVC.movies = movies
            detailVC.id = index
            
        }
    }*/
    
    /*@IBAction func goToAddMovie(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAddMovie", sender: self)
    }*/

    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    private func saveData(car: Movie) {
        movs.append(car)
        NSKeyedArchiver.archiveRootObject(movs, toFile: filePath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "goToAddMovie" {
            
        }
        if segue.identifier == "goToAddMovie" {
            let destionation = segue.destination as! MovieDetailViewController
            
        }*/
        if let destination = segue.destination as? MovieDetailViewController {
            if let index = sender as? Int {
                destination.index = index
                destination.movs = movs
                destination.path = filePath
            }
            
        }
        else if let destination = segue.destination as? AddViewController {
            //let destination = segue.destination as! AddViewController
            destination.movs = movs
            destination.path = filePath
            
        }
        if segue.identifier == "goToAddMovie" {
            let destination = segue.destination as! MovieDetailViewController
            destination.movs = movs
            destination.path = filePath
            
        }
        
    }
    private func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Movie] {
            movs = ourData
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        loadData()
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        //self.tableView.reloadData()
    }
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

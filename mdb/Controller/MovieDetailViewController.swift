//
//  MovieDetailViewController.swift
//  mdb
//
//  Created by Timar Cristian on 04/11/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit
class MovieDetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var GoBack: UIButton!
    
    @IBOutlet var titleText: UITextField!
    
    @IBOutlet var descText: UITextField!
    @IBOutlet var updateButton: UIButton!
    
    var movs  = [Movie]()
    var path = ""
    var index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.titleText.text = movs[index].Title
        self.descText.text = movs[index].Desc
        self.titleText.delegate = self
        self.descText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillAppear(animated)
    }

    @IBAction func GoBackTapped(_ sender: UIButton) {
        //self.performSegue(withIdentifier: "goBackToMovies", sender: self)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func updateTapped(_ sender: UIButton) {
        if self.titleText.text != ""{
            movs[index].Title = self.titleText.text!
        }
        if self.descText.text != ""{
            movs[index].Desc = self.descText.text!
        }
        NSKeyedArchiver.archiveRootObject(movs, toFile: path)
        //self.performSegue(withIdentifier: "goBackToMovies", sender: self)
        // go back to the previous view controller
         
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        if segue.identifier == "goBackToMovies" {
            let moviesVC = segue.destination as! MoviesTableViewController
            moviesVC.movies = movies
        }
    }*/
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func RemoveButton(_ sender: Any) {
        movs.remove(at: index)
        NSKeyedArchiver.archiveRootObject(movs, toFile: path)
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

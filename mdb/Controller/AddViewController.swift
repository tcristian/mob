//
//  AddViewController.swift
//  mdb
//
//  Created by Timar Cristian on 04/12/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    var movs  = [Movie]()
    var path = ""
    var index = 0
    let picker = UIPickerView()
    
    @IBOutlet var movie_title: UITextField!
    @IBOutlet var movie_poster: UITextField!
    @IBOutlet var movie_desc: UITextField!
    @IBOutlet var movie_year: UITextField!
    
    var years = ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(path)
        picker.delegate = self
        picker.dataSource = self
        movie_year.inputView = picker
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func addButton(_ sender: UIButton) {
        // && is_int(string: movie_year.text!)
        if(movie_title.text != "" && movie_poster.text != "" && movie_year.text != "" && movie_desc.text != ""){
            let new_movie = Movie(title: movie_title.text!, poster: movie_poster.text!, year: movie_year.text!, desc: movie_desc.text!, type: "Movie")
            movs.append(new_movie!)
            NSKeyedArchiver.archiveRootObject(movs, toFile: path)
        
            let alert = UIAlertController(title: "Succes!", message: "Movie added with succes!", preferredStyle: UIAlertControllerStyle.alert)
        
            let close = UIAlertAction(title: "Close", style: .default, handler: nil)
        
            self.present(alert, animated: true, completion: nil)
            alert.addAction(close)
            print(movs.count)
            movie_title.text = ""
            movie_poster.text = ""
            movie_year.text = ""
            movie_desc.text = ""
        }
    }
    func is_int(string: String) -> Bool {
        return Int(string) != nil
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        movie_year.text = years[row];
        self.view.endEditing(false)
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

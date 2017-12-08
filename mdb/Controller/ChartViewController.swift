//
//  ChartViewController.swift
//  mdb
//
//  Created by Timar Cristian on 04/12/2017.
//  Copyright © 2017 Timar Cristian. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {

    
    @IBOutlet var lineChartView: LineChartView!
    
    @IBAction func goBackTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    var movs = [Movie]()
    let years = [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        self.lineChartView.delegate = self
        self.lineChartView.gridBackgroundColor = UIColor.darkGray
        self.lineChartView.noDataText = "No data provided"
        setChartData(years: years)
    }
    func setChartData(years : [Int]) {
        // 1 - creating an array of data entries
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for i in 0...7 {
            yVals1.append(ChartDataEntry(x: Double(years[i]), y: Double(count_year(year: years[i]))))
        }
        
        // 2 - create a data set with our array
        let set1: LineChartDataSet = LineChartDataSet(values: yVals1, label: "Movies")
        set1.axisDependency = .left // Line will correlate with left axis values
        set1.setColor(UIColor.red.withAlphaComponent(0.5)) // our line's opacity is 50%
        set1.setCircleColor(UIColor.red) // our circle will be dark red
        set1.lineWidth = 2.0
        set1.circleRadius = 6.0 // the radius of the node circle
        set1.fillAlpha = 65 / 255.0
        set1.fillColor = UIColor.red
        set1.highlightColor = UIColor.white
        set1.drawCircleHoleEnabled = true
        
        //3 - create an array to store our LineChartDataSets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set1)
        
        //4 - pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(dataSets: dataSets)
        data.setValueTextColor(UIColor.white)
        
        //5 - finally set our data
        self.lineChartView.data = data
    }
    func count_year(year: Int) -> Int{
        let result = movs.filter { $0.Year == String(year)}
        return (result.count)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    private func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Movie] {
            movs = ourData
        }
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

//
//  ViewController.swift
//  sınav
//
//  Created by Lutfu on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {
    private var weatherDataSource = WeatherDataSource()
    
    @IBOutlet weak var weathersList: UICollectionView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        weatherDataSource.delegate = self
        weatherDataSource.getListOfWeather()
        weatherDataSource.getNumberOfWeather()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let cell = sender as! WeatherCollectionViewCell
          if let indexPath = self.weathersList.indexPath(for: cell) {
              let weather = weatherDataSource.getWeather(for: indexPath.row)
              let detailViewController = segue.destination as! DetailViewController
              if let weatherId = weather.number as String?{
                  detailViewController.weatherId = weatherId
              }
              else{
              }
              
              
          }
      }



}

extension ViewController : WeatherDataDelegate {
    
    
    func weatherListLoaded() {
        self.weathersList.reloadData()
    }
    
    
}



extension ViewController: UICollectionViewDataSource {
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}


func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return weatherDataSource.getNumberOfWeather()
}


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCollectionViewCell
    else  {
        
        return UICollectionViewCell()
    }
  
    let weather_data = weatherDataSource.getWeather(for: indexPath.row)
    cell.nameLabel.text = weather_data.location
    cell.locationLabel.text = weather_data.number
        return cell
        
        
    }
   //
    
    
    
}

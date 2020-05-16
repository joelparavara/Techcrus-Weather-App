//
//  MainViewController.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/9/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//


// Techcrus Weather App is a part of Joel Thomsons Portfolio where the data aquired is passed to and from the Techcrus database

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    var temp = "32"
    
    var weatherManager = WeatherManager()
    
    let bgView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "sun.max")
        view.tintColor = .black
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gpsBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        //btn.setTitle("G", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action:#selector(GPSClicked), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let searchBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        //btn.setTitle("S", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action:#selector(SearchClicked), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let searchField : UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search"
        tf.alpha = 0.7
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 12
        tf.layer.masksToBounds = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let ClabelView : UILabel = {
        let label = UILabel()
        label.text = "C"
        label.font = UIFont.systemFont(ofSize: 90)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let degreeView : UILabel = {
        let label = UILabel()
        label.text = "°"
        label.font = UIFont.systemFont(ofSize:80)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let TempView : UILabel = {
        let label = UILabel()
        label.text = "32"
        label.font = UIFont.systemFont(ofSize: 100, weight: .black)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let LocationLabel : UILabel = {
        let label = UILabel()
        label.text = "Ernakulam"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        searchField.delegate = self
        
    }
    
    @objc func GPSClicked() {
        searchField.endEditing(true)
    }
    
    @objc func SearchClicked() {
        searchField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Search for a location"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchField.text = ""
    }
    
    func addSubviews() {
        view.addSubview(bgView)
        setupBgView()
        
        view.addSubview(gpsBtn)
        SetupGpsBtn()
        
        view.addSubview(searchBtn)
        SetupSearchBtn()
        
        view.addSubview(searchField)
        setupSearchField()
        
        view.addSubview(imageView)
        setupImageView()
        
        view.addSubview(ClabelView)
        setupClabelView()
        
        view.addSubview(degreeView)
        setupDegreeView()
        
        view.addSubview(TempView)
        setupTempView()
        
        view.addSubview(LocationLabel)
        setupLocationLabel()
        
        updateScreen()
    }
    
    func updateScreen() {
        TempView.text = temp
    }
    

    func setupBgView() {
        bgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bgView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bgView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bgView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func SetupGpsBtn() {
        gpsBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        //gpsBtn.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        gpsBtn.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        gpsBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
        gpsBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func SetupSearchBtn() {
        searchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        searchBtn.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        searchBtn.heightAnchor.constraint(equalToConstant: 30).isActive = true
        searchBtn.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupSearchField() {
        searchField.leadingAnchor.constraint(equalTo: gpsBtn.trailingAnchor, constant: 10).isActive = true
        searchField.trailingAnchor.constraint(equalTo: searchBtn.leadingAnchor, constant: -10).isActive = true
        searchField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupImageView() {
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        imageView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupClabelView() {
        ClabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0).isActive = true
        ClabelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        ClabelView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        ClabelView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func setupDegreeView() {
        degreeView.trailingAnchor.constraint(equalTo: ClabelView.leadingAnchor, constant: -0).isActive = true
        degreeView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        degreeView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        degreeView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupTempView() {
        TempView.trailingAnchor.constraint(equalTo: degreeView.leadingAnchor, constant: -0).isActive = true
        TempView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        TempView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        TempView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setupLocationLabel() {
        LocationLabel.trailingAnchor.constraint(equalTo: ClabelView.trailingAnchor, constant: -20).isActive = true
        LocationLabel.topAnchor.constraint(equalTo: ClabelView.bottomAnchor, constant: 0).isActive = true
        LocationLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        LocationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
        
    
}

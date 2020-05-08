//
//  MainViewController.swift
//  Techcrus Weather App
//
//  Created by Joel Thomson on 5/9/20.
//  Copyright © 2020 Techcrus Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let bgView : UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gpsBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitle("B", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action:#selector(GPSClicked), for: .touchUpInside)
        btn.isUserInteractionEnabled = true
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let searchBtn : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .white
        btn.setTitle("S", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
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
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 10
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bgView)
        setupBgView()
        
        view.addSubview(gpsBtn)
        SetupGpsBtn()
        
        view.addSubview(searchBtn)
        SetupSearchBtn()
        
        view.addSubview(searchField)
        setupSearchField()
        
    }
    
    @objc func GPSClicked() {
        print("GPS Pressed")
    }
    
    @objc func SearchClicked() {
        print("Search Pressed")
    }
    
    func setupBgView() {
        bgView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bgView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bgView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bgView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }

    func SetupGpsBtn() {
        gpsBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        //gpsBtn.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        gpsBtn.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        gpsBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        gpsBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func SetupSearchBtn() {
        searchBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        searchBtn.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        searchBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //searchBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupSearchField() {
        searchField.leadingAnchor.constraint(equalTo: gpsBtn.trailingAnchor, constant: 10).isActive = true
        searchField.trailingAnchor.constraint(equalTo: searchBtn.leadingAnchor, constant: -10).isActive = true
        searchField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //searchField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
}

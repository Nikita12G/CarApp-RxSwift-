//
//  CarModel.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 04.02.2022.
//
import RxSwift
import RxCocoa

struct Cars {
    let brand: String
    let icon: UIImage
    
    init(brand: String, icon: UIImage) {
        self.brand = brand
        self.icon = icon
    }
}


let items = BehaviorRelay.init(value:[
    Cars(brand: "Acura", icon: UIImage(named: "Acura")!),
    Cars(brand: "Alfa", icon: UIImage(named: "Alfa")!),
    Cars(brand: "BMW", icon: UIImage(named: "BMW")!),
    Cars(brand: "Cadillac", icon: UIImage(named: "Cadillac")!),
    Cars(brand: "Fiat", icon: UIImage(named: "Fiat")!),
    Cars(brand: "GMC", icon: UIImage(named: "GMC")!),
    Cars(brand: "Hyundai", icon: UIImage(named: "Hyundai")!),
    Cars(brand: "Nissan", icon: UIImage(named: "Nissan")!),
    Cars(brand: "Tesla", icon: UIImage(named: "Tesla")!),
    Cars(brand: "Volkswagen", icon: UIImage(named: "Volkswagen")!)
])

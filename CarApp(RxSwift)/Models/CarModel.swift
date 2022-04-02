//
//  CarModel.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 04.02.2022.
//
import RxSwift
import RxCocoa
import RxDataSources

struct Cars {
    let brand: String
    let icon: UIImage
    
    init(brand: String, icon: UIImage) {
        self.brand = brand
        self.icon = icon
    }
}

struct SectionModel {
    let header: String
    var items: [Cars]
}

extension SectionModel: SectionModelType {
    init(original: SectionModel, items: [Cars]) {
        self = original
        self.items = items
    }
}

let items = BehaviorRelay.init(value:[
    SectionModel.init(header: "A", items: [
        Cars(brand: "Acura", icon: UIImage(named: "Acura")!),
        Cars(brand: "Alfa", icon: UIImage(named: "Alfa")!),
    ]),
    SectionModel.init(header: "B", items: [
        Cars(brand: "BMW", icon: UIImage(named: "BMW")!),
    ]),
    SectionModel.init(header: "C", items: [
        Cars(brand: "Cadillac", icon: UIImage(named: "Cadillac")!),
    ]),
    SectionModel.init(header: "F", items: [
        Cars(brand: "Fiat", icon: UIImage(named: "Fiat")!),
    ]),
    SectionModel.init(header: "G", items: [
        Cars(brand: "GMC", icon: UIImage(named: "GMC")!),
    ]),
    SectionModel.init(header: "H", items: [
        Cars(brand: "Hyundai", icon: UIImage(named: "Hyundai")!),
    ]),
    SectionModel.init(header: "N", items: [
        Cars(brand: "Nissan", icon: UIImage(named: "Nissan")!),
    ]),
    SectionModel.init(header: "T", items: [
        Cars(brand: "Tesla", icon: UIImage(named: "Tesla")!),
    ]),
    SectionModel.init(header: "V", items: [
        Cars(brand: "Volkswagen", icon: UIImage(named: "Volkswagen")!)
    ]),
])

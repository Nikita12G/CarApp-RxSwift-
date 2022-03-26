//
//  CarCompanyViewController.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 04.02.2022.
//

import UIKit
import RxSwift

class CarCompanyViewController: UIViewController {
    
    private let carsModel = items
    private let bag = DisposeBag()
    private let selectedCompanyViewController = SelectedCompanyViewController()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        configureTable()
        transitionFromСell()
        title = "Car Company"
    }
    
    private func configureTable() {
        // Bind table
        carsModel.bind(
            to:
                tableView.rx.items(
                    cellIdentifier: "cell",
                    cellType: UITableViewCell.self)) { tv, item, cell in
                        cell.textLabel?.text = item.brand
                        cell.imageView?.image = item.icon
                    }.disposed(by: bag)
        
        // Handle selection
        tableView.rx.modelSelected(Cars.self).bind { selectedItem in
            print("Selected car company \(selectedItem.brand) ")
        }.disposed(by: bag)
    }
    
    private func transitionFromСell() {
        tableView
            .rx
            .modelSelected(Cars.self)
            .subscribe(onNext: { carsObject in
                self.selectedCompanyViewController.imageName.accept(carsObject.brand)
                self.navigationController?.pushViewController(self.selectedCompanyViewController, animated: true)
            }).disposed(by: bag)
    }
    
}


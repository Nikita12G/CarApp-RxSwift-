//
//  CarCompanyViewController.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 04.02.2022.
//

import UIKit
import RxSwift
import RxDataSources

class CarCompanyViewController: UIViewController {
    
    private let carsModel = items
    private let bag = DisposeBag()
    private let selectedCompanyViewController = SelectedCompanyViewController()
    
    private let dataSources = RxTableViewSectionedReloadDataSource<SectionModel>(configureCell: {
        ds, tv, ip, items in
        let cell: CarCompanyTableViewCell = tv.dequeueReusableCell(withIdentifier: CarCompanyTableViewCell.reuseIdentifier, for: ip) as! CarCompanyTableViewCell
        cell.carsLabel.text = items.brand
        cell.cellCarImageView.image = items.icon
        return cell
    },
                                                                                 
    titleForFooterInSection: {
        ds, index in
        return ds.sectionModels[index].header
    })
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CarCompanyTableViewCell.self, forCellReuseIdentifier: CarCompanyTableViewCell.reuseIdentifier)
        table.keyboardDismissMode = .onDrag
        return table
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search car company..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.endEditing(true)
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        navigationItem.titleView = searchBar
        transitionFromСell()
        carQuery()
    }
    
    private func carQuery() {
        _ = searchBar.rx.text.orEmpty
            .throttle(.microseconds(200), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .map ({ query in
                self.carsModel.value.map ({ sectionModel in
                    SectionModel(header: sectionModel.header, items: sectionModel.items.filter ({
                        cars in
                        query.isEmpty || cars.brand.lowercased().contains(query.lowercased())
                    }))
                })
            })
                .bind(to:
                    tableView
                        .rx
                        .items(dataSource: dataSources))
                        .disposed(by: bag)
        
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


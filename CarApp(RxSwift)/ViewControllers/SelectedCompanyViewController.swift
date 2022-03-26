//
//  SelectedCompanyViewController.swift
//  CarApp(RxSwift)
//
//  Created by Никита Гуляев on 11.02.2022.
//

import UIKit
import RxSwift
import RxCocoa

class SelectedCompanyViewController: UIViewController {
    
    private var carCompanyImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(
            x: 0,
            y: 0,
            width: 250,
            height: 250))
        return imageView
    }()
    
    var imageName: BehaviorRelay = BehaviorRelay<String>(value: "")
    let desposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(carCompanyImage)
        view.backgroundColor = .systemRed
        carCompanyImage.center = view.center
        
        imageName.map { name in
            UIImage.init(named: name)
        }.bind(to: carCompanyImage
                .rx
                .image)
            .disposed(by: desposeBag)
    }
}

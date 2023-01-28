//
//  HomePresenter.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol HomePresenterProtocol: AnyObject {
    func viewWillAppear()
}

class HomePresenter: HomePresenterProtocol {
    
    private let useCase: HomeUseCase
    private weak var view: (HomeViewProtocol)?
    
    private let disposeBag = DisposeBag()
    
    required init(useCase: HomeUseCase, view: HomeViewProtocol) {
        self.useCase = useCase
        self.view = view
    }
    
    func viewWillAppear() {
        self.view?.onLoading()
        useCase.getTopAnime()
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.view?.onFetchDataSuccess()
            } onError: { error in
                self.view?.onFetchDataFailure()
            }.disposed(by: disposeBag)
    }
    
}

//
//  HomePresenter.swift
//  AnimeApp
//
//  Created by Apple on 28/01/23.
//

import Foundation
import RxSwift

protocol HomePresenterProtocol: AnyObject {
    var data: [ItemAnimeModel] { get }
    func viewWillAppear()
    func onItemDidSelected(at index: Int)
}

class HomePresenter: HomePresenterProtocol {
    var data: [ItemAnimeModel] = []
    
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
                self.data = result
                self.view?.onFetchDataSuccess(data: self.data)
            } onError: { error in
                print("DEBUG: presenter \(error.localizedDescription)")
                let errMessage = error.localizedDescription
                self.view?.onFetchDataFailure(message: errMessage)
            }.disposed(by: disposeBag)
    }
    
    func onItemDidSelected(at index: Int) {
        let id = data[index].id
        print("DEBUG: presenter item id \(id)")
    
    }
    
}

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
    func onAboutIconDidSelected()
}

class HomePresenter: HomePresenterProtocol {
    var data: [ItemAnimeModel] = []
    
    private let useCase: HomeUseCase
    private let router: AppRouterProtocol
    private weak var view: (HomeViewProtocol)?
    
    private let disposeBag = DisposeBag()
        
    required init(useCase: HomeUseCase, view: HomeViewProtocol, router: AppRouterProtocol) {
        self.useCase = useCase
        self.view = view
        self.router = router
    }
    
    func viewWillAppear() {
        if !data.isEmpty { return }
        
        self.view?.onLoading()
        useCase.getTopAnime()
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.data = result
                self.view?.onFetchDataSuccess(data: self.data)
            } onError: { error in
                print("DEBUG: home presenter \(error.localizedDescription)")
                let errMessage = error.localizedDescription
                self.view?.onFetchDataFailure(message: errMessage)
            }.disposed(by: disposeBag)
    }
    
    func onItemDidSelected(at index: Int) {
        let id = data[index].id
        print("DEBUG: home presenter item id \(id)")
    }
    
    func onAboutIconDidSelected() {
        print("DEBUG: home presenter about")
        router.navigateToAbout()
    }
    
}

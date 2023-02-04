//
//  FavoritePresenter.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import RxSwift
import Shared

protocol FavoritePresenterProtocol: AnyObject {
    var data: [ItemAnimeModel] { get }
    func viewWillAppear()
    func onItemDidSelected(at index: Int)}

class FavoritePresenter: FavoritePresenterProtocol {
    var data: [ItemAnimeModel] = []
    
    private let useCase: FavoriteUseCase
    private let router: AppRouterProtocol
    private weak var view: (FavoriteViewProtocol)?
    
    private let disposeBag = DisposeBag()

    init(
        useCase: FavoriteUseCase,
        view: FavoriteViewProtocol,
        router: AppRouterProtocol
    ) {
        self.useCase = useCase
        self.router = router
        self.view = view
    }
    
    func viewWillAppear() {
        useCase.getFavoriteAnimes()
            .observe(on: MainScheduler.instance)
            .do(onSubscribe: {
                self.view?.onLoadingState()
            })
            .subscribe { result in
                self.data = result
                self.view?.onBindSuccessState(data: self.data)
            } onError: { error in
                print("DEBUG: favorite presenter \(error.localizedDescription)")
                let errMessage = error.localizedDescription
                self.view?.onBindFailureState(message: errMessage)
            }.disposed(by: disposeBag)
    }
    
    func onItemDidSelected(at index: Int) {
        let id = data[index].id
        print("DEBUG: favorite presenter item id \(id)")
        router.navigateToDetail(with: id)
    }
    
}

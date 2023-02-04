//
//  DetailPresenter.swift
//  AnimeApp
//
//  Created by Apple on 29/01/23.
//

import Foundation
import RxSwift

protocol DetailPresenterProtocol: AnyObject {
    func viewWillAppear(with id: Int?)
    func onFavoriteDidPressed()
}

class DetailPresenter: DetailPresenterProtocol {
    
    private let useCase: DetailUseCase
    private weak var view: (DetailViewProtocol)?
    
    private let disposeBag = DisposeBag()
    
    private var data: DetailAnimeModel?
    
    required init(useCase: DetailUseCase, view: DetailViewProtocol) {
        self.useCase = useCase
        self.view = view
    }
    
    func viewWillAppear(with id: Int?) {
        print("DEBUG: detail presenter")
        
        guard let id = id else {
            view?.onBindFailureState(message: "Failed get data")
            return
        }
        
        let detail = useCase.getDetailAnime(id: id)
        let check = useCase.checkAnimeIsFavorited(from: id)
        
        Single.zip(detail, check) { value1, value2 in
            let data = value1.copy(isFavorite: value2)
            return data
        }
        .observe(on: MainScheduler.instance)
        .do(onSubscribe: {
            self.view?.onLoadingState()
        })
        .subscribe { result in
            switch result {
            case .success(let data):
                if data.id == -1 {
                    self.view?.onBindFailureState(message: "Failed get data")
                    return
                }
                
                print("DEBUG: detail presenter \(data)")
                self.data = data
                self.view?.onBindSuccessState(data: data)
                
            case .failure(let error):
                print("DEBUG: detail presenter \(error.localizedDescription)")
                let errMessage = error.localizedDescription
                self.view?.onBindFailureState(message: errMessage)
            }
        }
        .disposed(by: disposeBag)
    }
    
    func onFavoriteDidPressed() {
        print("DEBUG: detail presenter favorite")
        
        guard let data = self.data else {
            return
        }
        
        let isFavorite = !data.isFavorite
        self.data = data.copy(isFavorite: isFavorite)
        if isFavorite {
            self.useCase.saveAnime(from: data)
                .observe(on: MainScheduler.instance)
                .subscribe { result in
                    switch result {
                    case .success(let isSuccess):
                        if isSuccess {
                            self.view?.onFavoriteState(isFavorite: isFavorite)
                        }
                    case .failure(let err):
                        self.view?.onBindFailureState(message: err.localizedDescription)
                    }
                }
                .disposed(by: disposeBag)
        } else {
            self.useCase.removeAnime(from: data.id)
                .observe(on: MainScheduler.instance)
                .subscribe { result in
                    switch result {
                    case .success(let isSuccess):
                        if isSuccess {
                            self.view?.onFavoriteState(isFavorite: isFavorite)
                        }
                    case .failure(let err):
                        self.view?.onBindFailureState(message: err.localizedDescription)
                    }
                }
                .disposed(by: disposeBag)
        }
    }
    
}

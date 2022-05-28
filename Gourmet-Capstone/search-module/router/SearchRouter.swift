//
//  SearchRouter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//


import Foundation

class SearchRouter : PresenterToRouterSearchProtocol {
    static func createModule(ref: SearchVC) {
        let presenter = SearchPresenter()
        //View
        ref.searchPresenterNesnesi = presenter
        //Presenter
        ref.searchPresenterNesnesi?.searchInteractor = SearchInteractor()
        ref.searchPresenterNesnesi?.searchView = ref
        //Interactor
        ref.searchPresenterNesnesi?.searchInteractor?.searchPresenter = presenter
    }
}

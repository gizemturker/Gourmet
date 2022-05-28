//
//  SearchPresenter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SearchPresenter : ViewToPresenterSearchProtocol {

    
    var searchInteractor: PresenterToInteractorSearchProtocol?
    var searchView: PresenterToViewSearchProtocol?
    
    func yemekleriYukle() {
       searchInteractor?.tumYemekleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        searchInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }

}

extension SearchPresenter : InteractorToPresenterSearchProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        searchView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}

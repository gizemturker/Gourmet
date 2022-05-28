//
//  SearchProtocols.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

protocol ViewToPresenterSearchProtocol {
    var searchInteractor:PresenterToInteractorSearchProtocol? {get set}
    var searchView:PresenterToViewSearchProtocol? {get set}
    
    func yemekleriYukle()
    func ara(aramaKelimesi:String)

}

protocol PresenterToInteractorSearchProtocol {
    var searchPresenter:InteractorToPresenterSearchProtocol? {get set}
    
    func tumYemekleriAl()
    func yemekAra(aramaKelimesi:String)
   
}

protocol InteractorToPresenterSearchProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewSearchProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToRouterSearchProtocol {
    static func createModule(ref:SearchVC)
}

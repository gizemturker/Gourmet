//
//  SepetProtocols.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    
    func sepetYukle(kullanici_adi:String)
    func sepetSil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    
    func yukle(kullanici_adi:String)
    func sil(sepet_yemek_id:Int,kullanici_adi:String)
}

protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi:Array<SepetYemekler>)
}

protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetListesi:Array<SepetYemekler>)
}

protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetDetayVC)
}

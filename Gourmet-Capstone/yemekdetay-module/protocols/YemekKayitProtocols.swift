//
//  YemekKayitProtocols.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

protocol ViewToPresenterYemekKayitProtocol {
    var yemekKayitInteractor:PresenterToInteractorYemekKayitProtocol?  {get set}
    var yemekKayitView:PresenterToViewYemekKayitProtocol? {get set}
    
    func ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_adet:Int,kullanici_adi:String)
   
}

protocol PresenterToInteractorYemekKayitProtocol {
    var yemekKayitPresenter:PresenterToInteractorYemekKayitProtocol? {get set}
    func yemekEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_adet:Int,kullanici_adi:String)
   
}

protocol InteractorToPresenterYemekKayitProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewYemekKayitProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToRouterYemekKayitProtocol {
    static func createModule(ref:YemekDetayVC)
}

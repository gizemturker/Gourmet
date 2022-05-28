//
//  AnasayfaProtocols.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}

    func yemekleriYukle()
    func ara(aramaKelimesi:String)
    func sil(yemek_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl()
    func yemekAra(aramaKelimesi:String)
    func yemekSil(yemek_id:Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}

//
//  AnasayfaPresenter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }

    func sil(yemek_id: Int) {
        anasayfaInteractor?.yemekSil(yemek_id: yemek_id)
    }
}



extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}

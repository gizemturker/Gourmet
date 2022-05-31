//
//  SepetPresenter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetYukle(kullanici_adi: String) {
        sepetInteractor?.sepetYemekler(kullanici_adi: kullanici_adi)
    }
    
    func sepetYemekSil(sepet_yemek_id: Int, kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
    
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi sepetYemeklerListesi: Array<Sepet_Yemekler>) {
        sepetView?.vieweVeriGonder(sepetListesi: sepetYemeklerListesi)
    }
}


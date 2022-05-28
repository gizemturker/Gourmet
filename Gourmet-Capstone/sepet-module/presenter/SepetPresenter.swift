//
//  SepetPresenter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    func sepetYukle(kullanici_adi: String) {
        print("düzeltme")
    }
    
    func sepetSil(sepet_yemek_id: Int, kullanici_adi: String) {
        print("düzeltme")
    }
    
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
}



extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi sepetYemeklerListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(sepetListesi: sepetYemeklerListesi)
    }
}


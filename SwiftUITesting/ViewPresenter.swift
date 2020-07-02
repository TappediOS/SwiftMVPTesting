//
//  viewpresen.swift
//  SwiftUITesting
//
//  Created by jun on 2020/06/23.
//  Copyright © 2020 jun. All rights reserved.
//

protocol ViewPresenterProtocol {
    var view: ViewPresenterOutput! { get set }
    
}

protocol ViewPresenterOutput {

}

final class ViewPresenter: ViewPresenterProtocol, ViewModelOutput {
    var view: ViewPresenterOutput!
    private var model: ViewModelProtocol
    
    init(model:ViewModelProtocol) {
        self.model = model
        self.model.presenter = self
    }

}


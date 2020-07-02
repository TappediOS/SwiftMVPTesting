//
//  viewmodel.swift
//  SwiftUITesting
//
//  Created by jun on 2020/06/23.
//  Copyright © 2020 jun. All rights reserved.
//

protocol ViewModelProtocol {
    var presenter: ViewModelOutput! { get set }
}

protocol ViewModelOutput {
    
}

final class ViewModel: ViewModelProtocol {
    var presenter: ViewModelOutput!
}

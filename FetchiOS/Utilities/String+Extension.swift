//
//  String+Extension.swift
//  FetchiOS
//
//  Created by Adit Hasan on 11/15/23.
//

import Foundation

extension String {
    func emptyAsNil() -> String? {
        self.isEmpty ? nil : self
    }
    
    var removewhiteSpace: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

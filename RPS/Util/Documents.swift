//
//  Documents.swift
//  RPS
//
//  Created by Andy Wu on 1/3/23.
//

import Foundation


func getDocumentsDirectory() -> URL {
    // find all possible documents directories for this user
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    // just send back the first one, which ought to be the only one
    return paths[0]
}

func writeDocument<T: Codable>(name filename: String, for data: T) throws -> Void {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let jsonData = try encoder.encode(data)
    try jsonData.write(to: getDocumentsDirectory().appendingPathComponent(filename))
}

func documentExists(at filename: String) -> Bool {
    // .absoluteString does not work here
    return FileManager.default.fileExists(atPath: getDocumentsDirectory().appendingPathComponent(filename).path())
}
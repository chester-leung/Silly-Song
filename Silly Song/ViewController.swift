//
//  ViewController.swift
//  Silly Song
//
//  Created by Chester Leung on 12/24/16.
//  Copyright © 2016 Chester Leung. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
        let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        lyricsView.text = lyrics
        }
    }

}

func shortNameFromName(name: String) -> String {
    var lowercaseName = name.lowercased()
    //let vowelSet = CharacterSet(charactersIn: "aeiou")
    while lowercaseName.characters.first != "a" && lowercaseName.characters.first != "e" && lowercaseName.characters.first != "i" && lowercaseName.characters.first != "o" && lowercaseName.characters.first != "u" {
        let index1 = lowercaseName.index(lowercaseName.startIndex, offsetBy: 1)
        lowercaseName = lowercaseName.substring(from: index1)
    }
    return lowercaseName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    var song = lyricsTemplate
    let shortName = shortNameFromName(name: fullName)
    //replace <FULL_NAME> with fullName
    song = song.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    //replace <SHORT_NAME> with shortName
    song = song.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return song
}

// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}



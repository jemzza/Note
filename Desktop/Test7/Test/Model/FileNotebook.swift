
import Foundation
import CocoaLumberjack

class FileNotebook{
    
    private (set) var notes = [Note]()
    init() {
        self.notes = []
    }
    
    
    public func add(_ note: Note){
        notes.append(note)
    }
    
    
    public func remove(with uid: String){
        if    let index = notes.firstIndex(where: {$0.uid == uid }) {
            notes.remove(at: index)
        }
        
        
    }
    
    
    public func saveToFile(){
        if let cachePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let jsx = notes.map { $0.json }
            do {
                let data = try JSONSerialization.data(withJSONObject: jsx, options: [])
                let path = cachePath.appendingPathComponent("NoteBook")
                FileManager.default.createFile(atPath: path.path, contents: data, attributes: nil)
            } catch let error {
                DDLogError(error.localizedDescription)
            }
        }
    }
    
    public func loadFromFile(){
        if let cachePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            do {
                let path = cachePath.appendingPathComponent("NoteBook")
                if let data = FileManager.default.contents(atPath: path.path) {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                    _ = json.map {notes.append(Note.parse(json: $0)!)}
                }
            } catch let error {
                DDLogError(error.localizedDescription)
            }
        }
    }
}

//let note13 = Note( uid: "6" ,title: "Hello world", content: "It's first note of this application", color: .white, selfDestructionDate: Date(), importance: .important)
//let notebook = FileNotebook()
//notebook
//notebook.add(note13)
//print(notebook.notes)
//
//notebook.saveToFile()
//notebook.remove(with: note13.uid)
//print(notebook.notes)
//
//notebook.loadFromFile()
//print(notebook.notes)

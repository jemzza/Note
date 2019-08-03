import UIKit


struct Note{
    let uid: String
    let title :String
    let content :String
    let color: UIColor
    let importance: Importance
    let selfDestructionDate: Date?
    
    enum Importance: String {
        case unimportant
        case basic
        case important
        
    }
    
    
    
    init(uid: String = UUID().uuidString ,title: String, content: String, color: UIColor = .white, selfDestructionDate: Date? = nil, importance: Importance) {
        self.uid = uid
        self.title = title
        self.content = content
        self.color = color
        self.selfDestructionDate = selfDestructionDate
        self.importance = importance
        
    }
    
    
    
}

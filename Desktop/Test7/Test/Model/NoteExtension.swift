import UIKit

extension Note {
    
    var json: [String: Any] {
        var json = [String: Any]()
        json["uid"] = uid
        json["title"] = title
        json["content"] = content
        
        
        if color != .white {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0
            color.getRed(&r, green: &g, blue: &b, alpha: &a)
            json["color"] = ["red":Double(r), "green":Double(g), "blue":Double(b), "alpha":Double(a)]
        }
        
        json["selfDestructionDate"] = selfDestructionDate?.timeIntervalSince1970
        
        if importance != .basic {
            json["importance"] = importance.rawValue
        }
        
        return json
    }
    
    
    
    
    
    
    
    static func parse(json: [String: Any]) -> Note? {
        
        var uid: String
        if  let id = json["uid"] as? String {
            uid = id
        } else {
            uid = String()
        }
        
        guard let title = json["title"] as? String else {return nil}
        guard let content = json["content"]  as? String else {return nil}
        
        var color: UIColor
        
        if let colorA = json["color"] as? [String: Double] {
            func getColor(from thing: [String: Double]) -> UIColor {
                guard let red = thing["red"],
                    let green = thing["green"],
                    let blue = thing["blue"],
                    let alpha = thing["alpha"] else { return .white }
                
                return UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
            }
            color = getColor(from: colorA)
            
        } else {
            color = UIColor.white
        }
        
        
        
        var selfDestructionDate: Date?
        if let date = json["selfDestructionDate"] as? TimeInterval {
            selfDestructionDate = Date(timeIntervalSince1970: date)
        } else {
            selfDestructionDate = nil
        }
        
        
        var importance = Importance.basic
        if let importanceString = json["importance"] as? String {
            importance = Importance(rawValue: importanceString) ?? Importance.basic
        } else {
            importance = .basic
        }
        
        if uid.isEmpty{
            return Note(title: title, content: content, color: color, selfDestructionDate: selfDestructionDate, importance: importance)
        } else {
            return Note(uid: uid, title: title, content: content, color: color, selfDestructionDate: selfDestructionDate, importance: importance)
        }
        
    }
}


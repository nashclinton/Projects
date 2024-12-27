
import Foundation

class FamilyController {
    static let shared = FamilyController()
    
    var selectedFamilyMember: FamilyMembers? 
    
    var family: [FamilyMembers] = [
        FamilyMembers(name: "Dad", filename: "Dad", description: "My dad is a software engineer with a big heart and a big beard."),
        FamilyMembers(name: "Mom", filename: "Mom", description: "My mom is a talented who artist who loves to paint and read."),
        FamilyMembers(name: "Kylie", filename: "Kylie", description: "Kylie is my older sister who just graduated BYU in statistics."),
        FamilyMembers(name: "Paige", filename: "Paige", description: "Paige is my second oldest sister and the first to get married."),
        FamilyMembers(name: "Me", filename: "Me", description: "I am Nash Clinton, a swift developer who loves to code, paint, and am a self-published author."),
        FamilyMembers(name: "Maisie", filename: "Maisie", description: "Maisie is my younger sister who is a talented artist and loves to draw.")
    ]
}

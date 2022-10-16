import UIKit

// MARK: - Test Mark

class PractiseSwiftCodeSnippets: UIViewController {
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func helloSnippet() {
        print("👋 Swift Code Snippet")
    }
}

let practiseSnippet = PractiseSwiftCodeSnippets()
practiseSnippet.helloSnippet()


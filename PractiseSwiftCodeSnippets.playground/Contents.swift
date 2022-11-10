import UIKit

// MARK: - Test Mark

class PractiseSwiftCodeSnippets: UIViewController {
    override func viewDidLoad() {
        easySimulatorAccess()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func easySimulatorAccess() {
        #if targetEnvironment(simulator)
        let environment = ProcessInfo.processInfo.environment
        if let rootFolder = environment["SIMULATOR_HOST_HOME"].map(URL.init(fileURLWithPath:))?.appendingPathComponent("Desktop/SimulatorData"),
           let simulatorHome = environment["HOME"].map(URL.init(fileURLWithPath:)),
           let simulatorVersion = environment["SIMULATOR_RUNTIME_VERSION"],
           let simulatorName = environment["SIMULATOR_DEVICE_NAME"],
           let productName = Bundle.main.infoDictionary?["CFBundleName"] {
            let symlink = rootFolder.appendingPathComponent("\(productName) \(simulatorName) (\(simulatorVersion))")
            
            let fileManager = FileManager.default
            try? fileManager.createDirectory(at: rootFolder, withIntermediateDirectories: true)
            try? fileManager.removeItem(at: symlink)
            try? fileManager.createSymbolicLink(at: symlink, withDestinationURL: simulatorHome)
        }
        #endif
    }
    
    
    extension UIView {
        // We're saying that `T` is eventually going to be a `UIView`.
        //
        // It could be a `UIButton`, `UIImageView`, or
        // an ordinary `UIView` - it doesn't matter.
        //
        // Now, we can load any `UIView` or a subclass from a `.nib`.
        class func fromNib<T: UIView>() -> T {
            return Bundle(for: T.self).loadNibNamed(
                String(describing: T.self), owner: nil, options: nil
            )![0] as! T
        }
    }

}

let practiseSnippet = PractiseSwiftCodeSnippets()


import UIKit
import PlaygroundSupport


extension UIView {
    static func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, group: DispatchGroup, completion: ((Bool) -> Void)?) {
        group.enter()
        animate(withDuration: duration, animations: animations) { success in
            completion?(success)
            group.leave()
        }
    }
}



let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = .red


let box = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
box.backgroundColor = .yellow
view.addSubview(box)

let label = UILabel(frame: CGRect(x: 15, y: 100, width: 360, height: 40))
label.font = label.font.withSize(50)
label.text = "All done"
label.textColor = .yellow
label.textAlignment = .center
label.isHidden = true
view.addSubview(label)

let animationGroup = DispatchGroup()



UIView.animate(withDuration: 1, animations:  {
    box.center = CGPoint(x: 300, y: 300)
}, group: animationGroup, completion: { _ in
    UIView.animate(withDuration: 5, animations: {
        box.transform = CGAffineTransform(rotationAngle: .pi / 4)
    }, group: animationGroup, completion: nil)
})


UIView.animate(withDuration: 3, animations:  {
    view.backgroundColor = .blue
}, group: animationGroup, completion: nil)

animationGroup.notify(queue: DispatchQueue.main){
    label.isHidden = false
}


PlaygroundPage.current.liveView = view




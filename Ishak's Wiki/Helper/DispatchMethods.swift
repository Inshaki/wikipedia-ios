//~~~**DELETE THIS HEADER**~~~

import Foundation

func delayWithSeconds(_ seconds: Double, completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

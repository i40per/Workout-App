//
//  WorkoutModel.swift
//  Workout App
//
//  Created by Evgenii Lukin on 29.06.2022.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}

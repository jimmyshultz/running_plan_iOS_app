//
//  ContentView.swift
//  Running Plan
//
//  Created by Jimmy Shultz on 12/10/23.
//

import SwiftUI

enum TargetedRace: String, CaseIterable {
    case fiveK = "5k", tenK = "10k"
}

enum PlanWeeks: Int, CaseIterable {
    case weekOne = 1
    case weekTwo = 2
    case weekThree = 3
    case weekFour = 4
    case weekFive = 5
    case weekSix = 6
    case weekSeven = 7
    case weekEight = 8
}


struct ContentView: View {
    @State private var targetedRace: TargetedRace = .fiveK
    @State private var currentWeek: PlanWeeks = .weekOne
    
    let fiveKWeekOneMileage: Array<Float> = [2, 0, 2, 0, 3, 0, 3]
    let fiveKWeekTwoMileage: Array<Float> = [0, 2, 0, 3, 1, 0, 3]
    let fiveKWeekThreeMileage: Array<Float> = [2, 0, 3, 0, 3, 0, 4]
    let fiveKWeekFourMileage: Array<Float> = [2, 0, 3, 0, 3, 0, 4.5]
    let fiveKWeekFiveMileage: Array<Float> = [2, 3, 0, 4, 2, 4, 0]
    let fiveKWeekSixMileage: Array<Float> = [4, 0, 5, 0, 2, 0, 5]
    let fiveKWeekSevenMileage: Array<Float> = [2, 4, 0, 5, 3, 0, 4]
    let fiveKWeekEightMileage: Array<Float> = [3, 2, 0, 3.5, 0, 1, 3.1]
    
    let tenKWeekOneMileage: Array<Float> = [5, 2, 4, 0, 4, 0, 6]
    let tenKWeekTwoMileage: Array<Float> = [3, 5, 3, 0, 5, 2, 6.5]
    let tenKWeekThreeMileage: Array<Float> = [0, 5, 4, 5, 4, 0, 7]
    let tenKWeekFourMileage: Array<Float> = [2, 5, 5, 0, 6, 2, 7]
    let tenKWeekFiveMileage: Array<Float> = [2, 6, 5, 0, 5, 3, 7.5]
    let tenKWeekSixMileage: Array<Float> = [3, 6, 6, 0, 6, 3, 8]
    let tenKWeekSevenMileage: Array<Float> = [3, 7, 5, 0, 6, 2, 5]
    let tenKWeekEightMileage: Array<Float> = [3, 4, 4, 0, 3, 1, 6.2]
    
    let fiveKWeekOneIntesity: Array<String> = ["Easy Pace",  "Recover",  "Easy Pace",  "Recover",  "Easy Pace",  "Recover", "Easy Pace"]
    let fiveKWeekTwoIntesity: Array<String> = ["Recover",  "Easy Pace",  "Recover",  "Easy Pace",  "Easy Pace",  "Recover", "Easy Pace"]
    let fiveKWeekThreeIntesity: Array<String> = ["Easy Pace",  "Recover",  "Interval",  "Recover",  "Easy Pace",  "Recover", "Long Run"]
    let fiveKWeekFourIntesity: Array<String> = ["Easy Pace",  "Recover",  "Easy Pace",  "Recover",  "Easy Pace",  "Recover", "Long Run"]
    let fiveKWeekFiveIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Recover",  "Tempo",  "Easy Pace",  "Long Run", "Recover"]
    let fiveKWeekSixIntesity: Array<String> = ["Easy Pace",  "Recover",  "Easy Pace",  "Recover",  "Easy Pace",  "Recover", "Long Run"]
    let fiveKWeekSevenIntesity: Array<String> = ["Easy Pace",  "Interval",  "Recover",  "Long Run",  "Easy Pace",  "Recover", "Easy Pace"]
    let fiveKWeekEightIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Recover",  "Easy Pace",  "Recover",  "Easy Pace", "Raceday"]
    
    let tenKWeekOneIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Interval",  "Recover",  "Easy Pace",  "Recover", "Long Run"]
    let tenKWeekTwoIntesity: Array<String> = ["Easy Pace",  "Interval",  "Easy Pace",  "Recover",  "Easy Pace",  "Easy Pace", "Long Run"]
    let tenKWeekThreeIntesity: Array<String> = ["Recover",  "Easy Pace",  "Easy Pace",  "Interval",  "Easy Pace",  "Recover", "Long Run"]
    let tenKWeekFourIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Tempo",  "Recover",  "Easy Pace",  "Easy Pace", "Long Run"]
    let tenKWeekFiveIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Interval",  "Recover",  "Easy Pace",  "Easy Pace", "Long Run"]
    let tenKWeekSixIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Tempo",  "Recover",  "Easy Pace",  "Easy Pace", "Long Run"]
    let tenKWeekSevenIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Tempo",  "Recover",  "Easy Pace",  "Easy Pace", "Easy Pace"]
    let tenKWeekEightIntesity: Array<String> = ["Easy Pace",  "Easy Pace",  "Easy Pace",  "Recover",  "Easy Pace",  "Easy Pace", "Raceday"]
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(Color.green.gradient)
                .ignoresSafeArea()
            VStack {
                Text("Running Plans")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding(50)
                
                Spacer()
                
                Text("Targeted Race")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                Picker("Select Targeted Race", selection: $targetedRace) {
                    ForEach(TargetedRace.allCases, id: \.self) { race in
                        Text(race.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 25)
                .padding(.horizontal, 10)
                
                if (targetedRace.rawValue == "5k") {
                    if (currentWeek.rawValue == 1) {
                        WeeklyPlan(dailyMileage: fiveKWeekOneMileage, 
                                   dailyIntensity: fiveKWeekOneIntesity)
                    } else if (currentWeek.rawValue == 2) {
                        WeeklyPlan(dailyMileage: fiveKWeekTwoMileage, 
                                   dailyIntensity: fiveKWeekTwoIntesity)
                    } else if (currentWeek.rawValue == 3) {
                        WeeklyPlan(dailyMileage: fiveKWeekThreeMileage, 
                                   dailyIntensity: fiveKWeekThreeIntesity)
                    } else if (currentWeek.rawValue == 4) {
                        WeeklyPlan(dailyMileage: fiveKWeekFourMileage, 
                                   dailyIntensity: fiveKWeekFourIntesity)
                    } else if (currentWeek.rawValue == 5) {
                        WeeklyPlan(dailyMileage: fiveKWeekFiveMileage, 
                                   dailyIntensity: fiveKWeekFiveIntesity)
                    } else if (currentWeek.rawValue == 6) {
                        WeeklyPlan(dailyMileage: fiveKWeekSixMileage, 
                                   dailyIntensity: fiveKWeekSixIntesity)
                    } else if (currentWeek.rawValue == 7) {
                        WeeklyPlan(dailyMileage: fiveKWeekSevenMileage, 
                                   dailyIntensity: fiveKWeekSevenIntesity)
                    } else {
                        WeeklyPlan(dailyMileage: fiveKWeekEightMileage, 
                                   dailyIntensity: fiveKWeekEightIntesity)
                    }
                } else {
                    if (currentWeek.rawValue == 1) {
                        WeeklyPlan(dailyMileage: tenKWeekOneMileage, 
                                   dailyIntensity: tenKWeekOneIntesity)
                    } else if (currentWeek.rawValue == 2) {
                        WeeklyPlan(dailyMileage: tenKWeekTwoMileage, 
                                   dailyIntensity: tenKWeekTwoIntesity)
                    } else if (currentWeek.rawValue == 3) {
                        WeeklyPlan(dailyMileage: tenKWeekThreeMileage, 
                                   dailyIntensity: tenKWeekThreeIntesity)
                    } else if (currentWeek.rawValue == 4) {
                        WeeklyPlan(dailyMileage: tenKWeekFourMileage, 
                                   dailyIntensity: tenKWeekFourIntesity)
                    } else if (currentWeek.rawValue == 5) {
                        WeeklyPlan(dailyMileage: tenKWeekFiveMileage, 
                                   dailyIntensity: tenKWeekFiveIntesity)
                    } else if (currentWeek.rawValue == 6) {
                        WeeklyPlan(dailyMileage: tenKWeekSixMileage, 
                                   dailyIntensity: tenKWeekSixIntesity)
                    } else if (currentWeek.rawValue == 7) {
                        WeeklyPlan(dailyMileage: tenKWeekSevenMileage, 
                                   dailyIntensity: tenKWeekSevenIntesity)
                    } else {
                        WeeklyPlan(dailyMileage: tenKWeekEightMileage, 
                                   dailyIntensity: tenKWeekEightIntesity)
                    }
                }
                
                Spacer()
                
                Text("Current Week")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                Picker("Select Current Week", selection: $currentWeek) {
                    ForEach(PlanWeeks.allCases, id: \.self) { week in Text("\(week.rawValue)")}
                }
                .pickerStyle(.palette)
                .padding(.bottom, 10)
                .padding(.horizontal, 10)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeeklyPlan: View {
    var dailyMileage: Array<Float>
    var dailyIntensity: Array<String>
    var totalWeeklyMileage: Float = 0
    
    var body: some View {
        let totalWeeklyMileage = calculateWeeklyMileage(mileage: dailyMileage)
        
        VStack{
            HStack {
                PlanDayView(day: "Day 1", 
                            mileage: "\(dailyMileage[0]) miles",
                            pace: dailyIntensity[0])
                PlanDayView(day: "Day 2",
                            mileage: "\(dailyMileage[1]) miles",
                            pace: dailyIntensity[1])
                PlanDayView(day: "Day 3",
                            mileage: "\(dailyMileage[2]) miles",
                            pace: dailyIntensity[2])
                PlanDayView(day: "Day 4",
                            mileage: "\(dailyMileage[3]) miles",
                            pace: dailyIntensity[3])
                }
            .padding(10)
            HStack {
                PlanDayView(day: "Day 5",
                            mileage: "\(dailyMileage[4]) miles",
                            pace: dailyIntensity[4])
                PlanDayView(day: "Day 6",
                            mileage: "\(dailyMileage[5]) miles",
                            pace: dailyIntensity[5])
                PlanDayView(day: "Day 7",
                            mileage: "\(dailyMileage[6]) miles",
                            pace: dailyIntensity[6])
                PlanDayView(day: "Total",
                            mileage: " ",
                            pace: "\(totalWeeklyMileage) miles")
            }
            .padding(10)
        }
    }
}

struct PlanDayView: View {
    var day: String
    var mileage: String
    var pace: String
    
    var body: some View {
        VStack {
            Text(day)
            Text(mileage)
            Text(pace)
        }
        .frame(width: 85, height: 80)
        .background(Color.blue.gradient)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .medium, design: .default))
        .cornerRadius(10)
    }
}

func calculateWeeklyMileage(mileage: Array<Float>) -> Float {
    var weeklyTotalMileage: Float = 0
    
    for day in mileage {
        weeklyTotalMileage += day
    }
    
    return weeklyTotalMileage
}

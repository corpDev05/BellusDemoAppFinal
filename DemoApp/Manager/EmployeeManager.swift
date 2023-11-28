//
//  EmployeeManager.swift
//  DemoApp
//
//  Created by Bellubis-WS29 on 23/11/23.
//  Copyright © 2023 Bellubis-WS29. All rights reserved.
//

import Foundation
import CoreData

struct EmployeeManager {
    private let _employeeDataRepository = EmployeeDataRepository()
    
    func createEmployee(employee: Employees) {
        _employeeDataRepository.create(employees: employee)
    }
    func fetchEmployee() -> [Employees]?{
        return _employeeDataRepository.getAll()
    }
    func fetchEmployee(byName name : String) -> [Employees]?
    {
        return _employeeDataRepository.get(byName: name)
    }
    func updateEmployee(employee : Employees) -> Bool
    {
        return  _employeeDataRepository.update(employees: employee)
    }
    func deleteEmployee(employee : Employees) -> Bool {
        return _employeeDataRepository.delete(record: employee)
    }
    func deleteAll(){
        _employeeDataRepository.deleteAll()
    }
}

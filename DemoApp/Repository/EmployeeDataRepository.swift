//
//  EmployeeResource.swift
//  CDcrudOperations
//
//  Created by CodeCat15 on 6/19/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

/* Thank you for downloading the source code, I hope the video was helpful and if you are having any questions then I would be happy to answer them so do feel free to ask as YouTube comment or via email codecat15@gmail.com

 Note: If you think this video was helpful and someone can benefit from it, then please do share this and if you care new to the channel I request you to please subscribe to the channel :)*/

protocol EmployeeRepository {

    func create(employees: Employees)
    func getAll() -> [Employees]?
    func get(byName name: String) -> [Employees]?
    func update(employees: Employees) -> Bool
    func delete(record: Employees) -> Bool
    func deleteAll()
}

struct EmployeeDataRepository : EmployeeRepository
{
    func create(employees: Employees) {
        let employee = Employee(context: PersistentStorage.shared.context)
        employee.name = employees.name
        employee.designation = employees.designation
        employee.contactNo = employees.contactNo ?? 91
       //employee.id = employees.id!
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employees]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: Employee.self)
        var employees : [Employees] = []
        result?.forEach({(employee) in employees.append(employee.convertToEmployee())} )
        return employees
    }
    
    func get(byName name: String) -> [Employees]? {
        var emplRes : [Employees] = []
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
       // let predicate = NSPredicate(format: "%K == %@",argumentArray: ["name",name]/*name as CVarArg*/)
        //fetchRequest = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name CONTAINS [C]%@", "\(name)")
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest)
            guard result != nil else{return nil}
            /*for res in result {
                emplRes.insert(res.convertToEmployee(), at: emplRes.count)
            }*/
            print("Inside Search Function")
            print("\(result.count)")
            for res in result{
             //res.convertToEmployee()
                print("\(res.name)")
             emplRes.append(res.convertToEmployee())
            }
            return emplRes
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    func update(employees: Employees) -> Bool {
        let result = getEmployee(byName: employees.name!)
        guard result != nil else{return false}
        
    result?.email = employees.email
    result?.name = employees.name
    //result?.profilePic = employees.profilePicture
    
        PersistentStorage.shared.saveContext()
        return true
    }
    func delete(record: Employees) -> Bool {
        let employee = getEmployee(byName: record.name!)
        guard employee != nil else{return false}
        
        PersistentStorage.shared.context.delete(employee!)
        return true
        
    }
    func deleteAll(){
        //let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do{
            try PersistentStorage.shared.context.execute(deleteRequest)
                   try PersistentStorage.shared.context.save()
               }
               catch
               {
                   print ("There was an error")
               }
    }
    private func getEmployee(byName name : String) -> Employee?{
        let fetchRequest = NSFetchRequest<Employee>(entityName: "Employee")
        let predicate = NSPredicate(format: "name==%@", name as CVarArg)
        
        fetchRequest.predicate  = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    

}

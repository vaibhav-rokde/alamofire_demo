import Foundation
import Alamofire

class TreeCensusAPIService {
    
    private let baseURL = "http://92.204.137.146/treecensusapi/tree_vaibhav.php"
    
    func getTreeData(appName: String, electionName: String, userName: String, designation: String, operation: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "appName": appName,
            "electionName": electionName,
            "UserName": userName,
            "Designation": designation,
            "operation": operation
        ]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                guard let data = response.data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func addTreeData(appName: String, electionName: String, userName: String, designation: String, operation: String,LocalName: String, ScientificName: String, Specie: String,Description: String,Remark: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
//        appName:TreeCensus
//        electionName:NMMC
//        UserName:BHUSHAN_P20
//        Designation:Software Developer
//        operation:update
//        LocalName:Atharva
//        ScientificName:Test
//        Specie:Exotic
//        Description:Noo
//        Remark:Yes
//        TreeCd:324
//
        let parameters: [String: Any] = [
            "appName": appName,
            "electionName": electionName,
            "UserName": userName,
            "Designation": designation,
            "operation": operation,
            "LocalName":LocalName,
            "ScientificName":ScientificName,
            "Specie":Specie,
            "Description":Description,
            "Remark":Remark,
            

        ]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                guard let data = response.data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func editTreeData(appName: String, electionName: String, userName: String, designation: String, operation: String,LocalName: String, ScientificName: String, Specie: String,Description: String,Remark: String,TreeCd:Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "appName": appName,
            "electionName": electionName,
            "UserName": userName,
            "Designation": designation,
            "operation": operation,
            "LocalName":LocalName,
            "ScientificName":ScientificName,
            "Specie":Specie,
            "Description":Description,
            "Remark":Remark,
            "TreeCd":TreeCd

        ]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                guard let data = response.data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func deleteTreeData(appName: String, electionName: String, userName: String, designation: String, operation: String,TreeCd:Int, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "appName": appName,
            "electionName": electionName,
            "UserName": userName,
            "Designation": designation,
            "operation": operation,
            "TreeCd":TreeCd

        ]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                guard let data = response.data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDropdownTreeData(appName: String, electionName: String, userName: String, designation: String, operation: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        
        let parameters: [String: Any] = [
            "appName": appName,
            "electionName": electionName,
            "UserName": userName,
            "Designation": designation,
            "operation": operation
        ]
        
        AF.request(baseURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                guard let data = response.data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    completion(.failure(AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)))
                    return
                }
                completion(.success(json))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    
}

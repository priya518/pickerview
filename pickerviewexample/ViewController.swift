//
//  ViewController.swift
//  pickerviewexample
//
//  Created by COE-027 on 29/08/19.
//  Copyright © 2019 COE-027. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource{
    //step 1
    //class
    
    var countrylist=[countryclass()]
    var statelist=[stateclass()]
    var citylist=[cityclass()]
    
    
    //step 2
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //step 4
        if component==0 {
            
            return countrylist.count
        }
        //step 7
        else if component==1{
            
            return selectedstate.count
        }
        else if component == 2
        {
            return selectedcity.count
        }
            
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //step 5
        if component == 0
        {
            return countrylist[row].countryName
        }
        //step 8
        else if component==1
        {
            return selectedstate[row].stateName
        }
        else if component==2
        {
            return selectedcity[row].cityName
        }
        return ""
    }
    
    var selectedstate=[stateclass()]
    var selectedcity = [cityclass]()
    //step 9
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedstate = statelist.filter({ (stateObj) -> Bool in
                if stateObj.RefCountryId == countrylist[row].countryId{
                    return true
                }
                return false
            })
            pickerView.reloadComponent(1)
            
        }
        else if component == 1{
            selectedcity = citylist.filter({ (cityObj) -> Bool in
                if cityObj.RefstateId == statelist[row].stateId{
                    return true
                }
                return false
            })
            pickerView.reloadComponent(2)
            
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //step 3 here we did country detail
        
        var country=countryclass()
        country.countryId=1
        country.countryName="India"
        countrylist.append(country)
        
        country.countryId=2
        country.countryName="America"
        countrylist.append(country)
        
        //step 6
        var state=stateclass()
        state.RefCountryId=1
        state.stateId=1
        state.stateName="Gujarat"
        statelist.append(state)
        
        state.RefCountryId=2
        state.stateId=2
        state.stateName="New york"
        statelist.append(state)
        
        var city=cityclass()
        city.RefstateId=1
        city.cityId=1
        city.cityName="Gandhinagar"
        citylist.append(city)
        
        city.RefstateId=2
        city.cityId=2
        city.cityName="abc"
        citylist.append(city)
        
        
        
        
        rr
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


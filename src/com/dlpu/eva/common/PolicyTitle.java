/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dlpu.eva.common;

import javax.persistence.Entity;

/**
 *
 * @author JinCityKasto
 */
@Entity
public class PolicyTitle {
    
    private String policyId;
    private String policyTitle;
    private String policyTime;

    public String getPolicyId() {
        return policyId;
    }

    public void setPolicyId(String policyId) {
        this.policyId = policyId;
    }

    public String getPolicyTitle() {
        return policyTitle;
    }

    public void setPolicyTitle(String policyTitle) {
        this.policyTitle = policyTitle;
    }

    public String getPolicyTime() {
        return policyTime;
    }

    public void setPolicyTime(String policyTime) {
        this.policyTime = policyTime;
    }
    
}

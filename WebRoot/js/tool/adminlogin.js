/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $("#mainpage").click(function() {
        window.location.href = "../index.jsp";
    });

    $("#refesh").click(function() {
        document.getElementById("adminform").reset(); 
    });
    
});


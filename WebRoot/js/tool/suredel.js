/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function p_del() {
    var msg = "确认删除?";
    if (confirm(msg) === true) {
        return true;
    } else {
        window.history.go(0);
    }
}

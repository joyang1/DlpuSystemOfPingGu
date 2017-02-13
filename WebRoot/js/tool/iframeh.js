/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function IFrameReSize(iframename) {
    var pTar = document.getElementById(iframename);
    if (pTar) { //ff
        if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
            pTar.height = pTar.contentDocument.body.offsetHeight;
        }else if (pTar.Document && pTar.Document.body.scrollHeight) {//ie
            pTar.height = pTar.Document.body.scrollHeight;
        }
    }
}


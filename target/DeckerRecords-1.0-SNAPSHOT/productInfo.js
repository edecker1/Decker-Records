/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// FUnction for setting which object
let setProduct = (title) => {
  document.productInfo.cd.value = title;
  document.getElementById("hiddenForm").submit();
}
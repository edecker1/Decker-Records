// Main function to validating password
let validatePWD = () => {
  // Using the same logic as the submit function, we'll check the password
  if (validatePWDlength() && validatePWDnumber() && validatePWDcharacter() && validatePWDfirstName() && validatePWDlastName()) {
    return true;
  } else {
    return false;
  }
};
// validate if the length meets the minimum requiremnet
let validatePWDlength = () => {
  let pass1 = document.getElementById('pwd').value;
  if (pass1.length < 8) {
    document.getElementById("pwd").setCustomValidity("Passwords is not long enough!");
    console.log("Length failed");
    return false;
  } else {
    console.log("Length Success");
    return true;
  }
};

// Validate if there is a number in the password
let validatePWDnumber = () => {
  let pass1 = document.getElementById('pwd').value;
  // then lets check for a number
  console.log("Password is " + pass1);
  let n = pass1.search(/0|1|2|3|4|5|6|7|8|9/);
  console.log("Number search gets " + n);
  if (n < 0){
    console.log("It got " + pass1.search(/0|1|2|3|4|5|6|7|8|9/));
    document.getElementById("pwd").setCustomValidity("Passwords does not have a number!");
    console.log("Number failed");
    return false;
  } else {
    console.log("Number Success");
    return true;
  }
};

// Validate if theere is a special character in the password
let validatePWDcharacter = () => {
  let pass1 = document.getElementById('pwd').value;
  //Check for special character
  let m = pass1.search(/!|#|%|&|@/);
  console.log("Special character search get " + m);
  if (m < 0){
    document.getElementById("pwd").setCustomValidity("Passwords needs a special character!");
    return false;
    console.log("Special Character failed");
  } else {
    console.log("Special Character Success");
    return true;
  }
};

// Validate if their first name is in the string
let validatePWDfirstName = () => {
  let pass1 = document.getElementById('pwd').value;
  // Check for first name
  let first = document.getElementById('first').value;
  let f = new RegExp(first, 'i');   
  let last = document.getElementById('last').value;
  let l = new RegExp(last, 'i');
  n = pass1.search(f);
  console.log("Finding first name is " + n);
  if (n > -1) {
    document.getElementById("pwd").setCustomValidity("Passwords cannot contain your first name!");
    console.log("First Name failed");
    return false;
  } else {
    console.log("First Name Success");
    return true;
  }
};

// Validate whether or not their last name is in the string
let validatePWDlastName = () => {
  let pass1 = document.getElementById('pwd').value;
  // Check for last name   
  let last = document.getElementById('last').value;
  let l = new RegExp(last, 'i');
  n = pass1.search(l);
  console.log("Finding last name is " + n);
  if (n > -1){
    document.getElementById("pwd").setCustomValidity("Passwords cannot contain your last name!");
    console.log("Last Name failed");
    return false;
  } else {
    console.log("Last Name Success");
    return true;
  }
};

// Validate That the two passwords match
let validatePWD2 = () => {
  let pass1 = document.getElementById('pwd').value;
  let pass2 = document.getElementById('pwd2').value;
  if (pass1 !== pass2)
  {
    document.getElementById("pwd2").setCustomValidity("Passwords do not match!");
    console.log("Matching Passwords failed");
    return false;
  } else {
    document.getElementById("pwd2").setCustomValidity("");
    console.log("Matching Passwords Success");
    return true;
  }
};

let validateEmail = () => {
  var email = document.myForm.email.value;
  var position = email.search("@gmail.com");
  if (email.length === position + 10) {
    document.getElementById("email").setCustomValidity("");
    console.log("Gmail Account Success");
    return true;
  } else {
    document.getElementById("email").setCustomValidity("Not a Gmail account!");
    console.log("Gmail account failed");
    return false;
  }
};

let validateEmail2 = () => {
  var email = document.myForm.email.value;
  var email2 = document.myForm.email2.value;
  if (email !== email2)
  {
    document.getElementById("email2").setCustomValidity("Emails do not match!");
    console.log("Emails matching failed");
    return false;
  } else {
    document.getElementById("email2").setCustomValidity("");
    console.log("Emails Matching Success");
    return true;
  }
};

let validate = () => {
  if (validateEmail() && validateEmail2() && validatePWD() && validatePWD2()) {
    console.log("Register Success");
    document.myForm.submit();
  } else {
    console.log("Register Failed");
  }
};


encodeStringCUxD = function(elmID, paramID) {                           
  var jElm = jQuery("#"+elmID),
  inString = jElm.val(),
  outString = "";
  
  conInfo("encodeStringCUxD - inString: " + inString);                                
  conInfo("encodeStringCUxD - paramID: " + paramID);

  if (paramID.startsWith("CMD_") === true) {
    outString = inString.replace(/�/g, "~A7");
    outString = outString.replace(/\"/g, "~22");
    outString = outString.replace(/&/g, "~26");
    outString = outString.replace(/=/g, "~3d");
    outString = outString.replace(/�/g, "~b0");
    outString = outString.replace(/�/g, "~df");
    outString = outString.replace(/�/g, "~e4");
    outString = outString.replace(/�/g, "~f6");
    outString = outString.replace(/�/g, "~fc");
    outString = outString.replace(/�/g, "~c4");
    outString = outString.replace(/�/g, "~d6");
    outString = outString.replace(/�/g, "~dc");
    outString = outString.replace(/�/g, "~b5");
    outString = outString.replace(/�/g, "~80");
    outString = outString.replace(/�/g, "~b2");
    outString = outString.replace(/�/g, "~b3");
    
    jQuery("#"+elmID.replace(/^_/, "")).val(outString);
  }                                
};
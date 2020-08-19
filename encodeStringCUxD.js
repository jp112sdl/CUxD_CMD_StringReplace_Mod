encodeStringCUxD = function(elmID, paramID) {                           
  var jElm = jQuery("#"+elmID),
  inString = jElm.val(),
  outString = "";
  
  conInfo("encodeStringCUxD - inString: " + inString);                                
  conInfo("encodeStringCUxD - paramID: " + paramID);

  if (paramID.startsWith("CMD_") === true) {
    outString = inString.replace(/§/g, "~A7");
    outString = outString.replace(/\"/g, "~22");
    outString = outString.replace(/&/g, "~26");
    outString = outString.replace(/=/g, "~3d");
    outString = outString.replace(/°/g, "~b0");
    outString = outString.replace(/ß/g, "~df");
    outString = outString.replace(/ä/g, "~e4");
    outString = outString.replace(/ö/g, "~f6");
    outString = outString.replace(/ü/g, "~fc");
    outString = outString.replace(/Ä/g, "~c4");
    outString = outString.replace(/Ö/g, "~d6");
    outString = outString.replace(/Ü/g, "~dc");
    outString = outString.replace(/µ/g, "~b5");
    outString = outString.replace(/€/g, "~80");
    outString = outString.replace(/²/g, "~b2");
    outString = outString.replace(/³/g, "~b3");
    
    jQuery("#"+elmID.replace(/^_/, "")).val(outString);
  }                                
};
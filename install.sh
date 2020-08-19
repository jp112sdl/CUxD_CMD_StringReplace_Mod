#!/bin/sh        
mount -o remount,rw /                                                                                                                                           
                                                                                                                                                                
webuiFile="/www/webui/webui.js"
tempFile="/tmp/encodeStringCUxD.js"
if [ -z "`cat ${webuiFile} | grep "encodeStringCUxD = function(elmID, paramID)"`" ]; then                                                                                                      
  wget -nv -O ${tempFile} https://raw.githubusercontent.com/jp112sdl/CUxD_CMD_StringReplace_Mod/master/encodeStringCUxD.js 
  if [ "`cat ${tempFile} | grep "encodeStringCUxD = function(elmID, paramID)"`" ]; then
    cat /tmp/encodeStringCUxD.js >> ${webuiFile}                                                                                                                         
    echo "${webuiFile}: encodeStringCUxD function added."
  else
    echo "${webuiFile}: download failure"     
  fi
else                                                                                                                                                            
  echo "${webuiFile}: encodeStringCUxD function exists."                                                                                                                   
fi                                                                                                                                                              

iccommonFile="/www/config/ic_common.tcl"
icSearch="<td><input type=\\\\\"text\\\\\" name=\\\\\"\$param_id\\\\\" value=\\\\\"\$value\\\\\" \$id \$access"
icReplace="<td><input type=\\\\\"text\\\\\" name=\\\\\"\$param_id\\\\\" value=\\\\\"\$value\\\\\" onblur=\\\\\"encodeStringCUxD('\$idval', '\$param_id');\\\\\" \$id \$access"
if [ -z "`cat ${iccommonFile} | grep "${icReplace}"`" ]; then
  sed -i "s/${icSearch}/${icReplace}/g" ${iccommonFile}
  echo "${iccommonFile}: modified."                                                                                                                    
else                                                                                                                                                            
  echo "${iccommonFile}: already modified."                                                                                                                   
fi 
                                                                                                                                                                
sync                                                                                                                                                            
mount -o remount,ro /  

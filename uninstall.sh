#!/bin/sh        
mount -o remount,rw /                                                                                                                                           
                                                                                                                                                                
iccommonFile="/www/config/ic_common.tcl"
icSearch="<td><input type=\\\\\"text\\\\\" name=\\\\\"\$param_id\\\\\" value=\\\\\"\$value\\\\\" onblur=\\\\\"encodeStringCUxD('\$idval', '\$param_id');\\\\\" \$id \$access"
icReplace="<td><input type=\\\\\"text\\\\\" name=\\\\\"\$param_id\\\\\" value=\\\\\"\$value\\\\\" \$id \$access"

if [ "`cat ${iccommonFile} | grep "${icSearch}"`" ]; then
  sed -i "s/${icSearch}/${icReplace}/g" ${iccommonFile}
  echo "${iccommonFile}: encodeStringCUxD removed."                                                                                                                    
else                                                                                                                                                            
  echo "${iccommonFile}: nothing to do."                                                                                                                   
fi 
                                                                                                                                                                
sync                                                                                                                                                            
mount -o remount,ro /  
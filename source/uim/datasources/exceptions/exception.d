/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.datasources.exceptions.exception;

@safe:
import uim.datasources;

class DDSOException {
  this() {
    initialize;
  }

  void initialize() {}
}
auto DSOException() { return DDSOException; }
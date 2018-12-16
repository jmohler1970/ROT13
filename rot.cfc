component output="false" {

// Original source: https://cflib.org/udf/Rot13
/**
 * Caesar-cypher encryption that replaces each English letter with the one 13 places forward or back along the alphabet.
 * 
 * @param string      String you wish to rot13 encrypt. 
 * @return Returns a string. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, August 23, 2001 
 */

string function rot13(required string inString) output="false"	{

	var out = "";
	for (var i = 1; i <= Len(arguments.inString); i++){
		var j = asc(Mid(arguments.inString, i, 1));
		if(j >= asc("A") && j <= asc("Z")) {
			j = ((j - 52) % 26) + asc("A");
		}
		else if(j >= asc("a") && j <= asc("z")) {
			j = ((j - 84) % 26) + asc("a");
		}

		out &= Chr(j);
	} // end for

	return out;
}

string function rot5(required string inString) output="false"	{

	var out = "";
	for (var i = 1; i <= Len(arguments.inString); i++){
		var j = asc(Mid(arguments.inString, i, 1));
		if (j >= asc("0") && j <= asc("9")) {
			if (j <= asc("5")) j += 5; else j -= 5;
			}	

	out &= chr(j);
	} // end for

	return out;
}

string function rot18(required string inString) output="false"	{

	return this.rot5(this.rot13(arguments.inString));
	}


string function rot47(required string inString) output="false"	{

	var out = "";
	for (var i = 1; i <= Len(arguments.inString); i++){
		var j = asc(Mid(arguments.inString, i, 1));
		if(j >= asc("!") && j <= asc("~")) {
			j = ((j + 14) % 94) + asc("!");
		}
		out &= Chr(j);
	} // end for

	return out;
}

} // end component


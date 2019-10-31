if(primeAlternativesCreation){
	alternativeGotHit = false;
	show_debug_message("[PRIME TYPE]");
	primeType = true;
	if(ds_list_empty(oTable.numberOnePartials) and exersiseJustCreated){ // This means that the exersise is new. A pair of numbers needs to be selected.
		numberOne = 14; // Number chosen from script.
		actualNumberOne = numberOne;
		numberOneHeader = numberOne;
		numberTwo = 15; // Number chosen from script.
		actualNumberTwo = numberTwo;
		numberTwoHeader = numberTwo;
		findPrimeNumbers(numberOne, numberTwo, primeNumbersFound);  // All prime numbers below the biggest of the number pair.
		findUsefulPrimeNumbers(numberOne, numberTwo, primeNumbersFound, alternativesList); // All prime numbers that work for the number pair.
		show_debug_message("[Empty partials list]");
		show_debug_message("[NUMBERS ON INIT] "+string(numberOne) +" and "+string(numberTwo));
	}
	else{
		if(!ds_list_empty(oTable.numberOnePartials)){ // Should only check the list if it's not empty to take numbers.
			show_debug_message("[Not empty partials list] Getting Recent.");
			subDivisionNumber = undefined;
			numberOne = oTable.numberOnePartials[| ds_list_size(oTable.numberOnePartials)-1];
			actualNumberOne = numberOne;
			numberTwo = oTable.numberTwoPartials[| ds_list_size(oTable.numberTwoPartials)-1];
			actualNumberTwo = numberTwo;
		}
		show_debug_message("[Not empty partials list] Exersise of prime numbers selection.");
		show_debug_message("[NUMBERS AFTER INIT] "+string(numberOne) +" and "+string(numberTwo));
	}
	exersiseJustCreated = false; // Exersise is not new anymore. This only changes to true when multiplying phase is done.
	divisionType = false;
	alarm[0] = room_speed*1; // One second Delay after trigger.	
	primeAlternativesCreation = false;
}

if(divisionAlternativesCreation){
	show_debug_message("[DIVISION TYPE]");
	alternativeGotHit = false;
	primeType = false;
	divisionType = true;
	alarm[1] = room_speed*1; // One second Delay after trigger.	
	divisionAlternativesCreation = false;
}

if(multiplyAlternativesCreation){
	show_debug_message("[MULTIPLYING TYPE]");
	alternativeGotHit = false;
	show_debug_message("[Phase 2 under construction]");
	multiplyAlternativesCreation = false;
}
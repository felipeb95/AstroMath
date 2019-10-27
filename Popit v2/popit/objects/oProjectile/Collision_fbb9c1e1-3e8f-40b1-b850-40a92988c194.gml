var numberHit = undefined;
with(other) // Only specifif instance collisioned.
	numberHit = numberOnHolder;

if(oLogicSpawner.primeType){
	if(oLogicSpawner.numberOne mod numberHit == 0 or oLogicSpawner.numberTwo mod numberHit == 0){ // Number on hit can entirely divide at least one of the exersise's numbers.
		show_debug_message("[PT Correct] "+string(numberHit)+" can entirely divide one of the numbers");
		ds_list_add(oTable.tableDivisors, numberHit);
		oLogicSpawner.numberHit = numberHit;
		//oLogicSpawner.divisionType = true;
		oLogicSpawner.divisionAlternativesCreation = true;
		oLogicSpawner.subDivisionAnswered = true;
	}
	else{
		show_debug_message("[PT Wrong] "+string(numberHit)+" can't entirely divide any of the numbers");
		oLogicSpawner.primeAlternativesCreation = true;
	}
}

if(oLogicSpawner.divisionType){
	with(other){
		if(isCorrect){
			show_debug_message("[DT Correct]");
			global.answered = true;
			
			if(applies == 0){ // Check if the division doesn't appliy (can't entirely divide)
				if(oLogicSpawner.divisionCounter == 1)
					ds_list_add(oTable.numberOnePartials, oLogicSpawner.subDivisionNumber); // Same number is written down in table as a partial
				if(oLogicSpawner.divisionCounter == 2)
					ds_list_add(oTable.numberTwoPartials, oLogicSpawner.subDivisionNumber); // Same number is written down in table as a partial
			}
			else{ // It does apply, meaning that it can be entirely divided.
				if(oLogicSpawner.divisionCounter == 1)
					ds_list_add(oTable.numberOnePartials, numberHit); // The number hit, which is the right division, is written down as a partial.
				if(oLogicSpawner.divisionCounter == 2)
					ds_list_add(oTable.numberTwoPartials, numberHit); // The number hit, which is the right division, is written down as a partial.
			}
			oLogicSpawner.divisionCounter++;
			
			if(oLogicSpawner.divisionCounter <= 2) // Only if the the divisionCounter (number of subdivision exersise) is less equel or less than, the alarm is triggered
				oLogicSpawner.alarm[1] = room_speed*1;
			else{ // Alarm isn't triggered because the 2 division subexersises have been done.
				oLogicSpawner.divisionCounter = 1; // Division subexersise counter reseted.
				oLogicSpawner.divisionAlternativesCreation = false; // No more divsision alternatives are created.
				oLogicSpawner.primeAlternativesCreation = true; // Time to create prime alternatives.
				show_debug_message("[ # # # RESET # # # ]"); // New exersise starts message.
			}
		}
		else{
			if(oLogicSpawner.actualSubDivisionApplies == 0){ // Check if the division doesn't appliy (can't entirely divide)
				if(oLogicSpawner.divisionCounter == 1)
					ds_list_add(oTable.numberOnePartials, oLogicSpawner.subDivisionNumber); // Same number is written down in table as a partial
				if(oLogicSpawner.divisionCounter == 2)
					ds_list_add(oTable.numberTwoPartials, oLogicSpawner.subDivisionNumber); // Same number is written down in table as a partial
			}
			else{ // It does apply, meaning that it can be entirely divided.
				if(oLogicSpawner.divisionCounter == 1)
					ds_list_add(oTable.numberOnePartials, oLogicSpawner.subDivisionNumber / oLogicSpawner.numberHit); // The number hit, which is the right division, is written down as a partial.
				if(oLogicSpawner.divisionCounter == 2)
					ds_list_add(oTable.numberTwoPartials, oLogicSpawner.subDivisionNumber / oLogicSpawner.numberHit); // The number hit, which is the right division, is written down as a partial.
			}
			oLogicSpawner.divisionCounter++;
			
			if(oLogicSpawner.divisionCounter <= 2) // Only if the the divisionCounter (number of subdivision exersise) is less equel or less than, the alarm is triggered
				oLogicSpawner.alarm[1] = room_speed*1;
			else{ // Alarm isn't triggered because the 2 division subexersises have been done.
				oLogicSpawner.divisionCounter = 1; // Division subexersise counter reseted.
				oLogicSpawner.divisionAlternativesCreation = false; // No more divsision alternatives are created.
				oLogicSpawner.primeAlternativesCreation = true; // Time to create prime alternatives.
				show_debug_message("[ # # # RESET # # # ]"); // New exersise starts message.
			}
			show_debug_message("[DT Wrong]");
			
		}
	}
}

with(oAlternativeHolder) // Looping through all instances of oAlternativeHolder
	instance_destroy(self); // This will delete the instance of oAlternativeHolder
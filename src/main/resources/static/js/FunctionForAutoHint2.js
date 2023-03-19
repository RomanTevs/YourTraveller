
async function autoHint(id,parentId) {
	const inputEl = document.getElementById(id);
    const inputVal = inputEl.value
    if(inputVal.length === 0) {
		removeAutocompliteDropDown();
		return;
	}
	const cities = await fetch("/hint?firstLetters="+ inputVal);
	const citiesAsData = await cities.json();

	console.log(citiesAsData);
	
	removeAutocompliteDropDown();

	createAutocompliteDropDown(citiesAsData,parentId,inputEl);
}

function createAutocompliteDropDown(citiesAsData,parentId,inputEl) {
	const listEl = document.createElement("ul");
	listEl.id = "autocomplite-list";//что бы потом его удалять из removeAutocompliteDropDown()
	citiesAsData.forEach(city => {
		const listItem = document.createElement("li");
		const cityButton = document.createElement("button");
		cityButton.innerHTML = city;
		cityButton.addEventListener("click",function() {
			inputEl.value = cityButton.innerHTML;
			removeAutocompliteDropDown();
		});
		listItem.appendChild(cityButton);
		listEl.appendChild(listItem);
	});
	document.querySelector("#" + parentId).appendChild(listEl);
}

function removeAutocompliteDropDown() {
	const listEl = document.querySelector("#autocomplite-list");
	if(listEl) listEl.remove();
}









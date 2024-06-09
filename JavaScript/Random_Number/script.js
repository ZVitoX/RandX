// Wait for the DOM to fully load before executing the script
document.addEventListener("DOMContentLoaded", function() {
	const numElement = document.getElementById("random-number");
	const genBtn = document.getElementById("genetare-btn");
	const numRange = prompt("Enter the desired range: ")
	
	// Function to generate and display a random number
	function randNum() {
		const randomNumber = Math.floor(Math.random() * numRange) + 1; 
		numElement.textContent = randomNumber;
		
		// Remove the animation class to restart the animation
		numElement.parentNode.classList.remove("fadeIn");
		void numElement.parentNode.offsetWidth; 
		numElement.parentNode.classList.add("fadeIn");
	}

	// Add an event listener to the button to generate a random number on click
	genBtn.addEventListener("click", randNum);
	
	// Generate and display a random number when the page loads
	randNum();
}); 

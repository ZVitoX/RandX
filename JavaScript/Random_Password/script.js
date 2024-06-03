// Wait for the DOM to fully load before executing the script
document.addEventListener("DOMContentLoaded", () => {
	const passwordBox = document.getElementById("password");
	const button = document.getElementById("btn");
	const copyButton = document.getElementById("copy");
	const messageBox = document.getElementById("message");

	// Function to generate a random length for the password
	const getPasswordLength = () => {
		const min = 8;
		const max = 20;
		return Math.floor(Math.random() * (max - min + 1)) + min;
	};

	// Function to display error or success messages
	const displayMessage = (message, type = 'success') => {
		messageBox.textContent = message;
		messageBox.className = `message ${type}`;
		messageBox.style.display = 'block';

		setTimeout(() => {
			messageBox.style.display = 'none';
		}, 3000);
	};

	// Function to generate password using random characters
	const generatePassword = () => {
		const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-={}|[]`~<>?,./'\"\\;:";
		let password = "";
		const length = getPasswordLength();

		for (let i = 0; i < length; i++) {
			password += chars.charAt(Math.floor(Math.random() * chars.length));
		}

		passwordBox.value = password;
		displayMessage('Password generated successfully.', 'success');
	};

	// Function to copy the password by clicking on the icon
	const copyPassword = async () => {
		const passwordToCopy = passwordBox.value.trim();

		if (!passwordToCopy) {
			displayMessage('There is no password to copy!', 'error');
			return;
		}

		try {
			await navigator.clipboard.writeText(passwordToCopy);
			displayMessage('Password copied to clipboard.', 'success');
		} catch (err) {
			displayMessage(`Failed to copy the password: ${err}`, 'error');
		}
	};

	// Event listeners for the buttons
	button.addEventListener("click", generatePassword);
	copyButton.addEventListener("click", copyPassword);
}); 
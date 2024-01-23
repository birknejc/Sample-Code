// comicSales.js

var isCollectionViewOpen = false;

// function getPublisher
// parameter: selected series
// action: create the XMLHttpRequest object, register the handler for
// onreadystatechange, send the request (with open) with the series.
// response text, puts it in the document
// I used this reference for HTTP status code definitions https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
// xhr is a variable representing an instance of XMLHttpRequest, and it's used to manage the communication between the web page and the server, 
// facilitating the retrieval of data without a full page reload.
function getPublisher(series) {
    var xhr = new XMLHttpRequest();
    // Register the embedded handler function
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var result = JSON.parse(xhr.responseText.trim()); // Parse JSON response
            document.getElementById("publisher").value = result.publisher;

            // Dynamically update the image source based on the selected series
            var image = document.getElementById("seriesImage");
            image.src = "images/" + series.toLowerCase() + ".jpg"; // Adjust the file extension based on your images

            // Show the image tag
            image.style.display = "block";
        }
    }
    xhr.open("GET", "getPublisher.php?series=" + series);
    xhr.send();
}

// function submitForm
// action: create the XMLHttpRequest object, register the handler for
// onreadystatechange, send the request (with open) with the form data.
// response text, alerts the user with the server's response.
// I used this reference for HTTP status code definitions https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
// xhr is a variable representing an instance of XMLHttpRequest, and it's used to manage the communication between the web page and the server, 
// facilitating the retrieval of data without a full page reload.
function submitForm() {
    var xhr = new XMLHttpRequest();
    // Register the embedded handler function
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                alert(xhr.responseText.trim()); // Trim any leading/trailing whitespace
                // Clear the form on successful submission
                resetForm();
            } else {
                alert("Error submitting the form. Please try again.");
            }
        }
    }

    var formData = new FormData(document.forms['comicForm']);
    xhr.open("POST", "processForm.php", true);
    xhr.send(formData);
}

// function resetForm
// action: reset all form fields and clear the image
function resetForm() {
    var form = document.forms['comicForm'];
    form.reset();

    // Clear the image source and hide the image
    document.getElementById("seriesImage").src = "";
    document.getElementById("seriesImage").style.display = "none";
}

// function toggleCollectionViewButton
// action: toggle the text on the View Collection button
function toggleCollectionViewButton() {
    var viewCollectionButton = document.getElementById("viewCollectionButton");

    if (isCollectionViewOpen) {
        viewCollectionButton.innerHTML = "Close Collection";
    } else {
        viewCollectionButton.innerHTML = "View Collection";
    }
}

// function viewCollection
// action: create the XMLHttpRequest object, register the handler for
// onreadystatechange, send the request (with open) to fetch the collection.
// response text, displays the collection entries in a table.
// I used this reference for HTTP status code definitions https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml
// xhr is a variable representing an instance of XMLHttpRequest, and it's used to manage the communication between the web page and the server, 
// facilitating the retrieval of data without a full page reload.
function viewCollection() {
    var xhr = new XMLHttpRequest();
    // Register the embedded handler function
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                var result = JSON.parse(xhr.responseText.trim()); // Parse JSON response

                // Toggle the text on the View Collection button before updating the collection display
                isCollectionViewOpen = !isCollectionViewOpen; // Toggle the collection state
                toggleCollectionViewButton();

                // Display the collection entries in a table
                var collectionContainer = document.getElementById("collectionContainer");
                if (isCollectionViewOpen && result.length > 0) {
                    var table = "<table border='1' id='collectionTable'><tr><th>Series</th><th>Issue Number</th><th>Purchase Price</th><th>Grade</th><th>Publisher</th></tr>";
                    for (var i = 0; i < result.length; i++) {
                        table += `<tr><td>${result[i].series}</td><td>${result[i].issue_number}</td>
                        <td>${result[i].purchase_price}</td><td>${result[i].grade}</td><td>${result[i].publisher}</td></tr>`;
                    }
                    table += "</table>";
                    collectionContainer.innerHTML = table; // Use a specific container to hold the table
                } else {
                    collectionContainer.innerHTML = ""; // Clear the container
                    if (isCollectionViewOpen) {
                        alert("Your comic book collection is empty.");
                    }
                }
            } else {
                alert("Error fetching the collection. Please try again.");
            }
        }
    }

    xhr.open("GET", "getCollection.php");
    xhr.send();
}




// function closeCollection
// action: remove the table displaying the collection
function closeCollection() {
    document.getElementById("collectionContainer").innerHTML = ""; // Clear the container
    isCollectionViewOpen = false;
    toggleCollectionViewButton();
}



// Set the initial state of the button
toggleCollectionViewButton();

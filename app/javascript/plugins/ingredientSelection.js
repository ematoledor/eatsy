
function areChecked() {
    // Get all the checkboxes in your HTML. 
    const checkboxes = document.querySelectorAll('.Accept');
    // Check if all have been checked
    const checkboxarray = Array.from(checkboxes)
    const allChecked = checkboxarray.every(checkboxElement => checkboxElement.checked);
    
    return allChecked;
  };
 
  function handleCheckboxChange(event) {
    //Check if all have been checked and depending on the output toggle the buttons
    const orderButton = document.getElementById('order-now-button');
    const cookButton = document.getElementById('cook-now-button');
    
    console.log(areChecked())

    if (areChecked()) {
        // Show the cook now button. (Disable works too)
        cookButton.style.display = 'block';
        orderButton.style.display = 'none';
      } else {
        cookButton.style.display = 'none';
        orderButton.style.display = 'block;'
      }
    };
    

    function listenToCheckboxes() {
        // Get all the checkboxes in your HTML. 
        const checkboxes = document.querySelectorAll('.Accept');
        // Add event listenters to them
        checkboxes.forEach(checkboxElement => {
          checkboxElement.addEventListener('change', handleCheckboxChange);
        });
        
      
      };
    


      export { listenToCheckboxes }
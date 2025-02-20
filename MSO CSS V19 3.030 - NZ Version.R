
########################### MSO CSS ################################

#-----------------------Setup UI CSS Script-----------------------#


# Define the custom CSS for DTOutput
custom_css <- "
   body {
        background-color: #F1F5FA;  /* Set background color to #F1F5FA */
      }
      .logo {
        position: fixed;  /* Fix logo position */
        top: 0;
        left: 0;
        width: 250px;  /* Same width as the sidebar */
        padding: 10px;
        padding-top: 10px; /* Add 2px padding on top of the logo */
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1000;  /* Ensure the logo is on top */
      }
      .sidebar {
        height: calc(100vh - 65px - 20px); /* Adjust height to fill remaining viewport minus padding */
        width: 250px;
        position: fixed;
        left: 10px; /* Add padding to the left */
        top: 65px; /* Start below the logo initially */
        background-color: white; /* Set background color to white */
        padding-top: 60px; /* Added padding for the hide button */
        padding-left: 10px; /* Add padding to the left inside the sidebar */
        padding-bottom: 20px; /* Add padding to the bottom */
        transition: transform 0.3s ease-in-out, top 0.3s ease-in-out; /* Smooth transition for both transform and top */
        transform: translateY(0); /* Initially shown */
        overflow-y: auto; /* Enable vertical scrolling */
        overflow-x: hidden; /* Hide horizontal scrolling */
        border-radius: 15px; /* Rounded edges */
        border-right: 5px solid #00A1D2; /* Add a right border with the desired color */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: add some shadow for depth */
      }
      .sidebar-hidden {
        transform: translateY(-100%); /* Move sidebar upwards */
        top: 0; /* Reset top position to align with the hidden state */
      }
      .sidebar a,
      .dropdown-btn {
        padding: 10px 15px;
        text-decoration: none;
        font-size: 20px; /* Uniform font size for all links and buttons */
        color: black; /* Change text color to black */
        display: block;
      }
      .sidebar a:hover,
      .dropdown-btn:hover {
        background-color: #575757;
        color: white; /* Change text color to white on hover */
      }
      .dropdown-btn {
        border: none;
        background: none;
        width: 100%;
        text-align: left;
        cursor: pointer;
        outline: none;
      }
      .dropdown-container {
        display: none;
        background-color: #262626;
        padding-left: 8px;
        position: relative; /* Adjust to make dropdown appear over content */
        z-index: 99; /* Ensure dropdown is on top of sidebar content */
      }
      .dropdown-container a {
        font-size: 18px;
        display: block;
        padding: 8px 16px;
        color: white;
        text-decoration: none;
      }
      .dropdown-container a:hover {
        background-color: #575757;
      }
      .toggle-btn {
        position: fixed;
        top: 75px; /* Adjust to start below the logo */
        left: 10px;
        font-size: 20px;
        background-color: transparent; /* Remove background color */
        color: #00A1D2; /* Set icon color */
        border: none;
        padding: 10px;
        cursor: pointer;
        z-index: 1000; /* Ensure the button stays on top */
      }
      .toggle-btn:hover {
        background-color: transparent;  /* Remove hover background color */
      }
      .content {
        margin-top: 65px; /* Add margin to avoid overlap with the logo */
        margin-left: 230px; /* Margin to make space for the sidebar including padding */
        padding: 20px;
        transition: margin-left 0.3s;
        overflow-y: auto; /* Enable vertical scrolling */
        height: calc(100vh - 65px); /* Set height to fill viewport minus logo */
        background-color: #F1F5FA; /* Ensure content background matches sidebar */
      }
      .content-full {
        margin-left: 20px; /* Adjust as needed */
      }
      
  .white-rectangle {
  background-color: white;
  border-radius: 15px; /* Rounded edges */
  padding: 40px;
  margin: 20px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: add some shadow for depth */
  width: 100%; /* Ensure it uses full width of its container */
  height: 742px; /* Set a fixed height */
  box-sizing: border-box; /* Include padding and border in the element's total width and height */
  overflow: auto; /* Enable scrolling if content overflows */
  
  }

      .custom-header {
        margin-bottom: 20px; /* Add space below the header */
      }
      .plot-container {
        overflow-x: auto; /* Enable horizontal scrolling if needed */
      }

  .logo-div {
    padding: 15px; /* Add padding to the logo div */
  }
  .bold-text {
    font-weight: bold; /* Make text with the bold-text class bold */
  }
  
  #table-container {
    width: 50%; /* Adjust the percentage as needed for the table container */
    display: inline-block;
  }
  .dataTables_wrapper {
    width: 100%; /* Make the table wrapper take up the full width */
  }
  .optimize-button {
    background-color: #00A1D2; /* Background color for the Optimize button */
    color: white; /* Text color for the Optimize button */
  }
  .export-reach-button {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50px; /* Use a large value to make the button oval-shaped */
  height: 3.3rem;
  width: 125px; 
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .save-load-button {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50px; /* Use a large value to make the button oval-shaped */
  height: 3.3rem;
  width: 125px; 
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
    .relaunch-btn {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50px; /* Use a large value to make the button oval-shaped */
  height: 3.3rem;
  width: 125px; 
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
  }
  .download-curve-template-button {
    background-color: #d9dadb; /* Background color for the Download Curve Temp button */
    color: Dark Gray; /* Text color for the Download Curve Temp button */
  }
  .graph-view {
  background-color: #00A1D2; /* Background color for the Graph View button */
    color: white; /* Text color for the Graph View button */
  }
.edit-button {
  background-color: #00A1D2; /* Default background color */
  color: white; /* Default text color */
}
.advanced-setup {
  background-color: #00A1D2; /* Default background color */
  color: white; /* Default text color */
}
  #mso_metric_format table.dataTable {
    border: 1px solid #ccc; /* Add a light gray border around the table */
  }
  #mso_metric_format th, #mso_metric_format td {
    padding: 10px; /* Add padding to increase spacing between table columns */
  }
  #mso_metric_format table.dataTable thead th {
    border-bottom: none;
    text-align: center;  /* Center column text */
    font-size: 16px;  /* Increase font size for header columns */
  }
  #mso_metric_format table.dataTable tfoot th {
    border-top: none;
    border-bottom: 1px solid #ccc; /* Light gray border in the footer */
    text-align: center;  /* Center column text in the footer */
    font-size: 16px;  /* Increase font size for footer columns */
  }
  #mso_metric_format table.dataTable {
    border-bottom: none;  /* Remove the bottom border line */
  }
  #mso_metric_format table.dataTable tr:last-child td {
    border-bottom: 1px solid #ccc;  /* Add a light gray bottom border line below the last row */
  }
  #mso_metric_format table.dataTable td {
    text-align: center;  /* Center row text */
    padding: 5px;  /* Add even spacing between columns */
    font-size: 20px;  /* Increase font size for rows */
  }
  #mso_metric_format table.dataTable th {
    text-align: center;  /* Center column text in header */
    border-right: 1px solid #ccc;  /* Light gray vertical lines between columns in header */
    font-size: 16px;  /* Increase font size for header columns */
  }
  #mso_metric_format table.dataTable th:last-child {
    border-right: none;  /* Remove the vertical line after the last column in header */
  }
  #mso_metric_format table.dataTable td:nth-child(1),
  #mso_metric_format table.dataTable td:nth-child(2),
  #mso_metric_format table.dataTable td:nth-child(3),
  #mso_metric_format table.dataTable td:nth-child(4),
  #mso_metric_format table.dataTable td:nth-child(5) {
    border-right: 1px solid #ccc;  /* Light gray vertical lines between columns in rows */
  }
  #mso_metric_format table.dataTable td:last-child {
    border-right: none;  /* Remove the vertical line after the last column in rows */
  }
  
  
  #mso_metric_format table.dataTable {
    border: 1px solid #ccc; /* Add a light gray border around the table */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a background shadow */
}


#mso_channel_metrics table.dataTable {
  border: 1px solid #ccc; /* Add a light gray border around the table */
}


#mso_channel_metrics table.dataTable thead th {
  border-bottom: 1px solid #ccc; /* Restore the bottom border line */
  text-align: center;  /* Center column text */
  font-size: 12px;  /* Increase font size for header columns */
}

#mso_channel_metrics table.dataTable tfoot th {
  border-top: none;
  border-bottom: 1px solid #ccc; /* Light gray border in the footer */
  text-align: center;  /* Center column text in the footer */
  font-size: 12px;  /* Increase font size for footer columns */
}

#mso_channel_metrics table.dataTable td {
  text-align: center;  /* Center row text */
  padding: 5px;  /* Add even spacing between columns */
  font-size: 12px;  /* Increase font size for rows */
}

#mso_channel_metrics table.dataTable th {
  text-align: center;  /* Center column text in header */
  border-right: 1px solid #ccc;  /* Light gray vertical lines between columns in header */
  font-size: 12px;  /* Increase font size for header columns */
}

#mso_channel_metrics table.dataTable th:last-child,
#mso_channel_metrics table.dataTable td:last-child {
  border-right: none;  /* Remove the vertical line after the last column in header and rows */
}

#mso_channel_metrics table.dataTable td:nth-child(1),
#mso_channel_metrics table.dataTable td:nth-child(2),
#mso_channel_metrics table.dataTable td:nth-child(3),
#mso_channel_metrics table.dataTable td:nth-child(4),
#mso_channel_metrics table.dataTable td:nth-child(5),
#mso_channel_metrics table.dataTable td:nth-child(6),
#mso_channel_metrics table.dataTable td:nth-child(7),
#mso_channel_metrics table.dataTable td:nth-child(8),
#mso_channel_metrics table.dataTable td:nth-child(9) {
  border-bottom: 1px solid #ccc;  /* Light gray horizontal lines between rows */
}



#mso_channel_metrics table.dataTable td:last-child {
  border-right: none;  /* Remove the vertical line after the last column in rows */
}

#mso_channel_metrics table.dataTable {
    border: 1px solid #ccc; /* Add a light gray border around the table */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Add a background shadow */
}

  .screen-text {
    font-size: 14px;
    margin-top: 27px; /* Adjust this value for vertical space */
    font-weight: bold; /* Make text bold */
    padding-left: 20px; 
  }
  .first-input {
    padding-right: 20px; /* Adjust this value to reduce horizontal space */
  }
.screen-text, .first-input, .numeric-input {
    margin-bottom: -5px; /* Adjust this value to reduce space between elements in a row */

.plot-container {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a background shadow */
}





"


# Dropdown Menu For Pin Scenarios
dropdown_button_styles <- "
.custom-dropdown .btn.dropdown-toggle {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50%;
  height: 3.3rem;
  width: 3.3rem;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.custom-dropdown .btn.dropdown-toggle:hover {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.custom-dropdown .btn.dropdown-toggle:focus {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.custom-dropdown .fa {
  font-size: 2rem;
}

/* Custom style for action buttons inside dropdown */
.custom-dropdown .btn.btn-default {
  background-color: #E6E6E6; /* Set background color to #E6E6E6 */
  color: black; /* Set text color to black */
  border-color: transparent; /* Make the border color transparent */
}

/* Adjust width of the dropdown menu */
.custom-dropdown .dropdown-menu {
  min-width: 140px; /* Set the minimum width to your desired value */
}

/* Styles for the edit button to make it round */
.edit-button {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50%;
  height: 3.3rem;
  width: 3.3rem;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.edit-button:hover {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.edit-button:focus {
  background-color: #E6E6E6 !important;
  color: black !important;
}

/* Styles for the graph view button to make it round */
.graph-view {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50%;
  height: 3.3rem;
  width: 3.3rem;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.graph-view:hover {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.graph-view:focus {
  background-color: #E6E6E6 !important;
  color: black !important;
}

/* Styles for the setup button to make it oval-shaped */
.advanced-setup {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50px; /* Use a large value to make the button oval-shaped */
  height: 3.3rem;
  width: auto; /* Let the width adjust based on content */
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #D9DADB;
  color: black;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.advanced-setup:hover {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.advanced-setup:focus {
  background-color: #E6E6E6 !important;
  color: black !important;
}

/* Styles for the optimize button to make it oval-shaped */
.optimize-button {
  padding: 0.6rem 1.2rem;
  font-size: 1.5rem;
  border-radius: 50px; /* Use a large value to make the button oval-shaped */
  height: 3.3rem;
  width: auto; /* Let the width adjust based on content */
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #00A1D2;
  color: white;
  border-color: transparent;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.optimize-button:hover {
  background-color: #E6E6E6 !important;
  color: black !important;
}

.optimize-button:focus {
  background-color: #E6E6E6 !important;
  color: black !important;
}

"




# Define custom CSS For Advanced Pop Up Menu
custom_style <- tags$style(
  HTML("
    /* Custom CSS to change font size of text in rows */
    .dataTables_scrollBody tbody tr td {
      font-size: 12px; /* Adjust font size for rows as needed */
    }
    
    /* Custom CSS to change font size of column headers */
    .dataTables_scrollHeadInner thead th {
      font-size: 12px; /* Adjust font size for column headers as needed */
      text-align: center; /* Center align column headers */
    }
    

  ")
)